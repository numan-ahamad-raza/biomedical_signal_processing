This project implements a complete ECG signal processing pipeline using MATLAB. It focuses on:

Noise suppression using an IIR Butterworth Bandpass Filter (5–15 Hz)

Zero-phase filtering using [filtfilt()]

Automated R-peak detection

Heart rate estimation

Time-domain visualization

The ECG data is sourced from the MIT-BIH Arrhythmia Database.


ECG Signal Context

<img width="625" height="453" alt="image" src="https://github.com/user-attachments/assets/dbf28218-c1f8-4b3d-9290-b158f6032689" />




The ECG waveform consists of:

P-wave → Atrial depolarization

QRS complex → Ventricular depolarization (R-peak is dominant)

T-wave → Ventricular repolarization

Raw ECG signals are typically corrupted by:

Baseline drift (<5 Hz)

Powerline interference

Electromyographic (EMG) noise (>15 Hz)

This project isolates the diagnostic frequency band (5–15 Hz) to enhance signal clarity and improve peak detection reliability.
| Parameter          | Value                   |
| ------------------ | ----------------------- |
| Dataset            | MIT-BIH Record 100      |
| Sampling Frequency | 360 Hz                  |
| Filter Type        | IIR Butterworth         |
| Filter Order       | 2                       |
| Passband           | 5–15 Hz                 |
| Filtering Method   | Zero-phase (`filtfilt`) |
| Peak Detection     | `findpeaks()`           |


Processing Pipeline:

Load ECG Data
      ↓
Generate Time Vector
      ↓
Visualize Raw Signal
      ↓
Design Butterworth Bandpass Filter (5–15 Hz)
      ↓
Apply Zero-Phase Filtering
      ↓
Detect R-Peaks
      ↓
Compute Heart Rate
      ↓
Visualize Results


Key Observations

Significant reduction in baseline wander

Improved Signal-to-Noise Ratio (SNR)

Sharply defined R-peaks

Reliable automated beat counting

Accurate heart rate estimation



