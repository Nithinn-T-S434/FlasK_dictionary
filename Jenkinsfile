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
				// Build and test the image from the dockerfile with the source code from github\
				// . represents the path as dockerfile is availabe in the same path . is mentioned
				sh 'docker image build -t  app .'
		
			}	
		}
		stage('Docker Image containerization'){
			steps{
				// Docker image containerization from the docker compose Yaml file
				sh 'docker-compose up -d --build --scale flask_dictionary=3'
			}
		}

	}
}	

