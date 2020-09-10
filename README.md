
# Table of Contents

1.  [Astra](#orgd8489fb)
    1.  [Stage 1 - Prep <code>[2/5]</code>](#org93aa4b4)
    2.  [Stage 2 - Data <code>[0/1]</code>](#orgb52c57f)
    3.  [Stage 3 - RL Software integrations <code>[0/2]</code>](#org60c2d05)
    4.  [Stage 4 - Operations <code>[0/2]</code>](#orgbd91db2)
    5.  [Stage 5 - Stream Real Time Ops <code>[0/0]</code>](#org985240d)
    6.  [KSP Mod Requirements](#org9258691)
    7.  [On Hold](#orgb226236)



<a id="orgd8489fb"></a>

# Astra


<a id="org93aa4b4"></a>

## STRT Stage 1 - Prep <code>[2/5]</code>

-   [ ] Need to implement an automated Xvfb workflow using screenshots to debug Automation
    -   <del>There are module load errors in KSP.log, not sure if its preventing AutoLoadGame from doing its thing, or if that is related to the Changelog startup dialog in KSP Main Menu.</del> KSP 1.8.1 Works great
    -   <del>Why are we stuck at the Change Log dialog on KSP Start?</del> A bit annoying but appears to be inconsequential for my automation purposes.
        -   ksp settings.cfg:
            -   SHOW<sub>WHATSNEW</sub><sub>DIALOG</sub> = False
            -   <del>Version 1.7.3 was not honoring settings.cfg, lets see if 1.8.1 works</del> Still not honored in 1.8.1 but again, appears inconsequential
-   [X] Automate game-archiver
-   [-] Base VM Image(Packer) <code>[3/8]</code>
    -   [ ] astra-base.sfs
        -   Might need to hop into a graphical run to get the minimal base + mods setup
    -   [ ] AutoLoadGame.conf
    -   [ ] settings.cfg
    -   [ ] krpc-settings.cfg
    -   [X] Install KSP 1.7.3 from S3
    -   [-] Automate mod install <code>[3/6]</code>
        -   [X] Install CKAN.deb
        -   [X] kRPC manually from github
        -   [X] AutoLoadGame - Allista
        -   [ ] RO via CKAN
        -   [ ] Principia
        -   [ ] [KK&rsquo;s SpaceX Pack](https://forum.kerbalspaceprogram.com/index.php?/topic/193933-110-kks-spacex-pack-july-06-2020/)
    -   [X] AutoLoadGame - Now supports specifying SFS files
    -   [X] POC kRPC
-   [ ] Split Project into multiple repos <code>[0/3]</code>
    -   [ ] Terraform <code>[0/2]</code>
        -   [ ] Modules
        -   [ ] Plans
    -   [ ] Packer Base Image
    -   [ ] Astractl
-   [X] Choose kRPC client language - C++


<a id="orgb52c57f"></a>

## TODO Stage 2 - Data <code>[0/1]</code>

-   [ ] Set up client w/ all kRPC Data Stream - Once this is done, revisiting the image build will probably be worth it.
    -   Pipe into GMAT and OpenMCT ???


<a id="org60c2d05"></a>

## TODO Stage 3 - RL Software integrations <code>[0/2]</code>

-   [ ] [GMAT](https://opensource.gsfc.nasa.gov/projects/GMAT/index.php) - Planning
-   [ ] [OpenMCT](https://github.com/nasa/openmct) - Ops HUD


<a id="orgbd91db2"></a>

## TODO Stage 4 - Operations <code>[0/2]</code>

-   [-] Starlink(s) <code>[0/0]</code>
-   [-] Long running, real time ops <code>[0/0]</code>


<a id="org985240d"></a>

## TODO Stage 5 - Stream Real Time Ops <code>[0/0]</code>


<a id="org9258691"></a>

## KSP Mod Requirements

-   [AutoLoadGame](https://github.com/allista/AutoLoadGame) - by Allista, allows creating a configuration file in your saves dir that will automatically load the specified sfs file upong game start.
-   [kRPC](https://krpc.github.io/krpc/) - kRPC allows you to control Kerbal Space Program from scripts running outside of the game.
-   [Realism Overhaul](https://github.com/KSP-RO/RealismOverhaul/wiki) - Its not certain this will place nice with [kRPC](https://krpc.github.io/krpc/), however realistic(ish?) control theory is really the purpose of this project so we will proceed with it until/unless we encounter problems.
-   [kOS](https://ksp-kos.github.io/KOS/) - kOS might be useful for some simpler tasks where we don&rsquo;t want the full power of kRPC. Might use, might not. We&rsquo;ll see.


<a id="orgb226236"></a>

## On Hold

-   [ ] Properly version Packer builds
    -   dev builds by commit short SHA
    -   &ldquo;Prod&rdquo; builds by Releae Tag
-   [X] Do I even want to use KSP? This [Orbiter Space flight simulator](http://orbit.medphys.ucl.ac.uk/index.html) seems interesting:
    -   Results: perhaps I&rsquo;ll work up to this at some point&#x2026;
    -   [Docs](https://www.orbiterwiki.org/wiki/)
    -   [SDK Docs](https://www.orbiterwiki.org/wiki/SDK_documentation)

