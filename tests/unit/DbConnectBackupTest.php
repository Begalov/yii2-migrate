<?php
namespace tests\codeception\common\components;

use Codeception\Specify;
use tests\codeception\common\unit\TestCase;
// use tests\codeception\common\fixtures\UserFixture;
use Yii;

class DbConnectBackupTest extends TestCase
{

    public function testBackupWithoutSourceDbSet()
    {
        // $this->assertEquals(false, \Yii::$app->db->backup(true));
    }

    public function testBackup_()
    {
        // $this->assertEquals(true, \Yii::$app->db->backup(true,'archdeco'));
    }
}