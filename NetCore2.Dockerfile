FROM mcr.microsoft.com/dotnet/core/sdk:2.2.401 AS build

COPY * /src/
COPY global-netcore2.json /src/global.json

WORKDIR /src
RUN dotnet publish -r linux-x64 -c Release -o /app OrleansCodegenNetCore3.csproj
