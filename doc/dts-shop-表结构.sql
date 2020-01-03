CREATE TABLE `dts_account_trace` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`trace_sn` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '操作流水',
`user_id` int(11) NOT NULL COMMENT '用户表的用户ID',
`type` int(2) NULL DEFAULT NULL COMMENT '操作类型 0:系统结算 1:用户提现',
`amount` decimal(10,2) NULL DEFAULT NULL COMMENT '操作金额',
`total_amount` decimal(10,2) NULL DEFAULT NULL COMMENT '总申请金额',
`add_time` datetime NULL DEFAULT NULL COMMENT '申请时间',
`mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机号',
`sms_code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '短信提取码',
`status` tinyint(3) NULL DEFAULT NULL COMMENT '审批状态',
`trace_msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '消息内容',
`update_time` datetime NULL DEFAULT NULL COMMENT '审批时间',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 15
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '账户流水表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_ad` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '广告标题',
`link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '所广告的商品页面或者活动页面链接地址',
`url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '广告宣传图片',
`position` tinyint(3) NULL DEFAULT 1 COMMENT '广告位置：1则是首页',
`content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '活动内容',
`start_time` datetime NULL DEFAULT NULL COMMENT '广告开始时间',
`end_time` datetime NULL DEFAULT NULL COMMENT '广告结束时间',
`enabled` tinyint(1) NULL DEFAULT 0 COMMENT '是否启动',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) ,
INDEX `enabled` (`enabled` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '广告表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_address` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '收货人名称',
`user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户表的用户ID',
`province_id` int(11) NOT NULL DEFAULT 0 COMMENT '行政区域表的省ID',
`city_id` int(11) NOT NULL DEFAULT 0 COMMENT '行政区域表的市ID',
`area_id` int(11) NOT NULL DEFAULT 0 COMMENT '行政区域表的区县ID',
`address` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '具体收货地址',
`mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号码',
`is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否默认地址',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) ,
INDEX `user_id` (`user_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 76
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '收货地址表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_admin` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员名称',
`password` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '管理员密码',
`last_login_ip` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最近一次登录IP地址',
`last_login_time` datetime NULL DEFAULT NULL COMMENT '最近一次登录时间',
`avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'' COMMENT '头像图片',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
`role_ids` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '[]' COMMENT '角色列表',
`desc` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户描述',
`tel` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 6
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '管理员表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_article` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '信息类型',
`title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '信息标题',
`content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '信息内容,富文本格式',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 3
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '文章信息表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_brand` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '品牌商名称',
`desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '品牌商简介',
`pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '品牌商页的品牌商图片',
`sort_order` tinyint(3) NULL DEFAULT 50,
`floor_price` decimal(10,2) NULL DEFAULT 0.00 COMMENT '品牌商的商品低价，仅用于页面展示',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`share_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享二维码图片',
`admin_id` int(11) NULL DEFAULT NULL COMMENT '管理用户id',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
`commpany` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
`auto_update_good` tinyint(1) NULL DEFAULT NULL COMMENT '自动监控更新商品',
`shop_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '店铺url地址',
`default_category_id` int(11) NULL DEFAULT NULL COMMENT '默认的商品类别id',
`default_pages` int(4) NULL DEFAULT NULL COMMENT '默认商品页面数',
`add_precent` int(4) NULL DEFAULT NULL COMMENT '店铺商品溢价',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1001079
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '品牌商表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_cart` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) NULL DEFAULT NULL COMMENT '用户表的用户ID',
`brand_id` int(11) NULL DEFAULT NULL COMMENT '入驻品牌商编码',
`goods_id` int(11) NULL DEFAULT NULL COMMENT '商品表的商品ID',
`goods_sn` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品编号',
`goods_name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品名称',
`product_id` int(11) NULL DEFAULT NULL COMMENT '商品货品表的货品ID',
`price` decimal(10,2) NULL DEFAULT 0.00 COMMENT '商品货品的价格',
`number` smallint(5) NULL DEFAULT 0 COMMENT '商品货品的数量',
`specifications` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品规格值列表，采用JSON数组格式',
`checked` tinyint(1) NULL DEFAULT 1 COMMENT '购物车中商品是否选择状态',
`pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片或者商品货品图片',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 780
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '购物车商品表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_category` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类目名称',
`keywords` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '类目关键字，以JSON数组格式',
`desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类目广告语介绍',
`pid` int(11) NOT NULL DEFAULT 0 COMMENT '父类目ID',
`icon_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类目图标',
`pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '类目图片',
`level` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'L1',
`sort_order` tinyint(3) NULL DEFAULT 50 COMMENT '排序',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) ,
INDEX `parent_id` (`pid` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 100101305
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '类目表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_collect` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户表的用户ID',
`value_id` int(11) NOT NULL DEFAULT 0 COMMENT '如果type=0，则是商品ID；如果type=1，则是专题ID',
`type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '收藏类型，如果type=0，则是商品ID；如果type=1，则是专题ID',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) ,
INDEX `user_id` (`user_id` ASC) USING BTREE,
INDEX `goods_id` (`value_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 82
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '收藏表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_comment` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`value_id` int(11) NOT NULL DEFAULT 0 COMMENT '如果type=0，则是商品评论；如果是type=1，则是专题评论。',
`type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '评论类型，如果type=0，则是商品评论；如果是type=1，则是专题评论；如果type=3，则是订单商品评论。',
`content` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论内容',
`user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户表的用户ID',
`has_picture` tinyint(1) NULL DEFAULT 0 COMMENT '是否含有图片',
`pic_urls` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图片地址列表，采用JSON数组格式',
`star` smallint(6) NULL DEFAULT 1 COMMENT '评分， 1-5',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) ,
INDEX `id_value` (`value_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1023
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '评论表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_coupon` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
`desc` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '优惠券介绍，通常是显示优惠券使用限制文字',
`tag` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '优惠券标签，例如新人专用',
`total` int(11) NOT NULL DEFAULT 0 COMMENT '优惠券数量，如果是0，则是无限量',
`discount` decimal(10,2) NULL DEFAULT 0.00 COMMENT '优惠金额，',
`min` decimal(10,2) NULL DEFAULT 0.00 COMMENT '最少消费金额才能使用优惠券。',
`limit` smallint(6) NULL DEFAULT 1 COMMENT '用户领券限制数量，如果是0，则是不限制；默认是1，限领一张.',
`type` smallint(6) NULL DEFAULT 0 COMMENT '优惠券赠送类型，如果是0则通用券，用户领取；如果是1，则是注册赠券；如果是2，则是优惠券码兑换；',
`status` smallint(6) NULL DEFAULT 0 COMMENT '优惠券状态，如果是0则是正常可用；如果是1则是过期; 如果是2则是下架。',
`goods_type` smallint(6) NULL DEFAULT 0 COMMENT '商品限制类型，如果0则全商品，如果是1则是类目限制，如果是2则是商品限制。',
`goods_value` varchar(1023) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '[]' COMMENT '商品限制值，goods_type如果是0则空集合，如果是1则是类目集合，如果是2则是商品集合。',
`code` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '优惠券兑换码',
`time_type` smallint(6) NULL DEFAULT 0 COMMENT '有效时间限制，如果是0，则基于领取时间的有效天数days；如果是1，则start_time和end_time是优惠券有效期；',
`days` smallint(6) NULL DEFAULT 0 COMMENT '基于领取时间的有效天数days。',
`start_time` date NULL DEFAULT NULL COMMENT '使用券开始时间',
`end_time` date NULL DEFAULT NULL COMMENT '使用券截至时间',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 12
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '优惠券信息及规则表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_coupon_user` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) NOT NULL COMMENT '用户ID',
`coupon_id` int(11) NOT NULL COMMENT '优惠券ID',
`status` smallint(6) NULL DEFAULT 0 COMMENT '使用状态, 如果是0则未使用；如果是1则已使用；如果是2则已过期；如果是3则已经下架；',
`used_time` datetime NULL DEFAULT NULL COMMENT '使用时间',
`start_time` date NULL DEFAULT NULL COMMENT '有效期开始时间',
`end_time` date NULL DEFAULT NULL COMMENT '有效期截至时间',
`order_sn` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单编号',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 354
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '优惠券用户使用表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_del_picture` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`picUrl` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 2035
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Dynamic;
CREATE TABLE `dts_feedback` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户表的用户ID',
`username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户名称',
`mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
`feed_type` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '反馈类型',
`content` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '反馈内容',
`status` int(3) NOT NULL DEFAULT 0 COMMENT '状态',
`has_picture` tinyint(1) NULL DEFAULT 0 COMMENT '是否含有图片',
`pic_urls` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '图片地址列表，采用JSON数组格式',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) ,
INDEX `id_value` (`status` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 2
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '意见反馈表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_footprint` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户表的用户ID',
`goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '浏览商品ID',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 5398
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '用户浏览足迹表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_goods` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`goods_sn` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品编号',
`name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
`category_id` int(11) NULL DEFAULT 0 COMMENT '商品所属类目ID',
`brand_id` int(11) NULL DEFAULT 0,
`gallery` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品宣传图片列表，采用JSON数组格式',
`keywords` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品关键字，采用逗号间隔',
`brief` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '商品简介',
`is_on_sale` tinyint(1) NULL DEFAULT 1 COMMENT '是否上架',
`sort_order` smallint(4) NULL DEFAULT 100,
`pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品页面商品图片',
`share_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品分享朋友圈图片',
`is_new` tinyint(1) NULL DEFAULT 0 COMMENT '是否新品首发，如果设置则可以在新品首发页面展示',
`is_hot` tinyint(1) NULL DEFAULT 0 COMMENT '是否人气推荐，如果设置则可以在人气推荐页面展示',
`unit` varchar(31) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '’件‘' COMMENT '商品单位，例如件、盒',
`counter_price` decimal(10,2) NULL DEFAULT 0.00 COMMENT '专柜价格',
`retail_price` decimal(10,2) NULL DEFAULT 100000.00 COMMENT '零售价格',
`detail` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '商品详细介绍，是富文本格式',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`browse` int(11) NOT NULL DEFAULT 0 COMMENT '浏览量',
`sales` int(11) NOT NULL DEFAULT 0 COMMENT '已销售总量',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
`commpany` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '供货单位',
`wholesale_price` decimal(10,2) NULL DEFAULT NULL COMMENT '批发价格',
PRIMARY KEY (`id`) ,
INDEX `goods_sn` (`goods_sn` ASC) USING BTREE,
INDEX `cat_id` (`category_id` ASC) USING BTREE,
INDEX `brand_id` (`brand_id` ASC) USING BTREE,
INDEX `sort_order` (`sort_order` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 23857
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '商品基本信息表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_goods_attribute` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品表的商品ID',
`attribute` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品参数名称',
`value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品参数值',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) ,
INDEX `goods_id` (`goods_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 619120
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '商品参数表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_goods_product` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品表的商品ID',
`specifications` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品规格值列表，采用JSON数组格式',
`price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品货品价格',
`number` int(11) NOT NULL DEFAULT 0 COMMENT '商品货品数量',
`url` varchar(125) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品货品图片',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 339177
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '商品货品表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_goods_specification` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品表的商品ID',
`specification` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品规格名称',
`value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品规格值',
`pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品规格图片',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) ,
INDEX `goods_id` (`goods_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 181707
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '商品规格表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_groupon` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`order_id` int(11) NOT NULL COMMENT '关联的订单ID',
`groupon_id` int(11) NULL DEFAULT 0 COMMENT '参与的团购ID，仅当user_type不是1',
`rules_id` int(11) NOT NULL COMMENT '团购规则ID，关联dts_groupon_rules表ID字段',
`user_id` int(11) NOT NULL COMMENT '用户ID',
`creator_user_id` int(11) NOT NULL COMMENT '创建者ID',
`add_time` datetime NOT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`share_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '团购分享图片地址',
`payed` tinyint(1) NOT NULL COMMENT '是否已经支付',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 17
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_groupon_rules` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`goods_id` bigint(11) NOT NULL COMMENT '商品表的商品ID',
`goods_name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
`pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '商品图片或者商品货品图片',
`discount` decimal(63,0) NOT NULL COMMENT '优惠金额',
`discount_member` int(11) NOT NULL COMMENT '达到优惠条件的人数',
`add_time` datetime NOT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`expire_time` datetime NULL DEFAULT NULL COMMENT '团购过期时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 17
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_issue` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`question` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题标题',
`answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '问题答案',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '常见问题表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_keyword` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`keyword` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字',
`url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '关键字的跳转链接',
`is_hot` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是热门关键字',
`is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否是默认关键字',
`sort_order` int(11) NOT NULL DEFAULT 100 COMMENT '排序',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 10
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '关键字表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_order` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) NOT NULL COMMENT '用户表的用户ID',
`order_sn` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单编号',
`order_status` smallint(6) NOT NULL COMMENT '订单状态',
`consignee` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人名称',
`mobile` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人手机号',
`address` varchar(127) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货具体地址',
`message` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户订单留言',
`goods_price` decimal(10,2) NOT NULL COMMENT '商品总费用',
`freight_price` decimal(10,2) NULL DEFAULT NULL COMMENT '配送费用',
`coupon_price` decimal(10,2) NOT NULL COMMENT '优惠券减免',
`integral_price` decimal(10,2) NOT NULL COMMENT '用户积分减免',
`groupon_price` decimal(10,2) NOT NULL COMMENT '团购优惠价减免',
`order_price` decimal(10,2) NOT NULL COMMENT '订单费用， = goods_price + freight_price - coupon_price',
`actual_price` decimal(10,2) NOT NULL COMMENT '实付费用， = order_price - integral_price',
`pay_id` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '微信付款编号',
`pay_time` datetime NULL DEFAULT NULL COMMENT '微信付款时间',
`ship_sn` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货编号',
`ship_channel` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发货快递公司',
`ship_time` datetime NULL DEFAULT NULL COMMENT '发货开始时间',
`confirm_time` datetime NULL DEFAULT NULL COMMENT '用户确认收货时间',
`comments` smallint(6) NULL DEFAULT 0 COMMENT '待评价订单商品数量',
`end_time` datetime NULL DEFAULT NULL COMMENT '订单关闭时间',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
`settlement_money` decimal(10,2) NULL DEFAULT NULL COMMENT '代理结算金额',
`settlement_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '结算状态',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 167
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '订单表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_order_goods` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`order_id` int(11) NOT NULL DEFAULT 0 COMMENT '订单表的订单ID',
`brand_id` int(11) NULL DEFAULT NULL COMMENT '入驻品牌店铺编码',
`goods_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品表的商品ID',
`goods_name` varchar(127) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品名称',
`goods_sn` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品编号',
`product_id` int(11) NOT NULL DEFAULT 0 COMMENT '商品货品表的货品ID',
`number` smallint(5) NOT NULL DEFAULT 0 COMMENT '商品货品的购买数量',
`price` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT '商品货品的售价',
`specifications` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品货品的规格列表',
`pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '商品货品图片或者商品图片',
`comment` int(11) NULL DEFAULT 0 COMMENT '订单商品评论，如果是-1，则超期不能评价；如果是0，则可以评价；如果其他值，则是comment表里面的评论ID。',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) ,
INDEX `order_id` (`order_id` ASC) USING BTREE,
INDEX `goods_id` (`goods_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 283
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '订单商品表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_permission` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`role_id` int(11) NULL DEFAULT NULL COMMENT '角色ID',
`permission` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 52
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '权限表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_region` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`pid` int(11) NOT NULL DEFAULT 0 COMMENT '行政区域父ID，例如区县的pid指向市，市的pid指向省，省的pid则是0',
`name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '行政区域名称',
`type` tinyint(3) NOT NULL DEFAULT 0 COMMENT '行政区域类型，如如1则是省， 如果是2则是市，如果是3则是区县',
`code` int(11) NOT NULL DEFAULT 0 COMMENT '行政区域编码',
PRIMARY KEY (`id`) ,
INDEX `parent_id` (`pid` ASC) USING BTREE,
INDEX `region_type` (`type` ASC) USING BTREE,
INDEX `agency_id` (`code` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 3232
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '行政区域表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_role` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
`desc` varchar(1023) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色描述',
`enabled` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) ,
UNIQUE INDEX `name_UNIQUE` (`name` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 5
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '角色表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_search_history` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) NOT NULL COMMENT '用户表的用户ID',
`keyword` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '搜索关键字',
`from` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '搜索来源，如pc、wx、app',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 308
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '搜索历史表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_storage` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`key` varchar(63) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件的唯一索引',
`name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件名',
`type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件类型',
`size` int(11) NOT NULL COMMENT '文件大小',
`url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '文件访问链接',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = '文件存储表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_system` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`key_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统配置名',
`key_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '系统配置值',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 16
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '系统配置表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_topic` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '\'' COMMENT '专题标题',
`subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '\'' COMMENT '专题子标题',
`content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '专题内容，富文本格式',
`price` decimal(10,2) NULL DEFAULT 0.00 COMMENT '专题相关商品最低价',
`read_count` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1k' COMMENT '专题阅读量',
`pic_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '专题图片',
`sort_order` int(11) NULL DEFAULT 100 COMMENT '排序',
`goods` varchar(2048) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '专题相关商品序列码，用逗号分隔',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`share_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '活动分享二维码图片',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) ,
INDEX `topic_id` (`id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 318
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '专题表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_user` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`username` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名称',
`password` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户密码',
`gender` tinyint(3) NOT NULL DEFAULT 0 COMMENT '性别：0 未知， 1男， 1 女',
`birthday` date NULL DEFAULT NULL COMMENT '生日',
`last_login_time` datetime NULL DEFAULT NULL COMMENT '最近一次登录时间',
`last_login_ip` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '最近一次登录IP地址',
`user_level` tinyint(3) NULL DEFAULT 0 COMMENT '用户层级 0 普通用户，1 VIP用户，2 区域代理用户',
`nickname` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户昵称或网络名称',
`mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户手机号码',
`avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '用户头像图片',
`weixin_openid` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '微信登录openid',
`status` tinyint(3) NOT NULL DEFAULT 0 COMMENT '0 可用, 1 禁用, 2 注销',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
`share_user_id` int(11) NULL DEFAULT NULL,
PRIMARY KEY (`id`) ,
UNIQUE INDEX `user_name` (`username` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 200
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '用户表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_user_account` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`user_id` int(11) NOT NULL COMMENT '用户表的用户ID',
`remain_amount` decimal(10,2) NULL DEFAULT NULL COMMENT '账户总余额',
`total_amount` decimal(10,2) NULL DEFAULT NULL COMMENT '账户总额',
`create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
`modify_time` timestamp NULL DEFAULT NULL COMMENT '修改时间',
`settlement_rate` int(2) NULL DEFAULT NULL COMMENT '结算利率：5 表示5%或0.05',
`status` tinyint(3) NULL DEFAULT NULL COMMENT '账户状态',
`share_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分享推广二维码URL',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 37
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
COMMENT = '账户表'
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
CREATE TABLE `dts_user_formid` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`formId` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '缓存的FormId',
`isprepay` tinyint(1) NOT NULL COMMENT '是FormId还是prepayId',
`useAmount` int(2) NOT NULL COMMENT '可用次数，fromId为1，prepay为3，用1次减1',
`expire_time` datetime NOT NULL COMMENT '过期时间，腾讯规定为7天',
`openId` varchar(63) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '微信登录openid',
`add_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
`update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
`deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
PRIMARY KEY (`id`) 
)
ENGINE = InnoDB
AUTO_INCREMENT = 155
AVG_ROW_LENGTH = 0
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_general_ci
KEY_BLOCK_SIZE = 0
MAX_ROWS = 0
MIN_ROWS = 0
ROW_FORMAT = Compact;
