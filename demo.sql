create table lyl_test (
  id           serial primary key not null,
  kind         varchar(32),
  type         varchar(32),
  is_delete    boolean   default false,
  deleted_date TIMESTAMP default now(),
  unique (kind)

);

create table login (
  id                 bigint PRIMARY KEY NOT null,

  login_name         varchar(256)       null,
  user_name          varchar(256)       null,
  mobile             varchar(256)       null,
  job                varchar(256)       null,
  is_abled           bool               null,


  dept_code          varchar(64)        NOT NULL,
  dept_name          varchar(64)        NOT NULL,
  created_by         bigint             NOT NULL   DEFAULT '0',
  created_name       varchar(32)        NOT NULL,
  created_date       DATETIME           NOT NULL   DEFAULT now(),
  last_modified_by   bigint             NOT NULL   DEFAULT '0',
  last_modified_name varchar(32)        NOT NULL,
  last_modified_date DATETIME           NOT NULL   DEFAULT now(),
  is_deleted         bool               NOT NULL   DEFAULT false,
  deleted_date       DATETIME           NOT NULL   DEFAULT '1970-01-01 00:00:00'

);

create table sys_user (
  id                 bigint PRIMARY KEY NOT null,

  login_name         varchar(256)       null,
  user_name          varchar(256)       null,
  mobile             varchar(256)       null,
  job                varchar(256)       null,
  is_abled           bool               null,

  dept_code          varchar(64)        NOT NULL,
  dept_name          varchar(64)        NOT NULL,
  created_by         bigint             NOT NULL   DEFAULT '0',
  created_name       varchar(32)        NOT NULL,
  created_date       DATETIME           NOT NULL   DEFAULT now(),
  last_modified_by   bigint             NOT NULL   DEFAULT '0',
  last_modified_name varchar(32)        NOT NULL,
  last_modified_date DATETIME           NOT NULL   DEFAULT now(),
  is_deleted         bool               NOT NULL   DEFAULT false,
  deleted_date       DATETIME           NOT NULL   DEFAULT '1970-01-01 00:00:00'
);
create table sys_user_password (
  id          bigint PRIMARY KEY NOT null,
  user_id     bigint             null,
  cipher_type varchar(32)        null,
  cipher_salt varchar(128)       null,
  cipher_code varchar(128)       null

);

create table sys_role (
  id                 bigint PRIMARY KEY NOT null,

  role_name          varchar(256)       null,
  is_common          bool               null,

  dept_code          varchar(64)        NOT NULL,
  dept_name          varchar(64)        NOT NULL,
  created_by         bigint             NOT NULL   DEFAULT '0',
  created_name       varchar(32)        NOT NULL,
  created_date       DATETIME           NOT NULL   DEFAULT now(),
  last_modified_by   bigint             NOT NULL   DEFAULT '0',
  last_modified_name varchar(32)        NOT NULL,
  last_modified_date DATETIME           NOT NULL   DEFAULT now(),
  is_deleted         bool               NOT NULL   DEFAULT false,
  deleted_date       DATETIME           NOT NULL   DEFAULT '1970-01-01 00:00:00'

);
create table sys_menu (
  id                 bigint PRIMARY KEY NOT null,

  name               varchar(256)       null,
  code               varchar(256)       null,
  parent_code        varchar(256)       null,
  caption            varchar(256)       null,
  tag                varchar(256)       null,
  class_name         varchar(256)       null,
  icon_name          varchar(256)       null,
  level              integer            null,
  sort_num           integer            null,
  is_auth            bool               null,

  dept_code          varchar(64)        NOT NULL,
  dept_name          varchar(64)        NOT NULL,
  created_by         bigint             NOT NULL   DEFAULT '0',
  created_name       varchar(32)        NOT NULL,
  created_date       DATETIME           NOT NULL   DEFAULT now(),
  last_modified_by   bigint             NOT NULL   DEFAULT '0',
  last_modified_name varchar(32)        NOT NULL,
  last_modified_date DATETIME           NOT NULL   DEFAULT now(),
  is_deleted         bool               NOT NULL   DEFAULT false,
  deleted_date       DATETIME           NOT NULL   DEFAULT '1970-01-01 00:00:00'

);
create table sys_org (
  id                        bigint PRIMARY KEY NOT null,
  code                      varchar(256)       null,
  parent_code               varchar(256)       null,
  dept_name                 varchar(256)       null,
  dept_abbr_name            varchar(256)       null,
  level                     Integer            null,
  is_head_dept              bool               null,
  interface_dept_code       varchar(256)       null,
  interface_upper_dept_code varchar(256)       null,
  is_abled                  bool               null
);
create table sys_area (
  id          bigint PRIMARY KEY NOT null,
  code        varchar(256)       null,
  val         varchar(256)       null,
  parent_code varchar(256)       null
);
create table sys_user_role (
  id      bigint PRIMARY KEY NOT null,
  user_id bigint             null,
  role_id bigint             null
);
create table sys_role_auth_menu (
  id        bigint PRIMARY KEY NOT null,
  role_id   bigint             null,
  menu_code varchar(256)       null
);
create table sys_role_auth_dept (
  id        bigint PRIMARY KEY NOT null,
  role_id   bigint             null,
  dept_code varchar(256)       null
);

INSERT INTO sys_user (id, login_name, user_name, mobile, job, is_abled, dept_code, dept_name, created_by, created_name, created_date, last_modified_by, last_modified_name, last_modified_date)
VALUES (0, 'admin', 'admin', '0', '管理员', true, 'A', '重庆设计院', 0, 'admin-test', now(), 0, 'admin-test', now());

INSERT INTO sys_user_password (id, user_id, cipher_type, cipher_salt, cipher_code)
VALUES (0, 0, 'BC', 'pGPj5p7+WpATTTllYtSiuxjNL9w5Ng9IZNB+rVmenW8=', 'oOtDqDOp5EfX6MhE5OI/L+f7jYTxhOTv6wSWQ7kHrnY=');

INSERT INTO sys_role (id, role_name, dept_code, dept_name, created_by, created_name, created_date, last_modified_by, last_modified_name, last_modified_date)
VALUES (0, '系统管理员', 'A', '重庆设计院', 0, 'admin', now(), 0, 'admin', now());

INSERT INTO sys_user_role (id, user_id, role_id)
VALUES (0, 0, 0);

INSERT INTO sys_org (id, code, parent_code, dept_name, dept_abbr_name, level, interface_dept_code, interface_upper_dept_code, is_head_dept) VALUES
(1, 'A', '', '重庆设计院', '', 0, '', '', TRUE);

select
  u.id,
  u.login_name,
  u.user_name,
  u.mobile,
  u.job,
  u.is_abled,
  u.dept_code,
  u.dept_name,
  u.created_by,
  u.created_name,
  u.created_date,
  u.last_modified_by,
  u.last_modified_name,
  u.last_modified_date
from
  sys_user u
where
  u.is_deleted = false
  and u.login_name = 'admin';

select
  p.id,
  p.user_id,
  p.cipher_type,
  p.cipher_salt,
  p.cipher_code
from
  sys_user_password p
where
  p.user_id = 0;

select
  ur.id,
  ur.user_id,
  ur.role_id
from
  sys_user_role ur
where
  ur.user_id =0;

select
  rad.role_id    as roleId,
  rad.dept_code as deptCode
from
  (select role_id
   from sys_user_role
   where user_id = 0) r left join sys_role_auth_dept rad  on r.role_id = rad.role_id;

select
  ram.role_id   as roleId,
  ram.menu_code as menuCode
from
  (
    select role_id
    from sys_user_role
    where user_id = 0
  ) r left join sys_role_auth_menu ram on r.role_id = ram.role_id;

select
  o.id             as id,
  o.code           as code,
  o.parent_code    as parentCode,
  o.dept_name      as deptName,
  o.dept_abbr_name as deptAbbrName,
  o.level          as level,
  case when p.id is null then 0 else p.id end as pid
from
  sys_org o left join sys_org p on o.parent_code = p.code
where o.code like concat('A','%')
order by o.id;

select
  kind      as label,
  count(id) as num
from lyl_test
where is_delete = false
group by kind;
