//a generative music project inspired by gecko hearing, neuroscience, and the kuramoto model
//@ashlaeblume
//aegrae@gmail.com

//functions for short generative composition using slow textures

s.record;
s.stop;

//PART 1
//grainy sine wave synthdef routine: bell-type tones with randomly generated frequencies
(
SynthDef(\bellbot, { |freq = 523, amp = 0.2, sustain = 1|
	var sig; //signal convolves (multiplies) sine with perc envelope
    sig = SinOsc.ar(freq, 0, amp) * EnvGen.kr(Env.perc(0.01, sustain), doneAction: Done.freeSelf);
	Out.ar(0, sig ! 2);    // sig!2 is 2-channel (stereo) output
}).add;

//loop routine for generating bellbots with rrand, exprand
r = Routine({
    var dt;
    loop {
        dt = rrand(3, 5) * 2.2; //dt with rrand determines wait length btwn each oscillator
        Synth(\bellbot, [freq: exprand(150, 550), amp: rrand(0.1, 0.15), sustain: dt * 1.2]);
        dt.yield;
    }
});
//r.play;

(//task which plays bellbot routine 4 times with an interval of 4.3 seconds in-between each event
t =  Task({
	4.do({ arg i;
		r.play;
		4.3.wait;
	});
});
t.play;
)
)

//PART 2
//generates an ascending square wave synthdef
(

SynthDef.new("asc", {
	arg out = 0, freq = 440, amp = 0.01, dur = 1;
	var square, env_gen, env;

	env = Env.triangle(dur, amp);
	env_gen = EnvGen.kr(env, doneAction:2);
	square = Pulse.ar(freq, 0.5, env_gen);

	Out.ar(out, square ! 2);
}).load(s);

//after a 12 second wait, plays 10 ascending synthdefs in succession
(
t =  Task({
	var freq;
	6.do({ arg i;
		freq = 60 * (i);
		Synth(\asc, [\out, 0, \freq, freq, \dur, 11]);
		17.wait;
	});
});
t.play;
)
)
