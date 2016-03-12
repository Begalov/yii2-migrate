<?php

namespace kubo0\migratearray;

class Migration extends \yii\db\Migration
{

    /**
     * Migrate all tables.
     * @param array $ts 
     * @param bool $way 
     * @return bool
     */
    public function migrate($ts,$way=true,$safe=false)
    {
        if (!is_array($ts))
            return false;

        foreach ($ts as $t_name => $t) {
            $r[$t_name] = $this->migrateOneTable($t_name,$t,$way);
        }
        return in_array(false,$r) ? false : true;
    }

    /**
     * Migrate one table.
     * @param array $ts 
     * @param bool $way 
     * @return bool
     */
    private function migrateOneTable($t_name,$t,$way=true)
    {

        if (!is_array($t) OR !is_string($t_name))
            return false;
        $tableSchema = $this->db->getTableSchema($t_name);
        
        if (isset($t['createTable'])) {
            if ($way AND !$tableSchema) {
                $this->createTable($t_name,
                    $t['createTable']['columns'],
                    $t['createTable']['options']);
            } elseif (!$way AND $tableSchema) {
                $this->dropTable($t_name);
                return true;
        }}

        if (isset($t['renameTable'])) {
            if ($way AND $t['renameTable'] != $tableSchema->name) {
                $this->renameTable($t_name,$t['renameTable']);
                $t_name = $t['renameTable'];
            } else
                $this->renameTable($t['renameTable'],$t_name);
        }

        if (isset($t['renameColumn'])) {
            if (!$way)
                $t['renameColumn'] = array_flip($t['renameColumn']);
            foreach ($t['renameColumn'] as $c_old_name => $c_new_name) {
                $this->renameColumn($t_name,$c_old_name,$c_new_name);
        }}

        if (isset($t['addColumn']) AND is_array($t['addColumn'])) {
            foreach ($t['addColumn'] as $c_name => $type) {
                if ($way) {
                    $this->addColumn($t_name,$c_name,$type);
                } else {
                    $this->dropColumn($t_name,$c_name);
        }}}

        if (is_array($t['createIndex'])) {
            foreach ($t['createIndex'] as $index => $uniq) {
                if ($way) {
                    $this->createIndex($index,$t_name,$index,$uniq);
                } else {
                    $this->dropIndex($index,$t_name);
        }}}

        if (is_array($t['alterColumn'])) {
            foreach ($t['alterColumn'] as $c_name => $type) {
                if ($way) {
                    $this->alterColumn($t_name,$c_name,current($type));
                } else {
                    $this->alterColumn($t_name,$c_name,key($type));
        }}}

        return true;
    }
}
