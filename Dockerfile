FROM ruby:2.6.3
RUN apt-get update -qq && apt-get install -y postgresql-client
# https://github.com/nodesource/distributions#installation-instructions
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
        && apt-get install -y nodejs
RUN mkdir /malaysia_news_app
WORKDIR /malaysia_news_app
COPY Gemfile /malaysia_news_app/Gemfile
COPY Gemfile.lock /malaysia_news_app/Gemfile.lock
RUN gem install bundler 
RUN bundle install
COPY . /malaysia_news_app

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
