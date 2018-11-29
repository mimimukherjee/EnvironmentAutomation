echo "{ \"username\":\"$1\", \"password\":\"$2\", \"identityDomain\":\"$3\", \"region\":\"us\", \"outputFormat\":\"json\" }" >psm_setup.json
echo "{ \"operationType\": \"DELETE\", \"soacs\": { \"parameters\": { \"serviceParameters\": { \"dbaName\": \"sys\", \"dbaPassword\": \"$4\", \"forceDelete\": \"true\", \"skipBackupOnTerminate\": \"true\" } } } }" >psm_soastack_del.json
psm setup -c psm_setup.json
psm stack delete -n ${5}SOAStack -c psm_soastack_del.json -wc true
rm psm_soastack_del.json
rm psm_setup.json

