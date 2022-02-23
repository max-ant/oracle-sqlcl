SET LINESIZE 200 pagesize 50000 define ON SERVEROUTPUT ON SIZE UNLIMITED heading ON VERIFY OFF TAB OFF
SET FEEDBACK OFF autoprint OFF
alter session set nls_date_format = 'dd.mm.yy hh24:mi:ss';
alter session set nls_timestamp_format = 'dd.mm.yy hh24:mi:ss.FF3';
alter session set nls_timestamp_tz_format = 'dd.mm.yy HH24:MI:SS.FF3 TZH:TZM';
SET sqlprompt "_user'@'_connect_identifier' '_date > "
SET NEWPAGE 3 wrap ON recsep OFF RECSEPCHAR ' ' echo OFF trimspool ON
SET    long 160000 longchunksize 200000 exitcommit OFF  
SET SERVEROUTPUT ON SIZE UNLIMITED
set highlight on
set highlighting KEYWORD foreground YELLOW
set highlighting string foreground magenta
set highlighting number foreground red
set highlighting identifier foreground CYAN
SET SQLFORMAT ANSICONSOLE
DEFINE _EDITOR='/usr/bin/vim -c "set filetype=sql"'
