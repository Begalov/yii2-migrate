<?php
namespace kubo0\migrate\traits;

/**
 * use with yii\db\Migration
 * @author RUben <begalov@gmail.com>
 * @version 0.1.0
 */
trait MigrationSqliteCommentTrait
{

    public function addCommentOnColumn($table, $column, $comment) {
        if ($this->db->driverName !== 'sqlite') 
            parent::addCommentOnColumn($table, $column, $comment);
    }

    public function addCommentOnTable($table, $comment) {
        if ($this->db->driverName !== 'sqlite') 
            parent::addCommentOnTable($table, $comment);
    }

    public function dropCommentFromColumn($table, $column) {
        if ($this->db->driverName !== 'sqlite') 
            parent::dropCommentFromColumn($table, $column);
    }

    public function dropCommentFromTable($table) {
        if ($this->db->driverName !== 'sqlite') 
            parent::dropCommentFromTable($table);
    }

    /**
     * Owerride yii\db\Migration::createTable for sqlite comment bypass
     *
     * @param string $table the name of the table to be created. The name will be properly quoted by the method.
     * @param array $columns the columns (name => definition) in the new table.
     * @param string $options additional SQL fragment that will be appended to the generated SQL.
     */
    public function createTable($table, $columns, $options = null)
    {
        $time = $this->beginCommand("create table $table");
        $this->db->createCommand()->createTable($table, $columns, $options)->execute();
        foreach ($columns as $column => $type) {
            if ($type instanceof ColumnSchemaBuilder && $type->comment !== null && $this->db->driverName !== 'sqlite') {
                $this->db->createCommand()->addCommentOnColumn($table, $column, $type->comment)->execute();
            }
        }
        $this->endCommand($time);
    }

}
