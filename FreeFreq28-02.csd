<Cabbage>
form caption("FreeFreq") size(1280, 500), guiMode("queue"), pluginId("def1")
label bounds(520, 30, 237, 44) channel("label10010") text("FreeFreq") fontColour(0, 0, 0, 255) colour(255, 0, 0, 0)

//input buttons
button bounds(160, 410, 80, 40) channel("HpBtn") text("Inactive", "Active") colour:0(255, 0, 0, 255) colour:1(0, 255, 0, 255)
button bounds(384, 410, 80, 40) channel("b1Btn") text("Inactive", "Active") colour:0(255, 0, 0, 255) colour:1(0, 255, 0, 255)
button bounds(604, 410, 80, 40) channel("b2Btn") text("Inactive", "Active") colour:0(255, 0, 0, 255) colour:1(0, 255, 0, 255)
button bounds(840, 406, 80, 40) channel("b3Btn") text("Inactive", "Active") colour:0(255, 0, 0, 255) colour:1(0, 255, 0, 255)
button bounds(1064, 410, 80, 40) channel("LpBtn") text("Inactive", "Active") colour:0(255, 0, 0, 255) colour:1(0, 255, 0, 255)

groupbox bounds(148, 100, 100, 275) channel("groupbox10004") text("High Pass")
groupbox bounds(370, 100, 100, 275) channel("groupbox10005") text("Band 1")
groupbox bounds(594, 98, 100, 275) channel("groupbox10006") text("Band 2")
groupbox bounds(832, 100, 99, 275) channel("groupbox10007") text("Band 3") 
groupbox bounds(1054, 100, 100, 275) channel("groupbox10008") text("Low Pass")

rslider bounds(168, 148, 60, 60) channel("hpq") range(0.5, 10, 1, 1, 1) text("Q")
rslider bounds(168, 282, 60, 60) channel("hpfreq") range(20, 1000, 100, 1, 1) text("Freq")

rslider bounds(390, 128, 60, 60) channel("B1Q") range(0.5, 10, 1, 1, 1) text("Q")
rslider bounds(386, 204, 56, 59) channel("B1F") range(1000, 5000, 1000, 1, 0.001) text("Freq")
rslider bounds(392, 288, 60, 60) channel("B1A") range(-60, 60, 0, 1, 1) text("Ampitude")

rslider bounds(616, 130, 60, 60) channel("B2Q") range(0.5, 10, 1, 1, 1) text("Q")
rslider bounds(614, 206, 60, 60) channel("B2F") range(5000, 10000, 5000, 1, 0.001) text("Freq")
rslider bounds(612, 286, 60, 60) channel("B2A") range(-60, 60, 0, 1, 1) text("Amplitude")

rslider bounds(850, 126, 60, 60) channel("B3Q") range(0.5, 10, 1, 1, 1) text("Q")
rslider bounds(852, 202, 60, 60) channel("B3F") range(10000, 16000, 10000, 1, 0.001) text("Freq")
rslider bounds(854, 290, 60, 60) channel("B3A") range(-60, 60, 1, 1, 0.001) text("Amplitude")

rslider bounds(1074, 136, 60, 60) channel("LPQ") range(0.5, 10, 1, 1, 1) text("Q")
rslider bounds(1074, 266, 60, 60) channel("LPF") range(17000, 20000, 1, 1, 1) text("Freq")popupText("0")



</Cabbage>
<<CsoundSynthesizer>
<CsOptions>
-n -d -+rtmidi=NULL -M0 -m0d --midi-key-cps=4 --midi-velocity-amp=5
</CsOptions>
<CsInstruments>
  ; Initialize the global variables. 
  ksmps = 32
  nchnls = 2
  0dbfs = 1

  instr 1
   aLeft, aRight ins
    ; High Pass Filter
    kHPFreq   chnget "hpfreq"
    kHPQ      chnget "hpq"
    kHpBtn    chnget "HpBtn"
    aHPFL rezzy aLeft, kHPFreq, kHPQ, 1
    aHPFR rezzy aRight, kHPFreq, kHPQ, 1

    ; Band 1
    kB1Freq   chnget "B1F"
    kB1Q      chnget "B1Q"
    kB1ARaw      chnget "B1A"
    kB1A = ampdb(kB1ARaw)
    kB1Btn    chnget "b1Btn"
    
    aB1Lt pareq aLeft, kB1Freq, kB1A, kB1Q
    aB1Rt pareq aRight, kB1Freq, kB1A, kB1Q


    ; Band 2
    kB2Freq   chnget "B2F"
    kB2Q      chnget "B2Q"
    kB2ARaw      chnget "B2A"
    kB2A = ampdb(kB2ARaw)
    kB2Btn    chnget "b2Btn"
    
    aB2Lt pareq aLeft, kB2Freq, kB2A, kB2Q
    aB2Rt pareq aRight, kB2Freq, kB2A, kB2Q
  

    ; Band 3
    kB3Freq   chnget "B3F"
    kB3Q      chnget "B3Q"
    kB3ARaw      chnget "B3A"
    kB3A = ampdb(kB3ARaw)
    kB3Btn    chnget "b3Btn"
    
    aB3Lt pareq aLeft, kB3Freq, kB3A, kB3Q
    aB3Rt pareq aRight, kB3Freq, kB3A, kB3Q
 

    ; Low Pass Filter
    kLPFreq   chnget "LPF"
    kLPQ      chnget "LPQ"
    kLpBtn    chnget "LpBtn"
    
    aLPFL rezzy aLeft, kLPFreq, kLPQ
    aLPFR rezzy aRight, kLPFreq, kLPQ

    ; EQ CODE
    
    aFiltSigL = (aHPFL + aB1Lt + aB2Lt + aB3Lt + aLPFL)*0.3
    aFiltSigR = (aHPFR + aB1Rt + aB2Rt + aB3Rt + aLPFR)*0.3
    
    
    outs aFiltSigL, aFiltSigR

endin


</CsInstruments>

<CsScore>
  i 1 0 [3600*24*7]
  f 0 z

</CsScore>

</CsoundSynthesizer>