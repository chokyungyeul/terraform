pipeline {
    agent any

    parameters {
        string(name: 'environment', defaultValue: 'terraform', description: 'Workspace/environment file to use for deployment')
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    }

        environment {
       AZURE_CLIENT_ID          = credentials('fbf9bfce-a44e-4632-a9bc-4a1c4280ea08')
       AZURE_CLIENT_SECRET      = credentials('gpI8Q~TobJ735QPBspP4-DmmXRYpzmv0xLFKicts')
       AZURE_SUBSCRIPTION_ID    = credentials('a30376d1-42be-4a6d-a201-8254f23c7064')
       AZURE_TENANT_ID          = credentials('785087ba-1e72-4e7d-b1d1-4a9639137a66')
    }

    stages {

        stage('Plan') {

            steps {
                sh 'terraform init -upgrade'
                sh "terraform validate"
                sh "terraform plan"
            }
        }
        stage('Approval') {
           when {
               not {
                   equals expected: true, actual: params.autoApprove
               }
           }
           
           steps {
               script {
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan')]

               }
           }
       }

        stage('Apply') {
            steps {
                sh "terraform apply --auto-approve"
            }
        }
    }
}

