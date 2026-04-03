% Example Data (replace with your real measurements)
voltages_2LED_p = [0.745 0.648 0.59];
currents_2LED_p = [2.26 1.2 0.64];   % in microamps

voltages_5LED_p = [.8 .67 0.59];
currents_5LED_p = [2.6 1.9 0.822];   % in microamps

voltages_2LED_s = [1.67 1.21 1.02];
currents_2LED_s = [42.7 19 12];           % in microamps

voltages_5LED_s = [2.3 2.04 1.91];
currents_5LED_s = [84.5 73 61.4];           % in microamps

distances = [5, 10, 20]; % in cm

% Convert currents to amperes for power calculation microamps to amps
currents_photodiode_2 = currents_2LED_p * 1e-6; 
currents_photodiode_5 = currents_5LED_p * 1e-6; 
currents_solar_2 = currents_2LED_s * 1e-6;           
currents_solar_5 = currents_5LED_s * 1e-6;

% Calculate Power
power_photodiode_2 = voltages_2LED_p .* currents_photodiode_2;   % Watts
power_photodiode_5 = voltages_5LED_p .* currents_photodiode_5;
power_solar_2 = voltages_2LED_s .* currents_solar_2;             % Watts
power_solar_5 = voltages_5LED_s .* currents_solar_5; 

% Plotting
% Photodiode Power Plot
figure;
plot(distances, power_photodiode_2, '-o', 'LineWidth', 2, 'DisplayName', 'Photodiode, 2 LEDs');
hold on;
plot(distances, power_photodiode_5, '-s', 'LineWidth', 2, 'DisplayName', 'Photodiode, 5 LEDs');
hold off;
xlabel('Distance (cm)');
ylabel('Power (W)');
title('Photodiode Power vs. Distance');
legend('Location', 'northeast');
grid on;

% Solar Cell Power Plot
figure;
plot(distances, power_solar_2, '-^', 'LineWidth', 2, 'DisplayName', 'Solar Cell, 2 LEDs');
hold on;
plot(distances, power_solar_5, '-d', 'LineWidth', 2, 'DisplayName', 'Solar Cell, 5 LEDs');
hold off;
xlabel('Distance (cm)');
ylabel('Power (W)');
title('Solar Cell Power vs. Distance');
legend('Location', 'northeast');
grid on;

