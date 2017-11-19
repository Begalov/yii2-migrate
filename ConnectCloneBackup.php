<?php
namespace kubo0\migratearray;

/*
 * Author: RUben Begalov@gmail.com
 * Name: ConnectCloneBackup ex. ConnectBackup ex. DbBackup
 * v.0.4
 *
 * Moved from arch-deco.dev/_protected/common/components/db/
 *
 * If source_db not set - useing current db connection.
 * In case of test set source_db, backup_db will be set to curent.
 *
 * Using:
 *      $db = \Yii::$app->db;
 *      $db->setSourceDb('source_db');
 *      $db->backup();
 * You could use backup(true) to reset backup, it set to false by default. 
 */
class ConnectCloneBackup extends \yii\db\Connection
{
    // Marker file name
    const RESET_F = 'backup_reset';

    private $source_db, $backup_db, $clone;

    /**
     * Schema clonning.
     * @param string $to 
     * @return bool
     */
    public function cloneDb($to)
    {
        if (!is_string($to))
            return;
        $this->clone = true; 
        return $this->backup($reset = false, $source_db = null, $backup_db = $to); 
    }

    /**
     * Main execution
     * @param bool $reset 
     * @return bool
     */
    public function backup($reset = false, $source_db = null, $backup_db = null)
    {
        if (!$this->clone)
        {
            $suffix = '_test';
            if (
                !$reset // false or
                OR !file_exists(self::RESET_F) // file not exist
                && @!file_get_contents(self::RESET_F) // and file contain false
            )
                return;
        }
        if (isset($source_db)) $this->setSourceDb($source_db);
        if (isset($backup_db)) $this->setBackupDb($backup_db, $suffix); 
        if (!$this->set()) // setting fail
            return;

        file_put_contents('file',$to . ' + backup');

        $r = $this->dropCreateInsertTables(); // Submain execution

        if (!$this->clone)
            self::reset(false);

        return $r;
    }

    /**
     * Main settings
     * @return bool
     */
    private function set()
    {
        if (YII_ENV !== 'test' && !isset($this->source_db)) // Normal environment: set current db as source.
            $this->source_db = $this->setDb($this->currentDbName);
        elseif (YII_ENV === 'test') // Test environment: set current db as backup, source_db should be set.
        {
            if (!isset($this->source_db))
                return;
            if (!isset($this->backup_db))
                $this->backup_db = $this->setDb($this->currentDbName); // test suffix
        }
        return true;
    }

    /**
     * In test enviroment you should set source db to clone it to your test db 
     * @param string $dbName 
     * @return void
     */
    private function setSourceDb($dbName)
    {
        $this->source_db = $this->setDb($dbName);
    }

    /**
     * In case of normal use you may set backup db by name and suffix
     * @param string $dbName 
     * @param string $suffix
     * @return void
     */
    private function setBackupDb($dbName = null, $suffix)
    {
        if (!$dbName) $dbName = $this->currentDbName;
        $this->backup_db = $this->setDb($dbName, $suffix);
    }

    /**
     * Return backup db name
     * @return string
     */
    public function getBackupdb()
    {
        return $this->backup_db;
    }

    /**
     * Get current db name
     * @return string
     */
    public function getCurrentDbName()
    {
        return self::getDbName($this->dsn);
    }

    /**
     * Get source db name
     * @return string
     */
    public function getSourceDbName()
    {
        return self::getDbName($this->source_db->dsn);
    }

    /**
     * Get backup db name
     * @return string
     */
    public function getBackupdbName()
    {
        return self::getDbName($this->backup_db->dsn);
    }

    /**
     * Creates marking file
     * @param bool $state 
     * @return void
     */
    private static function reset($state = true)
    {
        file_put_contents(self::RESET_F, $state);
    }

    private static function getDbName($dsn)
    {
        return explode('=',explode(';',$dsn)[1])[1];
    }

    /**
     * Query and normalize array of tables names from:
     *     [1] => Array[Tables_in_database] => some_table
     * to:
     *     [1] => some_table
     * @param string $db Name
     * @return array
     */
    private static function dbTables($db)
    {
        $tables = $db->createCommand('SHOW TABLES')
            ->queryAll();
        foreach ($tables as $key => $value) {
            $tables[$key] = array_pop($value);
        }
        return $tables;
    }

    private function setDb($dbName, $suffix = '')
    {
        $schema = explode(';', $this->dsn)[0];
        $username = $this->username;
        $password = $this->password;
        $charset = $this->charset;
        // $currentDbDsnArray = ;
        return new \Yii\db\Connection([
            'dsn' => $schema . ';dbname=' . $dbName . $suffix,
            'username' => $username,
            'password' => $password,
            'charset' => $charset,
        ]);
    }

    private function constraints()
    {
        return $this->backup_db->createCommand("/*!40101 SET @OLD_LOCAL_SQL_MODE=@@SQL_MODE, SQL_MODE='' */;
        /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
        /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;")
            ->execute();
    }

    private function dropTable($tableName)
    {
        return $this->backup_db->createCommand('DROP TABLE IF EXISTS ' . $tableName)
            ->execute();
    }

    private function createInsertTable($tableName)
    {
        return $this->backup_db->createCommand('USE ' . $this->sourceDbName . ';
            CREATE TABLE ' . $this->backupdbName . '.'. $tableName . ' LIKE ' . $this->sourceDbName . '.'. $tableName . ';
            INSERT INTO ' . $this->backupdbName . '.'. $tableName . ' SELECT * FROM ' . $this->sourceDbName . '.'. $tableName . ';')
            ->execute();
    }

    /**
     * Submain execution
     * @return array $r
     */
    private function dropCreateInsertTables()
    {
        try {
            $this->constraints();
            foreach (self::dbTables($this->backup_db) as $key => $value) {
                $status['drop'][$value] = $this->dropTable($value);
            }
            foreach (self::dbTables($this->source_db) as $key => $value) {
                $status['createInsert'][$value] = $this->createInsertTable($value);
            }
            $r = $status;
        } catch (\yii\db\Exception $e) {
            $r = $e;
        }
        return $r;
    }
}
