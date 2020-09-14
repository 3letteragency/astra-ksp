
# Table of Contents

1.  [Astra](#orgc9a7a2e)
    1.  [Stage 1 - Prep <code>[4/6]</code>](#org46bd168)
    2.  [Stage 2 - Data <code>[0/1]</code>](#org2b4fc94)
    3.  [Stage 3 - RL Software integrations <code>[0/2]</code>](#orgf97bf9c)
    4.  [Stage 4 - Operations <code>[0/3]</code>](#org5c18c11)
        1.  [For re-usable missions: <code>[0/1]</code>](#org44573f8)
        2.  [Starlink(s) <code>[0/0]</code>](#orga5ed0b4)
        3.  [Long running, real time ops <code>[0/0]</code>](#orgb02f2cb)
    5.  [Stage 5 - Stream Real Time Ops <code>[0/0]</code>](#org941e49d)
    6.  [Backlog/As Needed <code>[0/2]</code>](#org8d103ff)
    7.  [KSP Mod Requirements](#org01dc9d4)
    8.  [On Hold](#orgaf724eb)



<a id="orgc9a7a2e"></a>

# Astra


<a id="org46bd168"></a>

## STRT Stage 1 - Prep <code>[4/6]</code>

-   [ ] Script or Ansible or etc. Out Packer Script provisioner(getting long and unweildy)
    -   Need to re-do raw-mods role tasks, `--strip-components` is a tar feature, not zip. Will need to extract to /tmp/$mod<sub>name</sub>/GameData/$mod<sub>name</sub>, move the mod dir to $KSP<sub>DIR</sub>/GameData, then cleanup.
-   [-] Base VM Image(Packer) <code>[8/15]</code>
    -   [ ] Forgot to add final chown after adding conf files
    -   [ ] Archive SpaceX Pack
    -   [ ] Change KSP version from 1.9.1 to 1.8.1 in SpaceX Pack craft files
    -   [ ] Add vehicles to Astra game save VAB
    -   [ ] Systemd user service to start game
    -   [ ] Figure something out w/ firewall
    -   [-] Automate mod install <code>[5/6]</code>
        -   [ ] [KK&rsquo;s SpaceX Pack](https://forum.kerbalspaceprogram.com/index.php?/topic/193933-110-kks-spacex-pack-july-06-2020/)
        -   [X] RO via CKAN
            -   Debug, make sure startup is ok
        -   [X] Principia
        -   [X] Install CKAN.deb
        -   [X] kRPC manually from github
        -   [X] AutoLoadGame - Allista
    -   [X] astra-base.sfs
        -   Might need to hop into a graphical run to get the minimal base + mods setup
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


<a id="org2b4fc94"></a>

## TODO Stage 2 - Data <code>[0/1]</code>

-   [ ] Set up client w/ all kRPC Data Stream
    -   Pipe into GMAT and OpenMCT ??? - yes


<a id="orgf97bf9c"></a>

## TODO Stage 3 - RL Software integrations <code>[0/2]</code>

-   [ ] [GMAT](https://opensource.gsfc.nasa.gov/projects/GMAT/index.php) - Planning
-   [ ] [OpenMCT](https://github.com/nasa/openmct) - Ops HUD


<a id="org5c18c11"></a>

## TODO Stage 4 - Operations <code>[0/3]</code>


<a id="org44573f8"></a>

### [-] For re-usable missions: <code>[0/1]</code>

1.  [ ] Will need something like [FMRS](https://forum.kerbalspaceprogram.com/index.php?/topic/157214-19x-flight-manager-for-reusable-stages-fmrs-now-with-recoverycontroller-integration/) implemented via kRPC


<a id="orga5ed0b4"></a>

### [-] Starlink(s) <code>[0/0]</code>


<a id="orgb02f2cb"></a>

### [-] Long running, real time ops <code>[0/0]</code>


<a id="org941e49d"></a>

## TODO Stage 5 - Stream Real Time Ops <code>[0/0]</code>


<a id="org8d103ff"></a>

## TODO Backlog/As Needed <code>[0/2]</code>

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


<a id="org01dc9d4"></a>

## KSP Mod Requirements

-   [AutoLoadGame](https://github.com/allista/AutoLoadGame) - by Allista, allows creating a configuration file in your saves dir that will automatically load the specified sfs file upong game start.
-   [kRPC](https://krpc.github.io/krpc/) - kRPC allows you to control Kerbal Space Program from scripts running outside of the game.
-   [Realism Overhaul](https://github.com/KSP-RO/RealismOverhaul/wiki) - Its not certain this will place nice with [kRPC](https://krpc.github.io/krpc/), however realistic(ish?) control theory is really the purpose of this project so we will proceed with it until/unless we encounter problems.
-   [kOS](https://ksp-kos.github.io/KOS/) - kOS might be useful for some simpler tasks where we don&rsquo;t want the full power of kRPC. Might use, might not. We&rsquo;ll see.


<a id="orgaf724eb"></a>

## On Hold

-   [ ] Properly version Packer builds
    -   dev builds by commit short SHA
    -   &ldquo;Prod&rdquo; builds by Releae Tag

