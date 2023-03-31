pipeline {
	agent any
	stages{
		stage('Updating the repository'){
			steps{
				// Updating the repo on target system
					withCredentials([usernamePassword(credentialsId:'7a5d9eb6-de84-4a60-a4fa-9afb1c84c893',passwordVariable: 'GIT_PASSWORD',usernameVariable:'GIT_USERNAME')]){
						sh 'cd /FlasK_Dictionary'
						git banch: 'main',
							credintialsId:'7a5d9eb6-de84-4a60-a4fa-9afb1c84c893',
							url:'https://github.com/Nithinn-T-S434/FlasK_dictionary.git'
						sh 'git pull'
				}
			}
		}
		stage('Docker Image generation'){
			agent {
				Dockerfile true
			}
			steps{
				// Build and test the flask appwith the source code from github
					sh '''
						cd /FlasK_Dictionary
						RUN pip3 install -r requirements.txt
						docker build -t Flask_Dictionary
						'''
				}
			}
		stage('Running the image'){
				// Build and test the flask appwith the source code from github
				script{
					sh '''
						cd /Flask_Dictionary
						docker run Flask_Dictionay -d -p 3000:3000 FlasK_Dictionary
						'''
				}
			}
		}
}
