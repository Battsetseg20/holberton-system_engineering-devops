<p align="center">
  <img width="409" height="128" src="https://www.holbertonschool.com/holberton-logo.png">
</p>

# Webstack Debugging 2

# Tasks

* **0. Run software as another user** [0-iamsomeoneelse](./0-iamsomeoneelse)
   The user root is, on Linux, the “superuser”. It can do anything it wants, that’s a good and bad thing. A good practice is that one should never be logged in the root user, as if you fat finger a command and for example run rm -rf /, there is no comeback. That’s why it is preferable to run as a privileged user, meaning that the user also has the ability to perform tasks that the root user can do, just need to use a specific command that you need to discover.
  For the containers that you are given in this project as well as the checker, everything is run under the root user, which has the ability to run anything as another user.
  
  ```
  root@ubuntu:~# whoami
  root
  root@ubuntu:~# ./0-iamsomeoneelse www-data
  www-data
  root@ubuntu:~# whoami
  root
  root@ubuntu:~#
  ```
  
* **Run Nginx as Nginx** [1-run_nginx_as_nginx](./1-run_nginx_as_nginx)
  The root user is a superuser that can do anything on a Unix machine, the top administrator. Security wise, you must do everything that you can to prevent an attacker from logging in as root. With this in mind, it’s a good practice not to run your web servers as root (which is the default for most configurations) and instead run the process as the less privileged nginx user instead. This way, if a hacker does find a security issue that allows them to break-in to your server, the impact is limited by the permissions of the nginx user.

  Fix this container so that Nginx is running as the nginx user.

    **Requirements:**
    * nginx must be running as nginx user
    * nginx must be listening on all active IPs on port 8080
    * You cannot use apt-get remove
    * Write a Bash script that configures the container to fit the above requirements
Before
```
root@40891890dac9:/# service nginx start                                                                       
root@40891890dac9:/# ps auxff | grep ngin[x]                                                                   
root       200  0.0  0.0  85944  2736 ?        Ss   20:02   0:00 nginx: master process /usr/sbin/nginx         
nobody     201  0.0  0.0  86248  3464 ?        S    20:02   0:00  \_ nginx: worker process                     
nobody     202  0.0  0.0  86248  3464 ?        S    20:02   0:00  \_ nginx: worker process                     
nobody     203  0.0  0.0  86248  3464 ?        S    20:02   0:00  \_ nginx: worker process                     
nobody     204  0.0  0.0  86248  3464 ?        S    20:02   0:00  \_ nginx: worker process         
```

After Deugging:
```
root@40891890dac9:/# chown nginx:nginx /etc/nginx/nginx.conf                                                   
root@40891890dac9:/# chmod 744 /etc/nginx/nginx.conf                                                           
root@40891890dac9:/# sed -i "s/80/8080/g" /etc/nginx/sites-available/default                                   
root@40891890dac9:/# sudo -u nginx service nginx restart                                                       
 * Restarting nginx nginx                                                                                [fail]
root@40891890dac9:/# service nginx stop                                                                        
root@40891890dac9:/# sudo -u nginx service nginx restart                                                       
 * Restarting nginx nginx                                                                                [ OK ]
root@40891890dac9:/# ps auxff | grep ngin[x]                                                                   
nginx      365  0.0  0.0  77384  2776 ?        Ss   20:06   0:00 nginx: master process /usr/sbin/nginx         
nginx      366  0.0  0.0  77736  3148 ?        S    20:06   0:00  \_ nginx: worker process                     
nginx      367  0.0  0.0  77736  2788 ?        S    20:06   0:00  \_ nginx: worker process                     
nginx      369  0.0  0.0  77736  3148 ?        S    20:06   0:00  \_ nginx: worker process                     
nginx      370  0.0  0.0  77736  3176 ?        S    20:06   0:00  \_ nginx: worker process                     
root@40891890dac9:/# nc -z 0 8080 ; echo $?                                                                    
0                                                      
```

