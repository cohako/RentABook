FROM ruby:3.0.0

# add debian source list to sources for update
RUN sed -i 's;http://archive.debian.org/debian;http://deb.debian.org/debian;' /etc/apt/sources.list
# ignore errors of update and install apps
RUN apt-get -o Acquire::Check-Valid-Until=false update -qq && apt-get install -y postgresql-client

# RUN curl -sL https://deb.nodesource.com/setup_17.x | bash 
# RUN apt-get install nodejs -y

RUN mkdir ./rent_a_book
WORKDIR /rent_a_book
COPY Gemfile /rent_a_book/Gemfile
COPY Gemfile.lock /rent_a_book/Gemfile.lock
RUN  bundle config set force_ruby_platform true && bundle install
COPY . /rent_a_book
WORKDIR /rent_a_book

# RUN bundle exec rake assets:precompile

EXPOSE 5003

# Configure the main process to run when running the image
CMD ["rails", "server", "-p", "5003", "-b", "0.0.0.0"]
