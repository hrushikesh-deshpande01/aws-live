#!/bin/bash
# Software Components to be installed
declare -a arr=("git --version" "python3 --version" "mysql --version")

# check if not installed then installed
for i in "${arr[@]}"
do
   eval $i
   status=$?
   component=$(echo $i| cut -f 1 -d " ")
        if [ $status -eq 0 ]; then
        echo "$component is already installed."
        else
        echo "Installing $component..."
        sudo yum install -y $component
fi
done

# installing pip
curl -O https://bootstrap.pypa.io/pip/3.6/get-pip.py
python3 get-pip.py --user

#installing required python packages
pip install Flask-Flash PyMySQL boto3 --user
pip install markupsafe==2.0.1

# cloning source code from github
git clone https://github.com/hrushikesh-deshpande01/aws-live.git
cd aws-live

#running application
export FLASK_APP=EmpApp.py
export FLASK_ENV=development
pytnon3 EmpApp.py
