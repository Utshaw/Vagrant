# Vagrant (Development Environments Made Easy) <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/8/87/Vagrant.png/492px-Vagrant.png" align="right" width="100px" alt="Vagrant Logo">

## Example
```
mkdir vgdemo # create a dir for containing the vagrant project files
cd vgdemo/  # entering that dir
vagrant init centos/7 # initialize a public box (https://app.vagrantup.com/boxes/search?utf8=%E2%9C%93&sort=downloads&provider=&q=centos)
vagrant up # if the virtual guest machine exists it will run that otherwise download it then runs that; make sure to run this command from inside the folder where VagrantFile resides
vargrant suspend [VM] # suspends the VM
vargrant resume [VM] # resumes the VM
vargrant reload [VM] # reloads the VM (run this after any change in the VagrantFile)

```

## Search for Box from here
https://app.vagrantup.com/boxes/search


## Resources
- [Traversy media](https://youtu.be/vBreXjkizgo)

