alter session set container = pdbname;
alter session set "_ORACLE_SCRIPT"=true; 

CREATE USER stateinsurance IDENTIFIED BY "DevOps_123#"
DEFAULT TABLESPACE users
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED ON users;

GRANT CONNECT, DBA to stateinsurance;

GRANT create table, create sequence to stateinsurance;

GRANT all privileges to stateinsurance;

ALTER USER stateinsurance IDENTIFIED BY STateinsurance12#_ ACCOUNT UNLOCK;

--------------------------------------------------------
--  DDL for Table CUSTOMER
--------------------------------------------------------

  CREATE TABLE "STATEINSURANCE"."CUSTOMER" 
   (	"INC_ID" VARCHAR2(20 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"ADDRESS" VARCHAR2(30 BYTE), 
	"PHONE" VARCHAR2(30 BYTE), 
	"SSN" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into STATEINSURANCE.CUSTOMER
SET DEFINE OFF;
Insert into STATEINSURANCE.CUSTOMER (INC_ID,NAME,ADDRESS,PHONE,SSN) values ('1','Juan G.','123 Address St.','(123) 555-6540','987-88-1564');
Insert into STATEINSURANCE.CUSTOMER (INC_ID,NAME,ADDRESS,PHONE,SSN) values ('2','Carlos Z.','321 EIP Main','(789) 951-6547','123-88-6548');
--------------------------------------------------------
--  DDL for Index CUSTOMER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "STATEINSURANCE"."CUSTOMER_PK" ON "STATEINSURANCE"."CUSTOMER" ("INC_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table CUSTOMER
--------------------------------------------------------

  ALTER TABLE "STATEINSURANCE"."CUSTOMER" MODIFY ("INC_ID" NOT NULL ENABLE);
  ALTER TABLE "STATEINSURANCE"."CUSTOMER" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "STATEINSURANCE"."CUSTOMER" ADD CONSTRAINT "CUSTOMER_PK" PRIMARY KEY ("INC_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
  
  quit;
  /