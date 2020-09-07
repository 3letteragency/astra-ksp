
# Table of Contents

1.  [Astra](#orgb1ec985)
    1.  [R&D <code>[2/2]</code>](#org561a476)
    2.  [Stage 1 - Prep <code>[2/4]</code>](#orgb8e151e)
    3.  [Stage 2 - Data <code>[0/1]</code>](#orgce3d39c)
    4.  [Stage 3 - RL Software integrations <code>[0/2]</code>](#org06116d7)
    5.  [Stage 4 - Operations <code>[0/2]</code>](#orgdd5f385)
    6.  [Stage 5 - Stream Real Time Ops <code>[0/0]</code>](#org7ab8a56)
    7.  [KSP Mod Requirements](#orgbd3de33)
    8.  [On Hold](#org408665a)



<a id="orgb1ec985"></a>

# Astra


<a id="org561a476"></a>

## STRT R&D <code>[2/2]</code>

-   [X] Can we set up a headless/graphically limited KSP?
    -   <del>Running KSP in a VM seems promising.</del>
        -   <del>Set all graphics settings to minimum</del>
    -   We sure can! Unity options: `~KSP.x86_64 -batchmode -nographics~`
-   [X] If not headless, can we automate the launching of KSP &ldquo;instances&rdquo;, and entering/setting up the game as desired(specific missions, locations, etc.) via the [kRPC UI API](https://krpc.github.io/krpc/cpp/api/ui/ui.html)?
    -   <del>Might be able to use the Unity [Batch Mode](https://docs.unity3d.com/Manual/CLIBatchmodeCoroutines.html) and [nographics](https://docs.unity3d.com/Manual/CommandLineArguments.html) options to facilitate headless.</del>
    -   <del>Will need some means of automatically launching specified game saves.</del>
        -   <del>[AutoLoadGame](https://github.com/allista/AutoLoadGame) might do the trick.</del>
            -   <del>Might modify to use Unity CLI args instead of config file:</del>
                -   <https://answers.unity.com/questions/138715/read-command-line-arguments.html>
                -   <https://answers.unity.com/questions/366195/parameters-at-startup.html>
    -   No longer neccessary, headless is possible w/ unity opts in above task


<a id="orgb8e151e"></a>

## STRT Stage 1 - Prep <code>[2/4]</code>

-   [X] Automate game-archiver
-   [ ] Base VM Image(Packer) <code>[0/4]</code>
    -   [X] Install KSP 1.7.3 from S3
    -   [-] Automate mod install <code>[0/3]</code>
        -   [ ] Install CKAN.deb
        -   [ ] kRPC manually from github
        -   [ ] RO via CKAN
    -   [ ] Install/POC kRPC and AutoLoadGame SFS
    -   [ ] Loads arbitrary sfs game <code>[0/3]</code>
        -   [ ] Rework [AutoLoadGame](https://github.com/krpc/krpc/blob/master/tools/TestingTools/src/AutoLoadGame.cs) from kRPC to take sfs filename string as commandline arg to `~KSP.x86_64~`
        -   [ ] Figure out how to write sfs/scenario files for your base
        -   [ ] kRPC AutoStarts and listening on 0.0.0.0
            -   Is it possible to set this via the SFS File? Might need to extend here.
-   [ ] Split Project into multiple repos <code>[0/2]</code>
    -   [ ] Terraform <code>[0/2]</code>
        -   [ ] Modules
        -   [ ] Plans
    -   [ ] Packer Base Image
-   [X] Choose kRPC client language - C++


<a id="orgce3d39c"></a>

## TODO Stage 2 - Data <code>[0/1]</code>

-   [ ] Set up client w/ all kRPC Data Stream - Once this is done, revisiting the image build will probably be worth it.
    -   Pipe into GMAT and OpenMCT ???


<a id="org06116d7"></a>

## TODO Stage 3 - RL Software integrations <code>[0/2]</code>

-   [ ] [GMAT](https://opensource.gsfc.nasa.gov/projects/GMAT/index.php) - Planning
-   [ ] [OpenMCT](https://github.com/nasa/openmct) - Ops HUD


<a id="orgdd5f385"></a>

## TODO Stage 4 - Operations <code>[0/2]</code>

-   [-] Starlink(s) <code>[0/0]</code>
-   [-] Long running, real time ops <code>[0/0]</code>


<a id="org7ab8a56"></a>

## TODO Stage 5 - Stream Real Time Ops <code>[0/0]</code>


<a id="orgbd3de33"></a>

## KSP Mod Requirements

-   [kRPC](https://krpc.github.io/krpc/) - kRPC allows you to control Kerbal Space Program from scripts running outside of the game.
-   [Realism Overhaul](https://github.com/KSP-RO/RealismOverhaul/wiki) - Its not certain this will place nice with [kRPC](https://krpc.github.io/krpc/), however realistic(ish?) control theory is really the purpose of this project so we will proceed with it until/unless we encounter problems.
-   [kOS](https://ksp-kos.github.io/KOS/) - kOS might be useful for some simpler tasks where we don&rsquo;t want the full power of kRPC. Might use, might not. We&rsquo;ll see.


<a id="org408665a"></a>

## On Hold

-   [X] Do I even want to use KSP? This [Orbiter Space flight simulator](http://orbit.medphys.ucl.ac.uk/index.html) seems interesting:
    -   Results: perhaps I&rsquo;ll work up to this at some point&#x2026;
    -   [Docs](https://www.orbiterwiki.org/wiki/)
    -   [SDK Docs](https://www.orbiterwiki.org/wiki/SDK_documentation)
-   [ ] Automate S3 hosting of tar&rsquo;d game download
    -   On Hold: Can just use steam cmd locally for now to create the tars then automate the uploading/point packer builds to the &ldquo;latest&rdquo; tar.
    -   No Steam DRM on KSP, should be able to move this around/host in S3 however I need. No direct DL necessary, and should negate the need for steamcmd in the Game Packer build.
    -   Will be nice to automate, but is not strictly necessary and would only need to be done on game updates.
    -   If ever necessary can provide &ldquo;depot&rdquo; and manifest ID&rsquo;s to steamcmd to DL specific KSP releases.

