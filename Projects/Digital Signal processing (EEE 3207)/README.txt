==================================================================
          DSP Assignment - Audio Signal Analysis using MATLAB
==================================================================

Course: EEE-3207 (Digital Signal Processing)
Topic: Differentiating Bangla Words Using FFT and Cross-Correlation
Author: Mir Masrur 
Roll: 2001019
Section: A 
Submission Includes: Audio Files, Plots, Report, MATLAB Scripts

==================================================================
		INSTRUCTIONS TO RUN THE PROJECT
==================================================================

This project is organized into three parts:
1. Audio Processing
2. FFT Analysis
3. Cross-Correlation Analysis

------------------------------------------------------------------
🔹 STEP 1: AUDIO PROCESSING
------------------------------------------------------------------
Script: `Preprocessing_the_Audio.m`

- Loads the main audio file (e.g., chaar_tiin2.mp3)
- Extracts and normalizes the individual word segments: "chaar" and "tiin"
- Saves them into variables for the next step

Output: Variables `chaar`, `tiin` saved in memory

------------------------------------------------------------------
🔹 STEP 2: FFT ANALYSIS
------------------------------------------------------------------
Script: `Fourier_Analysis.m`

- Applies FFT to both `chaar` and `tiin`
- Plots the frequency spectra
- Prints the peak frequencies for "aa" and "ii" vowel identification

Output: FFT plots (auto-displayed), peak frequencies in command window

------------------------------------------------------------------
🔹 STEP 3: CROSS-CORRELATION ANALYSIS
------------------------------------------------------------------
Script: `Cross_Correlation_Analysis.m`

- Loads vowel-only clips: `aaa.mp3` (for "aa") and `iii.mp3` (for "ii")
- Cross-correlates them with both `chaar` and `tiin`
- Resizes the correlation outputs to 100 points
- Plots the results and prints peak correlation values

 Output:
- 4 correlation plots
- Printed peak correlation values
- Optional: trimmed/displayable correlation arrays

------------------------------------------------------------------
If you face any issues, recheck audio file names or use `cd` in each script to set your working directory.

Thank you!
