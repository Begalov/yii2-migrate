# yii2-migrate-array

Yii2 2-way migration as array helper and template.

### Supported commands:
* execute - not planning
* insert - not planning
* batchInsert - not planning
* update - not planning
* delete - not planning
* createTable - yes
* renameTable - yes
* dropTable - no
* truncateTable - no
* addColumn - yes
* dropColumn - yes
* renameColumn - yes
* alterColumn - yes
* addPrimaryKey - yes
* dropPrimaryKey - yes
* addForeignKey - yes
* dropForeignKey - no*
* createIndex - yes
* dropIndex - yes
* addCommentOnColumn - no
* addCommentOnTable - no
* dropCommentFromColumn - no
* dropCommentFromTable - no

## Installation
is not nessesary, just if you whant 'yii migrate/create' template generation

Configure config/console.php or console/config/main.php:
```
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
then ./yii migrate/create will use our template instead of standard one.

modify array to your purpose:

```
[
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
        'createIndex'=>[ // index name => bool uniq
            'indexName' => true,
        ],
        'dropIndex'=>[ // index name => bool was uniq?
            'indexName' => true,
        ]
    ],
];
```

* Don't use same keys as names in same array. If you need to rename one table and on it's place create other with same name use 'tableName' insted of key;

and ./yii migrate/up or down will apply and rollback migration.

tips used from https://yii2-cookbook.readthedocs.org/using-custom-migration-template/

