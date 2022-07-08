# Base image, make sure that the Ruby version is compatible with the version in your Gemfile.
FROM ruby:2.7.0

# Install dependencies needed for the app and delete the packages after installed.
  RUN apt-get update -qq \
  && apt-get install -y nodejs postgresql-client

# Create a directory inside the container for the project.
WORKDIR /internal_news-7

# Set the folder to where install ruby gems
ENV BUNDLE_PATH /gems

# Install yarn and bundle dependencies
#COPY package.json yarn.lock /internal_news-7/
#RUN yarn install
COPY Gemfile Gemfile.lock /internal_news-7/
RUN bundle install

# Copy source code after dependencies installed
COPY . /internal_news-7/

# Set the command that runs when the docker image is started
ENTRYPOINT ["bin/rails"]
CMD ["s", "-b", "0.0.0.0"]

# Expose the port that rails uses
EXPOSE 3000