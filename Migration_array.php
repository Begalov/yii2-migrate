<?php
/**
 * This view is used by console/controllers/MigrateController.php
 * The following variables are available in this view:
 */
/* @var $className string the new migration class name */

echo "<?php\n";
?>

use yii\db\Schema;

class <?= $className ?> extends \kubo0\migratearray\Migration
{
    private $migration = [
        'table1'=>[
            'createTable' => [
                'options'=>'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB',
                'columns'=>[ // colum name => schema type
                    'id' => Schema::TYPE_BIGPK,
                    'name' => Schema::TYPE_STRING,
                    'type' => Schema::TYPE_INTEGER,
                    'status' => 'int(1) null',
                    'text' => Schema::TYPE_TEXT . ' null',
                    ]
                ]
            ],
        [
        'tableName' => 'table1'
        // command => new name
        'renameTable'=>'table2',
        ],
        'table2'=>[
            'renameTable'=>'table22', // command => new name
            'renameColumn'=>[
                'oldColumnName1' => 'newColumnName1',
                'oldColumnName2' => 'newColumnName2',
                'oldColumnName3' => 'newColumnName3',
            ],
            'alterColumn'=>[ // column name => [old type => new type]
                'columnName1'=>[Schema::TYPE_INTEGER => Schema::TYPE_STRING],
                'columnName2'=>['int(1) null' => 'string'],
            ],
            'addColumn'=>[ // colum name => schema type
                'newColumnName3'=>Schema::TYPE_INTEGER,
            ],
            'createIndex'=>[ // index name => uniq bool
                'indexName' => true,
            ]
        ],
    ];

    public function up()
    {
        return $this->migrate($this->migration);
    }

    public function down()
    {
        // echo "<?= $className ?> cannot be reverted.\n";

        // return false; // or

        return $this->migrate($this->migration,false);
    }


    /*
    // Use safeUp/safeDown to run migration code within a transaction
    public function safeUp()
    {
        //\Yii::$app->db->createSavepoint($t_name);

        //$r[$t_name]
        //  ? \Yii::$app->db->releaseSavepoint($t_name)
        //  : \Yii::$app->db->rollBackSavepoint($t_name);
    }

    public function safeDown()
    {
    }
    */
}
