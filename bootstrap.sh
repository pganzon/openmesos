sudo apt-get update
sudo apt-get install -y python software-properties-common python-pip build-essential libssl-dev libffi-dev python-dev
sudo pip install --upgrade pip
sudo pip install ansible==2.0.0.2

cd /vagrant
cp ansible.cfg.vagrant ansible.cfg
ansible-playbook openmesos.yml
