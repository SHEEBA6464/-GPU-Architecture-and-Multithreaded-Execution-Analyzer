clc;

clear;

% Input Data (Large dataset simulation)
N = 1000000;
A = rand(1, N);
B = rand(1, N);

%% CPU Execution (Sequential)
tic;
C_cpu = zeros(1, N);
for i = 1:N
    C_cpu(i) = A(i) + B(i);
end
cpu_time = toc;

%% Parallel Execution (Simulating GPU using parfor)
tic;
C_gpu = zeros(1, N);
parfor i = 1:N
    C_gpu(i) = A(i) + B(i);
end
gpu_time = toc;

%% Display Results
disp('--- Execution Time Comparison ---');
fprintf('CPU Execution Time: %f seconds\n', cpu_time);
fprintf('GPU (Parallel) Execution Time: %f seconds\n', gpu_time);

%% Thread Analysis (Basic Simulation)
disp('--- Thread Analysis ---');
fprintf('Total Elements Processed: %d\n', N);
fprintf('Parallel Threads Utilized (Simulated): %d\n', feature('numcores'));

%% Result Verification
if isequal(C_cpu, C_gpu)
    disp('Results are equal: Correct Execution');
else
    disp('Results differ: Check computation');
end

