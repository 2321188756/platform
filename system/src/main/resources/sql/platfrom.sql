DROP DATABASE IF EXISTS platform;
CREATE DATABASE IF NOT EXISTS platform  DEFAULT CHARACTER SET utf8;
USE platform;

CREATE TABLE t_merchant(
		merchant_code INT(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,#商户编码
		merchant_name VARCHAR(20) NOT NULL,#商户名
		head VARCHAR(20) NOT NULL,   #负责人
		merchant_account VARCHAR(20),	#商户账户
		merchant_password VARCHAR(100), #商户密码
		telephone VARCHAR(20),					#商户电话
		address VARCHAR(50),						#地址
		create_time DATETIME,					#商户创建日期
		update_time DATETIME,         #更新时间
		status TINYINT(1),
		is_enabled TINYINT(1) DEFAULT 0,        #账户是否可用
		is_delete TINYINT(1)	DEFAULT 0					#账户是否删除
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO t_merchant(merchant_name,head,merchant_account,merchant_password,telephone,address,create_time,update_time,status)
VALUES
('苏宁','张三','suning','123456','023-5555','china',CURRENT_DATE,CURRENT_DATE,false),
('京东','李四','jingdong','123456','023-6666','china',CURRENT_DATE,CURRENT_DATE,false),
('淘宝','王五','taobao','123456','023-7777','china',CURRENT_DATE,CURRENT_DATE,false),
('拼多多','白嫖党','pdd','123456','023-8888','china',CURRENT_DATE,CURRENT_DATE,false);


CREATE TABLE t_permission(
		id INT(10) AUTO_INCREMENT,
		permisson_name VARCHAR(32),
		role_id INT(10),
		KEY id(id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT into t_permission(permisson_name,role_id)
values
('add',1),
('del',1),
('update',1),
('query',1);

CREATE TABLE t_role(
		id INT(10) AUTO_INCREMENT,
		role_name VARCHAR(32),
		KEY id(id)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO t_role(role_name)
VALUES
('admin'),
('db_manager'),
('user'),
('merchant');

CREATE TABLE t_user(
		id INT(10) PRIMARY KEY AUTO_INCREMENT,
		username VARCHAR(10),
		password VARCHAR(32),
		telephone VARCHAR(11),
		vipCode  VARCHAR(50) DEFAULT "none",
		dynamicVipCode VARCHAR(50) DEFAULT "none",
		openId VARCHAR(50) NOT NULL UNIQUE,
		inviterId VARCHAR(50)
)ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

INSERT INTO t_user()
VALUES
(1,'admin','123456',"176123456","vip_232512","vip_code3301","SJIKAHNDLASHDNALSJDLAMDL","none"),
(2,'user1','123456',"176125516","vip_458445","vip_code3302","NDKLSNDLKSDBWKJABSJKDBAJ","SJIKAHNDLASHDNALSJDLAMDL"),
(3,'user2','123456',"176125516","vip_458446","vip_code3303","SDNKJANDKANDKAJNSJKDNAJJ","NDKLSNDLKSDBWKJABSJKDBAJ");

CREATE TABLE t_user_role(
	user_id INT(10) DEFAULT NULL,
	role_id INT(10) DEFAULT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO t_user_role(user_id,role_id)
VALUES
(1,1),
(2,2);

#ALTER TABLE t_user ADD FOREIGN KEY(id) REFERENCES t_role(id);


