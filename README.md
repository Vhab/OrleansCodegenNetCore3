This repository reproduces an issue with Microsoft Orleans' code generator on .NET Core 3 Preview7.

## Baseline test on .NET Core 2.2

```
docker build -f .\NetCore2.Dockerfile .
```

## Reproduction case with .NET Core 3.0 Preview7

```
docker build -f .\NetCore3.Dockerfile .
```

This is expected to fail with the following message:

```
  It was not possible to find any compatible framework version
  The specified framework 'Microsoft.NETCore.App', version '2.0.0' was not found.
    - The following frameworks were found:
        3.0.0-preview7-27912-14 at [/usr/share/dotnet/shared/Microsoft.NETCore.App]

  You can resolve the problem by installing the specified framework and/or SDK.

  The .NET Core frameworks can be found at:
    - https://aka.ms/dotnet-download
```

## Workaround with having both .NET Core 2.2 and 3.0 Preview 7 installed

Please note this image takes a while to build as it needs to download .NET core 2.2

```
docker build -f .\NetCore3With2.Dockerfile .
```
