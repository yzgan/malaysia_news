[![CircleCI](https://circleci.com/gh/yzgan/malaysia_news.svg?style=svg)](https://circleci.com/gh/yzgan/malaysia_news)
# Malaysia News 

## Hosted in heroku
https://aqueous-coast-36800.herokuapp.com

Place to view most recent news from Malaysia.

> Powered by NewsApi.org

## Docker
Run `rails s` to start server without docker environment by default.

Alternatively, initiate server in docker environment in the following.

Note: Prerequisite to have `docker` and `docker-compose` installed locally.

Autobuild has been configured and triggered upon github master branch push -> [docker-autobuild](https://cloud.docker.com/repository/docker/ganyizhong/malaysia_news/builds)

### Build image
For first time, build image locally by running the following command. run `docker image ls` to list available and existing built image. 

Built image will be tagged with `latest` label upon completion.
```
  docker-compose build
```
### Start server from image
require: [build image](#build-image)
```
  docker-compose up
```
### Execute Database Migration in image
require: [build image](#build-image)
```
  docker-compose run web rails db:create db:migrate
```
### Manually Deploy image
require: [build image](#build-image)
require: docker credential
```
  docker login 
```
Deploy or push image to docker repo with `latest` tag
```
  docker push ganyizhong/malaysia_news:latest
```
```
  docker-compose push
```
Checkout [docker hub](https://cloud.docker.com/repository/docker/ganyizhong/malaysia_news/general) to view image push and autobuild status.

## Google Cloud
### Text Classification
Google Cloud Language API is used for text classification in article. 

In order to use the API, 
1. Create new project in google cloud console.
1. Navigate to `IAM & admin` to create new service account.
1. Download credential `json` file to local machine.
1. Export `GOOGLE_APPLICATION_CREDENTIALS` environment variable to the credential json file path in local machine.

```
export GOOGLE_APPLICATION_CREDENTIALS="/path/to/credential.json"
```
