pipeline {
    agent any

     environment {
       AZURE_CLIENT_ID          = credentials('fbf9bfce-a44e-4632-a9bc-4a1c4280ea08')
       AZURE_CLIENT_SECRET      = credentials('gpI8Q~TobJ735QPBspP4-DmmXRYpzmv0xLFKicts')
       AZURE_SUBSCRIPTION_ID    = credentials('a30376d1-42be-4a6d-a201-8254f23c7064')
       AZURE_TENANT_ID          = credentials('785087ba-1e72-4e7d-b1d1-4a9639137a66')
    }

    parameters {
        choice(
            name: 'Action',
            choices: ['Build', 'Destroy'],
            description: 'The action to take'
        )
        choice(
            name: 'Colour',
            choices: ['Blue', 'Green'],
            description: 'The environment to use'
        )
    }

    stages {
        stage('Init') {
            steps {
                terraformInit()
            }
        }
        stage('Plan') {
            steps {
                terraformPlan()
            }
        }
        stage('Approval') {
            steps {
                input(message: 'Apply Terraform ?')
            }
        }
        stage('Apply') {
            steps {
                terraformApply()
            }
        }
        stage('Validate') {
            steps {
                inspecValidation()
            }
        }
    }
    post {
        always {
            echo 'Deleting Directory!'
            deleteDir()
        }
    }
}

def terraformInit() {
    sh("""
        cd Terraform/Demo;
        terraform init -backend-config="bucket=${env.BACKEND_BUCKET}" -backend-config="key=demo.tfstate"
        terraform workspace select ${params.Colour.toLowerCase()} || terraform workspace new ${params.Colour.toLowerCase()}
    """)
}

def terraformPlan() {
    // Setting Terraform Destroy flag
    if(params.Action == 'Destroy') {
        env.DESTROY = '-destroy'
    } else {
        env.DESTROY = ""
    }

    sh("""
        cd Terraform/Demo;
        terraform plan ${env.DESTROY} -var-file=${params.Colour.toLowerCase()}.tfvars -no-color -out=tfout
    """)
}

def terraformApply() {
    sh("""
        cd Terraform/Demo;
        terraform apply tfout -no-color
        mkdir ../../Inspec/files/
        terraform output --json > ../../Inspec/files/output.json
    """)
}

def inspecValidation() {
    sh("""
        inspec exec Inspec/ -t aws:// --input workspace=${params.Colour}
    """)
}
