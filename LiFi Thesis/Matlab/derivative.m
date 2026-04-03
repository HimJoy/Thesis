%% 
% Load data from CSV file
data = readtable('single_5_cm_correct.csv');  % Replace with your CSV file name
V_mili = data.V;           % Voltage (V)
I_micro = data.I;     % Current (in μA)

% Convert current from microamperes to amperes
I = I_micro * 1e-6;

% Convert current from microamperes to amperes
V = V_mili * 1e-3;

% Plot I-V curve
figure;
plot(V, I, 'b.-');
xlabel('Voltage (V)');
ylabel('Current (micro A)');
title('Measured I-V Curve');
grid on;

%%
% Compute derivative dI/dV
%dIdV = gradient(I) ./ gradient(V);

% Compute derivative dI/dV
dIdV = gradient(I) ./ gradient(V);

% Plot dI/dV
figure;
plot(V, dIdV, 'r.-');
xlabel('Voltage (V)');
ylabel('dI/dV (A/V)');
title('Current-Voltage Derivative');
grid on;

%%

% Estimate Rsh from slope at short-circuit (V ≈ 0)
[~, idx0] = min(abs(V));  % Index closest to V = 0
Rsh = -1 / dIdV(idx0);
fprintf('Estimated Shunt Resistance Rsh: %.2f Ohms\n', Rsh);

%%

% Estimate Rs from slope at open-circuit (I ≈ 0)
[~, idxVoc] = min(abs(I));    % Index where current ≈ 0
VT = 0.036;                % Thermal voltage (approx) at room temp (V)
Isc = max(I);                 % Short-circuit current (A)
dVdI = 1 / dIdV(idxVoc);      % Reciprocal of dI/dV
Rs = -dVdI - (VT / Isc);      % From the approximation


fprintf('Estimated Series Resistance Rs: %.2f Ohms\n', Rs);
