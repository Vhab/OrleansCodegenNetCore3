FROM mcr.microsoft.com/dotnet/core/sdk:3.0.100-preview7 AS build

COPY * /src/
COPY global-netcore3.json /src/global.json

WORKDIR /src
RUN dotnet publish -r linux-x64 -c Release -o /app OrleansCodegenNetCore3.csproj
