
-- XXL_JOB_GROUP definition

create table XXL_JOB_GROUP
(
    id           NUMBER(10) not null,
    app_name     VARCHAR2(64),
    title        VARCHAR2(64),
    address_type NUMBER(2) not null,
    address_list CLOB,
    update_time  TIMESTAMP(6)
);

-- Create/Recreate indexes
create unique index XXL_JOB_GROUP_PKEY on XXL_JOB_GROUP (ID);


-- 表注释
COMMENT ON TABLE xxl_job_group IS 'xxl_job_group表';

-- 列注释
COMMENT ON COLUMN xxl_job_group.id IS '自增主键';
COMMENT ON COLUMN xxl_job_group.app_name IS '执行器AppName';
COMMENT ON COLUMN xxl_job_group.title IS '执行器名称';
COMMENT ON COLUMN xxl_job_group.address_type IS '执行器地址类型：0 = 自动注册、1 = 手动录入';
COMMENT ON COLUMN xxl_job_group.address_list IS '执行器地址列表，多地址逗号分隔';
COMMENT ON COLUMN xxl_job_group.update_time IS '更新时间';





-- XXL_JOB_INFO definition

-- Create table
create table XXL_JOB_INFO
(
    id                        NUMBER(10) not null,
    job_group                 NUMBER(10) not null,
    job_desc                  VARCHAR2(255),
    add_time                  TIMESTAMP(6),
    update_time               TIMESTAMP(6),
    author                    VARCHAR2(64),
    alarm_email               VARCHAR2(255),
    schedule_type             VARCHAR2(50),
    schedule_conf             VARCHAR2(128),
    misfire_strategy          VARCHAR2(50),
    executor_route_strategy   VARCHAR2(50),
    executor_handler          VARCHAR2(255),
    executor_param            VARCHAR2(4000),
    executor_block_strategy   VARCHAR2(50),
    executor_timeout          NUMBER(10) not null,
    executor_fail_retry_count NUMBER(10) not null,
    glue_type                 VARCHAR2(50),
    glue_source               CLOB,
    glue_remark               VARCHAR2(128),
    glue_updatetime           TIMESTAMP(6),
    child_jobid               VARCHAR2(255),
    trigger_status            NUMBER(2) not null,
    trigger_last_time         NUMBER(20) not null,
    trigger_next_time         NUMBER(20) not null
);

-- Create/Recreate indexes
create unique index XXL_JOB_INFO_PKEY on XXL_JOB_INFO (ID);



-- 表注释
COMMENT ON TABLE xxl_job_info IS 'xxl_job_info表';

-- 列注释
COMMENT ON COLUMN xxl_job_info.id IS '自增主键';
COMMENT ON COLUMN xxl_job_info.job_group IS '执行器主键ID';
COMMENT ON COLUMN xxl_job_info.job_desc IS '任务描述';
COMMENT ON COLUMN xxl_job_info.add_time IS '添加时间';
COMMENT ON COLUMN xxl_job_info.update_time IS '更新时间';
COMMENT ON COLUMN xxl_job_info.author IS '作者';
COMMENT ON COLUMN xxl_job_info.alarm_email IS '报警邮件';
COMMENT ON COLUMN xxl_job_info.schedule_type IS '调度类型';
COMMENT ON COLUMN xxl_job_info.schedule_conf IS '调度配置，值含义取决于调度类型';
COMMENT ON COLUMN xxl_job_info.misfire_strategy IS '调度过期策略';
COMMENT ON COLUMN xxl_job_info.executor_route_strategy IS '执行器路由策略';
COMMENT ON COLUMN xxl_job_info.executor_handler IS '执行器任务handler';
COMMENT ON COLUMN xxl_job_info.executor_param IS '执行器任务参数';
COMMENT ON COLUMN xxl_job_info.executor_block_strategy IS '阻塞处理策略';
COMMENT ON COLUMN xxl_job_info.executor_timeout IS '任务执行超时时间，单位秒';
COMMENT ON COLUMN xxl_job_info.executor_fail_retry_count IS '失败重试次数';
COMMENT ON COLUMN xxl_job_info.glue_type IS 'GLUE类型';
COMMENT ON COLUMN xxl_job_info.glue_source IS 'GLUE源代码';
COMMENT ON COLUMN xxl_job_info.glue_remark IS 'GLUE备注';
COMMENT ON COLUMN xxl_job_info.glue_updatetime IS 'GLUE更新时间';
COMMENT ON COLUMN xxl_job_info.child_jobid IS ' 子任务 ID，多个逗号分隔 ';
COMMENT ON COLUMN xxl_job_info.trigger_status IS ' 调度状态：0 - 停止，1 - 运行 ';
COMMENT ON COLUMN xxl_job_info.trigger_last_time IS ' 上次调度时间 ';
COMMENT ON COLUMN xxl_job_info.trigger_next_time IS ' 下次调度时间 ';



-- XXL_JOB_LOCK definition

CREATE TABLE XXL_JOB_LOCK
(	LOCK_NAME VARCHAR2(50)
) ;

CREATE UNIQUE INDEX XXL_JOB_LOCK_PKEY ON XXL_JOB_LOCK (LOCK_NAME);

-- 表注释
COMMENT ON TABLE xxl_job_lock IS '对应MySQL中的xxl_job_lock表';

-- 列注释
COMMENT ON COLUMN xxl_job_lock.lock_name IS '锁名称';


-- XXL_JOB_LOG definition

CREATE TABLE XXL_JOB_LOG
(	ID NUMBER(20,0) NOT NULL ,
     JOB_GROUP NUMBER(10,0) NOT NULL ,
     JOB_ID NUMBER(10,0) NOT NULL ,
     EXECUTOR_ADDRESS VARCHAR2(255),
     EXECUTOR_HANDLER VARCHAR2(255),
     EXECUTOR_PARAM VARCHAR2(4000),
     EXECUTOR_SHARDING_PARAM VARCHAR2(20),
     EXECUTOR_FAIL_RETRY_COUNT NUMBER(10,0) DEFAULT 0 NOT NULL ,
     TRIGGER_TIME TIMESTAMP (6),
     TRIGGER_CODE NUMBER(10,0) NOT NULL ,
     TRIGGER_MSG CLOB,
     HANDLE_TIME TIMESTAMP (6),
     HANDLE_CODE NUMBER(10,0) NOT NULL ,
     HANDLE_MSG CLOB,
     ALARM_STATUS NUMBER(2,0) DEFAULT 0 NOT NULL
) ;

-- 表注释
COMMENT ON TABLE xxl_job_log IS '对应MySQL中的xxl_job_log表';

-- 列注释
COMMENT ON COLUMN xxl_job_log.id IS '自增主键';
COMMENT ON COLUMN xxl_job_log.job_group IS '执行器主键ID';
COMMENT ON COLUMN xxl_job_log.job_id IS '任务，主键ID';
COMMENT ON COLUMN xxl_job_log.executor_address IS '执行器地址，本次执行的地址';
COMMENT ON COLUMN xxl_job_log.executor_handler IS '执行器任务handler';
COMMENT ON COLUMN xxl_job_log.executor_param IS '执行器任务参数';
COMMENT ON COLUMN xxl_job_log.executor_sharding_param IS '执行器任务分片参数，格式如 1/2';
COMMENT ON COLUMN xxl_job_log.executor_fail_retry_count IS '失败重试次数';
COMMENT ON COLUMN xxl_job_log.trigger_time IS '调度 - 时间';
COMMENT ON COLUMN xxl_job_log.trigger_code IS '调度 - 结果';
COMMENT ON COLUMN xxl_job_log.trigger_msg IS '调度 - 日志';
COMMENT ON COLUMN xxl_job_log.handle_time IS '执行 - 时间';
COMMENT ON COLUMN xxl_job_log.handle_code IS '执行 - 状态';
COMMENT ON COLUMN xxl_job_log.handle_msg IS '执行 - 日志';
COMMENT ON COLUMN xxl_job_log.alarm_status IS '告警状态：0-默认、1-无需告警、2-告警成功、3-告警失败';

CREATE INDEX I_HANDLE_CODE ON XXL_JOB_LOG (HANDLE_CODE)
;
CREATE INDEX I_JOBID_JOBGROUP ON XXL_JOB_LOG (JOB_ID, JOB_GROUP)
;
CREATE INDEX I_JOB_ID ON XXL_JOB_LOG (JOB_ID)
;
CREATE INDEX I_TRIGGER_TIME ON XXL_JOB_LOG (TRIGGER_TIME)
;
CREATE UNIQUE INDEX XXL_JOB_LOG_PKEY ON XXL_JOB_LOG (ID)
;


-- XXL_JOB_LOGGLUE definition

CREATE TABLE XXL_JOB_LOGGLUE
(	ID NUMBER(10,0) NOT NULL ,
     JOB_ID NUMBER(10,0) NOT NULL ,
     GLUE_TYPE VARCHAR2(50),
     GLUE_SOURCE CLOB,
     GLUE_REMARK VARCHAR2(128),
     ADD_TIME TIMESTAMP (6),
     UPDATE_TIME TIMESTAMP (6)
) ;

-- 表注释
COMMENT ON TABLE xxl_job_logglue IS '对应MySQL中的xxl_job_logglue表';

-- 列注释
COMMENT ON COLUMN xxl_job_logglue.id IS '自增主键';
COMMENT ON COLUMN xxl_job_logglue.job_id IS '任务，主键ID';
COMMENT ON COLUMN xxl_job_logglue.glue_type IS 'GLUE类型';
COMMENT ON COLUMN xxl_job_logglue.glue_source IS 'GLUE源代码';
COMMENT ON COLUMN xxl_job_logglue.glue_remark IS 'GLUE备注';
COMMENT ON COLUMN xxl_job_logglue.add_time IS '添加时间';
COMMENT ON COLUMN xxl_job_logglue.update_time IS '更新时间';


CREATE UNIQUE INDEX XXL_JOB_LOGGLUE_PKEY ON XXL_JOB_LOGGLUE (ID) ;


-- XXL_JOB_LOG_REPORT definition

CREATE TABLE XXL_JOB_LOG_REPORT
(	ID NUMBER(10,0) NOT NULL ,
     TRIGGER_DAY TIMESTAMP (6),
     RUNNING_COUNT NUMBER(10,0) NOT NULL ,
     SUC_COUNT NUMBER(10,0) NOT NULL ,
     FAIL_COUNT NUMBER(10,0) NOT NULL ,
     UPDATE_TIME TIMESTAMP (6)
) ;
-- 表注释
COMMENT ON TABLE xxl_job_log_report IS '对应MySQL中的xxl_job_log_report表';

-- 列注释
COMMENT ON COLUMN xxl_job_log_report.id IS '自增主键';
COMMENT ON COLUMN xxl_job_log_report.trigger_day IS '调度 - 时间';
COMMENT ON COLUMN xxl_job_log_report.running_count IS '运行中 - 日志数量';
COMMENT ON COLUMN xxl_job_log_report.suc_count IS '执行成功 - 日志数量';
COMMENT ON COLUMN xxl_job_log_report.fail_count IS '执行失败 - 日志数量';
COMMENT ON COLUMN xxl_job_log_report.update_time IS '更新时间';


CREATE UNIQUE INDEX LOG_REPORT_TRIGGER_DAY_KEY ON XXL_JOB_LOG_REPORT (TRIGGER_DAY)
;
CREATE UNIQUE INDEX XXL_JOB_LOG_REPORT_PKEY ON XXL_JOB_LOG_REPORT (ID)
;


-- XXL_JOB_REGISTRY definition

CREATE TABLE XXL_JOB_REGISTRY
(	ID NUMBER(10,0) NOT NULL ,
     REGISTRY_GROUP VARCHAR2(50),
     REGISTRY_KEY VARCHAR2(255),
     REGISTRY_VALUE VARCHAR2(255),
     UPDATE_TIME TIMESTAMP (6)
) ;

CREATE UNIQUE INDEX REGISTRY_GROUP_KEY_VALUE_KEY ON XXL_JOB_REGISTRY (REGISTRY_GROUP, REGISTRY_KEY, REGISTRY_VALUE)
;
CREATE UNIQUE INDEX XXL_JOB_REGISTRY_PKEY ON XXL_JOB_REGISTRY (ID)
;


-- XXL_JOB_USER definition

CREATE TABLE XXL_JOB_USER
(	ID NUMBER(10,0) NOT NULL ,
     USERNAME VARCHAR2(50),
     PASSWORD VARCHAR2(50),
     ROLE NUMBER(2,0) NOT NULL ,
     PERMISSION VARCHAR2(255)
) ;

-- 表注释
COMMENT ON TABLE xxl_job_user IS '对应MySQL中的xxl_job_user表';

-- 列注释
COMMENT ON COLUMN xxl_job_user.id IS '自增主键';
COMMENT ON COLUMN xxl_job_user.username IS '账号';
COMMENT ON COLUMN xxl_job_user.password IS '密码';
COMMENT ON COLUMN xxl_job_user.role IS '角色：0-普通用户、1-管理员';
COMMENT ON COLUMN xxl_job_user.permission IS '权限：执行器ID列表，多个逗号分割';


CREATE UNIQUE INDEX XXL_JOB_USER_PKEY ON XXL_JOB_USER (ID)
;
CREATE UNIQUE INDEX XXL_JOB_USER_USERNAME_KEY ON XXL_JOB_USER (USERNAME)
;




-- 序列
CREATE SEQUENCE XXL_JOB_GROUP_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999  CACHE 20 ;

CREATE SEQUENCE XXL_JOB_INFO_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999  CACHE 20 ;

CREATE SEQUENCE XXL_JOB_LOGGLUE_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999  CACHE 20 ;

CREATE SEQUENCE XXL_JOB_LOG_REPORT_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999  CACHE 20 ;

CREATE SEQUENCE XXL_JOB_LOG_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999  CACHE 20 ;

CREATE SEQUENCE XXL_JOB_REGISTRY_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999  CACHE 20 ;

CREATE SEQUENCE XXL_JOB_USER_SEQ INCREMENT BY 1 MINVALUE 1 MAXVALUE 9999999999999999999999999999  CACHE 20 ;

--触发器
CREATE OR REPLACE EDITIONABLE TRIGGER XXL_JOB_GROUP_TRG
BEFORE INSERT ON XXL_JOB_GROUP
FOR EACH ROW
BEGIN
SELECT XXL_JOB_GROUP_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

CREATE OR REPLACE EDITIONABLE TRIGGER XXL_JOB_INFO_TRG
BEFORE INSERT ON XXL_JOB_INFO
FOR EACH ROW
BEGIN
SELECT XXL_JOB_INFO_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

CREATE OR REPLACE EDITIONABLE TRIGGER XXL_JOB_LOG_TRG
BEFORE INSERT ON XXL_JOB_LOG
FOR EACH ROW
BEGIN
SELECT XXL_JOB_LOG_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

CREATE OR REPLACE EDITIONABLE TRIGGER XXL_JOB_LOGGLUE_TRG
BEFORE INSERT ON XXL_JOB_LOGGLUE
FOR EACH ROW
BEGIN
SELECT XXL_JOB_LOGGLUE_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

CREATE OR REPLACE EDITIONABLE TRIGGER XXL_JOB_LOG_REPORT_TRG
BEFORE INSERT ON XXL_JOB_LOG_REPORT
FOR EACH ROW
BEGIN
SELECT XXL_JOB_LOG_REPORT_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

CREATE OR REPLACE EDITIONABLE TRIGGER XXL_JOB_REGISTRY_TRG
BEFORE INSERT ON XXL_JOB_REGISTRY
FOR EACH ROW
BEGIN
SELECT XXL_JOB_REGISTRY_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

CREATE OR REPLACE EDITIONABLE TRIGGER XXL_JOB_USER_TRG
BEFORE INSERT ON XXL_JOB_USER
FOR EACH ROW
BEGIN
SELECT XXL_JOB_USER_SEQ.NEXTVAL INTO :NEW.ID FROM DUAL;
END;

--设置启动
ALTER TRIGGER XXL_JOB_GROUP_TRG ;

ALTER TRIGGER XXL_JOB_INFO_TRG ;

ALTER TRIGGER XXL_JOB_LOG_TRG ;

ALTER TRIGGER XXL_JOB_LOGGLUE_TRG ;

ALTER TRIGGER XXL_JOB_LOG_REPORT_TRG ;

ALTER TRIGGER XXL_JOB_REGISTRY_TRG ;

ALTER TRIGGER XXL_JOB_USER_TRG ;