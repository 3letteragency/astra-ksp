
# Table of Contents

1.  [Astra | Status: Planning](#orgb77e463)
    1.  [R&D <code>[0/2]</code>](#org52c7376)
    2.  [Stage 1 - Prep <code>[1/4]</code>](#orgb3eabe5)
    3.  [Stage 2 - Data <code>[0/1]</code>](#org1b2c4cb)
    4.  [Stage 3 - RL Software integrations <code>[0/2]</code>](#orga51b5e1)
    5.  [Stage 4 - Operations <code>[0/2]</code>](#org43935d2)
    6.  [Stage 5 - Stream Real Time Ops <code>[0/0]</code>](#org2586752)
    7.  [KSP Mod Requirements](#orga48083a)
    8.  [On Hold](#orgabfcbbd)



<a id="orgb77e463"></a>

# Astra | Status: Planning


<a id="org52c7376"></a>

## STRT R&D <code>[0/2]</code>

-   [ ] Can we set up a headless/graphically limited KSP?
    -   Running KSP in a VM seems promising.
        -   Set all graphics settings to minimum
-   [ ] If not headless, can we automate the launching of KSP &ldquo;instances&rdquo;, and entering/setting up the game as desired(specific missions, locations, etc.) via the [kRPC UI API](https://krpc.github.io/krpc/cpp/api/ui/ui.html)?
    -   Might be able to use the Unity [Batch Mode](https://docs.unity3d.com/Manual/CLIBatchmodeCoroutines.html) and [nographics](https://docs.unity3d.com/Manual/CommandLineArguments.html) options to facilitate headless.
    -   Will need some means of automatically launching specified game saves.
        -   [AutoLoadGame](https://github.com/allista/AutoLoadGame) might do the trick.
            -   Might modify to use Unity CLI args instead of config file:
                -   <https://answers.unity.com/questions/138715/read-command-line-arguments.html>
                -   <https://answers.unity.com/questions/366195/parameters-at-startup.html>


<a id="orgb3eabe5"></a>

## STRT Stage 1 - Prep <code>[1/4]</code>

-   [-] Base VM Image(Packer) <code>[1/4]</code>
    -   [X] CLI Steam management - steamcmd works
        -   <del>Make sure deb frontend noninteractive works</del>
        -   <del>Non-interactive steamcmd</del>
        -   <del>Missing some 32bit libs by default</del>
        -   <del>2fa?</del>
        -   <del>Otherwise, seems to work just fine then directly launch with the binary installed in ~/.steam/&#x2026;</del>
        -   <del>As an alternative should we run into unfixable issues w/ steam, direct download from Squad and hosting that in a private s3 should be fine.</del>
    -   [ ] KSP Installed
    -   [ ] Mods installed
    -   [ ] Loads arbitrary sfs game
-   [ ] Base sfs loaded by base image instances <code>[0/1]</code>
    -   [ ] kRPC AutoStarts and listening on 0.0.0.0
-   [X] Choose kRPC client language - C++


<a id="org1b2c4cb"></a>

## TODO Stage 2 - Data <code>[0/1]</code>

-   [ ] Set up client w/ all kRPC Data Stream
    -   Pipe into GMAT and OpenMCT ???


<a id="orga51b5e1"></a>

## TODO Stage 3 - RL Software integrations <code>[0/2]</code>

-   [ ] [GMAT](https://opensource.gsfc.nasa.gov/projects/GMAT/index.php) - Planning
-   [ ] [OpenMCT](https://github.com/nasa/openmct) - Ops HUD


<a id="org43935d2"></a>

## TODO Stage 4 - Operations <code>[0/2]</code>

-   [-] Starlink(s) <code>[0/0]</code>
-   [-] Long running, real time ops <code>[0/0]</code>


<a id="org2586752"></a>

## TODO Stage 5 - Stream Real Time Ops <code>[0/0]</code>


<a id="orga48083a"></a>

## KSP Mod Requirements

-   [kRPC](https://krpc.github.io/krpc/) - kRPC allows you to control Kerbal Space Program from scripts running outside of the game.
-   [Realism Overhaul](https://github.com/KSP-RO/RealismOverhaul/wiki) - Its not certain this will place nice with [kRPC](https://krpc.github.io/krpc/), however realistic(ish?) control theory is really the purpose of this project so we will proceed with it until/unless we encounter problems.
-   [kOS](https://ksp-kos.github.io/KOS/) - kOS might be useful for some simpler tasks where we don&rsquo;t want the full power of kRPC. Might use, might not. We&rsquo;ll see.


<a id="orgabfcbbd"></a>

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

