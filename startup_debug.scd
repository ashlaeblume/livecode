//file containing various troubleshoot methods for debugging supercollider livecoding startup issues
//aegrae@gmail.com

Quarks.install("FoxDot") //in case the quarkes get messed up
Platform.userExtensionDir //obtains locations of system extensions

//choose which platform you are running
FoxDot.start
SuperDirt.start

//set output device
Server.default.options.outDevice_("Built-in Output")
Server.default.options.outDevice_("BlackHole 16ch")
Server.default.options.outDevice_("multiIn")

//set input device
Server.default.options.inDevice_("Built-in Input")
Server.default.options.inDevice_("BlackHole 16ch")
Server.default.options.inDevice_("multiOut")


//other quarks in case the FoxDot quark is inaccessible
Quarks.install("https://github.com/Qirky/FoxDotQuark.git")
Quarks.install("https://github.com/supercollider-quarks/BatLib.git")
