# volatility-docker-image
docker image for volatility 2.6.1

# usage
``docker run --rm -v $PWD/memdump.raw:/tmp/memdump.raw --name volatility 4ensix/volatility vol.py -f /tmp/memdump.raw [--profilie=]  <command>``

## example
```
$ docker run --rm -v $PWD/memdump.raw:/tmp/memdump.raw --name volatility 4ensix/volatility vol.py -f /tmp/memdump.raw imageinfo
Volatility Foundation Volatility Framework 2.6.1
INFO    : volatility.debug    : Determining profile based on KDBG search...
          Suggested Profile(s) : WinXPSP2x86, WinXPSP3x86 (Instantiated with WinXPSP2x86)
                     AS Layer1 : IA32PagedMemoryPae (Kernel AS)
                     AS Layer2 : FileAddressSpace (/tmp/cridex.vmem)
                      PAE type : PAE
                           DTB : 0x2fe000L
                          KDBG : 0x80545ae0L
          Number of Processors : 1
     Image Type (Service Pack) : 3
                KPCR for CPU 0 : 0xffdff000L
             KUSER_SHARED_DATA : 0xffdf0000L
           Image date and time : 2012-07-22 02:45:08 UTC+0000
     Image local date and time : 2012-07-21 22:45:08 -0400
```
