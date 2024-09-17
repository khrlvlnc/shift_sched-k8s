pipeline {
    agent any
    
    stages {
        stage ("Checkout") {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[credentialsId: 'maximolds', url: 'https://github.com/maximolds/shift_sched.git']])
                sh 'ls -al'  // Verify the file is checked out
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t maximolds/mini_project_test .'
                }
            }
        }
        
        stage ('Push Docker Image') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'maximo', variable: 'dockerpwd')]) {
                        sh 'echo ${dockerpwd} | docker login -u maximolds --password-stdin'
                    }
                    sh 'docker push maximolds/mini_project_test'
                }
            }
        }
        
        stage('Deploy on K8s Cluster') {
            steps {
                withKubeConfig(caCertificate: "${KUBE_CERT}", clusterName: 'kubernetes', contextName: 'kubernetes-admin@kubernetes', credentialsId: 'my-kube-config-credentials', namespace: 'default', restrictKubeConfigAccess: false, serverUrl: 'https://jump-host:6443') {
                    sh 'kubectl apply -f master_deployment.yaml'
                    sh 'kubectl get all'
                }
            }
        }
    }
}

