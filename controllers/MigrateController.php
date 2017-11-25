<?php
namespace kubo0\migrate\controllers;

use Yii;
use yii\console\controllers\MigrateController as BaseMigrateController;
use yii\helpers\Console;

class MigrateController extends BaseMigrateController
{

    /**
     * Main action.
     * @param string|null $tb 
     */
    public function actionGetSchema($tableName = null) {
        array_walk(self::tableSchema($tableName), function($line) {
            Console::output($line);
        });
    }

    /**
     * Extract migration schema from curent db.
     * @param string $tableName 
     * @return array of lines
     */
    private static function tableSchema($tableName) {
        $ident = '    ';
        $schemas = Yii::$app->db->schema->tableSchemas;
        foreach ($schemas as $tableKey => $table) {
            if ($table->name == "migration" or 
                ($tableName and $table->name != $tableName)) continue;
            $result[] = '$tableName'."$tableKey = '$table->name';";
            $result[] = '$this->createTable(self::$tableName'.$tableKey.', [';
            foreach ($table->columns as $kc => $column) {
                if ($column->isPrimaryKey)
                    $value = 'primaryKey()';
                else {
                    $value = "$column->type()";
                    $value .= $column->allowNull ? '->null()' : '->notNull()';
                    $value .= $column->defaultValue ? "->defaultValue('$column->defaultValue')" : '';
                }
                $value .= $column->comment ? "->comment('$column->comment')" : '';
                $result[] = $ident."'$kc' => ".'$this->'."$value,";
            }
            $result[] = ']);';
        }
        return $result;
    }

}