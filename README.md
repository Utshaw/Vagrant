# Vagrant (Development Environments Made Easy) <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Vagrant.png/492px-Vagrant.png" align="right" width="100px" alt="Vagrant Logo">

## Info (Docker & Vagrant)
- Used for creating development environment
- While Docker uses container technology vagrant used Virtual Machines
- VMs emulate a physical computer comes with complete OS, resource allocation
- Host machine provides necessary physical resources 
- Virtualized envionment works as independent machine with it's own BIOS, CPU, storage, network adapters 
- Modern VMs run on Hypervisors
- Hypervisors are responsible for creation and execution of VMs
- Example of Hypervisors: KVM, vmware
- Vagrant is Open Source tool for creating and maintaining Virtual Machines
- Vagrant Simplifies the management of VMs
- Containers create virtualization on the OS level
- Containers create executable software package which isolates app from it's environments
- Inside the package the container has necesary properties Code, Runtime, system library
- Containers run on OS of host machine
- Docker doesn't create whole OS
- Docker Uses kernel of the host OS & creates virtualization only for the application and necessary libraries
- ssh: Secure Shell, a network protocol for connecting to remote system




## Setting Up
### Commands
```
# Install vagrant from [Here](https://www.vagrantup.com/)
# Install VirtualBox from [Here](https://www.virtualbox.org/wiki/Downloads)
vagrant -v # check if installed 
mkdir vgdemo # create a dir for containing the vagrant project files
cd vgdemo/  # entering that dir
# search on vagrantbox what you want from [here](https://app.vagrantup.com/boxes/search)
vagrant box add centos/7 # would just download the box & store on local system but don't create a Vagrantfile
vagrant init centos/7 # initialize the specified public box (https://app.vagrantup.com/boxes/search?utf8=%E2%9C%93&sort=downloads&provider=&q=centos) & creates VagrantFile
vagrant up # if the virtual guest machine exists it will run that otherwise adds it then runs that; make sure to run this command from inside the folder where VagrantFile resides
vargrant suspend [VM] # suspends the VM
vargrant resume [VM] # resumes the VM (to resume after suspending)
vargrant reload [VM] # reloads the VM (run this after any change in the VagrantFile)
vagrant status # status of the VMs
vagrant ssh [VM] # ssh into the VM, connect to the virtual machine as vagrant user; password for root & vagrant both account: vagrant
exit # logout of the VM & return to host OS
vagrant halt [VM] # stop the VM
vagrant destroy [VM]# deletes the VM completely
vagrant reload --provision # to force provisioning
```
### VagrantFile
```
config.vm.hostname = "UtshawsCentOS" # Change the default hostname of the guest machine
config.vm.network "private_network", ip: "10.9.8.7" # Change the IP address of the guest machine; cam be pinged from host machine
config.vm.synced_folder "../data", "/vagrant_data" # ../data -> host directory /vagrant_data -> box directory (guest machine)
```
#### Multiple machine based on single OS (VagrantFile) [multinet](./multinet/)
```
Vagrant.configure("2") do |config|
  config.vm.box = "centos/7"

  config.vm.define "admin01" do |admin01|
    admin01.vm.hostname = "admin01"
    admin01.vm.network "private_network", ip: "10.9.8.10"
  end

  config.vm.define "server01" do |server01|
    server01.vm.hostname = "server01"
    server01.vm.network "private_network", ip: "10.9.8.11"
  end

  config.vm.define "server02" do |server02|
    server02.vm.hostname = "server02"
    server02.vm.network "private_network", ip: "10.9.8.12"
  end

end

```
Testing the above configuration:
```
# Login into the admin01
vagrant ssh admin01
# modify /etc/hosts of admin01
echo '10.9.8.11 server01' | sudo tee -a /etc/hosts
echo '10.9.8.12 server02' | sudo tee -a /etc/hosts
# Check if the VMs are up & /etc/hosts is working
ping -c 3 server01; ping -c 3 server02

```

## Search for Box from here
https://app.vagrantup.com/boxes/search


## Resources
- [vagrant_lamp_traversy - GitHub](https://github.com/bradtraversy/vagrant_lamp_traversy)
- [Vagrant Crash Course - Traversy media](https://youtu.be/vBreXjkizgo)
- [Docker Vs Vagrant](https://youtu.be/9QGkJvbLpRA)

