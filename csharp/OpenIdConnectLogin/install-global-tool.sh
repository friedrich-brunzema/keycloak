#!/bin/bash -e
  
read -r VERSION < version
FEED=http://proget2.oneomics.net/nuget/Tools/
dotnet tool uninstall --global Sciex.Dt || true
dotnet tool install --global --version $VERSION --add-source $FEED Sciex.Dt
