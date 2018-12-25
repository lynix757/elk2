#!/bin/sh

OPTSTART="-e $ES_URL -H $HOSTNAME"

exec bin/kibana $OPTSTART
