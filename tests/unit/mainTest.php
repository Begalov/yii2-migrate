<?php

namespace kubo0\migratearray\tests\unit;

use Yii;

// codecept -d run unit mainTest
class mainTest extends \Codeception\Test\Unit
{
    /**
     * @var \UnitTester
     */
    protected $tester;

    protected function _before()
    {
    }

    protected function _after()
    {
    }

    // codecept -d run unit mainTest:testSchemaToMigration
/*    public function testSchemaToMigrationCode() {
        $ident = '    ';
        $schemas = Yii::$app->db->schema->tableSchemas;
        foreach ($schemas as $kt => $table) {
            if ($table->name == "migration") continue;
            $result[] = '$tableName'.$kt.' = "'.$table->name.'";';
            $result[] = '$this->createTable(self::$tableName'.$kt.', [';
            foreach ($table->columns as $kc => $column) {
                if ($column->isPrimaryKey) $value = 'primaryKey()';
                else $value = "$column->type".'('.$this->defaultValue($column->defaultValue, $column->type).')'; // defaultValue works WRONG!
                $value .= $column->allowNull ? '->null()' : '';
                $value .= $column->comment ? "->comment($column->comment)" : '';
                $result[] = $ident."'$kc' => ".'$this->'."$value;";
                if ($column->defaultValue != null) $null[] = $kc; // for test
            }
            $result[] = ']);';
            // $result[] = "$this->createTable(self::$projectTable, [";
        }
        codecept_debug($result);
        codecept_debug($null);
    }*/

    // codecept -d run unit mainTest:testDefaultValue
    function testDefaultValue() {
        foreach ([['1','integer'],['some', 'string']] as $value) {
            codecept_debug($this->defaultValue($value[0],$value[1]));
        }
    }
/*
    private function defaultValue($value, $type) {
        if (is_numeric($value) or $type == 'integer')
            return $value;
        return '\''.$value.'\'';
    }*/

    // codecept -d run unit mainTest:testSchemaPrint
    public function testSchemaPrint() {
        codecept_debug(\kubo0\migratearray\controllers\DbController::actionGetSchema());
        // codecept_debug(Yii::$app->db->schema->tableSchemas);
    }


}