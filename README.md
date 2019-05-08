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

### Steps
1. For first time, build image locally by running the following command. run `docker image ls` to list available and existing built image.
```
  docker-compose build
```
2. Initatite server
```
  docker-compose up
```
3. Database Migration
```
  docker-compose run web rails db:create db:migrate
```