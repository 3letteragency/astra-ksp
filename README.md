
# Table of Contents

1.  [Astra](#orge58c519)
    1.  [Stage 1 - Prep <code>[5/6]</code>](#orgd61d65c)
    2.  [Stage 2 - Data <code>[0/1]</code>](#org6452022)
    3.  [Stage 3 - RL Software integrations <code>[0/2]</code>](#org8942559)
    4.  [Stage 4 - Operations <code>[0/3]</code>](#org9da0a69)
        1.  [For re-usable missions: <code>[0/1]</code>](#org1bda0c3)
        2.  [Starlink(s) <code>[0/0]</code>](#org182b3ff)
        3.  [Long running, real time ops <code>[0/0]</code>](#org6ebc88d)
    5.  [Stage 5 - Stream Real Time Ops <code>[0/0]</code>](#orgd8d86ec)
    6.  [Backlog/As Needed <code>[0/2]</code>](#org861ef4f)
    7.  [KSP Mod Requirements](#orgd999962)
    8.  [On Hold](#orgb22f681)



<a id="orge58c519"></a>

# Astra


<a id="orgd61d65c"></a>

## STRT Stage 1 - Prep <code>[5/6]</code>

-   [X] Script or Ansible or etc. Out Packer Script provisioner(getting long and unweildy)
-   [-] Base VM Image(Packer) <code>[14/14]</code>
    -   [X] Change KSP version from 1.9.1 to 1.8.1 in SpaceX Pack craft files
    -   [X] Add vehicles to Astra game save VAB
    -   [X] Figure out how to get a `systemd --user` instance running on Astra user
    -   [X] Systemd user service to start game
        -   added systemd service/linger config, but may need to set XDG<sub>RUNTIME</sub><sub>DIR</sub> var in the systemd task as shown [here](https://gist.github.com/carlwgeorge/dbe186ce7562843932ebd03ccccd1a6d).
    -   [X] Figure something out w/ firewall
        -   I think leaving the image as is, and opening the kRPC Ports via a TF provisioner combined w/ the HTTP Datasource(to get ifconfig.me data) will be a good solution
    -   [X] Automate mod install <code>[6/6]</code>
        -   [X] [KK&rsquo;s SpaceX Pack](https://forum.kerbalspaceprogram.com/index.php?/topic/193933-110-kks-spacex-pack-july-06-2020/)
        -   [X] RO via CKAN
        -   [X] Principia
        -   [X] Install CKAN.deb
        -   [X] kRPC manually from github
        -   [X] AutoLoadGame - Allista
    -   [X] astra-base.sfs
        -   <del>Might need to hop into a graphical run to get the minimal base + mods setup</del>
    -   [X] AutoLoadGame.conf
    -   [X] settings.cfg
    -   [X] krpc-settings.cfg
    -   [X] AutoLoadGame - Now supports specifying SFS files
    -   [X] POC kRPC - connection over Internet successful, responses receieved
    -   [X] Install KSP <del>1.7.3</del> 1.8.1 from S3
    -   [X] File provision packer/files/\*
-   [X] Automate game-archiver
-   [X] Choose kRPC client language - C++
-   [X] VLC/Xvfb workflow for graphical debugging and SFS building
-   [X] Debug RO Install, problems w/ Kopernicus?


<a id="org6452022"></a>

## TODO Stage 2 - Data <code>[0/1]</code>

-   [ ] Set up client w/ all kRPC Data Stream
    -   Pipe into GMAT and OpenMCT ??? - yes


<a id="org8942559"></a>

## TODO Stage 3 - RL Software integrations <code>[0/2]</code>

-   [ ] [GMAT](https://opensource.gsfc.nasa.gov/projects/GMAT/index.php) - Planning
-   [ ] [OpenMCT](https://github.com/nasa/openmct) - Ops HUD


<a id="org9da0a69"></a>

## TODO Stage 4 - Operations <code>[0/3]</code>


<a id="org1bda0c3"></a>

### [-] For re-usable missions: <code>[0/1]</code>

1.  [ ] Will need something like [FMRS](https://forum.kerbalspaceprogram.com/index.php?/topic/157214-19x-flight-manager-for-reusable-stages-fmrs-now-with-recoverycontroller-integration/) implemented via kRPC


<a id="org182b3ff"></a>

### [-] Starlink(s) <code>[0/0]</code>


<a id="org6ebc88d"></a>

### [-] Long running, real time ops <code>[0/0]</code>


<a id="orgd8d86ec"></a>

## TODO Stage 5 - Stream Real Time Ops <code>[0/0]</code>


<a id="org861ef4f"></a>

## TODO Backlog/As Needed <code>[0/2]</code>

-   [ ] If TCP latency becomes a problem, try implementing a kRPC unix socket comm. protocol
-   [ ] Need to implement an automated Xvfb workflow using screenshots to debug Automation
    -   <del>There are module load errors in KSP.log, not sure if its preventing AutoLoadGame from doing its thing, or if that is related to the Changelog startup dialog in KSP Main Menu.</del> KSP 1.8.1 Works great
    -   <del>Why are we stuck at the Change Log dialog on KSP Start?</del> A bit annoying but appears to be inconsequential for my automation purposes.
        -   ksp settings.cfg:
            -   SHOW<sub>WHATSNEW</sub><sub>DIALOG</sub> = False
            -   <del>Version 1.7.3 was not honoring settings.cfg, lets see if 1.8.1 works</del> Still not honored in 1.8.1 but again, appears inconsequential
-   [ ] Split Project into multiple repos <code>[0/3]</code>
    -   [ ] Terraform <code>[0/2]</code>
        -   [ ] Modules
        -   [ ] Plans
    -   [ ] Packer Base Image
    -   [ ] Astractl


<a id="orgd999962"></a>

## KSP Mod Requirements

-   [AutoLoadGame](https://github.com/allista/AutoLoadGame) - by Allista, allows creating a configuration file in your saves dir that will automatically load the specified sfs file upong game start.
-   [kRPC](https://krpc.github.io/krpc/) - kRPC allows you to control Kerbal Space Program from scripts running outside of the game.
-   [Realism Overhaul](https://github.com/KSP-RO/RealismOverhaul/wiki) - Its not certain this will place nice with [kRPC](https://krpc.github.io/krpc/), however realistic(ish?) control theory is really the purpose of this project so we will proceed with it until/unless we encounter problems.
-   [kOS](https://ksp-kos.github.io/KOS/) - kOS might be useful for some simpler tasks where we don&rsquo;t want the full power of kRPC. Might use, might not. We&rsquo;ll see.


<a id="orgb22f681"></a>

## On Hold

-   [ ] Properly version Packer builds
    -   dev builds by commit short SHA
    -   &ldquo;Prod&rdquo; builds by Releae Tag

