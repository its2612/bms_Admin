#See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

FROM mcr.microsoft.com/dotnet/core/aspnet:3.1-buster-slim AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/core/sdk:3.1-buster AS build
WORKDIR /src
COPY ["BMS_Admin/BMS_Admin.csproj", "BMS_Admin/"]
RUN dotnet restore "BMS_Admin/BMS_Admin.csproj"
COPY . .
WORKDIR "/src/BMS_Admin"
RUN dotnet build "BMS_Admin.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "BMS_Admin.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "BMS_Admin.dll"]