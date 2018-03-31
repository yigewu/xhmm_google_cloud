############################################################
# Dockerfile to build XHMM image
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu:16.04

# File Author / Maintainer
MAINTAINER Yige Wu <yigewu@wustl.edu>

# Update the repository sources list & Install compiler and basics
RUN apt-get update && apt-get install --yes \
 build-essential \
 gcc-multilib \
 libpthread-stubs0-dev \
 liblapack-dev \
 unzip \
 gengetopt \
 wget \
 default-jre \
 default-jdk \
 csh \
 gawk \
 && apt-get clean

# TODO: install zip
# Install XHMM
RUN wget https://bitbucket.org/statgen/xhmm/get/master.zip
RUN unzip master.zip
WORKDIR /statgen-xhmm-cc14e528d909
RUN make

# Install gatk3
RUN mkdir /gatk3
WORKDIR /gatk3
RUN wget https://software.broadinstitute.org/gatk/download/auth?package=GATK
RUN tar xvjf auth\?package\=GATK

# Install plinkseq
WORKDIR /
RUN wget http://psychgen.u.hpc.mssm.edu/plinkseq_downloads/plinkseq-x86_64-latest.zip  
RUN unzip plinkseq-x86_64-latest.zip
