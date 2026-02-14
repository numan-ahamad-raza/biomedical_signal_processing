clc; clear; close all

%% ------------------- ecg signal -------------------
filename = '100.dat';
fid = fopen(filename,"r");
ecg_signal=fread(fid,inf,"int16");
fclose(fid);
%extract sampling frequency & time vector
fs=360;
t= (0: length(ecg_signal)-1)/fs;
figure;
t_5sec=t(t<=5);% time only for 5 sec
subplot(1,2,1)
plot(t_5sec,ecg_signal(1:length(t_5sec)));
xlabel('TIME(S)');
ylabel('AMPLTUDE mV');
title('RAW ECG SIGNAL(1ST 5 SEC)');
%apply bandpass filter to remove noise 
f_low = 5;
f_high= 15;%range of ecg is 5 to 15 Hz
[b,a]= butter(2,[f_low,f_high]/(fs/2),'bandpass');
filtered_signal=filtfilt(b,a,ecg_signal);
%detect R-peaks for segmentation
[~,r_locks]=findpeaks(filtered_signal,'MinPeakHeight',200);
%print number of beats in signal
num_beats=(length(r_locks));
fprintf('NUMBER OF BEATS:%d/n', num_beats);
%plot 5 seconds of the filtered signal ECG signal

t_5sec = t(t<=5); %adjust time vector to only span 1st 5 seconds
subplot(1,2,2)
plot(t_5sec,filtered_signal(1:length(t_5sec)));
xlabel('TIME');
ylabel('AMPLITUDE(mV)');
title('FILTERED ECG SIGNAL (1ST 5 SEC)');
subtitle("NUMAN 24BEE056");




