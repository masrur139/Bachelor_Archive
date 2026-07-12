% Define your transfer function
num = [-0.48 240];
den = [3.2e-6 0.0016 0.8];
G = tf(num, den);

% Define tuning options
opts = pidtuneOptions('DesignFocus', 'reference-tracking');

% Tune a PI controller
C = pidtune(G, 'PI', opts);

% Display results
disp(C)
