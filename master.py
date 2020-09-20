#!/usr/bin/env python

import os
import sys

if os.path.exists('/data/namenode'):
    sys.exit(0)
os.popen('/home/hadoop/hadoop/sbin/hdfs namenode -format -force')