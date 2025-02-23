# Dockerfile
FROM ruby:3.4

# Install dependencies
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    postgresql-client \
    nodejs \
    yarn \
    tzdata \
    git \
    libyaml-dev \
    netcat-openbsd \
&& rm -rf /var/lib/apt/lists/*

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