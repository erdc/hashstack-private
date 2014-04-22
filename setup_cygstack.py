#!/usr/bin/env python
"""
Install 64-bit Cygwin dependences needed by HashStack.

This utility script uses Cygwin's setup-x86_64.exe program to install
dependencies needed both to run HashStack as well as dependencies for
commonly installed packages within HashStack.  This script is mostly
scaffolding to get users up and running on HashStack and is a first
effort.  Improvements and suggestions welcome!
"""

import sys
import subprocess
import argparse


def get_installed_packages():
    packages = subprocess.check_output(['cygcheck','-c', '-d'])
    # split lines on Windows carriage returns
    packages = packages.split('\r\n')
    # header_data
    packages = packages[2:]
    # package name
    packages = [p.split()[0] for p in packages if p]
    return packages


if __name__ == '__main__':

    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("CYGSTACK", nargs="?", default="cygstack.txt",
                        help="List of packages to install, use cygcheck -cd to generate")
    parser.add_argument("--cache", help="cache package download directory (don't install)", default="")
    parser.add_argument("--mirror", help="Cygwin mirror to use", default="http://mirror.mcs.anl.gov/cygwin/")
    parser.add_argument("--verbosity", help="increase output verbosity")


    args = parser.parse_args()

    try:
        subprocess.check_call(['which', 'setup-x86_64.exe'])
    except:
        sys.stderr.write('Unable to find setup-x86_64.exe, please put it on your PATH and re-execute this script.\n')
        sys.stderr.write('You could try: \n\nwget http://cygwin.com/setup-x86_64.exe -O /usr/bin/setup-x86_64.exe\n')
        sys.exit(1)

    try:
        subprocess.check_call(['cygcheck','-c'])
    except:
        sys.stderr.write('Unable to find cygcheck.exe, please put it on your PATH and re-execute this script.\n')
        sys.stderr.write('Please check your Cygwin install\n')
        sys.exit(1)
    
    cygstack = args.CYGSTACK

    print "Using %s as list of packages to install." % cygstack

    with open(cygstack) as packages:
        # header_data
        packages.readline()
        packages.readline()

        installed_packages = get_installed_packages()
        packages_to_install = ''

        for package_line in packages.readlines():
            package = package_line.split()[0]

            if package in installed_packages and not args.cache:
                print 'already installed', package_line
                continue
            
            packages_to_install += ','+package
            print 'installing', package

        exec_args = ['-q']
        if args.cache:
            cygpath_cache = subprocess.check_output(['cygpath', '-aw', args.cache]).strip()
            exec_args += ['-R', args.cache, '-D', '-l', cygpath_cache]
        if args.mirror:
            exec_args += ['-O', '-s', args.mirror]
        exec_args += ['-P', packages_to_install]
        call = ['setup-x86_64.exe'] + exec_args
        print "Calling", call
        subprocess.check_call(call)