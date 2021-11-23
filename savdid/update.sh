#!/bin/sh

/opt/savdid/bin/update.sh https://sophos.halon.io/1/XXXXXXXXXX

status=$?

if [ $status -eq 2 ]; then
    # An exit status of 2 means that an update was available which requires the deployment to restart
    kubectl rollout restart deployment/savdid
    exit 0
fi

exit $status