drop table if exists `public_number`;
create table `public_number` (
  `id` int(10) not null auto_increment comment '公众号id',
  `public_number_wechat_id` varchar(255) not null comment '公众号微信号',
  `public_number_name` varchar(255) not null comment '公众号名称',
  `public_number_biz` varchar(255) not null comment '公众号biz值(biz值为公众号的唯一且不重复的标识)',
  `today_is_crawl` tinyint(4) not null default '0' comment '今天是否已爬取(0--今天未爬取,1--今天已爬取)',
  `create_time` timestamp default current_timestamp comment '创建时间',
  `update_time` timestamp default current_timestamp on update current_timestamp comment '更新时间',
  `is_del` tinyint(4) not null default '0' comment '是否删除(0--否,1--是)',
  primary key (`id`)
) engine=InnoDB auto_increment=1 default charset=utf8 comment='公众号表';
insert into `public_number`(public_number_wechat_id, public_number_name, public_number_biz) values('pythonbuluo', 'Python程序员', 'MjM5NzU0MzU0Nw=='),
('python-china', 'Python中文社区', 'MzAxMjUyNDQ5OA==');

drop table if exists `public_number_article`;
create table `public_number_article` (
  `id` int(10) not null auto_increment comment '公众号文章id',
  `public_number_wechat_id` varchar(255) not null comment '公众号微信号',
  `public_number_name` varchar(255) not null comment '公众号名称',
  `public_number_article_cover` text not null comment '公众号文章封面',
  `public_number_article_publish_time` timestamp default current_timestamp comment '公众号文章发表时间',
  `public_number_article_title` varchar(255) not null comment '公众号文章标题',
  `public_number_article_content_url` text not null comment '公众号文章内容',
  `create_time` timestamp default current_timestamp comment '创建时间',
  `update_time` timestamp default current_timestamp on update current_timestamp comment '更新时间',
  `is_del` tinyint(4) not null default '0' comment '是否删除(0--否,1--是)',
  primary key (`id`)
) engine=InnoDB auto_increment=1 default charset=utf8 comment='公众号文章表';

drop table if exists `crawl_record`;
create table `crawl_record` (
  `id` int(10) not null auto_increment comment '爬取记录id',
  `public_number_id` int(10) not null comment '公众号id',
  `crawl_status` tinyint(4) not null default '-1' comment '爬取状态(0--爬取失败,1--爬取成功)',
  `create_time` timestamp default current_timestamp comment '创建时间',
  `update_time` timestamp default current_timestamp on update current_timestamp comment '更新时间',
  `is_del` tinyint(4) not null default '0' comment '是否删除(0--否,1--是)',
  primary key (`id`)
) engine=InnoDB auto_increment=1 default charset=utf8 comment='爬取记录表';
