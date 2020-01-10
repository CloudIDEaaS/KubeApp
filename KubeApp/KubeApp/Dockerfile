FROM mcr.microsoft.com/dotnet/core/aspnet:2.1 AS base
WORKDIR /app
EXPOSE 80

FROM mcr.microsoft.com/dotnet/core/sdk:2.1 AS build
WORKDIR /src
COPY ["KubeApp/KubeApp.csproj", "KubeApp/"]

RUN dotnet restore "KubeApp/KubeApp.csproj"
COPY . .
WORKDIR "/src/KubeApp"
RUN dotnet build "KubeApp.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "KubeApp.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "KubeApp.dll"]