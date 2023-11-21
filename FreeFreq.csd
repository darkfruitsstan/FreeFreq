<Cabbage>
form caption("Untitled") size(1280, 500), guiMode("queue"), pluginId("def1")

button bounds(160, 410, 80, 40) channel("HpBtn") text("Inactive", "Active", "") colour:0(255, 0, 0, 255) colour:1(0, 255, 0, 255)
button bounds(384, 410, 80, 40) channel("b1Btn") text("Inactive", "Active") colour:0(255, 0, 0, 255) colour:1(0, 255, 0, 255)
button bounds(604, 410, 80, 40) channel("b2Btn") text("Inactive", "Active") colour:0(255, 0, 0, 255) colour:1(0, 255, 0, 255)
button bounds(840, 406, 80, 40) channel("b3Btn") text("Inactive", "Active") colour:0(255, 0, 0, 255) colour:1(0, 255, 0, 255)

groupbox bounds(148, 100, 100, 275) channel("groupbox10004") text("High Pass")
groupbox bounds(370, 100, 100, 275) channel("groupbox10005") text("Band 1")
groupbox bounds(594, 98, 100, 275) channel("groupbox10006") text("Band 2")
groupbox bounds(832, 100, 99, 275) channel("groupbox10007") text("Band 3") 
groupbox bounds(1054, 100, 100, 275) channel("groupbox10008") text("Low Pass ")
button bounds(1064, 410, 80, 40) channel("LpBtn") text("Inactive", "Active") colour:0(255, 0, 0, 255) colour:1(0, 255, 0, 255)
label bounds(520, 30, 237, 44) channel("label10010") text("FreeFreq") fontColour(0, 0, 0, 255) colour(255, 0, 0, 0)
rslider bounds(168, 148, 60, 60) channel("hpq") range(0, 1000, 0, 1, 1) text("Q")
rslider bounds(168, 282, 60, 60) channel("hpfreq") range(0, 1000, 0, 1, 1) text("Freq")
rslider bounds(390, 128, 60, 60) channel("B1Q") range(0, 1, 0, 1, 0.001) text("Q")
rslider bounds(386, 204, 56, 59) channel("B1F") range(1000, 5000, 0, 1, 0.001) text("Freq")
rslider bounds(392, 288, 60, 60) channel("B1A") range(0, 1, 0, 1, 0.001) text("Ampitude")
rslider bounds(616, 130, 60, 60) channel("B2Q") range(0, 1, 0, 1, 0.001) text("Q")
rslider bounds(614, 206, 60, 60) channel("B2F") range(5000, 10000, 0, 1, 0.001) text("Freq")
rslider bounds(612, 286, 60, 60) channel("B2A") range(0, 1, 0, 1, 0.001) text("Amplitude")
rslider bounds(850, 126, 60, 60) channel("B3Q") range(0, 1, 0, 1, 0.001) text("Q")
rslider bounds(852, 202, 60, 60) channel("B3F") range(10000, 16000, 0, 1, 0.001) text("Freq")
rslider bounds(854, 290, 60, 60) channel("B3A") range(0, 1, 0, 1, 0.001) text("Amplitude")
rslider bounds(1074, 136, 60, 60) channel("LPQ") range(0, 1, 0, 1, 0.001) text("Q")
rslider bounds(1074, 266, 60, 60) channel("LPF") range(17000, 20000, 0, 1, 1) text("Freq")popupText("0")
</Cabbage>
<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
; Initialize the global variables. 
ksmps = 32
nchnls = 2
0dbfs = 1



</CsInstruments>
<CsScore>
;causes Csound to run for about 7000 years...
f0 z
</CsScore>
</CsoundSynthesizer>
