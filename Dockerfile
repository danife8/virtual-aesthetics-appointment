# Dockerfile
FROM ruby:3.4.1-alpine

# Install dependencies
RUN apk add --update --no-cache \
    build-base \
    postgresql-dev \
    postgresql-client \
    nodejs \
    yarn \
    tzdata \
    git \
    libpq

WORKDIR /virtual-aesthetics-appointment

# Install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . .

# Entry point setup
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]