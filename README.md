# quartus-lite

Quartus Lite docker.

For Mac OS X users, I included a `quartus` shell script, which allows execution of e.g. `quartus_sh` inside the docker container. The current working directory is mounted to `/build`. 

Example:
```
quartus quartus_sh --flow compile my.qpf
```
`quartus_sh` command is executed in the current working directory. 
Just copy `quartus_sh` to a directory in your `PATH`.

Environment variables:
- `JTAG_SERVER`: allows setting a server for remote programming
- `JTAG_PASSWD`: allows setting a server password for remote programming


# Running Quartus GUI from docker 
To run the quartus as GUI, you can use the shell script

```
$ launch.sh
```

This binds your home folder  and user profiles to the container.

To open GUI enter 

```
# /opt/intelFPGA_lite/20.1/quartus/bin/quartus
```
