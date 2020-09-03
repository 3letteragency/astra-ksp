
# Table of Contents

1.  [Astra](#org799177e)
    1.  [Tasks <code>[0/4]</code>](#org075be62)
    2.  [KSP Mod Requirements](#orgd6f0fdf)
    3.  [On Hold](#org1daf6e9)



<a id="org799177e"></a>

# Astra


<a id="org075be62"></a>

## Tasks <code>[0/4]</code>

-   [ ] R&D
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
-   [-] Stage 1 - Prep <code>[0/3]</code>
    -   [ ] Base VM Image(Packer) <code>[/]</code>
        -   [ ] KSP Installed
        -   [ ] Mods installed
        -   [ ] Loads arbitrary sfs game save at a scene where kRPC is started and may take over
    -   [ ] Base sfs loaded by base image instances
        -   [ ] kRPC AutoStarts and listening on 0.0.0.0
    -   [X] Choose kRPC client language - C++
-   [ ] RL Software integrations <code>[0/2]</code>
    -   [ ] [GMAT](https://opensource.gsfc.nasa.gov/projects/GMAT/index.php) - Planning
    -   [ ] [OpenMCT](https://github.com/nasa/openmct) - Ops HUD
-   [ ] Stage 2 - Data <code>[0/1]</code>
    -   [ ] Set up all kRPC Data Stream


<a id="orgd6f0fdf"></a>

## KSP Mod Requirements

-   [kRPC](https://krpc.github.io/krpc/) - kRPC allows you to control Kerbal Space Program from scripts running outside of the game.
-   [Realism Overhaul](https://github.com/KSP-RO/RealismOverhaul/wiki) - Its not certain this will place nice with [kRPC](https://krpc.github.io/krpc/), however realistic(ish?) control theory is really the purpose of this project so we will proceed with it until/unless we encounter problems.
-   [kOS](https://ksp-kos.github.io/KOS/) - kOS might be useful for some simpler tasks where we don&rsquo;t want the full power of kRPC. Might use, might not. We&rsquo;ll see.


<a id="org1daf6e9"></a>

## On Hold

-   [X] Do I even want to use KSP? This [Orbiter Space flight simulator](http://orbit.medphys.ucl.ac.uk/index.html) seems interesting:
    -   Results: perhaps I&rsquo;ll work up to this at some point&#x2026;
    -   [Docs](https://www.orbiterwiki.org/wiki/)
    -   [SDK Docs](https://www.orbiterwiki.org/wiki/SDK_documentation)

