
#### First approach and first implementation of a Vagrant configuration.

----

In this project the VM is configured with the web tools below :
 
 - Apache       (Puppet module [puppet-apache](https://github.com/example42/puppet-apache))
 - PHP          (Puppet module [puppet-php](https://github.com/example42/puppet-php))
 - MySQL        (Puppet module [puppet-mysql](https://github.com/example42/puppet-mysql))
 - PhpMyadmin
 - Ruby         (Puppet module [puppet-ruby](https://github.com/example42/puppet-ruby))
 - Sass
 - Compass
 - Git
 - Composer
 - Curl
 - Vim

----
**Requirements** :

 - [VirtualBox](https://www.virtualbox.org/) installation
 - [Vagrant](http://www.vagrantup.com/) installation
 - For the version 1.6.5 and later of Git types :
    - `git clone --recursive https://github.com/ke20/vagrant-web.git yourDirectory/`
 - For the older version types :
    - `git clone https://github.com/ke20/vagrant-web.git yourDirectory/`
    - `cd yourDirectory`
    - `git init`
    - `git update`
 - Open bash and types :
    - `cd yourDirectory/`
    - `vagrant up`


It is needed to create a directory named `projects` at the same level of this project.
This directory will be shared with the virtual machine and will be accessed to `/vagrant/projects`. 

The list of the PHP extensions can to be found and modified in the file `manifests/initialize.pp`.
The list of the Apache modules is also defined in the file `manifests/initialize.pp`.

----

**SSH access** :

    ip      => 127.0.0.1
    port    => 2222
    user    => vagrant
    passwd  => vagrant


**Browser access** : 

    url     => 192.168.0.10 (Can to be modify in `Vagrantfile`)


**PhpMyAdmin access** :

    url     => 192.168.0.10/phpmyadmin
    user    => root
    passwd  => root (Can to be modify in `manifests/initialize.pp`)


