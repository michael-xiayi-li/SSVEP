# SSVEP


Using Emotiv Epoc's headset and data acquisition software, I created a real-time SSVEP program with Unity (UI/Graphics), and Matlab (Data analysis). SSVEP stands for single-state visually evoked potential. By using an EEG reading data from the occipital lobe, frequency flashes can be detected by a program using Canonical Correlational Analysis. This allows users to communicate without speaking.

edfread is a plugin from Matlab, not personally created.

1.Make sure electrodes O1, O2, P1, and P2 on the Emotiv have good contact quality.
2. Open Emotiv's eeg data acquisition software, and start logging data.
3. Input the name of the file being read, the corresponding letters and frequencies, and the file being written to in Matlab.
4. play the Unity scene
