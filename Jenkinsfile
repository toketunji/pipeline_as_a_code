pipeline {
    agent {
        node {
            label 'slaveJENKINS'
        }
    }
environment {
    TERRAFORM_CMD = 'sudo docker run --network host -w /app -v /root/.aws:/root/.aws -v /root/.ssh:/root/.ssh -v "${WORKSPACE}/CreateJenkins":/app hashicorp/terraform:light'

    }
      	stages {
          stage('checkout repo') {
            steps {
              git url: 'https://github.com/toketunji/pipeline_as_a_code.git'
            }
          }
          stage('pull latest light terraform image') {
	    steps {
 	      withEnv(['PATH+EXTRA=/usr/sbin:/usr/bin:/sbin:/bin']) {	
                sh  """
                    sudo docker pull hashicorp/terraform:light
                    """
             }
            }
          }
          stage('Init') {
            steps {
	      ansiColor('xterm') {
                sh  """
                    cd terraform
                    ${TERRAFORM_CMD} init -backend=true -input=false
                    """
              }
            }
          }
          stage('Plan') {
            steps {
	      ansiColor('xterm') {
                sh  """
 		    cd terraform
                    ${TERRAFORM_CMD} plan -backend=true -input=false
                    """
              }
            }
          }  
          stage('Apply') {
            steps {
	      ansiColor('xterm') {
                sh  """
		    cd terraform
                    ${TERRAFORM_CMD} apply -lock=false -input=false tfplan
                    """
	        }
              }
          }
      }
}
