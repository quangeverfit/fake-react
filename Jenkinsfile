pipeline {
  agent {
    node {
      label agentLabel
    }

  }
  stages {
    stage('Build') {
      when {
        branch 'dev'
      }
      environment {
        USERNAME_PASSWORD = credentials("${agentCredential}")
      }
      steps {
        withCredentials(bindings: [file(credentialsId: 'SAMPLE_ENV_FILE', variable: 'envfile')]) {
          sh "echo $USERNAME_PASSWORD_PSW | sudo -S cp $envfile .env"
          sh 'cat .env'
        }

        sh 'bash ./ci/build.sh'
      }
    }

    stage('Push') {
      steps {
        sh 'bash ./ci/push.sh'
      }
    }

    stage('Clean') {
      steps {
        sh 'bash ./ci/clean.sh'
      }
    }

  }
  environment {
    AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
    AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
    IMAGE_REPOSITORY_URL = credentials('IMAGE_REPOSITORY_URL')
    IMAGE_URL = "$IMAGE_REPOSITORY_URL/everfit-demo-${repoNamespace}/frontend:latest"
    AWS_DEFAULT_REGION = 'us-east-2'
  }
}