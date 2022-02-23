# oracle-sqlcl
Oracle sqlcl in docker

Based on https://www.oracle.com/tools/downloads/sqlcl-downloads.html

Using SQL code syntax highlight and vim with sql syntax as editor

## Build:
Before build you have to put downloaded sqlcl-latest.zip into `files` folder
```
docker  build -t antmax/oracle-sqlcl:21.4 .
```
## Run - command prompt
```
docker run --rm -it antmax/oracle-sqlcl:latest  USER/Password@//host:port/service
```
## Run - the script
```
docker run --rm \
-v `pwd`:/sqlcl \
antmax/oracle-sqlcl:latest  USER/Password@//host:port/service @script.sql
```


## Volumes
* /sqlcl 	Home folder (for example for custom SQL files)
* /oracle Folder with login.sql and can be used to store sqlcl aliases. Ex: alias load /oracle/sqlcl-alias.xml.

## run with volumes
```
docker run --rm -it \
        -v `pwd`:/sqlcl \
        -v ~/Documents/Oracle/:/oracle \
antmax/oracle-sqlcl:latest  USER/Password@//host:port/service


```
