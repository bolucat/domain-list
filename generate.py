#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# 
# Credits: https://github.com/v2fly/domain-list-community
# Usage: python3 generate.py -f "domain list name"

import os
import argparse

parser = argparse.ArgumentParser(description='convert domain list to clash config')
parser.add_argument('-f', '--file', nargs='*', help='domain list file', default='')
args = parser.parse_args()


def test_file_exists(file):
    if os.path.exists(file):
        return True
    else:
        print("File not exists")
        return False


for arg in args.file:
    domain_list = 'src/' + arg + '.txt'
    clash_config = 'clash/' + arg + '.yaml'
    if args.file != '':
        if test_file_exists(domain_list):
            with open(domain_list, 'r') as f:
                with open(clash_config, 'w') as f1:
                    f1.write("payload:\n")
                    for line in f:
                        f1.write("  - '+." + line.strip() + "'\n")
            print("Convert success")
        else:
            print("Convert failed")
    else:
        print("Please check file name")
