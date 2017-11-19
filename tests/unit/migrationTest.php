<?php

namespace kubo0\migratearray\tests\unit;

use Yii;
use Codeception\Test\Unit;

// codecept -d run unit mainTest
class MigrationTest extends Unit
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

    // codecept -d run unit mainTest:testGetTableOptions
    function testGetTableOptions() {
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