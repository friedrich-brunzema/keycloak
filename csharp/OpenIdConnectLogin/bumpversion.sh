#!/bin/bash

# Adapted from
# https://stackoverflow.com/questions/8653126/how-to-increment-version-number-in-a-shell-script

# first, we read and bump the version
read -r line < ./version
newversion=`(echo $line | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)%(10^length($NF))); print}')`
echo Update to: $newversion
echo $newversion > ./version

# File and package versions are defined in 
# respective Directory.Build.props files, which get included automatically and
# are merged to the .csproj.  Those props files have the versions we need to bump

# Tool dependency: resolve with
# dotnet tool install -g dotnet-property
dotnet property **/Directory.Build.props FileVersion:"$newversion"
dotnet property **/Directory.Build.props PackageVersion:"$newversion"
