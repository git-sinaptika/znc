# sinaptika/znc
Docker image for znc  
From alpine:3.5  
znc: 1.6.5  
This image contains ZNC, an advanced IRC Bouncer.  
ZNC Port: 7000  
[ZNC 1.6.5](http://wiki.znc.in/ZNC/)  
[Github](https://github.com/git-sinaptika/znc)  

#### Simple instructions:
Run the image and answer the questions:  
`docker run -it --name c_znc -p 7000:7000 -v v_znc:/opt/znc sinaptika/znc`  

Start znc:  
`docker start znc`  
Web interface is on port 7000.  

#### Another example:
`docker run -it`  
Docker run command, don't leave out the *-it*, or the configuration "wizard"  
will not display.  

`--name c_znc`  
The name of our container. Use something you will remember and append c_ in front,  
so you don't mix up images and container and volumes and networks...

`-p 6000:7000`  
 Here we map port 6000 from the host to port 7000 on the container, where znc  
 is listening.

 `-v /path/on/host:/opt/znc`  
 Here we mount /opt/znc from the container to /path/on/host. Make sure directory  
 on host exists, with proper permissions.

`-e TZ=America/Costa_Rica`  
Change the timezone inside the container:
[timezones](https://en.wikipedia.org/wiki/Tz_database)

`--restart=unless-stopped`  
Docker's restart policy. unless-stopped means that docker will always  
restart this container (e.g. after a host restart), unless you stopped it with  
*docker stop c_znc*.

`sinaptika/znc`  
Name of the image on which we will base the whole container.  

The whole command:  
`docker run -it \`  
`--name c_znc \`  
`-p 6000:7000 \`  
`-v /path/on/host:/opt/znc \`  
`-e TZ=America/Costa_Rica \`  
`--restart=unless-stopped \`  
`sinaptika/znc \`  
