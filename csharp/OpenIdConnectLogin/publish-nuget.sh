#!/bin/bash -e
  
read -r VERSION < version
CONFIGURATION=Release
PROJECTDIR=`pwd`
FEED=http://proget2.oneomics.net/nuget/Tools/

echo $VERSION
dotnet restore --source https://api.nuget.org/v3/index.json
dotnet pack -p:PackageVersion=$VERSION --configuration $CONFIGURATION --output $PROJECTDIR/bin$Configuration 
dotnet nuget push $PROJECTDIR/bin/$Configuration/Sciex.Dt.$VERSION.nupkg  --source $FEED 
# The above does not work on non-windows platforms (e.g. mac, Linux), so we use nuget.exe
#nuget push -ApiKey $NUGET_API_KEY $PROJECTDIR/bin$Configuration/DanaherDigital.DataServiceCli.$VERSION.nupkg  -Source $FEED 
