#!/bin/bash

TIME=`date --date='+'$1' minutes' +"%Y-%m-%d %H:%M:%S"`
TIME2="date -d '$TIME' +%s"

eval $TIME2
