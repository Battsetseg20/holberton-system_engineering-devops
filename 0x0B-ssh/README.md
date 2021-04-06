<p align="center">
  <img width="409" height="128" src="https://www.holbertonschool.com/holberton-logo.png">
</p>


# SSH

## Learning Objectives

- What is a server
- Where servers usually live
- What is SSH
- How to create an SSH RSA key pair
- How to connect to a remote host using an SSH RSA key pair
- The advantage of using #!/usr/bin/env bash instead of /bin/bash

## Tasks

* **0 Use a private key
  * [0-use_a_private_key](./0-use_a_private_key): Write a Bash script that uses ssh to connect to your server using the private key ~/.ssh/holberton with the user ubuntu.
    * Only use ssh single-character flags
    * You cannot use -l
    * You do not need to handle the case of a private key protected by a passphrase	

    ```
    sylvain@ubuntu$ ./0-use_a_private_key
    Welcome to Ubuntu 16.04.1 LTS (GNU/Linux 4.4.0-45-generic x86_64)

     * Documentation:  https://help.ubuntu.com
     * Management:     https://landscape.canonical.com
     * Support:        https://ubuntu.com/advantage

       Get cloud support with Ubuntu Advantage Cloud Guest:
       http://www.ubuntu.com/business/services/cloud

       0 packages can be updated.
       0 updates are security updates.


       *** System restart required ***
       Last login: Fri Feb  3 01:12:16 2017 from 104.7.14.91
       ubuntu@server01:~$ logout
       Connection to 8.8.8.8 closed.
       sylvain@ubuntu$ 
       ```