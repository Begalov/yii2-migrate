# yii2-migrate-array

Yii2 up and down migration as array helper and template.

Supported commands:
* createTable
* renameTable
* addColumn
* renameColumn
* alterColumn
* createIndex

## Installation

### via packagist

#### composer require kubo0/yii2-migrate-array 

Configure **config/console.php** or **console/config/main.php**:
```php
return [
...
    'controllerMap' => [
        'migrate' => [
            'class' => 'yii\console\controllers\MigrateController',
            'templateFile' => 'kubo0/migratearray/Migration_array.php',
        ],
    ],
...
];
```
then **./yii migrate/create** will use our template instead of standard one.

modify *$migration** array for your purpose with various count of tables:
```php
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
        ]]],
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
        ]],
        'addColumn'=>[ // colum name => schema type
            'newColumnName3'=>Schema::TYPE_INTEGER,
        ],
        'createIndex'=>[ // index name => uniq bool
            'indexName' => true,
        ]],
    ];
```
and **./yii migrate/up** or **down** will apply and rollback migration.

tips used from https://yii2-cookbook.readthedocs.org/using-custom-migration-template/

