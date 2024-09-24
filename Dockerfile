# Use the official Ruby image with version 3.3.5
FROM ruby:3.3.5

# Set the working directory inside the container
WORKDIR /resource-finder

# Install Node.js, Yarn, and system dependencies
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get update -qq && \
    apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y yarn build-essential libpq-dev sqlite3 libsqlite3-dev tzdata libvips && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

# Install Bundler
RUN gem install bundler

# Copy Gemfile and Gemfile.lock before other files to leverage Docker cache
COPY Gemfile Gemfile.lock ./

# Install application gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Ensure tmp directory is created to avoid PID issues
RUN mkdir -p tmp && \
    rm -f tmp/pids/server.pid

# Expose port 3000 for the Rails server
EXPOSE 3000

# Default command to run the Rails server in development mode
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails s -b '0.0.0.0'"]
