[![CircleCI](https://circleci.com/gh/yzgan/malaysia_news.svg?style=svg)](https://circleci.com/gh/yzgan/malaysia_news)
# Malaysia News 

## Hosted in render.com
https://malaysia-news-app.onrender.com

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
Google Cloud Language API is used for text classification in article content. 

Important Notes
> Credential json file contains private information and was intended to be used in Google Cloud environment.
> Do not commit and push to public repo and 3rd party cloud services.

In order to use the API, 
1. Create new project in google cloud console.
1. Navigate to `IAM & admin` to create new service account.
1. Download credential `json` file
1. Copy credential json content and paste to `rails credentials` with converted `yml` format.
1. Use the following command to edit rails credentials.
```sh
EDITOR="code --wait" rails credentials:edit
```

## Developer
### database.yml
Each local machine has local database setup for e.g. windows ubuntu subsystem for postgres.

To skip tracking local tracked file, 
```sh
git update-index --skip-worktree <file>
```
To view files with skipped flagged,
```sh
git ls-files -v
```
Any files skipped will have character `S` marked in the result.

To undo skipped worktree
```sh
git update-index --no-skip-worktree <file>
```
### CRLF issue in windows
when running `rubocop` in windows environment, probably would complain the following:
```
Layout/EndOfLine: Carriage return character detected.
```
caused by EOL rendered different in different OS.

try the following commands to resolve the issue
```sh
git config core.autocrlf false 
git rm --cached -r . 
git reset --hard
```
