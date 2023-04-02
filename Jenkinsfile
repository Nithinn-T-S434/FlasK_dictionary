pipeline {
	agent any
	stages{
		stage('Updating the repository'){
			steps{
				// Updating the repo on target system
						dir("folder"){
							sh '''
								pwd
								cd ..
								pwd
								cd /var/lib/jenkins/workspace/FlasK_Dictionary/folder
								pwd
								git pull origin main
								'''
						}
				}
			}
		stage('Docker Image generation'){
			steps{
				// Build and test the flask appwith the source code from github\
				sh 'docker image build -t  app .'
		
			}	
		}
		stage('Docker Image containerization'){
			steps{
				// Build and test the flask appwith the source code from github\
				sh 'docker run -p 5000:5000 -d app'
		
			}	
		
		}	
	}
}	

