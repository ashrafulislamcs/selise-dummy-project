# demo-project
> node v14.21.1,
> npm 8.19.3

Git Action
docker-image.yml
name: Docker Image CI

on:
  push:
    branches:
      - main
      - dev
  pull_request:
    branches:
      - main
      - dev

jobs:

  build:

    runs-on: ubuntu-latest

    steps:
    - name: Login to DockerHub
      uses: docker/login-action@v2
      with:
        username: ${{ secrets.DOCKERHUB_USERNAME }}
        password: ${{ secrets.DOCKERHUB_TOKEN }}
        
    - uses: actions/checkout@v3
    - name: Build the Docker image
      run: docker build . --file Dockerfile --tag ashrafulislamcs/selise:latest
      
    - name: Build and push
      uses: docker/build-push-action@v3
      with:
       push: true
       tags: ashrafulislamcs/selise:latest
