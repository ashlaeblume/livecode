// mumblefrog is an additive synthesis thingy that combines 4 sine oscillators with different amplitudes,
(
SynthDef.new("mumblefrog", {
	var ampArray, ampOscArray, outArray, phaseArray;
	ampArray = [2, 3, 4, 5]/1;
	ampOscArray = [SinOsc.kr(0.3, pi/2, ampArray[0]), SinOsc.kr(0.5, pi/3, ampArray[1]);, SinOsc.kr(0.8, pi/5, ampArray[2]), SinOsc.kr(0.7, pi/5, ampArray[3])];
	phaseArray = [pi/2, 2pi/3, 6pi/4, 1.5pi];
	outArray = [SinOsc.ar(413, phaseArray[0], ampOscArray[0]), SinOsc.ar(450, phaseArray[1], ampOscArray[1]), SinOsc.ar(546, phaseArray[2], ampOscArray[2]), SinOsc.ar(Phasor.kr(0, 1, 545, 542), phaseArray[3], ampOscArray[3])];
	Out.ar(0, outArray[0]);
	Out.ar(0, outArray[1]);
	Out.ar(1, outArray[2]);
	Out.ar(1, outArray[3]);

}).send(s); //use send(s) to send synthdef to variables for playing outside the function
x = Synth.new("mumblefrog");
)

// wondering if i can use an array to have variable frequency between 2 vals...
//{ SinOsc.ar([546,550], 0, 0.05) }.play;

// trying to get a linear crossfade between 2 sounds split into 2 channels... currently only can get mono...
//{ LinXFade2.ar(FSinOsc.ar(800, 0, 0.2), PinkNoise.ar(0.2), FSinOsc.kr(1)) }.play;

// below, thee shall find 3 pairs of (6 total) sine oscillators with asynchronous amplitude oscillation. myarf!
(
{ var ampOsc;
    ampOsc = SinOsc.kr(0.5, 0.7pi, 0.2, 0.2);
    SinOsc.ar(330, 0, ampOsc);
}.play;

{ var ampOsc;
    ampOsc = SinOsc.kr(0.5, 1.0pi, 0.2, 0.2);
    SinOsc.ar(447, 0, ampOsc);
}.play;

{ var ampOsc;
    ampOsc = SinOsc.kr(0.5, 1.3pi, 0.2, 0.2);
    SinOsc.ar(322, 0, ampOsc);
}.play(1);

{ var ampOsc;
    ampOsc = SinOsc.kr(0.5, 1.0pi, 0.2, 0.2);
    SinOsc.ar(632, 0, ampOsc);
}.play(2);

{ var ampOsc;
    ampOsc = SinOsc.kr(0.5, 1.3pi, 0.2, 0.2);
    SinOsc.ar(519, 0, ampOsc);
}.play;

{ var ampOsc;
    ampOsc = SinOsc.kr(0.5, 1.3pi, 0.2, 0.2);
    SinOsc.ar(212, 0, ampOsc);
}.play;
)

//wobble panners which build a sequential chord from 4 stacked fast sine oscillators, with 2 pink noiseses for good measure
(
{ LinPan2.ar(FSinOsc.ar(800, 0, 0.1), FSinOsc.kr(6)) }.play;
{ LinPan2.ar(FSinOsc.ar(600, 0, 0.1), FSinOsc.kr(5)) }.play;
{ LinPan2.ar(FSinOsc.ar(700, 0, 0.1), FSinOsc.kr(4)) }.play;
{ LinPan2.ar(FSinOsc.ar(900, 0, 0.1), FSinOsc.kr(3)) }.play;
{ Pan2.ar(PinkNoise.ar(0.1), FSinOsc.kr(3), 0.3) }.play;
{ Pan2.ar(PinkNoise.ar(0.1), FSinOsc.kr(5), 0.3) }.play;
)
