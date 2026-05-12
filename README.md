1. ISO in root folder
2. uncompress with Dolphin emu
3. Dumping
    1. Dump bank(s) (GameCubeMarioPartyAudioEditor)
    2. Dump DSPs (MusyX)
4. Convert DSPs to regular WAVs (vgmsteam-cli)
5. Modify WAVs
    - Ocenaudio is pretty good for this
    - Check `labels`, it might have info on that bank
    - the `README.csv` in `labels` might have info on each bank
    - These labels are for the specific copy of Mario Party 6 I have, so YMMV
6. Repacking
    1. Convert WAVs to DSPs (LoopingAudioConverter)
    2. Fix Nonlooping DSPs (GameCubeMarioPartyAudioEditor)
    3. Repackage DSPs into banks (MusyX)
    4. Inject banks into msm (GameCubeMarioPartyAudioEditor)



Dumping process
| Steps | Conversion | Tool | 
| ----- | ---------- | ---- |
| Dump-banks            | msm -> banks   | ✅ ae |
| Dump-dsps             | banks -> dsps  | ✅ MusyX Extract |
| Convert DSPs to Wavs  | dsps -> wav    | ✅ vgmstream-cli |

> Note: i think vgmstream stores looping audio data. LoopingAudioConverter uses vgmstream anyway, it just fails cuz I'm trying to do it with Linux.

Modify .wavs
- Ocenaudio

Repacking process
| Steps | Conversion | Tool | 
| ----- | ---------- | ---- |
| Convert Wavs to DSP    | wav -> dsp    | ✅ lac |
| Fix for Nonlooping DSP | dsp -> dsp    | ✅ ae |
| Repack dsps into banks | dsps -> banks | ✅ MusyX Repack |
| Inject banks           | banks -> msm  | ✅ ae |

