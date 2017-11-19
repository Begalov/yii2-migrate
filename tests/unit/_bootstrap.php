<?php
/*defined('YII_DEBUG') or define('YII_DEBUG', true);
defined('YII_ENV') or define('YII_ENV', 'test');

defined('VENDOR_PATH') or define('VENDOR_PATH', dirname(dirname(dirname(dirname(__DIR__)))).'/vendor');

require_once(VENDOR_PATH . '/autoload.php');
require_once(VENDOR_PATH . '/yiisoft/yii2/Yii.php');

// set correct script paths
$_SERVER['SERVER_NAME'] = 'localhost';
$_SERVER['SERVER_PORT'] = '80';

Yii::setAlias('@tests', dirname(__DIR__));*/

// to avoid some bag
\Codeception\Specify\Config::setDeepClone(false);
