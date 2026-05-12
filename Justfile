# LoopingAudioConverter
lac:
    cd tools/LoopingAudioConverter/ && mono LoopingAudioConverter.exe

# GameCubeMarioPartyAudioEditor
ae:
    cd tools && java -jar GameCubeMarioPartyAudioEditor.jar
    
# Extract banks into dsps w/MusyXExtract
musy-e:
    python tools/musyx-extract/MusyXExtract.py data/old/bank/
    rm -rf data/old/dsp
    mv data/old/bank/samples/ data/old/dsp/
    
# Convert DSPs to Wav given a bank (i.e. 00012)
dump-wav bank:
    mkdir -p data/rewrite/{{ bank }}/
    tools/vgmstream-cli -o ?f.wav data/old/dsp/{{ bank }}/*.dsp
    mv data/old/dsp/{{ bank }}/*.wav data/rewrite/{{ bank }}

# Repack dsps into banks w/MusyXExtract
musy-p bank:
    python tools/musyx-extract/MusyXExtract.py -p data/new/dsp/{{ bank }}/
    
    rm -rf data/new/bank/{{ bank }}.*
    rm -rf data/new/bank/{{ bank }}.*
    
    mkdir -p data/new/bank/
    mv data/new/dsp/{{ bank }}/sfxProject/* data/new/bank/
    
# Replace MP6_SND.msm with original.msm - original.msm must exist, or MP6_SND.msm will be gone forever
restore-msm:
    rm -f extracted/files/sound/MP6_SND.msm
    cp extracted/files/sound/original.msm extracted/files/sound/MP6_SND.msm

    

