/*
 Navicat Premium Dump SQL

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 50740 (5.7.40)
 Source Host           : localhost:3306
 Source Schema         : admin

 Target Server Type    : MySQL
 Target Server Version : 50740 (5.7.40)
 File Encoding         : 65001

 Date: 09/07/2025 14:08:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `version` bigint(20) NOT NULL,
  `migration_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `start_time` timestamp NULL DEFAULT NULL,
  `end_time` timestamp NULL DEFAULT NULL,
  `breakpoint` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (20241010000001, 'AdminPlugin', '2025-07-08 11:28:46', '2025-07-08 11:28:46', 0);
INSERT INTO `migrations` VALUES (20241010000002, 'AdminPlugin', '2025-07-08 11:28:46', '2025-07-08 11:28:46', 0);

-- ----------------------------
-- Table structure for system_auth
-- ----------------------------
DROP TABLE IF EXISTS `system_auth`;
CREATE TABLE `system_auth`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '权限名称',
  `utype` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '身份权限',
  `desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注说明',
  `sort` bigint(20) NULL DEFAULT 0 COMMENT '排序权重',
  `status` int(1) NULL DEFAULT 1 COMMENT '权限状态(1使用,0禁用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i73a781d61_sort`(`sort`) USING BTREE,
  INDEX `i73a781d61_title`(`title`) USING BTREE,
  INDEX `i73a781d61_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-权限' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_auth
-- ----------------------------
INSERT INTO `system_auth` VALUES (1, 'user01', '', '普通用户', 0, 1, '2025-07-08 14:08:38');

-- ----------------------------
-- Table structure for system_auth_node
-- ----------------------------
DROP TABLE IF EXISTS `system_auth_node`;
CREATE TABLE `system_auth_node`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `auth` bigint(20) NULL DEFAULT 0 COMMENT '角色',
  `node` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节点',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i4cd9aaff6_auth`(`auth`) USING BTREE,
  INDEX `i4cd9aaff6_node`(`node`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-授权' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_auth_node
-- ----------------------------
INSERT INTO `system_auth_node` VALUES (8, 1, 'admin');
INSERT INTO `system_auth_node` VALUES (9, 1, 'admin/word');
INSERT INTO `system_auth_node` VALUES (10, 1, 'admin/word/index');

-- ----------------------------
-- Table structure for system_base
-- ----------------------------
DROP TABLE IF EXISTS `system_base`;
CREATE TABLE `system_base`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数据类型',
  `code` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数据代码',
  `name` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '数据名称',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '数据内容',
  `sort` bigint(20) NULL DEFAULT 0 COMMENT '排序权重',
  `status` int(1) NULL DEFAULT 1 COMMENT '数据状态(0禁用,1启动)',
  `deleted` int(1) NULL DEFAULT 0 COMMENT '删除状态(0正常,1已删)',
  `deleted_at` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '删除时间',
  `deleted_by` bigint(20) NULL DEFAULT 0 COMMENT '删除用户',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i2a29c450f_type`(`type`) USING BTREE,
  INDEX `i2a29c450f_code`(`code`) USING BTREE,
  INDEX `i2a29c450f_name`(`name`) USING BTREE,
  INDEX `i2a29c450f_sort`(`sort`) USING BTREE,
  INDEX `i2a29c450f_status`(`status`) USING BTREE,
  INDEX `i2a29c450f_deleted`(`deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-字典' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_base
-- ----------------------------

-- ----------------------------
-- Table structure for system_config
-- ----------------------------
DROP TABLE IF EXISTS `system_config`;
CREATE TABLE `system_config`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '配置分类',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '配置名称',
  `value` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '配置内容',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i48e345b98_type`(`type`) USING BTREE,
  INDEX `i48e345b98_name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-配置' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_config
-- ----------------------------
INSERT INTO `system_config` VALUES (1, 'base', 'app_name', 'ThinkAdmin');
INSERT INTO `system_config` VALUES (2, 'base', 'app_version', 'v6');
INSERT INTO `system_config` VALUES (3, 'base', 'editor', 'ckeditor5');
INSERT INTO `system_config` VALUES (4, 'base', 'login_name', '系统管理');
INSERT INTO `system_config` VALUES (5, 'base', 'site_copy', '©版权所有 2014-2025 ThinkAdmin');
INSERT INTO `system_config` VALUES (6, 'base', 'site_icon', 'https://thinkadmin.top/static/img/logo.png');
INSERT INTO `system_config` VALUES (7, 'base', 'site_name', 'ThinkAdmin');
INSERT INTO `system_config` VALUES (8, 'base', 'site_theme', 'default');
INSERT INTO `system_config` VALUES (9, 'storage', 'allow_exts', 'doc,gif,ico,jpg,mp3,mp4,p12,pem,png,zip,rar,xls,xlsx');
INSERT INTO `system_config` VALUES (10, 'storage', 'type', 'local');
INSERT INTO `system_config` VALUES (11, 'wechat', 'type', 'api');
INSERT INTO `system_config` VALUES (12, 'base', 'site_host', 'http://thinkadmin.cc');
INSERT INTO `system_config` VALUES (13, 'storage', 'link_type', 'none');
INSERT INTO `system_config` VALUES (14, 'storage', 'name_type', 'xmd5');
INSERT INTO `system_config` VALUES (15, 'storage', 'local_http_protocol', 'follow');

-- ----------------------------
-- Table structure for system_data
-- ----------------------------
DROP TABLE IF EXISTS `system_data`;
CREATE TABLE `system_data`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '配置名',
  `value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '配置值',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `icbccedc16_name`(`name`) USING BTREE,
  INDEX `icbccedc16_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-数据' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_data
-- ----------------------------

-- ----------------------------
-- Table structure for system_file
-- ----------------------------
DROP TABLE IF EXISTS `system_file`;
CREATE TABLE `system_file`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '上传类型',
  `hash` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件哈希',
  `tags` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件标签',
  `name` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件名称',
  `xext` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件后缀',
  `xurl` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '访问链接',
  `xkey` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件路径',
  `mime` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '文件类型',
  `size` bigint(20) NULL DEFAULT 0 COMMENT '文件大小',
  `uuid` bigint(20) NULL DEFAULT 0 COMMENT '用户编号',
  `unid` bigint(20) NULL DEFAULT 0 COMMENT '会员编号',
  `isfast` int(1) NULL DEFAULT 0 COMMENT '是否秒传',
  `issafe` int(1) NULL DEFAULT 0 COMMENT '安全模式',
  `status` int(1) NULL DEFAULT 1 COMMENT '上传状态(1悬空,2落地)',
  `create_at` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i738a363ca_type`(`type`) USING BTREE,
  INDEX `i738a363ca_hash`(`hash`) USING BTREE,
  INDEX `i738a363ca_uuid`(`uuid`) USING BTREE,
  INDEX `i738a363ca_xext`(`xext`) USING BTREE,
  INDEX `i738a363ca_unid`(`unid`) USING BTREE,
  INDEX `i738a363ca_tags`(`tags`) USING BTREE,
  INDEX `i738a363ca_name`(`name`) USING BTREE,
  INDEX `i738a363ca_status`(`status`) USING BTREE,
  INDEX `i738a363ca_issafe`(`issafe`) USING BTREE,
  INDEX `i738a363ca_isfast`(`isfast`) USING BTREE,
  INDEX `i738a363ca_create_at`(`create_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-文件' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_file
-- ----------------------------

-- ----------------------------
-- Table structure for system_menu
-- ----------------------------
DROP TABLE IF EXISTS `system_menu`;
CREATE TABLE `system_menu`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NULL DEFAULT 0 COMMENT '上级ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单名称',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单图标',
  `node` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '节点代码',
  `url` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '链接节点',
  `params` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '链接参数',
  `target` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '_self' COMMENT '打开方式',
  `sort` bigint(20) NULL DEFAULT 0 COMMENT '排序权重',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态(0:禁用,1:启用)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i29b9da675_pid`(`pid`) USING BTREE,
  INDEX `i29b9da675_sort`(`sort`) USING BTREE,
  INDEX `i29b9da675_status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-菜单' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_menu
-- ----------------------------
INSERT INTO `system_menu` VALUES (1, 0, '系统管理', '', '', '#', '', '_self', 100, 1, '2025-07-08 11:28:46');
INSERT INTO `system_menu` VALUES (2, 1, '系统配置', '', '', '#', '', '_self', 0, 1, '2025-07-08 11:28:46');
INSERT INTO `system_menu` VALUES (3, 2, '系统参数配置', 'layui-icon layui-icon-set', 'admin/config/index', 'admin/config/index', '', '_self', 0, 1, '2025-07-08 11:28:46');
INSERT INTO `system_menu` VALUES (4, 2, '系统任务管理', 'layui-icon layui-icon-log', 'admin/queue/index', 'admin/queue/index', '', '_self', 0, 1, '2025-07-08 11:28:46');
INSERT INTO `system_menu` VALUES (5, 2, '系统日志管理', 'layui-icon layui-icon-form', 'admin/oplog/index', 'admin/oplog/index', '', '_self', 0, 1, '2025-07-08 11:28:46');
INSERT INTO `system_menu` VALUES (6, 2, '数据字典管理', 'layui-icon layui-icon-code-circle', 'admin/base/index', 'admin/base/index', '', '_self', 0, 1, '2025-07-08 11:28:46');
INSERT INTO `system_menu` VALUES (7, 2, '系统文件管理', 'layui-icon layui-icon-carousel', 'admin/file/index', 'admin/file/index', '', '_self', 0, 1, '2025-07-08 11:28:46');
INSERT INTO `system_menu` VALUES (8, 2, '系统菜单管理', 'layui-icon layui-icon-layouts', 'admin/menu/index', 'admin/menu/index', '', '_self', 0, 1, '2025-07-08 11:28:46');
INSERT INTO `system_menu` VALUES (9, 1, '权限管理', '', '', '#', '', '_self', 0, 1, '2025-07-08 11:28:46');
INSERT INTO `system_menu` VALUES (10, 9, '系统权限管理', 'layui-icon layui-icon-vercode', 'admin/auth/index', 'admin/auth/index', '', '_self', 0, 1, '2025-07-08 11:28:46');
INSERT INTO `system_menu` VALUES (11, 9, '系统用户管理', 'layui-icon layui-icon-username', 'admin/user/index', 'admin/user/index', '', '_self', 0, 1, '2025-07-08 11:28:46');
INSERT INTO `system_menu` VALUES (12, 0, '业务管理', '', '', '#', '', '_self', 0, 1, '2025-07-08 11:34:03');
INSERT INTO `system_menu` VALUES (13, 12, '助记词管理', '', '', 'admin/word/index', '', '_self', 0, 1, '2025-07-08 11:34:35');

-- ----------------------------
-- Table structure for system_oplog
-- ----------------------------
DROP TABLE IF EXISTS `system_oplog`;
CREATE TABLE `system_oplog`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `node` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '当前操作节点',
  `geoip` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作者IP地址',
  `action` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作行为名称',
  `content` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作内容描述',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '操作人用户名',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id7cb1c775_create_at`(`create_at`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-日志' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_oplog
-- ----------------------------
INSERT INTO `system_oplog` VALUES (1, 'admin/login/index', '127.0.0.1', '系统用户登录', '登录系统后台成功', 'admin', '2025-07-08 11:33:12');
INSERT INTO `system_oplog` VALUES (2, 'admin/menu/add', '127.0.0.1', '系统菜单管理', '增加系统菜单[12]成功', 'admin', '2025-07-08 11:34:02');
INSERT INTO `system_oplog` VALUES (3, 'admin/menu/add', '127.0.0.1', '系统菜单管理', '增加系统菜单[13]成功', 'admin', '2025-07-08 11:34:34');
INSERT INTO `system_oplog` VALUES (4, 'admin/menu/edit', '127.0.0.1', '系统菜单管理', '更新系统菜单[13]记录', 'admin', '2025-07-08 11:35:33');
INSERT INTO `system_oplog` VALUES (5, 'admin/menu/edit', '127.0.0.1', '系统菜单管理', '更新系统菜单[13]记录', 'admin', '2025-07-08 11:41:02');
INSERT INTO `system_oplog` VALUES (6, 'admin/index/pass', '127.0.0.1', '系统用户管理', '修改用户[10000]密码成功', 'admin', '2025-07-08 14:06:41');
INSERT INTO `system_oplog` VALUES (7, 'admin/auth/add', '127.0.0.1', '系统权限管理', '增加系统权限[1]成功', 'admin', '2025-07-08 14:08:37');
INSERT INTO `system_oplog` VALUES (8, 'admin/auth/add', '127.0.0.1', '系统权限管理', '配置系统权限[1]授权成功', 'admin', '2025-07-08 14:08:37');
INSERT INTO `system_oplog` VALUES (9, 'admin/user/add', '127.0.0.1', '系统用户管理', '增加系统用户[10001]成功', 'admin', '2025-07-08 14:09:02');
INSERT INTO `system_oplog` VALUES (10, 'admin/login/index', '127.0.0.1', '系统用户登录', '登录系统后台成功', 'user01', '2025-07-08 14:12:06');
INSERT INTO `system_oplog` VALUES (11, 'admin/index/pass', '127.0.0.1', '系统用户管理', '修改用户[10001]密码成功', 'user01', '2025-07-08 14:13:14');
INSERT INTO `system_oplog` VALUES (12, 'admin/login/index', '127.0.0.1', '系统用户登录', '登录系统后台成功', 'admin', '2025-07-08 20:43:25');
INSERT INTO `system_oplog` VALUES (13, 'admin/api.system/clear', '127.0.0.1', '系统运维管理', '清理网站日志缓存', 'admin', '2025-07-08 20:51:36');
INSERT INTO `system_oplog` VALUES (14, 'admin/auth/edit', '127.0.0.1', '系统权限管理', '更新系统权限[1]记录', 'admin', '2025-07-08 20:51:51');
INSERT INTO `system_oplog` VALUES (15, 'admin/auth/edit', '127.0.0.1', '系统权限管理', '配置系统权限[1]授权成功', 'admin', '2025-07-08 20:51:51');
INSERT INTO `system_oplog` VALUES (16, 'admin/login/index', '127.0.0.1', '系统用户登录', '登录系统后台成功', 'user01', '2025-07-08 20:52:23');

-- ----------------------------
-- Table structure for system_queue
-- ----------------------------
DROP TABLE IF EXISTS `system_queue`;
CREATE TABLE `system_queue`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `code` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务编号',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `command` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '执行指令',
  `exec_pid` bigint(20) NULL DEFAULT 0 COMMENT '执行进程',
  `exec_data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '执行参数',
  `exec_time` bigint(20) NULL DEFAULT 0 COMMENT '执行时间',
  `exec_desc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '执行描述',
  `enter_time` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '开始时间',
  `outer_time` decimal(20, 4) NULL DEFAULT 0.0000 COMMENT '结束时间',
  `loops_time` bigint(20) NULL DEFAULT 0 COMMENT '循环时间',
  `attempts` bigint(20) NULL DEFAULT 0 COMMENT '执行次数',
  `message` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '最新消息',
  `rscript` int(1) NULL DEFAULT 1 COMMENT '任务类型(0单例,1多例)',
  `status` int(1) NULL DEFAULT 1 COMMENT '任务状态(1新任务,2处理中,3成功,4失败)',
  `create_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `if64376974_code`(`code`) USING BTREE,
  INDEX `if64376974_title`(`title`) USING BTREE,
  INDEX `if64376974_status`(`status`) USING BTREE,
  INDEX `if64376974_rscript`(`rscript`) USING BTREE,
  INDEX `if64376974_create_at`(`create_at`) USING BTREE,
  INDEX `if64376974_exec_time`(`exec_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-任务' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_queue
-- ----------------------------

-- ----------------------------
-- Table structure for system_user
-- ----------------------------
DROP TABLE IF EXISTS `system_user`;
CREATE TABLE `system_user`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `usertype` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户类型',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户昵称',
  `headimg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `authorize` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '权限授权',
  `contact_qq` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系QQ',
  `contact_mail` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系邮箱',
  `contact_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '联系手机',
  `login_ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地址',
  `login_at` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录时间',
  `login_num` bigint(20) NULL DEFAULT 0 COMMENT '登录次数',
  `describe` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注说明',
  `sort` bigint(20) NULL DEFAULT 0 COMMENT '排序权重',
  `status` int(1) NULL DEFAULT 1 COMMENT '状态(0禁用,1启用)',
  `is_deleted` int(1) NULL DEFAULT 0 COMMENT '删除(1删除,0未删)',
  `create_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `i34b957835_sort`(`sort`) USING BTREE,
  INDEX `i34b957835_status`(`status`) USING BTREE,
  INDEX `i34b957835_username`(`username`) USING BTREE,
  INDEX `i34b957835_is_deleted`(`is_deleted`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10002 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统-用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_user
-- ----------------------------
INSERT INTO `system_user` VALUES (10000, '', 'admin', '9f2791a87578ad976a1204ab7a278863', '超级管理员', 'https://thinkadmin.top/static/img/head.png', '', '', '', '', '127.0.0.1', '2025-07-08 20:43:25', 2, '', 0, 1, 0, '2025-07-08 11:28:47');
INSERT INTO `system_user` VALUES (10001, '', 'user01', '9f2791a87578ad976a1204ab7a278863', 'user01', '', ',1,', '', '', '', '127.0.0.1', '2025-07-08 20:52:23', 2, '', 0, 1, 0, '2025-07-08 14:09:02');

-- ----------------------------
-- Table structure for word
-- ----------------------------
DROP TABLE IF EXISTS `word`;
CREATE TABLE `word`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '助记词',
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `createdat` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of word
-- ----------------------------
INSERT INTO `word` VALUES (1, '大商股份噶地方噶发电房发过的撒gas', NULL, '2025-07-08 13:16:30');
INSERT INTO `word` VALUES (2, '范德萨发是的是的萨达阿萨', NULL, '2025-07-08 13:16:46');
INSERT INTO `word` VALUES (3, 'gfdagdf fasdfasd fdsafads fsdfas fasdfas fasdafs fasdfa fafsdas fsdafasd fdsafsd fafads fasfsdf', NULL, '2025-07-08 13:44:26');
INSERT INTO `word` VALUES (4, 'gfdagdf fasdfasd fdsafads fsdfas fasdfas fasdafs fasdfa fafsdas fsdafasd fdsafsd fafads fasfsdf', NULL, '2025-07-08 13:49:18');
INSERT INTO `word` VALUES (5, 'fdsfdsa wqerqeew rewrewq rwrqq rwerqew rqwerewq rwerqq rqew rqweq rqwrqw rqrqw rwqrqrq', NULL, '2025-07-08 13:53:04');
INSERT INTO `word` VALUES (6, 'fdsfdsa wqerqeew rewrewq rwrqq rwerqew rqwerewq rwerqq rqew rqweq rqwrqw rqrqw rwqrqrq', NULL, '2025-07-08 13:53:40');
INSERT INTO `word` VALUES (7, 'test test test test test test test test test test test test', '127.0.0.1', '2025-07-09 14:07:50');

SET FOREIGN_KEY_CHECKS = 1;
