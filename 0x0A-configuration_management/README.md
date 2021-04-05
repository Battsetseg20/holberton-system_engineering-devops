<p align="center">
  <img width="409" height="128" src="https://www.holbertonschool.com/holberton-logo.png">
</p>

# Configuration management

Configuration management (CM) refers to the process of systematically handling changes to a system in a way that it maintains integrity over time. Even though this process was not originated in the IT industry, the term is broadly used to refer to server configuration management.Automation is in the heart of configuration management for servers, and that’s why it’s common to also refer to configuration management tools as Automation Tools or IT Automation Tools.

- Quick provisioning of new servers: Whenever a new server needs to be deployed, a configuration management tool can automate most, if not all, of the provisioning process for you. Automation makes provisioning much quicker and more efficient because it allows tedious tasks to be performed faster and more accurately than any human could.
- Quick recovery from critical events : deploying a replacement server is usually the safest way to get your services back online while a detailed inspection is done on the affected server. With configuration management and automation, this can be done in a quick and reliable way.
- No more snowlake servers: By using a configuration management tool, the procedure necessary for bringing up a new server or updating an existing one will be all documented in the provisioning scripts.
- Version control for the server environement: Version control tools, such as Git, can be used to keep track of changes made to the provisioning and to maintain separate branches for legacy versions of the scripts. You can also use version control to implement a code review policy for the provisioning scripts, where any changes should be submitted as a pull request and approved by a project lead before being accepted.
- Replicated Environments: This enables you to effectively build a multistage ecosystem, with production, development, and testing servers. You can even use local virtual machines for development, built with the same provisioning scripts. 

## Tasks
* Install `puppet-lint`
```
$ apt-get install -y ruby
$ gem install puppet-lint -v 2.1.1
```

* **0. Create a file**
  * [0-create_a_file.pp](./0-create_a_file.pp): Using Puppet, create a file `holberton` in the `/tmp` directory.
    * File permissions: `0744`.
    * File group: `www-data`.
    * File owner: `www-data`.
    * File content: `I love Puppet`.
  ```
  root@6712bef7a528:~# puppet-lint --version
  puppet-lint 2.1.1
  root@6712bef7a528:~# puppet-lint 0-create_a_file.pp
  root@6712bef7a528:~# 
  root@6712bef7a528:~# puppet apply 0-create_a_file.pp
  Notice: Compiled catalog for 6712bef7a528.ec2.internal in environment production in 0.04 seconds
  Notice: /Stage[main]/Main/File[holberton]/ensure: defined content as '{md5}f1b70c2a42a98d82224986a612400db9'
  Notice: Finished catalog run in 0.03 seconds
  root@6712bef7a528:~#
  root@6712bef7a528:~# ls -l /tmp/holberton
  -rwxr--r-- 1 www-data www-data 13 Mar 19 23:12 /tmp/holberton
  root@6712bef7a528:~# cat /tmp/holberton
  I love Puppetroot@6712bef7a528:~#
  ```

* **1. Install a package**
  * [1-install_a_package.pp](./1-install_a_package.pp): Using Puppet, install puppet-lint version 2.1.1.
  ```
  root@d391259bf577:/# puppet apply 1-install_a_package.pp
  Notice: Compiled catalog for d391259bf577.hsd1.ca.comcast.net in environment production in 0.10 seconds
  Notice: /Stage[main]/Main/Package[puppet-lint]/ensure: created
  Notice: Finished catalog run in 2.83 seconds
  root@d391259bf577:/# gem list

  *** LOCAL GEMS ***

  puppet-lint (2.1.1)
  root@d391259bf577:/#
  ```

* **2. Execute a command**
  * [2-execute_a_command.pp](./2-execute_a_command.pp): Using Puppet, kill the process `killmenow`. Must use `èxec` and `pkill`.
  * Terminal #0 - starting my process

  ```
  root@d391259bf577:/# cat killmenow
  #!/bin/bash
  while [[ true ]]
  do
      sleep 2
  done

  root@d391259bf577:/# ./killmenow
  ```
  
  * Terminal #1 - executing my manifest
  ```
  root@d391259bf577:/# puppet apply 2-execute_a_command.pp
  Notice: Compiled catalog for d391259bf577.hsd1.ca.comcast.net in environment production in 0.01 seconds
  Notice: /Stage[main]/Main/Exec[killmenow]/returns: executed successfully
  Notice: Finished catalog run in 0.10 seconds
  root@d391259bf577:/# 
  ```
  * Terminal #0 - process has been terminated
  
  ```
  root@d391259bf577:/# ./killmenow
  Terminated
  root@d391259bf577:/#
  ````

  
## Ressources

- https://www.digitalocean.com/community/tutorials/an-introduction-to-configuration-management
- https://puppet.com/docs/puppet/3.8/types/exec.html
- https://puppet-lint.com/
  





