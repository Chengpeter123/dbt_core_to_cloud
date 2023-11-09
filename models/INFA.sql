---------------------To get all the table and columns in perticular schema/owner-------------
SELECT owner,table_name, column_name
FROM   all_tab_columns
WHERE  owner='INFA'
AND column_name like '%W%'
ORDER BY owner, table_name,column_name
;



-----------------------------------------To find the transformation is reusable for instances----------------------------------------
select widget_name,is_reusable
from 
OPB_WIDGET;


--------------------------------------------------------------For gettting the Owner name----------------------------------------------

SELECT rep_widget_inst.INSTANCE_NAME,rep_widget_inst.WIDGET_TYPE_NAME,
REP_WIDGET_ATTR.ATTR_NAME AS OWNER_NAME
FROM 
rep_widget_inst
JOIN 
REP_WIDGET_ATTR
ON
REP_WIDGET_ATTR.WIDGET_ID=rep_widget_inst.WIDGET_ID
WHERE rep_widget_inst.WIDGET_TYPE_NAME='Source Definition';


--------------------------------------------------------------------------- For getting OBJECT_COUNT,mapping_name,Instance_name------------------

select count(REP_TBL_MAPPING.SOURCE_NAME)+count(distinct(REP_TBL_MAPPING.TARGET_NAME)) as OBJECT_COUNT
,REP_TBL_MAPPING.mapping_name,rep_widget_inst.INSTANCE_NAME 
from REP_TBL_MAPPING 
 join 
rep_widget_inst
on
rep_widget_inst.subject_id=REP_TBL_MAPPING.subject_id
--and Instance_name='FILTER'
--OR Instance_name='LKPTRANS'
group by REP_TBL_MAPPING.mapping_name,rep_widget_inst.Instance_name
;



--------------------------------------------------------------------------General Query-------------------------------------------------------------------

Select distinct 
wid.WIDGET_ID, 
all_map.mapping_name,
all_map.mapping_id,
OPB_SESSION.session_id,
OPB_SRC.SOURCE_NAME,
wid.INSTANCE_NAME Lkp_name, 
OPB_TARG.TARGET_NAME,
Decode(widat.attr_id,2,widat.attr_value) Table_name,
decode (widat.attr_id,6,widat.attr_value) src_tgt
FROM 
rep_all_mappings ALL_MAP, 
rep_widget_inst wid, 
OPB_WIDGET_ATTR widat,
OPB_SESSION,
OPB_SRC,
OPB_TARG
where 
all_map.mapping_id=wid.mapping_id
and wid.WIDGET_ID=widat.WIDGET_ID
and all_map.mapping_name=all_map.mapping_name
--and wid.WIDGET_TYPE=11
--and widat.WIDGET_TYPE='LKP_SQL_QUERY_OVERRIDE'
and widat.ATTR_ID in (2,6)
--AND wid.INSTANCE_NAME LIKE '%JAVA%'
AND wid.INSTANCE_NAME LIKE '%SQ_EMP%'
order by 6;

--------------------------To get the total number of sessions------------------
SELECT COUNT(SESSION_NAME)as TOTALNO_OFSESSIONS FROM REP_LOAD_SESSIONS;  

--------------------------To get tolat number of worklets--------------- 
SELECT count(WORKLET_RUN_ID) FROM REP_TASK_INST_RUN where WORKLET_RUN_ID<>0;


---------------------------To get code page----------------------------
SELECT count(code_page) as FF_CODE_PAGE FROM OPB_CNX;



--------------------------To get COMMAND_TYPE_FILE_LIST-----------------
SELECT * FROM PO_COMMAND;
SELECT * FROM PO_PROCESS;


------------------------------NOOFCONNECTIONNAMESRCTGT_SRC & NOOFCONNECTIONNAMESRCTGT_TGT----


SELECT * FROM REP_SESSION_INSTANCES;

SELECT CONNECTION_NAME FROM REP_SESSION_INSTANCES WHERE CONNECTION_NAME LIKE '%Src%' or
CONNECTION_NAME LIKE  '%TGT%' or CONNECTION_NAME LIKE  '%Tgt%';

--NOOFCONNECTIONNAMESRCTGT_SRC
SELECT count(CONNECTION_NAME) FROM REP_SESSION_INSTANCES WHERE CONNECTION_NAME LIKE '%Src%';

--NOOFCONNECTIONNAMESRCTGT_TGT
SELECT count(CONNECTION_NAME) FROM REP_SESSION_INSTANCES WHERE CONNECTION_NAME LIKE  '%TGT%' 
or CONNECTION_NAME LIKE  '%Tgt%';



-----------------------------To get EXECUTION----------------------------------------
SELECT EXECUTION_MSECS FROM V_IME_TASK_LOG;





-------------------------To check the sessions,wworkflows,tasks etc are reusable-----------------------------

-----OPB_TASK-----also can be used---------------------------------------------

select * from REP_ALL_TASKS;

select task_name,IS_REUSABLE from REP_ALL_TASKS;
select task_name,IS_REUSABLE from REP_ALL_TASKS where IS_REUSABLE>0;



----------------------------------------------------------------To get SOURCE_POST_SQL_USED -----------------------------------------------


select * from rep_widget_attr;
SELECT ATTR_NAME,ATTR_VALUE
FROM rep_widget_attr
where
ATTR_NAME like 'Pre S%'
or ATTR_NAME like 'Post S%'
and
ATTR_DESCRIPTION like '%source%'
and
ATTR_VALUE is not null
;


SELECT count(ATTR_NAME)
FROM rep_widget_attr
where ATTR_NAME like 'Post S%'
and
ATTR_DESCRIPTION like '%source%'
and ATTR_VALUE is not null;

-----------------------------------------------------------------To get SOURCE_PRE_SQL_USED--------------------------------------------------


SELECT count(ATTR_NAME)
FROM rep_widget_attr
where ATTR_NAME like 'Pre S%'
and
ATTR_DESCRIPTION like '%source%'
and ATTR_VALUE is not null
;


---------------------------------------------------------------------To get NOOF_SRC_QUERY_GT_4K used-------------------------------------------------------------------

select * from rep_widget_attr
where ATTR_NAME like 'Sql Q%';

SELECT count(ATTR_NAME)
FROM rep_widget_attr
where ATTR_NAME like 'Sql Q%'
;


 ---------------------------------------------To get MULTIPLE_LINKS_TO_FROM ---------------------------------------------------------------------------------------
  
SELECT * FROM REP_SESSION_INSTANCES order by WORKFLOW_NAME;

SELECT  WORKFLOW_NAME
FROM REP_SESSION_INSTANCES
GROUP BY WORKFLOW_NAME
HAVING COUNT(WORKFLOW_NAME) > 1;

select * from REP_SESSION_INSTANCES where WORKFLOW_NAME='WF_FULLY_PARAM';


-----------------------------------To get EVENT_RAISE --------------------------------------------------------------------------------------
 
 select * from REP_ALL_TASKS;
 select * from REP_ALL_TASKS;
  select * from REP_ALL_TASKS WHERE TASK_TYPE_NAME like 'Event%';

  
-------------------------------To get  NOTIFICATION_TASK_WITH_EMAIL_ATTACHMENT -------------------------------------------------------------
 select * from REP_ALL_TASKS;
  select * from REP_ALL_TASKS WHERE TASK_TYPE_NAME like 'Email%';
  
-----------------------------To get COMMAND_TASK_WITH_EMPTY_BODY ---------------------------------------------------------------------------
select * from REP_ALL_TASKS WHERE TASK_TYPE_NAME = 'Command';

select TASK_TYPE_NAME,task_name from REP_ALL_TASKS WHERE TASK_TYPE_NAME = 'Command';








------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


SELECT sql_trace FROM v$session ;
ALTER SESSION SET SQL_TRACE = TRUE;
ALTER SESSION SET SQL_TRACE = FALSE;
SELECT *
FROM v$session;
WHERE sql_trace = 'TRUE';



EXECUTE dbms_session.set_sql_trace (TRUE);


create table for_check (no number);

ALTER SYSTEM SET sql_trace = true SCOPE=MEMORY;

drop table for_check;




show parameter user_dump;
alter session set tracefile_identifier=PT1;
ALTER SESSION SET SQL_TRACE = TRUE;

select s.sql_trace,s.sql_trace_waits,s.sql_trace_binds,
traceid,tracefile
from v$session s join
v$process p
on
(p.addr=s.paddr) where
audsid=USERENV('SESSIONID');

select * from t1    ;

select * from emp_tgt;

ALTER SESSION SET SQL_TRACE = FALSE;

show parameter user_dump;

exit;

cd \oraclexe\app\oracle\diag\rdbms\xe\xe\trace


