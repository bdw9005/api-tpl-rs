-- SQL Export
-- Created by Querious (303012)
-- Created: February 10, 2023 at 11:25:49 GMT+8
-- Encoding: Unicode (UTF-8)

-- PostgreSQL does not have a direct equivalent to MySQL's foreign_key_checks, unique_checks, and sql_mode.
-- The timezone is set in the session or in the PostgreSQL configuration file.
-- 删除数据库（如果存在）
DROP DATABASE IF EXISTS demo_rs;

-- 创建数据库
CREATE DATABASE demo_rs
    WITH 
    ENCODING = 'UTF8'  -- 设置字符集为UTF8
    LC_COLLATE = 'en_US.UTF-8',  -- 设置排序规则
    LC_CTYPE = 'en_US.UTF-8';
    -- 使用数据库（在连接时指定）
-- 连接到数据库时使用：
-- psql -d demo_rs

-- Drop tables if they exist
DROP TABLE IF EXISTS project;
DROP TABLE IF EXISTS account;

-- Create account table
CREATE TABLE account (
  id BIGSERIAL PRIMARY KEY, -- 自增ID
  username VARCHAR(16) NOT NULL DEFAULT ''::VARCHAR, -- 用户名称
  password VARCHAR(32) NOT NULL DEFAULT ''::VARCHAR, -- 用户密码
  salt VARCHAR(16) NOT NULL DEFAULT ''::VARCHAR, -- 加密盐
  role INTEGER NOT NULL DEFAULT 0, -- 角色：1 - 普通；2 - 管理员
  realname VARCHAR(16) NOT NULL DEFAULT ''::VARCHAR, -- 真实姓名
  login_at BIGINT NOT NULL DEFAULT 0, -- 最近一次登录时间
  login_token VARCHAR(32) NOT NULL DEFAULT ''::VARCHAR, -- 当前登录的token
  created_at BIGINT NOT NULL DEFAULT 0, -- 创建时间
  updated_at BIGINT NOT NULL DEFAULT 0 -- 更新时间
);

COMMENT ON TABLE account IS '账号表';

COMMENT ON COLUMN account.id IS '自增ID';
COMMENT ON COLUMN account.username IS '用户名称';
COMMENT ON COLUMN account.password IS '用户密码';
COMMENT ON COLUMN account.salt IS '加密盐';
COMMENT ON COLUMN account.role IS '角色：1 - 普通；2 - 管理员';
COMMENT ON COLUMN account.realname IS '真实姓名';
COMMENT ON COLUMN account.login_at IS '最近一次登录时间';
COMMENT ON COLUMN account.login_token IS '当前登录的token';
COMMENT ON COLUMN account.created_at IS '创建时间';
COMMENT ON COLUMN account.updated_at IS '更新时间';

-- Create project table
CREATE TABLE project (
  id BIGSERIAL PRIMARY KEY, -- 自增ID
  code VARCHAR(8) NOT NULL DEFAULT ''::VARCHAR, -- 项目编号
  name VARCHAR(32) NOT NULL DEFAULT ''::VARCHAR, -- 项目名称
  remark VARCHAR(64) NOT NULL DEFAULT ''::VARCHAR, -- 项目备注
  account_id BIGINT NOT NULL DEFAULT 0, -- 创建账号ID
  created_at BIGINT NOT NULL DEFAULT 0, -- 创建时间
  updated_at BIGINT NOT NULL DEFAULT 0 -- 更新时间
);

COMMENT ON TABLE project IS '项目表';

COMMENT ON COLUMN project.id IS '自增ID';
COMMENT ON COLUMN project.code IS '项目编号';
COMMENT ON COLUMN project.name IS '项目名称';
COMMENT ON COLUMN project.remark IS '项目备注';
COMMENT ON COLUMN project.account_id IS '创建账号ID';
COMMENT ON COLUMN project.created_at IS '创建时间';
COMMENT ON COLUMN project.updated_at IS '更新时间';

-- Add unique constraint and index comments
-- COMMENT ON CONSTRAINT uniq_code ON project IS '项目编号唯一';
-- COMMENT ON CONSTRAINT fk_account ON project IS '外键约束，关联到账号表的ID';

-- Truncate table and insert data is not done with LOCK TABLES in PostgreSQL
-- To insert data, use the COPY command or INSERT INTO with VALUES
TRUNCATE account;
INSERT INTO account (id, username, password, salt, role, realname, login_at, login_token, created_at, updated_at) VALUES
	(1, 'admin', 'e03dcdf34a257041b36bd77132130fdc', 'LCV8xdTcqmkhA$ze', 2, 'Administrator', 1675941517, 'cc3e49577201323b0010815f2485acd9', 1675941476, 1675941517);

-- There is no need to reset foreign_key_checks, unique_checks, and sql_mode in PostgreSQL
-- The timezone is set in the session or in the PostgreSQL configuration file.

-- Export Finished: February 10, 2023 at 11:25:49 GMT+8