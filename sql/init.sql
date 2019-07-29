create database sacc_frontend
    default character set utf8
    default collate utf8_general_ci;

use sacc_frontend;

create table sacc_frontend.assignment
(
    id          bigint auto_increment comment 'ID'
        primary key,
    name        varchar(20)  default ''                not null comment '作业名称',
    start_time  timestamp    default CURRENT_TIMESTAMP not null,
    end_time    timestamp    default CURRENT_TIMESTAMP not null,
    remarks     varchar(255) default ''                not null comment '备注',
    create_date timestamp    default CURRENT_TIMESTAMP not null,
    create_by   bigint       default 0                 not null comment '创建人',
    update_date timestamp    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_by   bigint                                 null comment '修改人ID',
    del_flag    tinyint      default 0                 not null
);

create table sacc_frontend.assignment_question
(
    id            bigint auto_increment comment 'UUID'
        primary key,
    assignment_id bigint                              not null comment '作业ID',
    question_id   bigint                              null comment '选择题ID',
    remarks       varchar(255)                        not null comment '备注',
    create_date   timestamp default CURRENT_TIMESTAMP not null,
    create_by     bigint                              not null comment '创建人ID',
    update_date   timestamp default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_by     bigint                              not null comment '修改人ID',
    del_flag      tinyint   default 0                 not null
);

create table sacc_frontend.assignment_stage
(
    id              bigint auto_increment comment 'UUID'
        primary key,
    assignment_id   bigint                                 not null comment '作业ID',
    user_id         bigint                                 not null comment '用户ID',
    question_id     bigint                                 not null comment '选择题ID',
    question_result char(6)      default ''                not null comment '选择题选项',
    remarks         varchar(255) default ''                not null comment '备注',
    create_date     timestamp    default CURRENT_TIMESTAMP not null,
    create_by       bigint                                 not null comment '创建人ID',
    update_date     timestamp    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_by       bigint                                 not null comment '修改人ID',
    save_time       timestamp    default CURRENT_TIMESTAMP not null,
    del_flag        tinyint      default 0                 not null
);

create table sacc_frontend.question_bank
(
    id             bigint auto_increment comment 'UUID'
        primary key,
    title          varchar(20)  default ''                not null comment '题目简称',
    description    varchar(255) default ''                not null comment '题干描述',
    choice_a       varchar(255) default ''                not null comment 'A选项',
    choice_b       varchar(255) default ''                not null comment 'B选项',
    choice_c       varchar(255) default ''                not null comment 'C选项',
    choice_d       varchar(255) default ''                not null comment 'D选项',
    choice_e       varchar(255) default ''                not null comment 'E选项',
    choice_f       varchar(255) default ''                not null comment 'F选项',
    correct_answer char(6)      default ''                not null comment '正确选项',
    remarks        varchar(255) default ''                not null comment '备注',
    create_date    timestamp    default CURRENT_TIMESTAMP not null,
    create_by      bigint                                 not null comment '创建人ID',
    update_date    timestamp    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_by      bigint                                 not null comment '修改人ID',
    del_flag       tinyint      default 0                 not null
);

create table sacc_frontend.sys_menu
(
    id          bigint auto_increment comment 'UUID'
        primary key,
    sort        bigint                                 not null comment '排序',
    is_show     char         default ''                not null comment '是否在菜单中显示',
    parent_id   bigint                                 not null comment '父级编号',
    icon        varchar(64)  default ''                not null comment '图标',
    name        varchar(100) default ''                not null comment '名称',
    url         varchar(128) default ''                not null comment '链接',
    remarks     varchar(255) default ''                not null comment '备注',
    create_date timestamp    default CURRENT_TIMESTAMP not null,
    create_by   bigint                                 not null comment '创建人ID',
    update_date timestamp    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_by   bigint                                 not null comment '修改人ID',
    del_flag    tinyint      default 0                 not null comment '删除标识'
);

create index sys_menu_id_index
    on sacc_frontend.sys_menu (id);

create table sacc_frontend.sys_permission
(
    id          bigint auto_increment comment 'UUID'
        primary key,
    permission  varchar(100) default ''                not null comment '权限',
    url         varchar(500) default ''                not null comment 'REST API URL地址',
    remarks     varchar(255) default ''                not null comment '备注',
    create_date timestamp    default CURRENT_TIMESTAMP not null,
    create_by   bigint                                 not null comment '创建人ID',
    update_date timestamp    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_by   bigint                                 not null comment '修改人ID',
    del_flag    tinyint      default 0                 not null comment '删除标识'
);

create index sys_permission_id_index
    on sacc_frontend.sys_permission (id);

create table sacc_frontend.sys_role
(
    id          bigint auto_increment comment 'UUID'
        primary key,
    name        varchar(100) default ''                not null comment '角色名称',
    remarks     varchar(255) default ''                not null comment '备注',
    create_date timestamp    default CURRENT_TIMESTAMP not null,
    create_by   bigint                                 not null comment '创建人ID',
    update_date timestamp    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_by   bigint                                 not null comment '修改人ID',
    del_flag    tinyint      default 0                 not null comment '删除标识'
);

create table sacc_frontend.sys_role_menu
(
    id          bigint auto_increment comment 'UUID'
        primary key,
    role_id     bigint                                 not null comment '角色编号',
    menu_id     bigint                                 null comment '菜单编号',
    remarks     varchar(255) default ''                not null comment '备注',
    create_date timestamp    default CURRENT_TIMESTAMP not null,
    create_by   bigint                                 not null comment '创建人ID',
    update_date timestamp    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_by   bigint                                 not null comment '修改人ID',
    del_flag    tinyint      default 0                 not null comment '删除标识'
);

create table sacc_frontend.sys_role_menu
(
    id          bigint auto_increment comment 'UUID'
        primary key,
    role_id     bigint                                 not null comment '角色编号',
    menu_id     bigint                                 null comment '菜单编号',
    remarks     varchar(255) default ''                not null comment '备注',
    create_date timestamp    default CURRENT_TIMESTAMP not null,
    create_by   bigint                                 not null comment '创建人ID',
    update_date timestamp    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_by   bigint                                 not null comment '修改人ID',
    del_flag    tinyint      default 0                 not null comment '删除标识'
);

create table sacc_frontend.sys_role_permission
(
    id            bigint auto_increment comment 'UUID'
        primary key,
    role_id       bigint                                 not null comment '角色ID',
    permission_id bigint                                 not null comment 'Permission_ID',
    remarks       varchar(255) default ''                not null comment '备注',
    create_date   timestamp    default CURRENT_TIMESTAMP not null,
    create_by     bigint                                 not null comment '创建人',
    update_date   timestamp    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_id     bigint                                 not null comment '修改人ID',
    del_flag      tinyint      default 0                 not null comment '删除标识'
);

create table sacc_frontend.sys_user
(
    id          bigint auto_increment comment 'UUID'
        primary key,
    remarks     varchar(255) default ''                not null comment '备注',
    login_name  varchar(16)  default ''                not null comment '登录名',
    name        varchar(100) default ''                not null comment '用户名称',
    password    varchar(100) default ''                not null comment '密码',
    email       varchar(100) default ''                not null comment '邮箱',
    tel         varchar(100) default ''                not null comment '电话',
    pic_url     varchar(100) default ''                not null comment '头像地址',
    create_date timestamp    default CURRENT_TIMESTAMP not null,
    update_date timestamp    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_by   bigint                                 not null,
    del_flag    tinyint      default 0                 not null comment '删除标记'
)
    comment '用户';

create index sys_user_id_index
    on sacc_frontend.sys_user (id);

create table sacc_frontend.sys_user_role
(
    id          bigint auto_increment comment 'UUID'
        primary key,
    role_id     bigint                                 not null comment '角色编号',
    user_id     bigint                                 not null comment '用户编号',
    remarks     varchar(255) default ''                not null comment '备注',
    create_date timestamp    default CURRENT_TIMESTAMP not null,
    create_by   bigint                                 not null comment '创建人ID',
    update_date timestamp    default CURRENT_TIMESTAMP not null on update CURRENT_TIMESTAMP,
    update_by   bigint                                 null comment '修改人ID',
    del_flag    tinyint      default 0                 not null comment '删除标记'
);

INSERT INTO sacc_frontend.sys_role (id, name, remarks, create_date, create_by, update_date, update_by, del_flag) VALUES (1, 'administrator', '', '2019-07-29 10:51:59', 2333, '2019-07-29 10:51:59', 2233, 0);
INSERT INTO sacc_frontend.sys_role (id, name, remarks, create_date, create_by, update_date, update_by, del_flag) VALUES (2, 'issuer', '', '2019-07-29 10:54:20', 2333, '2019-07-29 10:54:20', 2233, 0);
INSERT INTO sacc_frontend.sys_role (id, name, remarks, create_date, create_by, update_date, update_by, del_flag) VALUES (3, 'user', '', '2019-07-29 11:05:36', 2333, '2019-07-29 11:05:36', 2233, 0);
INSERT INTO sacc_frontend.sys_role (id, name, remarks, create_date, create_by, update_date, update_by, del_flag) VALUES (4, 'unvalidation', '', '2019-07-29 11:07:06', 2333, '2019-07-29 11:07:06', 2233, 0);

