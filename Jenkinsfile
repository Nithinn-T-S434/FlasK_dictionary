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
								cd ~/FlasK_dictionary
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
						cd '/home/ec2-user/FlasK_dictionary'
						RUN pip3 install -r requirements.txt
						docker build -t Flask_Dictionary
						'''
				}
			}
		stage('Running the image'){
			steps{
				// Build and test the flask appwith the source code from github
					sh '''
						cd '/home/ec2-user/FlasK_dictionary'
						docker run Flask_Dictionay -d -p 3000:3000 FlasK_Dictionary
						'''
			}
		}
	}
}
