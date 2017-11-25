<?php
/**
 * This view is used by console/controllers/MigrateController.php
 * The following variables are available in this view:
 */
/* @var $className string the new migration class name */

echo "<?php\n";
?>

use yii\db\Schema;
use kubo0\migrate\MigrationAsArray as Migration;

class <?= $className ?> extends Migration
{
    private function getMigration() {
        return [
        'firstTable' => [
            'createTable' => [
                'options' => 'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB',
                'columns' => [
                    // colum name => schema type
                    'id' => Schema::TYPE_BIGPK,
                    'name' => Schema::TYPE_STRING . ' notNull',
                    'type' => Schema::TYPE_INTEGER,
                    'status' => 'int(1) null',
                    'text' => $this->text()->allowNull()->comment('some comment'),
                    ]
                ]
            ],
        [
        'tableName' => 'firstTable'
        // command => new name
        'tableToRename' => 'tableToRenameNewName',
        ],
        'secondTable' => [
            'renameTable' => 'secondTableNewName', // command => new name
            'renameColumn' => [
                'oldColumnName1' => 'newColumnName1',
                'oldColumnName2' => 'newColumnName2',
                'oldColumnName3' => 'newColumnName3',
            ],
            'alterColumn' => [ // column name => [old type => new type]
                'columnName1' => [Schema::TYPE_INTEGER => Schema::TYPE_STRING],
                'columnName2' => ['int(1) null' => 'string'],
            ],
            'addColumn' => [ // colum name => schema type
                'newColumnName3' => Schema::TYPE_INTEGER,
            ],
            'createIndex' => [ // index name => bool uniq
                'indexName' => true,
            ],
            'dropIndex' => [ // index name => bool was uniq?
                'indexName' => true,
            ]
        ],
    ];
    }

    // Use safeUp/safeDown to run migration code within a transaction
    public function safeUp()
    {

    }

    public function safeDown()
    {

    }

    /*
    public function up()
    {
        return $this->migrate($this->migration);
    }

    public function down()
    {
        return $this->migrate($this->migration,false);
    }
    */
}
