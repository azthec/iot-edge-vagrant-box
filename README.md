# IoT Edge Vagrant Box
Setups an Ubuntu 16.04 64bit VM and runs an Azure IoT Edge node VM, with configurations provisioned from local files.

Make sure you [register your IoT Edge device](https://docs.microsoft.com/en-us/azure/iot-edge/quickstart#register-an-iot-edge-device) and place its connection string on the _config.yaml_ file.

# Support

The box comes with sample configs and certificates for development and tests only. The **certificates are obviously insecure** do not use these in any public fashion.

> **Note**
>
> The bootstrap script uses Microsoft repositories and keys that may change in the future.

If you've found an issue and want to submit a patch open a Pull Request.


# Requirements

* [Vagrant](https://www.vagrantup.com) >= 1.9.x
* [Virtualbox](https://www.virtualbox.org/) >= 5.x

> **Note**
> 
> For the bare minimum iotedge service to run properly the Vagrant box requires
> about 1 GB RAM. Running it on more modest settings requires that the 
> [environment variable OptimizeForPerformance is set to false](https://docs.microsoft.com/en-us/azure/iot-edge/troubleshoot#stability-issues-on-resource-constrained-devices).
> 
> Resource limitations are automatically configured when running `vagrant up`
> and can be changed on the _Vagrantfile_.

## Linux

### VirtualBox

**Fedora:** 

Add [RPM Fusion repositories](https://rpmfusion.org/Configuration/) first.

```
sudo dnf install vagrant
sudo dnf install virtualbox
vagrant plugin install virtualbox
```

**Ubuntu:**

```
sudo apt-get install vagrant
sudo apt-get install virtualbox
```

# Installation

## Linux

```
git clone https://github.com/azthec/iot-edge-vagrant-box
```

## Windows

Clone this repository or you can alternatively manually download and extract the files if you don't have git installed.

```
git.exe clone https://github.com/azthec/iot-edge-vagrant-box
```

## Start Machine

You can now start the demo configuration machine. Until you create a connection string for your Azure IoT Edge device and place it in the _config.yaml_ the iotedge service will fail to start. 

```
cd iot-edge-vagrant-box
vagrant up
```

> **Note**
>
> On the first 'vagrant up' the bootstrap script may fail to restart the service.
> You can restart it manually with by running `vagrant up` again or `vagrant ssh -c "sudo systemctl restart iotedge"`.

# Vagrant Commands

## Up
Start the VM:

```
vagrant up
```

## SSH
By default Vagrant 1.7+ provisions each box with a different insecure keypair to be used for authentication. Username and passwords can be set explicitly on the _Vagrantfile_. SSH into the VM with default non-root user:

```
vagrant ssh
```

## Halt
Stop the VM:

```
vagrant halt
```

## Provision

Re-run automatic configuration:

```
vagrant provision
```

## Destroy

Delete the VM from disk:

```
vagrant destroy
```

## Remove

Destroy removes the VM but keeps the base image on disk, use list to see installed images:

```
vagrant box list
```

And remove them with:

```
vagrant box remove $box_name
```

