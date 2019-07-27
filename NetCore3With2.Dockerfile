FROM mcr.microsoft.com/dotnet/core/sdk:3.0.100-preview7 AS build

# Add the .NET Core 2.2 SDK to the image, but preserve the .NET Core 3 Preview7 dotnet executable
RUN mv /usr/share/dotnet/dotnet /usr/share/dotnet/dotnet.bak \
    && curl -SL --output dotnet.tar.gz https://dotnetcli.blob.core.windows.net/dotnet/Sdk/2.2.401/dotnet-sdk-2.2.401-linux-x64.tar.gz \
    && dotnet_sha512='08E1FCAFA4F898C80FF5E88EEB40C7497B4F5651AF3B8EC85F65A3DAA2F1509A766D833477358D3FF83D179E014034AB0C48120847EF24736C8D1A5B67FEC10B' \
    && echo "$dotnet_sha512 dotnet.tar.gz" | sha512sum -c - \
    && mkdir -p /usr/share/dotnet \
    && tar -zxf dotnet.tar.gz -C /usr/share/dotnet \
    && rm dotnet.tar.gz \
    && rm /usr/share/dotnet/dotnet \
    && mv /usr/share/dotnet/dotnet.bak /usr/share/dotnet/dotnet

COPY * /src/
COPY global-netcore3.json /src/global.json

WORKDIR /src
RUN dotnet publish -r linux-x64 -c Release -o /app OrleansCodegenNetCore3.csproj
