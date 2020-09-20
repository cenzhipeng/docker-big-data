#!/usr/bin/env python

import os
import sys

if os.path.exists('/data/namenode'):
    exit(0)
os.popen('/home/hadoop/hadoop/bin/hdfs namenode -format -force')