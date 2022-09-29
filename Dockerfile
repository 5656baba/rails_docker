FROM ruby:2.7

# Node.jsをインストール
RUN curl -sL RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
    apt-get install -y nodejs

# Yarnをインストール
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt update && apt install yarn    
WORKDIR /app
COPY src/Gemfile /app
COPY src /app
RUN bundle config --local set path 'vendor/bundle' \
    && bundle install
