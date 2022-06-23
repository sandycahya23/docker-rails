# Dockerfile.rails
FROM ruby:2.7.0 AS rails-toolbox

# Default directory
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# Install rails
RUN gem install rails bundler
#RUN chown -R user:user /opt/app
WORKDIR /opt/app
COPY Gemfile Gemfile.lock /opt/app/
RUN gem install bundler && bundle install
COPY . /opt/app


# Run a shell
EXPOSE 3000
CMD bundle exec rails server -b 0.0.0.0

# CMD ["/opt/app/bin/rails server"]
