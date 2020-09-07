
# Table of Contents

1.  [Astra](#org043c192)
    1.  [R&D <code>[2/2]</code>](#org991f7dc)
    2.  [Stage 1 - Prep <code>[1/7]</code>](#orga55a702)
    3.  [Stage 2 - Data <code>[0/1]</code>](#org69e357d)
    4.  [Stage 3 - RL Software integrations <code>[0/2]</code>](#org85a2baa)
    5.  [Stage 4 - Operations <code>[0/2]</code>](#orgee38c10)
    6.  [Stage 5 - Stream Real Time Ops <code>[0/0]</code>](#org37a21d8)
    7.  [KSP Mod Requirements](#org78fb854)
    8.  [On Hold](#org45d2300)



<a id="org043c192"></a>

# Astra


<a id="org991f7dc"></a>

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


<a id="orga55a702"></a>

## STRT Stage 1 - Prep <code>[1/7]</code>

-   [ ] Pin KSP to 1.7.3
-   [ ] Get KSP 1.7.3 running
-   [ ] Install mods via CKAN
-   [ ] Load Arbitrary SFS via cli args(modded version of AutoLoadGame)
-   [ ] SFS File that autostarts kRPCServer
-   [ ] Load Arbitrary b64 encoded SFS(w/ kRPC autostarted) via userdata
-   [X] Choose kRPC client language - C++


<a id="org69e357d"></a>

## TODO Stage 2 - Data <code>[0/1]</code>

-   [ ] Set up client w/ all kRPC Data Stream - Once this is done, revisiting the image build will probably be worth it.
    -   Pipe into GMAT and OpenMCT ???


<a id="org85a2baa"></a>

## TODO Stage 3 - RL Software integrations <code>[0/2]</code>

-   [ ] [GMAT](https://opensource.gsfc.nasa.gov/projects/GMAT/index.php) - Planning
-   [ ] [OpenMCT](https://github.com/nasa/openmct) - Ops HUD


<a id="orgee38c10"></a>

## TODO Stage 4 - Operations <code>[0/2]</code>

-   [-] Starlink(s) <code>[0/0]</code>
-   [-] Long running, real time ops <code>[0/0]</code>


<a id="org37a21d8"></a>

## TODO Stage 5 - Stream Real Time Ops <code>[0/0]</code>


<a id="org78fb854"></a>

## KSP Mod Requirements

-   [kRPC](https://krpc.github.io/krpc/) - kRPC allows you to control Kerbal Space Program from scripts running outside of the game.
-   [Realism Overhaul](https://github.com/KSP-RO/RealismOverhaul/wiki) - Its not certain this will place nice with [kRPC](https://krpc.github.io/krpc/), however realistic(ish?) control theory is really the purpose of this project so we will proceed with it until/unless we encounter problems.
-   [kOS](https://ksp-kos.github.io/KOS/) - kOS might be useful for some simpler tasks where we don&rsquo;t want the full power of kRPC. Might use, might not. We&rsquo;ll see.


<a id="org45d2300"></a>

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
-   [-] Base VM Image(Packer) <code>[3/8]</code> - On hold, image building is taking too much time and is not very clean to automate with steamcmd atm. Will need to revisit once project is further along. Not currently worth pursuing, better to get some real work done.
    -   [ ] KSP Needs to be pinned to 1.7.3 for compatibility between both kRPC and RO :(
    -   [ ] Userdata json structure for:
        -   b64 encoded sfs
        -   Authorized keys
    -   [ ] Automate version bumping on every build and passing down version variable to other locations(i.e. TF plans snapshot string variables)
    -   [X] Add ssh key
    -   Ubuntu base image
    -   Vultr builder
    -   KSP Archive is uploaded to build server from local
    -   [X] CLI Steam management - steamcmd works
        -   <del>Make sure deb frontend noninteractive works</del>
        -   <del>Non-interactive steamcmd</del>
        -   <del>Missing some 32bit libs by default</del>
        -   <del>2fa?</del>
        -   <del>Otherwise, seems to work just fine then directly launch with the binary installed in ~/.steam/&#x2026;</del>
        -   <del>As an alternative should we run into unfixable issues w/ steam, direct download from Squad and hosting that in a private s3 should be fine.</del>
    -   [X] KSP Installed
    -   [ ] Loads arbitrary sfs game <code>[0/3]</code>
        -   [ ] Rework [AutoLoadGame](https://github.com/krpc/krpc/blob/master/tools/TestingTools/src/AutoLoadGame.cs) from kRPC to take sfs filename string as commandline arg to `~KSP.x86_64~`
        -   [ ] Figure out how to write sfs/scenario files for your base
        -   [ ] kRPC AutoStarts and listening on 0.0.0.0
            -   Is it possible to set this via the SFS File? Might need to extend here.
    -   [ ] Mods installed
-   [-] Split Project into multiple repos <code>[0/1]</code> - Similar to Packer build, not currently worth pursuing till a greater bulk of work is done.
    -   [ ] Terraform <code>[0/2]</code>
        -   [ ] Modules
        -   [ ] Plans

