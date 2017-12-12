# OpenMesos
This platform can be used as a generic platform for devops and dataops. This is built using Apache Mesos.

Please note this is under development and various hardening is required to use it in production. This platform has been tested on Vagrant on MacOSX and Digital Ocean.

# Prerequisites
1. Vagrant Version  1.8.3 or latest. Installation instructions [here](https://www.vagrantup.com/downloads.html).
2. Ansible version ansible 2.0.0.2 or latest. Installation instructions [here](http://docs.ansible.com/ansible/intro_installation.html#latest-releases-on-mac-osx).
```
sudo apt-get update
sudo apt-get install -y python software-properties-common python-pip build-essential libssl-dev libffi-dev python-dev
sudo pip install --upgrade pip
sudo pip install ansible==2.0.0.2
```


# Steps for using locally - Vagrant.
1. Go to the directory where you cloned this project.
2. Open VagrantFile and adjust the value of vb.memory = "4096" to the capacity of your laptop.
3. Open vars/global_var.yml, then edit the following:
    * mesos_setup: single or cluster. If running on a cluster ie 3 mesos masters and n mesos slaves put "cluster" as the value of this parameter.
    * ansible_ethernet_name: ethernet id being used by your virtualbox.
    * zk_quorumval: If running on a cluster ie 3 mesos masters and 3 zookeepers then put 2 as the value of this parameter.
4. Run __vagrant up__.
5. Re-Open vars/global_var.yml, then edit the following:
    * ansible_ethernet_name: ethernet id being used by your virtualbox. You can get this by doing ifconfig inside your virtualbox. Choose the ethernet id with the same ip range as your host.
6. Run __ansible-playbook openmesos.yml__.
7. When the ansible build is finished run __vagrant reload__ to ensure all the changed are applied.
8. If everything is ok, the following url should be available:
    * Mesos - http://yourvm.ip:5050
    * Marathon - http://yourvm.ip:8080

# Steps for using VPS single node- DigitalOcean
1. Create your droplet. 
```
doctl compute droplet create mesosstandalone --region <regionid> --image ubuntu-16-04-x64 --size <size> --ssh-keys 123 --wait --user-data-file bootstrap_do.sh
```
2. Create ansible.cfg.
```
cp ansible.cfg.do ansible.cfg
```
3. Update ansible.cfg parameters.
  * remote_user
  * private_key_file. Private key that you want to use. Please follow [this](https://help.ubuntu.com/community/SSH/OpenSSH/Keys) to generate an ssh private key. 
4. Update hosts.do.
  * ansible_ssh_host. Put ip address of your droplet.
5. Edit vars/global_var.yml.
  * ansible_ethernet_name:eth0
6. Run __ansible-playbook openmesos.yml__.
7. If everything is ok, the following url should be available:
    * Mesos - http://yourvm.ip:5050
    * Marathon - http://yourvm.ip:8080

# Related Projects to be released.
- [ ]  Service Discovery using MarathonLb.
- [x]  [Data Science Notebooks on Marathon](https://github.com/pganzon/kuwaderno).
- [x]  [Apache Airflow on Marathon](https://github.com/pganzon/airflow).
- [ ]  Instructions for implementation on other cloud providers.
