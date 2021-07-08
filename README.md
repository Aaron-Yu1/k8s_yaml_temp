The dockerfile is for nginx test.

You need to change web.conf file and rezip a new nginx.tar file.

For Example:
```bash
it@docker:~/docker/nginx$ vim index.html 
it@docker:~/docker/nginx$ rm nginx.tar 
it@docker:~/docker/nginx$ tar cf nginx.tar index.html nginx-1.18.0/ web.conf 
it@docker:~/docker/nginx$ ls
Dockerfile  index.html  nginx-1.18.0  nginx.tar  README.md  web.conf
```
