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
			agent {
				dockerfile true
			}
			steps{
				// Build and test the flask appwith the source code from github
					sh '''
						cd ..
						RUN pip3 install -r requirements.txt
						cd /var/lib/jenkins/workspace/FlasK_Dictionary/folder
						sudo usermod -a -G docker jenkins
						docker image build -t  app .
						'''
				}
			}
		stage('Running the image'){
			steps{
				// Build and test the flask appwith the source code from github
					sh '''
						cd '/home/ec2-user/FlasK_dictionary'
						docker run -p 3000:3000 -d app
						'''
			}
		}
	}
}
