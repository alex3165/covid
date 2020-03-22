FROM timbru31/ruby-node:2.6

WORKDIR /app/

RUN ruby --version
RUN node -v

COPY Gemfile* ./
RUN bundle install

COPY package.json ./
RUN yarn

ADD . .

RUN gem install bundler

CMD bundle exec rails db:setup && rails s -b 0.0.0.0
