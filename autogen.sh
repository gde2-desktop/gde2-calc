#!/bin/sh
# Run this to generate all the initial makefiles, etc.

srcdir=`dirname $0`
test -z "$srcdir" && srcdir=.

PKG_NAME="gde2-calc"
REQUIRED_AUTOMAKE_VERSION=1.7
REQUIRED_YELP_TOOLS_VERSION=3.1.1

(test -f $srcdir/configure.ac \
  && test -d $srcdir/src) || {
    echo -n "**Error**: Directory "\`$srcdir\'" does not look like the"
    echo " top-level gde2-calc directory"
    exit 1
}

which gde2-autogen || {
    echo "You need to install gde2-common from the GDE2 git"
    exit 1
}

which yelp-build || {
    echo "You need to install yelp-tools" 
    exit 1
}

USE_GDE22_MACROS=1 USE_COMMON_DOC_BUILD=yes . gde2-autogen
