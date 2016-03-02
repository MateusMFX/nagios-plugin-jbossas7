#!/bin/bash
JBOSS_HOST="localhost"
JBOSS_PORT="9990"
JBOSS_USER="user"
JBOSS_PASS="123456"

#This assumes that the check_jbossas7.py is in the same folder as this shell script.
cd "${BASH_SOURCE%/*}"

case $1 in
    heap)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A heap_usage -D
        ;;
    non_heap)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A non_heap_usage -D
        ;;
    code_cache)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A code_cache_usage -D
        ;;
    perm_gen)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A perm_gen_usage -m Perm_Gen -D
        ;;
    eden_space)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A eden_space_usage -m Eden_Space -D
        ;;
    tenured_gen)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A tenured_gen_usage -m Tenured_Gen -D
        ;;
    survivor_space)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A survivor_space_usage -m Survivor_Space -D
        ;;
esac