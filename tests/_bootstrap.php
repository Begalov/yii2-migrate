<?php
/** 
 * file from yii2-entry
*/

defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'test');
// defined('YII_APP_PATH') or define('YII_APP_PATH', realpath(dirname(__DIR__.'/adv.dev/', 3)));
defined('VENDOR_PATH') or define('VENDOR_PATH', dirname(__DIR__, 2).'/vendor/');
defined('STDIN') or define('STDIN', fopen('php://stdin', 'r'));
defined('STDOUT') or define('STDOUT', fopen('php://stdout', 'w'));
// var_dump(VENDOR_PATH);


require_once(VENDOR_PATH . '/autoload.php');
require_once(VENDOR_PATH . '/yiisoft/yii2/Yii.php');

Yii::setAlias('@tests', dirname(__DIR__));

// require(YII_APP_PATH . '/common/config/bootstrap.php');
// require(YII_APP_PATH . '/backend/config/bootstrap.php');