pipeline {
  agent any

  environment {
    RUBY_VERSION = '3.2.2'
  }

  stages {
    stage('Build') {
      steps {
        container('ruby:3.2.2') {
          script {
            sh 'apt-get update && apt-get install -y postgresql-client'
            sh 'bundle install'
            sh 'bundle exec rubocop'
          }
        }
      }
    }

    stage('Test') {
      steps {
        container('ruby:3.2.2') {
          // start the postgres database
          sh 'docker run --name postgres -e POSTGRES_DB=ci_db -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=runner123 -d postgres:15.3-alpine'

          // run the tests
          sh 'apt-get update && apt-get install -y postgresql-client'
          sh 'bundle install'
          sh 'cp config/database-ci.yml config/database.yml'
          sh 'bundle exec rails db:create db:schema:load'
          sh 'bundle exec rails spec'

          // stop the postgres database
          sh 'docker rm -f postgres'
        }
      }
    }
  }
}
