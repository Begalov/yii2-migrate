<?php

namespace kubo0\migratearray;

use yii\db\Migration;

/**
 * @author RUben <begalov@gmail.com>
 * @todo giving $tableSchema up
 * @todo improve 2-way logic in add/dropColumn, create/dropIndex, add/dropPrimaryKey, add/dropForeignKey
 * @version [0.2.1] [getter, tableOptions]
 */
class MigrationArray extends Migration
{
    public function getTableOptions()
    {
        $tableOptions = null;
        if ($this->db->driverName === 'mysql') 
        {
            $tableOptions = 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB';
        }
        return $tableOptions;
    }

    /**
     * Migrate all tables.
     * @param array $tables 
     * @param bool $way: true for upgrading and false for downgrading
     * @return bool
     */
    protected function migrate($tables,$way=true,$safe=false)
    {
        if (!is_array($tables))
            return false;

        if (!$way)
            $tables = array_reverse($tables);

        foreach ($tables as $t_name => $t) {
            if (is_int($t_name))
                $t_name = $t['tableName'];
            $r[$t_name] = $this->migrateOneTable($t_name, $t, $way);
        }
        return in_array(false, $r) ? false : true;
    }

    /**
     * Migrate one table.
     * @param array $t_name curent table name 
     * @param bool $way 
     * @return bool
     */
    protected function migrateOneTable($t_name, $t, $way=true)
    {
        if (!is_array($t) OR !is_string($t_name))
            return false;
        $tableSchema = $this->db->getTableSchema($t_name);

        if (isset($t['createTable'])) {
            if ($way AND !$tableSchema) {
                $this->createTable(
                    $t_name,
                    $t['createTable']['columns'],
                    $t['createTable']['options']
                );
            } elseif (!$way AND $tableSchema) {
                $this->dropTable($t_name);
                return true;
            }
        }

        if (isset($t['renameTable'])) {
            if (
                $way
                AND $t['renameTable'] != $tableSchema->name
                AND $tableSchema->name == $t_name
            ) {
                $this->renameTable($t_name, $t['renameTable']);
                $t_name = $t['renameTable'];
            } else {
                if ($tableSchema->name != $t_name) // case redo
                    $this->renameTable($t['renameTable'], $t_name);
            }
        }

        if (isset($t['renameColumn'])) {
            if (!$way)
                $t['renameColumn'] = array_flip($t['renameColumn']);
            foreach ($t['renameColumn'] as $c_old_name => $c_new_name) {
                $this->renameColumn($t_name, $c_old_name, $c_new_name);
            }
        }

        if (isset($t['addColumn']) AND is_array($t['addColumn'])) {
            foreach ($t['addColumn'] as $c_name => $type) {
                if ($way AND !array_key_exists($c_name, $tableSchema->columns)) {
                    $this->addColumn($t_name, $c_name, $type);
                } else {
                    if (true/*@array_key_exists($c_name, $tableSchema->columns)*/) // case redo
                        @$this->dropColumn($t_name, $c_name);
                }
            }
        } elseif (isset($t['dropColumn']) AND is_array($t['dropColumn'])) {
            foreach ($t['dropColumn'] as $c_name => $type) {
                if (!$way) {
                    $this->addColumn($t_name, $c_name, $type);
                } else {
                    @$this->dropColumn($t_name, $c_name);
                }
            }
        }


        if (is_array($t['createIndex'])) {
            foreach ($t['createIndex'] as $index => $uniq) {
                // $index($index, $t_name, $index, $uniq, $way);
                if ($way) {
                    $this->createIndex($index, $t_name, $index, $uniq);
                } else {
                    @$this->dropIndex($index, $t_name);
                }
            }
        } elseif (is_array($t['dropIndex'])) {
            foreach ($t['dropIndex'] as $index => $uniq) {
                // $index($index, $t_name, $index, $uniq, $way, true);
                if (!$way) {
                    $this->createIndex($index, $t_name, $index, $uniq);
                } else {
                    @$this->dropIndex($index, $t_name);
                }
            }
        }

        if (is_array($t['addPrimaryKey'])) {
            foreach ($t['addPrimaryKey'] as $name => $column) {
                // $index($index, $t_name, $index, $uniq, $way);
                if ($way) {
                    $this->addPrimaryKey($name, $t_name, $column);
                } else {
                    $this->dropPrimaryKey($name, $t_name);
                }
            }
        } elseif (is_array($t['dropPrimaryKey'])) {
            foreach ($t['dropPrimaryKey'] as $name => $column) {
                // $index($index, $t_name, $index, $uniq, $way, true);
                if (!$way) {
                    $this->addPrimaryKey($name, $t_name, $column);
                } else {
                    $this->dropPrimaryKey($name, $t_name);
                }
            }
        }

        if (is_array($t['addForeignKey'])) {
            foreach ($t['addForeignKey'] as $key => $fk) {
                // $index($index, $t_name, $index, $uniq, $way);
                if ($way) {
                    $this->addForeignKey(
                        $fk['new']['name'],
                        $t_name,
                        $fk['new']['columns'],
                        $fk['new']['refTable'],
                        $fk['new']['refColumns'],
                        $fk['new']['delete'],
                        $fk['new']['update']
                    );
                } elseif (!$way && $fk['old']['name']) {
                    $this->addForeignKey(
                        $fk['old']['name'],
                        $t_name,
                        $fk['old']['columns'],
                        $fk['old']['refTable'],
                        $fk['old']['refColumns'],
                        $fk['old']['delete'],
                        $fk['old']['update']
                    );
                } else {
                    $this->dropForeignKey($fk['new']['name'], $t_name);
                }
            }
        } elseif (is_array($t['dropForeignKey'])) {
            foreach ($t['dropForeignKey'] as $name => $fk) {
                // $index($index, $t_name, $index, $uniq, $way, true);
                if (!$way) {
                    // $this->addForeignKey($name, $t_name, $fk);
                } else {
                    // $this->dropForeignKey($name, $t_name);
                }
            }
        }

        if (is_array($t['alterColumn'])) {
            foreach ($t['alterColumn'] as $c_name => $type) {
                if ($way) {
                    $this->alterColumn($t_name, $c_name, current($type));
                } else {
                    $this->alterColumn($t_name, $c_name, key($type));
                }
            }
        }



        return true;
    }
}
