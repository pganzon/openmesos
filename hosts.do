mesosstandalone  ansible_ssh_host=127.0.0.1

[zookeeper]
mesosstandalone

[mesosmasters]
mesosstandalone

[mesosslaves]
mesosstandalone


[all:children]
zookeeper
mesosmasters
mesosslaves
