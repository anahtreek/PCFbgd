#!/bin/sh
curl -X POST -H 'content-type: application/json;charset=UTF-8' -d '{"productName":"HD SetupBox", "serviceId":"100"}' 'https://product-new.apps.dev.pcf-aws.com/product' > response
grep '\"serviceId\":\"100\"' 'response'
if [ "$?" -eq "0" ] ; then
echo "Success"
else
echo "Failed"
fi
