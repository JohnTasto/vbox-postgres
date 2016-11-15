#!/bin/bash



# install Miniconda

echo 'Installing Miniconda...'
bash ~/proj/Miniconda3-latest-Linux-x86_64.sh -b  >> $LOGFILE
echo '# Added for Miniconda' >> ~/.bash_profile
echo "export PATH=\"$HOME/miniconda3/bin:\$PATH\"" >> ~/.bash_profile

. ~/.bash_profile



# install Conda packages

echo 'Installing Jupyter...'
conda install -y jupyter >> $LOGFILE
mkdir ~/.jupyter && cp ~/proj/jupyter_notebook_config.py ~/.jupyter

echo 'Installing Pandas...'
conda install -y pandas >> $LOGFILE

echo 'Installing scikit and seaborn...'
conda install -y seaborn scikit-learn >> $LOGFILE



# add virtual environment

echo 'Creating Conda virtual environment...'
conda create -n cvdjango python django psycopg2 >> $LOGFILE
source activate cvdjango >> $LOGFILE



# install Python packages

echo 'Installing csvkit...'
pip install csvkit >> $LOGFILE         # for commands 'csvsql' and 'csvstat'
