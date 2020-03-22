FROM timbru31/ruby-node:2.6

WORKDIR /app/

RUN ruby --version
RUN node -v

COPY . .

RUN bundle install
RUN npm install

RUN bundle exec rails db:setup

RUN gem install bundler

CMD ["heroku", "local"]
