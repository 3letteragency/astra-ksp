
# Table of Contents

1.  [Astra](#org36d04d3)
    1.  [Tasks <code>[0/3]</code>](#org7a99633)
    2.  [KSP Mod Requirements](#org3477099)



<a id="org36d04d3"></a>

# Astra


<a id="org7a99633"></a>

## Tasks <code>[0/3]</code>

-   [-] R&D
    -   [ ] Do I even want to use KSP? This [Orbiter Space flight simulator](http://orbit.medphys.ucl.ac.uk/index.html) seems interesting:
        -   [Docs](https://www.orbiterwiki.org/wiki/)
        -   [SDK Docs](https://www.orbiterwiki.org/wiki/SDK_documentation)
    -   [ ] Can we set up a headless/graphically limited KSP?
    -   [ ] If not headless, can we automate the launching of KSP &ldquo;instances&rdquo;, and entering/setting up the game as desired(specific missions, locations, etc.) via the [kRPC UI API](https://krpc.github.io/krpc/cpp/api/ui/ui.html)?
-   [-] Stage 1 - Prep <code>[0/3]</code>
    -   [ ] Set up game
    -   [ ] Create a restore point from clean configuration
    -   [ ] Choose kRPC client language
-   [-] Stage 2 - Data <code>[0/1]</code>
    -   [ ] Set up all kRPC Data Streams


<a id="org3477099"></a>

## KSP Mod Requirements

-   [kRPC](https://krpc.github.io/krpc/) - kRPC allows you to control Kerbal Space Program from scripts running outside of the game.
-   [Realism Overhaul](https://github.com/KSP-RO/RealismOverhaul/wiki) - Its not certain this will place nice with [kRPC](https://krpc.github.io/krpc/), however realistic(ish?) control theory is really the purpose of this project so we will proceed with it until/unless we encounter problems.
-   [kOS](https://ksp-kos.github.io/KOS/) - kOS might be useful for some simpler tasks where we don&rsquo;t want the full power of kRPC. Might use, might not. We&rsquo;ll see.

