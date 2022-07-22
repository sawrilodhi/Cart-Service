pipeline{
    agent any
    tools{
        maven 'Apache Maven 3.6.3'
    }
    stages{
        stage('Build Maven'){
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/sawrilodhi/Cart-Services.git']]])
                sh 'mvn clean install'
            }
            
        }
        stage('Build docker images'){
            steps{
                script{
                    sh 'docker build -t cart-service .'
                }
            }
        }
        stage('Push image to Hub'){
            steps{
                script{
                    withCredentials([string(credentialsId: 'dockerHubpwd', variable: 'dockerHubpwd')]) {
                    sh 'docker login -u sawrilodhi -p ${dockerHubpwd}'
}
                    sh 'docker push cart-service'
                }
            }
        }
    }
}