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
		stage('initializing the container'){
			steps{
				//making port 5000 available if occupied
				sh'''
					doker rmi app
					docker stop Flask_dictionary
					docker system prune
					'''
			}
		}
		stage('Docker Image generation'){
			steps{
				// Build and test the flask app with the source code from github\
				// . represents the path as dockerfile is availabe in the same path . is mentioned 
				sh 'docker image build -t  app .'
		
			}	
		}
		stage('Docker Image containerization'){
			steps{
				// Build and test the flask appwith the source code from github\
				sh 'docker-compose up -d --build --scale Flask_dictionary=5'
			}	
		}	
	}
}	

