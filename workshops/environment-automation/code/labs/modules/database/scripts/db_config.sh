set -x

export ORACLE_SID=$1 
export ORAENV_ASK=NO  
. /usr/local/bin/oraenv

tnsname="$ORACLE_HOME/network/admin/tnsnames.ora"
echo " " >> $tnsname
echo "$3 ="  >> $tnsname
echo "  (DESCRIPTION ="  >> $tnsname
echo "    (ADDRESS = (PROTOCOL = TCP)(HOST = $1.$2)(PORT = 1521)) "   >> $tnsname
echo "    (CONNECT_DATA ="  >> $tnsname
echo "      (SERVER = DEDICATED)"  >> $tnsname
echo "      (SERVICE_NAME = $3.$2)"  >> $tnsname
echo "    )"  >> $tnsname
echo "  )"  >> $tnsname

sqlplus / as sysdba @/tmp/StateInsurance.sql
