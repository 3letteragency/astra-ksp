
# Table of Contents

1.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2020-09-26 Sat&gt;</span></span>](#orgbb3e774)
2.  [<span class="timestamp-wrapper"><span class="timestamp">&lt;2020-10-03 Sat&gt;</span></span>](#org9ef90e7)



<a id="orgbb3e774"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2020-09-26 Sat&gt;</span></span>

-   Ansible provisioner porting from bash is mostly finished. Just a couple small things like a SystemD service for automatically starting KSP on deployment, and autoconfiguring the firewall to allow connections to the kRPC ports from the provisioning machine(Laptop, workstation, etc.). Adding functionality via the ansible config will be very much easier than stuffing more bash in here. Once those are done I&rsquo;ll initiate a build based on the new provisioner, at which point I think we&rsquo;ll be able to get some real work done.
    
    As we&rsquo;re running the game without graphics, we do need some kind of visuals. Initially I believe some combination of NASA&rsquo;s GMAT, and OpenMCT will do the trick. I&rsquo;ll begin by linking up:
    
    -   Some misc. [SpaceCenter](https://krpc.github.io/krpc/python/api/space-center/space-center.html), [Comms](https://krpc.github.io/krpc/python/api/space-center/comms.html), [Parts](https://krpc.github.io/krpc/python/api/space-center/parts.html), [ReferenceFrame](https://krpc.github.io/krpc/python/api/space-center/reference-frame.html), and [Waypoints](https://krpc.github.io/krpc/python/api/space-center/waypoints.html) functions
    -   Most of the [Vessel](https://krpc.github.io/krpc/python/api/space-center/vessel.html), [CelestialBody](https://krpc.github.io/krpc/python/api/space-center/vessel.html), [Flight](https://krpc.github.io/krpc/python/api/space-center/flight.html), [Orbit](https://krpc.github.io/krpc/python/api/space-center/orbit.html), and [kRPC](https://krpc.github.io/krpc/python/api/krpc/krpc.html) functions
    
    This should all give a pretty good picture of what is going on in the game so we can begin flying and experimenting with the Control and Flight functions.


<a id="org9ef90e7"></a>

# <span class="timestamp-wrapper"><span class="timestamp">&lt;2020-10-03 Sat&gt;</span></span>

-   Another Saturday. I got the KSP systemd service and automatated opening the firewall for kRPC ports for connections from the controlling machine. Once I build the final image esetting to the base game becomes a matter of just \`terraform destroy; terraform apply\`. Time to start piping data into OpenMCT and GMAT.

