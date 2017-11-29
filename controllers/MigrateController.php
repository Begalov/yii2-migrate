<?php
namespace kubo0\migrate\controllers;

use Yii;
use yii\console\controllers\MigrateController as BaseMigrateController;
use yii\helpers\Console;

class MigrateController extends BaseMigrateController
{

    /**
     * Generate migration schema from all db tables if not specified.
     * @param string|null $tableName comma separeted table names
     */
    public function actionGetSchema($tableName = null) {
        array_walk(self::tableSchema(explode(',', $tableName)), function($line) {
            Console::output($line);
        });
    }

    /**
     * Extract migration schema from curent db.
     * @param string $tableName 
     * @return array of lines
     */
    private static function tableSchema(array $tableName) {
        $ident = '    ';
        $schemas = Yii::$app->db->schema->tableSchemas;
        if (YII_DEBUG) file_put_contents('debug$tableName', \yii\helpers\VarDumper::dumpAsString(boolval($tableName[0])));
        foreach ($schemas as $tableKey => $table) {
            if ($table->name == "migration" or 
                (boolval($tableName[0]) and !in_array($table->name, $tableName))) continue;
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