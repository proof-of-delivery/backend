pipeline {
    agent any

    stages {
      
        stage('Build') {
            steps {
                sh 'rbenv install'
                sh 'rbenv local 3.2.2'
                sh 'gem install bundler'
                sh 'gem install ./vendor/comee_core-0.1.9.gem'
                sh 'bundle install'
            }
        }

        stage('Database Setup') {
            steps {
                sh 'docker-compose up -d'
                sh 'bundle exec rails db:create'
                sh 'bundle exec rails db:migrate'
            }
        }

        stage('Tests') {
            steps {
                sh 'bundle exec rspec'
            }
        }

        stage('Linting') {
            steps {
                sh 'bundle exec rubocop'
            }
        }

        stage('Database Cleanup') {
            steps {
                // Stop and remove the database container
                sh 'docker-compose down'
            }
        }
        
        stage('Clean Up') {
            steps {
                // Clean up any temporary files or resources
                deleteDir()
            }
        }
    }
}