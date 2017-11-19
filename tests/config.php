<?php
/**
 * Application configuration shared by all applications and test types
 */
return [
    'id' => 'yii2-migratearray',
    'basePath' => dirname(__DIR__),
    'vendorPath' => VENDOR_PATH,
    'language' => 'ru',
    'sourceLanguage' => 'en',
/*    'controllerMap' => [
        'fixture' => [
            'class' => 'yii\faker\FixtureController',
            'fixtureDataPath' => '@tests/codeception/common/_fixtures/data',
            'templatePath' => '@tests/codeception/common/_templates/fixtures',
            'namespace' => 'tests\codeception\common\fixtures',
        ],
    ],*/
    'components' => [
        'db' => [
            'class' => 'yii\db\Connection',
            // 'class' => 'common\components\db\ConnectCloneBackup',
            // 'dsn' => 'mysql:host=localhost;dbname=yii2-migrate-array',
            'dsn' => 'sqlite:tests/_data/db2.sqlite',
        ],
        /*'mailer' => [
            'useFileTransport' => true,
        ],*/
        /*'urlManager' => [
            'showScriptName' => true,
        ],*/
    ],
];

//console/migrations
// yii migrate/up --migrationPath=C:\Users\RUben\YandexDisk\domains\adv.dev\console\migrations --db=db
// yii migrate/up --migrationPath=@vendor/kubo0/yii2-project/migrations --db=db
// 
// /console/migrations/m130524_201442_init.php
// C:\Users\RUben\YandexDisk\domains\adv.dev\console\migrations\m130524_201442_init.php