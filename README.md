
# Table of Contents

1.  [Astra](#org63bc942)
    1.  [Stage 1 - Prep <code>[2/5]</code>](#org8ea0dd1)
    2.  [Stage 2 - Data <code>[0/1]</code>](#org01602d3)
    3.  [Stage 3 - RL Software integrations <code>[0/2]</code>](#org9f55c2c)
    4.  [Stage 4 - Operations <code>[0/2]</code>](#org7502208)
    5.  [Stage 5 - Stream Real Time Ops <code>[0/0]</code>](#orgaec6775)
    6.  [KSP Mod Requirements](#org54f3e69)
    7.  [On Hold](#org1433706)



<a id="org63bc942"></a>

# Astra


<a id="org8ea0dd1"></a>

## STRT Stage 1 - Prep <code>[2/5]</code>

-   [-] Base VM Image(Packer) <code>[3/8]</code>
    -   [-] Automate mod install <code>[3/6]</code>
        -   [ ] RO via CKAN
        -   [ ] Principia
        -   [ ] [KK&rsquo;s SpaceX Pack](https://forum.kerbalspaceprogram.com/index.php?/topic/193933-110-kks-spacex-pack-july-06-2020/)
        -   [X] Install CKAN.deb
        -   [X] kRPC manually from github
        -   [X] AutoLoadGame - Allista
    -   [ ] astra-base.sfs
        -   Might need to hop into a graphical run to get the minimal base + mods setup
    -   [ ] AutoLoadGame.conf
    -   [ ] settings.cfg
    -   [ ] krpc-settings.cfg
    -   [X] AutoLoadGame - Now supports specifying SFS files
    -   [X] POC kRPC - connection over Internet successful, responses receieved
    -   [X] Install KSP <del>1.7.3</del> 1.8.1 from S3
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
-   [X] Automate game-archiver
-   [X] Choose kRPC client language - C++


<a id="org01602d3"></a>

## TODO Stage 2 - Data <code>[0/1]</code>

-   [ ] Set up client w/ all kRPC Data Stream - Once this is done, revisiting the image build will probably be worth it.
    -   Pipe into GMAT and OpenMCT ???


<a id="org9f55c2c"></a>

## TODO Stage 3 - RL Software integrations <code>[0/2]</code>

-   [ ] [GMAT](https://opensource.gsfc.nasa.gov/projects/GMAT/index.php) - Planning
-   [ ] [OpenMCT](https://github.com/nasa/openmct) - Ops HUD


<a id="org7502208"></a>

## TODO Stage 4 - Operations <code>[0/2]</code>

-   [-] Starlink(s) <code>[0/0]</code>
-   [-] Long running, real time ops <code>[0/0]</code>


<a id="orgaec6775"></a>

## TODO Stage 5 - Stream Real Time Ops <code>[0/0]</code>


<a id="org54f3e69"></a>

## KSP Mod Requirements

-   [AutoLoadGame](https://github.com/allista/AutoLoadGame) - by Allista, allows creating a configuration file in your saves dir that will automatically load the specified sfs file upong game start.
-   [kRPC](https://krpc.github.io/krpc/) - kRPC allows you to control Kerbal Space Program from scripts running outside of the game.
-   [Realism Overhaul](https://github.com/KSP-RO/RealismOverhaul/wiki) - Its not certain this will place nice with [kRPC](https://krpc.github.io/krpc/), however realistic(ish?) control theory is really the purpose of this project so we will proceed with it until/unless we encounter problems.
-   [kOS](https://ksp-kos.github.io/KOS/) - kOS might be useful for some simpler tasks where we don&rsquo;t want the full power of kRPC. Might use, might not. We&rsquo;ll see.


<a id="org1433706"></a>

## On Hold

-   [ ] Properly version Packer builds
    -   dev builds by commit short SHA
    -   &ldquo;Prod&rdquo; builds by Releae Tag

