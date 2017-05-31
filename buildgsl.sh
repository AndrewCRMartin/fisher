#!/usr/bin/bash
# Dwonloads and builds the GSL library
# By default installs it in $HOME/lib/gsl - but this can be specified
# on the command line instead
#
# Version to install
VERSION=1.16

# Where to install (can override on command line)
GSLDEST=${HOME}/lib/gsl
if [ "X$1" != "X" ]
then
   GSLDEST=$1
fi

# Work out directory and file names
GSLDIR=gsl-${VERSION}
GSLTAR=${GSLDIR}.tar.gz

# Get the tar file if we don't have it
if [ ! -f $GSLTAR ]
then
   wget ftp://ftp.gnu.org/gnu/gsl/$GSLTAR
fi

# Remove the working directory if present
if [ -d $GSLDIR ]
then
   \rm -rf $GSLDIR
fi

# Unpack and build
tar -zxvf $GSLTAR
cd $GSLDIR
./configure --prefix=$GSLDEST
make
make install
cd ..

# Remove the working directory
\rm -rf $GSLDIR
