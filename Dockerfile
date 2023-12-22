FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /movie_app

COPY Gemfile /movie_app/Gemfile

COPY Gemfile.lock /movie_app/Gemfile.lock

RUN bundle install

COPY . /movie_app

COPY entrypoint.sh /usr/bin/

RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
