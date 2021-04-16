# 0x10. HTTPS SSL

## Concepts

_For this project, students are expected to look at these concepts:_

-   [DNS](https://intranet.hbtn.io/concepts/12)
-   [Web stack debugging](https://intranet.hbtn.io/concepts/68)

![](https://s3.amazonaws.com/intranet-projects-files/holbertonschool-sysadmin_devops/276/FlhGPEK.png)

**man or help**:

-   `awk`
-   `dig`

### General

-   What is HTTPS SSL 2 main roles
-   What is the purpose encrypting traffic
-   What SSL termination means

## Requirements

### General

-   Allowed editors:  `vi`,  `vim`,  `emacs`
-   All your files will be interpreted on Ubuntu 16.04 LTS
-   All your files should end with a new line
-   A  `README.md`  file, at the root of the folder of the project, is mandatory
-   All your Bash script files must be executable
-   Your Bash script must pass  `Shellcheck`  (version  `0.3.7`) without any error
-   The first line of all your Bash scripts should be exactly  `#!/usr/bin/env bash`
-   The second line of all your Bash scripts should be a comment explaining what is the script doing

## 0. World wide web
````
vagrant@vagrant-ubuntu-trusty-64:~/holberton-system_engineering-devops/0x10-https_ssl$ ./0-world_wide_web tsetseg.tech
The subdomain www is a A record and points to 34.74.100.173
The subdomain lb-01 is a A record and points to 34.74.100.173
The subdomain web-01 is a A record and points to 35.196.60.120
The subdomain web-02 is a A record and points to 35.237.139.171
````

## 1. HAproxy SSL termination
````
$ curl -sI https://tsetseg.tech
HTTP/1.1 200 OK
Server: nginx/1.10.3 (Ubuntu)
Date: Fri, 16 Apr 2021 09:36:55 GMT
Content-Type: text/html
Content-Length: 17
Last-Modified: Wed, 14 Apr 2021 18:03:42 GMT
ETag: "60772e7e-11"
X-Served-By: 2482-web-02
Accept-Ranges: bytes
````
````
$ curl -sI https://www.tsetseg.tech
HTTP/1.1 200 OK
Server: nginx/1.10.3 (Ubuntu)
Date: Fri, 16 Apr 2021 09:46:20 GMT
Content-Type: text/html
Content-Length: 17
Last-Modified: Wed, 14 Apr 2021 18:00:08 GMT
ETag: "60772da8-11"
X-Served-By: 2482-web-01
Accept-Ranges: bytes
````

## 2. No loophole in your website traffic
````
$ curl -sIL http://www.tsetseg.tech
HTTP/1.1 301 Moved Permanently
Content-length: 0
Location: https://www.tsetseg.tech/

HTTP/1.1 200 OK
Server: nginx/1.10.3 (Ubuntu)
Date: Fri, 16 Apr 2021 09:58:15 GMT
Content-Type: text/html
Content-Length: 17
Last-Modified: Wed, 14 Apr 2021 18:00:08 GMT
ETag: "60772da8-11"
X-Served-By: 2482-web-01
Accept-Ranges: bytes
````


## Ressources

- Manage your tech domain

    https://controlpanel.tech/
    
- SSL certificate

  https://certbot.eff.org/lets-encrypt/ubuntuxenial-haproxy
  
  https://serversforhackers.com/c/using-ssl-certificates-with-haproxy
  
  https://www.haproxy.com/blog/redirect-http-to-https-with-haproxy/
  
  https://www.haproxy.com/blog/haproxy-ssl-termination/
