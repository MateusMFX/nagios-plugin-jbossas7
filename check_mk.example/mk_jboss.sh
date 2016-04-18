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
    tenured_gen)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A tenured_gen_usage -m PS_Old_Gen -D
        ;;
    survivor_space)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A survivor_space_usage -m PS_Survivor_Space -D
        ;;
    compressed_class)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A compressed_class_usage -D
        ;;
    code_cache)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A code_cache_usage -D
        ;;
    eden_space)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A eden_space_usage -m PS_Eden_Space -D
        ;;
    metaspace)
        python ./check_jbossas7.py -H $JBOSS_HOST -P $JBOSS_PORT -u $JBOSS_USER -p $JBOSS_PASS -A metaspace_usage -D
        ;;
esac
