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
					sh 'docker image build -t  app .'
				}
			}
	}
}
