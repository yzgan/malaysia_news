FROM ruby:2.6.3-alpine

# Minimal requirements to run a Rails app
RUN apk add --update build-base \
                     linux-headers \
                     git \
                     postgresql-dev \
                     nodejs \
                     tzdata \
                     bash

RUN mkdir /malaysia_news_app
WORKDIR /malaysia_news_app
COPY Gemfile /malaysia_news_app/Gemfile
COPY Gemfile.lock /malaysia_news_app/Gemfile.lock
RUN gem install bundler 
RUN bundle install --retry 3
COPY . /malaysia_news_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["sh", "entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
