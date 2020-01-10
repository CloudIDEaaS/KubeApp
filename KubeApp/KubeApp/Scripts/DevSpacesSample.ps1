az group create --name myResourceGroupDevSpaces --location westus2
az aks create -g myResourceGroupDevSpaces -n MyAKS --location eastus --disable-rbac --generate-ssh-keys
az aks use-dev-spaces -g myResourceGroupDevSpaces -n MyAKS --space dev --yes

az login

cd "C:\Users\Ken\Source\Repos\KubeAppRepo\KubeApp"

docker build -f C:\Users\Ken\Source\Repos\KubeAppRepo\KubeApp\KubeApp\Dockerfile C:\Users\Ken\Source\Repos\KubeAppRepo\KubeApp

# Delete every Docker containers
# Must be run first because images are attached to containers
docker rm -f $(docker ps -a -q)

# Delete every Docker image
docker rmi -f $(docker images -q)

docker image ls