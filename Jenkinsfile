pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    }
    options {
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    parameters {
        string(name: 'version', defaultValue: '', description: 'What is the artifact version?')
        string(name: 'environment', defaultValue: 'dev', description: 'What is environment?')
        booleanParam(name: 'Apply', defaultValue: 'false', description: 'Apply to create the Infra?')
        booleanParam(name: 'Destroy', defaultValue: 'false', description: 'Destroy to destroy the Infra?')
    }
    stages {
        stage('DEV Environment'){
        when{
            expression{
                params.environment == 'dev'
            }
        }
            steps{
                sh """
                echo "running in dev env"
                """
            }
        }
        stage('PROD Environment'){
        when{
            expression{
                params.environment == 'prod'
            }
        }
            steps{
                sh """
                echo "running in prod env"
                """
            }
        }
        stage('Print version') {
            steps {
                sh """
                echo "version: ${params.version}"
                echo "environment: ${params.environment}"
                """
            }
        }
        stage('Init') {
            steps {
                sh """
                    cd terraform
                    terraform init --backend-config=${params.environment}/backend.tf -reconfigure
                """
            }
        }
        stage('Plan') {
            steps {
                sh """
                    cd terraform
                    terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}"
                """
            }
        }
        stage('Apply') {
            when{
                expression{
                    params.Apply == true
                }
            }
            steps {
                sh """
                    cd terraform
                    terraform apply -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -auto-approve
                """
            }
        }
        stage('Destroy') {
            when{
                expression{
                    params.Destroy == true
                }
            }
            steps {
                sh """
                    cd terraform
                    terraform destroy -var-file=${params.environment}/${params.environment}.tfvars -var="app_version=${params.version}" -auto-approve
                """
            }
        }
    }
    post {
        always {
            echo 'I will always say Hello again!'
            deleteDir()
        }
        failure {
            echo 'This runs when pipeline is failed, used to send some alerts'
        }
        success {
            echo 'This runs when pipeline is success'
        }
    }
}
