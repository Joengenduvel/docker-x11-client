# docker-x11-client

## Goal
This images provides a linux machine with all the tools needed to Launch X11 applications in a docker container

### Windows
You will need to install an X server for Windows.
I went for [Vcxsrv](https://sourceforge.net/projects/vcxsrv/) and [Xming](https://sourceforge.net/projects/xming/.
The `DISPLAY` environment variable points by default to 10.0.75.1:0.0.
If you use docker on Windows 10, this should be ok.

I found Xming has better performance than Vcxsrv

#### Vcxsrv
To configure Vcxsrv, start Xlaunch.
It will prompt with some questions of what options you want to set.
Make sure you add the extra option `-rootless` in the last screen.
Save this configuration file in one of these locations:
* %appdata%\Xming
* %userprofile%\Desktop
* %userprofile%
* Xming install directory.

#### Xming
The standard installation should do the trick.

### Linux
If you have a desktop environment installed, you can use the excisting X server of your host.
Replace the IP in the `DISPLAY` environment variable with your host's IP or hostname.

## Known issues
* menus of Visual Studio Code are slow when using Vcxsrv

## Usage
### Create a home volume
`docker create -v /home/dev --name home alpine /bin/true`
### Run the container
```
 docker run -i -t --rm --name intellij --volumes-from home joengenduvel/docker-x11-client xclock
```
