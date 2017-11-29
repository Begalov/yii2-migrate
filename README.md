# yii2-migrate

Migration assistant

## Installation

Console app configuration:
```
return [
...
    'controllerMap' => [
        'migrate' => [
            'class' => 'kubo0\migrate\controllers\MigrateController',
            'templateFile' => 'kubo0\migrate\views\MigrationAsArray.php',
        ],
    ],
...
];
```

## Features

### Generate migration schema for existing table

`yii migrate/get-schema` from `kubo0\migrate\controllers\MigrateController` generate migration schema for all db tables if not specified.

### Bidirectional migration over array schema

When you create a new table, the original way is comfy, but if you have to deal with the development of an existing table migration, the original one can confuse.

#### Commands avaible over array

`yii migrate/create` generate template from `kubo0\migrate\views\MigrationAsArray.php`

* createTable, renameTable - yes
* dropTable, truncateTable - no
* addColumn, dropColumn - yes
* renameColumn, alterColumn - yes
* addPrimaryKey, dropPrimaryKey - yes
* addForeignKey, dropForeignKey - no
* createIndex, dropIndex - yes
* addCommentOnColumn, addCommentOnTable - no
* dropCommentFromColumn, dropCommentFromTable - no
* execute, insert, batchInsert, update, delete - not planning

#### Usage

Modify array to your purpose. Don't use same keys as names in same array. If you need to rename one table and on it's place create other with same name use 'tableName' insted of key;

and `./yii migrate/up` or `down` will apply and rollback migration.

tips used from https://yii2-cookbook.readthedocs.org/using-custom-migration-template/





## Sqlite and comments

If your migration contains comments just add `kubo0\migrate\traits\MigrationSqliteCommentTrait` in it
