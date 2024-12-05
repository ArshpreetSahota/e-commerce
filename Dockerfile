# Use an official Ruby image from Docker Hub
FROM ruby:3.3.0

# Install dependencies (for example: nodejs and PostgreSQL client)
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set up working directory
WORKDIR /myapp

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install Ruby gems
RUN bundle install

# Copy the rest of the application
COPY . .

# Precompile assets (if needed for production)
RUN bundle exec rake assets:precompile

# Expose port (adjust based on your app's port)
EXPOSE 3000

# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]
