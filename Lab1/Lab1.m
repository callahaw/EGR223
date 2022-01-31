%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Title: Lab #1 - Introduction to MATLAB
% Filename: Lab1.m
% Author: Wade Callahan
% Course: EGR223 - 03
% Date: 1.19.2022
% Assignment: Lab 1
% Instructor: Prof. Baine
% Description: This script file generates a clean sinusoidal wave with
% an amplitude of 3, 3Hz frequency, 90 degree phase offset, and 4 cycles.
% The script then adds noise to this clean signal at three different noise
% levels: 12Db, 0Db, and -12Db. The output of this script is 4 subplots of
% each signal
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Variable Declarations
A = 3;              % Amplitude is 3
freq = 3;           % Frequency is 3 Hz
period = 1 / freq;  % Period is 1 / frequency
offset = pi/2;      % 90 degree of set in radians
t = 0 : 1/1000 : 4 * period;    % Plot 3 cycles, 1000 sampling frequency

% Generates the clean signal
Clean_Signal = A * sin( 2 * pi * freq * t + offset);

%Noise Levels Constants
DB12 = 12;
DB0 = 0;
DBn12 = -12;
DBn26 = -26;

%SNR Calculations
SNR = @(xDB) 10 ^ (xDB / 10);
SNR12 = SNR(DB12);
SNR0 = SNR(DB0);
SNRn12 = SNR(DBn12);
SNRn26 = SNR(DBn26);

%Noisey Signal Calculations
Ps = var(Clean_Signal);
noiseSig = @(SNR) sqrt(Ps/SNR) * randn(size(Clean_Signal));
sig12 = Clean_Signal + noiseSig(SNR12);
sig0 = Clean_Signal + noiseSig(SNR0);
sign12 = Clean_Signal + noiseSig(SNRn12);
sign26 = Clean_Signal + noiseSig(SNRn26);

%Subplot setup
figure;
% Clean Sine Wave Signal
subplot(4,1,1);plot(Clean_Signal);grid on;                
title('Clean Signal');ylabel('Sine Wave Amplitude');xlabel('Time (Milliseconds)');             
% 12Db Noisey Signal
subplot(4,1,2);plot(sig12, 'g');grid on;
title('12dB Noise Signal');ylabel('Sine Wave Amplitude');xlabel('Time (Milliseconds)'); 
% 0Db Noisey Signal
subplot(4,1,3);plot(sig0, 'r');grid on;
title('0dB Noise Signal');ylabel('Sine Wave Amplitude');xlabel('Time (Milliseconds)'); 
% -12Db Noisey Signal
subplot(4,1,4);plot(sign12, 'c');grid on;
title('-12dB Noise Signal');ylabel('Sine Wave Amplitude');xlabel('Time (Milliseconds)'); 
% Seperate plot for -26dB
figure;
plot(sign26);                
title('-26dB Noise Signal');ylabel('Sine Wave Amplitude');xlabel('Time (Milliseconds)'); 


