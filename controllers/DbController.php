<?php
namespace kubo0\migratearray\controllers;

use yii\helpers\Console;
use yii\console\Controller;
use Yii;

class DbController extends Controller
{

    /**
     * Main action.
     * @param string|null $tb 
     */
    public function actionGetSchema($tb = null) {
        array_walk(self::tableSchema($tb), function($r) {
            Console::output($r);
        });
    }

    /**
     * Extract migration schema from curent db.
     * @param string $tb 
     * @return array of lines
     */
    private static function tableSchema($tb) {
        $ident = '    ';
        $schemas = Yii::$app->db->schema->tableSchemas;
        foreach ($schemas as $kt => $table) {
            if ($table->name == "migration" or 
                ($tb and $table->name != $tb)) continue;
            $result[] = '$tableName'."$kt = '$table->name';";
            $result[] = '$this->createTable(self::$tableName'.$kt.', [';
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