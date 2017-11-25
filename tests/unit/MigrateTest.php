<?php
namespace tests\codeception\common\components;

use Yii;
use common\models\Img;
use common\models\File;
use tests\codeception\common\unit\TestCase;
use yii\db\Schema;


/**
 * codecept run -d unit models\ImgTest
 */
class ImgTest extends TestCase
{
    /**
     * @var \tests\codeception\common\UnitTester
     */
    protected $tester;

    protected function _before()
    {
    }

    protected function _after()
    {
    }

    // tests
    public function testOne()
    {
        $array = $migration = [
            'ad_stuff'=>[
                // command => new name
                'renameTable'=>'ad_stuff_position',
                ],
            'ad_stuff'=>[
                // command => new name
                'createTable' => [
                    'options'=>'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB',
                    'columns'=>[ // colum name => Schema type
                        'id' => Schema::TYPE_BIGPK,
                        'user_id' => Schema::TYPE_STRING,
                        'position' => Schema::TYPE_INTEGER, // contract, bill, act, estimate
                        'status' => Schema::TYPE_INTEGER, // created, accepted, sendet, signed, received,  
                        // 'prefix' => Schema::TYPE_TEXT,
                        // 'message' => Schema::TYPE_TEXT,
                ]]],
            'ad_doc'=>[
                // command => new name
                'createTable' => [
                    'options'=>'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB',
                    'columns'=>[ // colum name => Schema type
                        'id' => Schema::TYPE_BIGPK,
                        'name' => Schema::TYPE_STRING,
                        'type' => Schema::TYPE_INTEGER, // contract, bill, act, estimate
                        'status' => Schema::TYPE_INTEGER, // created, accepted, sendet, signed, received,  
                        'prefix' => Schema::TYPE_TEXT,
                        'message' => Schema::TYPE_TEXT,
                ]]],
            'ad_partner'=>[
                // command => new name
                'renameTable'=>'ad_contractor',
                'renameColumn'=>[ // column old => new name
                    'partnerName'=>'name',
                    'fullPartnerName'=>'fullName',
                    'bankName'=>'bank',
                    'create'=>'created_at',
                    'update'=>'updated_at',
                    'author_id'=>'created_by',
                    'log'=>'rawData',
                ],
                'addColumn'=>[ // colum name => Schema type
                    'updated_by'=>Schema::TYPE_INTEGER,
                ],
                'createIndex'=>[ // index name => uniq bool
                    'inn'=>true,
                ]],
            ];
        codecept_debug($array);
    }

    public function testTwo()
    {
        $array = $migration = [
            [
            'tableName' => 'ad_stuff',
            // command => new name
            'renameTable'=>'ad_stuff_pos',
            ],
        'ad_stuff'=>[
            // command => new name
            'createTable' => [
                'options'=>'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB',
                'columns'=>[ // colum name => Schema type
                    'id' => Schema::TYPE_BIGPK,
                    'user_id' => Schema::TYPE_STRING,
                    'position' => Schema::TYPE_INTEGER, // contract, bill, act, estimate
                    'status' => Schema::TYPE_INTEGER, // created, accepted, sendet, signed, received,  
                    // 'prefix' => Schema::TYPE_TEXT,
                    // 'message' => Schema::TYPE_TEXT,
            ]]],
        'ad_doc'=>[
            // command => new name
            'createTable' => [
                'options'=>'CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE=InnoDB',
                'columns'=>[ // colum name => Schema type
                    'id' => Schema::TYPE_BIGPK,
                    'name' => Schema::TYPE_STRING,
                    'type' => Schema::TYPE_INTEGER, // contract, bill, act, estimate
                    'status' => Schema::TYPE_INTEGER, // created, accepted, sendet, signed, received,  
                    'prefix' => Schema::TYPE_TEXT,
                    'message' => Schema::TYPE_TEXT,
            ]]],
        'ad_partner'=>[
            // command => new name
            'renameTable'=>'ad_contractor',
            'renameColumn'=>[ // column old => new name
                'partnerName'=>'name',
                'fullPartnerName'=>'fullName',
                'bankName'=>'bank',
                'create'=>'created_at',
                'update'=>'updated_at',
                'author_id'=>'created_by',
                'log'=>'rawData',
            ],
            'addColumn'=>[ // colum name => Schema type
                'updated_by'=>Schema::TYPE_INTEGER,
            ],
            'createIndex'=>[ // index name => uniq bool
                'inn'=>true,
            ]],
            ];
        codecept_debug(array_reverse($array));
    }
    
    // public function testBeforeDelete() {
    //     codecept_debug($img->beforeDelete());
    // }
}