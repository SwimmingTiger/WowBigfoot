# Deadly Boss Mods Core

## [9.0](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/9.0) (2020-10-13)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/8.3.34...9.0) [Previous Releases](https://github.com/DeadlyBossMods/DeadlyBossMods/releases)

- Bump all TOCs  
    Removed 8.3 compat code  
    Enabled remove enrage on marksman Hunters for 9.0  
- Fixed vulnerability in whisper sync logic that actually just caused syncs that didn't pass safety check to be passed to group whisper handler that doesn't run through safety check. Credits to Payo  
- Miner timer adjustments to ghuun  
- Fix last  
- Change stack count on stitches to warn 1 stack sooner, to allow some classes more time t react  
    Removed some bad code from core  
    Fixed one timer on Mythrax  
- Fixed a bug where several brawlers timers didn't fade/disable countdowns for spectators  
- Update party zhcn (#364)  
- bump alpha version  
- Update koKR (#362)  
- Add bleed icon (#363)  
- Had source timers to allow double and prevent them canceling each other or triggering debug since the actual duplicate timer/refresh code is utter dogshit but I can't be bothered to fix it  
- Possibly fix timer bug on vectis where multiple timers wouldn't start or would overrwrite eachother if fight is done incorrectly for the big adds  
    Hopefully silenced some debug on mother and fetid  
- Fixed initial yawning gate timer after grasp ends on Volzith  
    Fixed initial darkened lightning timer on gorak tul  
    Fixed Triad which had timers for Sister Solena and Sister Malady backwards for over a year.  
- Fix stray comment that awsn't supposed to be saved  
- Revert the Avastye timer changes, what was breaking it wasn't bad timer data, it aws two timers using same spellId by mistake.  
- Adjustments to antispam thresholds in Shrine of storm to hopefully reduce spam in more situations a lot of packs are pulled together  
- Update zhTW (#359)  
    Co-authored-by: Adam <MysticalOS@users.noreply.github.com>  
- Fix last. thse common locals needed to be added to core, not duplicated in GUI  
- Fix random and none not being translated in event sounds  
- Fixed some cases "default" option wasn't localized  
- Handful of dungeon updates to reduce spam, or improve timer correctness in bfa M+ dungeons  
- Filter out duplicate target names from Ricochetting throw, eliminating double yells/warnings, in addition, multiple different targets at same time will now aggregate,  
- Further aggregate frozen solid on my end.  
- Fixed several mechagon dungeon issues. Closes #355  
- Make sure debug event is still logged by transcriptor when user enables timer debugging in options  
- Update localization.tw.lua (#358)  
- Changing file permissions to remove execute bit (#357)  
- Update localization.tw.lua (#356)  
- koKR Update (#353)  
- Update Kaelthas post mythic retest number 2. pretty much all timers changed, so I also half expect almost nothing to be correct on normal/heroic and those likely won't be rested, so release week will be fun! Also, even though add timers are right, add events are hit or miss on blizzards end. if that's not fixed by live either may have to add redundant/backup scheduling  
- Update localization.ru.lua (#352)  
- Some language updates for link hook  
- Fixed noteshare link. At some point blizzard made it so if color codes aren't properly terminated, they now error out.  
- Some typos in Core localization file (#349)  
- Update localization.ru.lua (#350)  
- Fix TColor not saving (#351)  
- Added world boss special condition for outdoor areas of shadowlands, which return 172 not 0  
- Added echoing Sonar cast announce and cast timer  
- Also missed alpha compat  
- Missed one  
- Resurrect hyperlink hook for notes and pizza timers. It'll also be used for profile sharing soon™  
- Fix #346 (#347)  
- Update CN (#345)  
- Updated GeneralKaal (depths version)  
- Improved timer debug to give phase/stage if available.  
    Fixed 2 timers on heroic Carapace and 1 on non mythic nzoth  
- Fix last  
- Prevent debug from spitting out phase change announces as having invalid spellIds  
- Variable is DebugMode, not Debug (#344)  
- Add new crimson flurry spellId for good measure, blizz may have swapped it  
- (╯°□°）╯︵ ┻━┻ the numbers (#343)  
- Hooks now working, unbreak things  
- Push last rename, seems to fix issue by resetting travis url caching  
- testing build failure webhook  
- Fixes to Executor Tarvoid  
- Adjusted first slaver timer  
- Fixed raid finder difficulty text not showing  
- Change URL back  
- Missed spot  
- Removed Punishing blow. It was in fact deleted from fight, and now that A mostly working auto updating journal at disposal now, can see that. :)  
- Prevent GUID check from erroring if called in an arg that isn't a string and add custom function that also supports NPC GUIDs  
- Fix shadowing nitpick  
- if timers have a GUID arg, it will now be parsed and sent in the TimerStart and TimerStop callbacks  
- Push more updates to generals  
- tired of having to stash changes so pushing incompelte changes for now  
- Fix #340 (#341)  
- Hide header for single sections. (#339)  
- Stats (#338)  
- New stats system (#337)  
- Last minute icon option changes to stone generals  
- Fixed phase change detection on shriekwing since blizzard change it from a 3 second cast to a hidden instant cast.  
    Fixed all timers, which were changed  
    Fixed max icon for Echolocation since it now targets an additional person.  
    Changed yells for echolocation to include icons  
- Update Core: localization.tw.lua (#336)  
- Forgot this  
- Change Mythic carapace back to 2 stacks, the unitdebuff check should be good enough to handle checking whether or not it's viable.  
- Update localization.cn.lua (#333)  
- Update koKR (#334)  
- Prep next alpha cycles  
