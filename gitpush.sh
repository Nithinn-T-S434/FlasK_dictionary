git status
git add .
git status
echo 'Enter the commit message:'
read commitMessage
git commit -m "$commitMessage"
#echo 'Enter the name of the branch:'
#read branch
git config credential.helper store
git push origin main
read

