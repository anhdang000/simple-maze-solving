%% maze-solving
clear; close all; clc
n = 10;

start = 1;
goal = n*n;

%% Maze initialization
value = 1;
blocked_value = -50;
maze = value * ones(n);
random_prob = rand(n);
threshold = 0.2;
maze(find(random_prob <= threshold)) = blocked_value;
maze(1, 1) = value;        
maze(n, n) = 20;
orig = figure();
imagesc(maze);
text(1, 1, 'START', 'HorizontalAlignment', 'center');
text(n, n, 'GOAL', 'HorizontalAlignment', 'center');
[x_obs, y_obs] = find(maze'==blocked_value);
text(x_obs, y_obs, 'X', 'HorizontalAlignment', 'center');
grid on;
save('maze.mat', 'maze');
saveas(orig, 'maze.png');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% Reward initialization
reward = zeros(n*n);
for i=1:goal
    reward(i, :) = reshape(maze, 1, goal);
end

% Remove all impossible moves
for i=1:n*n
    for j=1:n*n
        if j ~= i-n && j ~= i+n && j ~= i-1 &&j ~= i+1 ...
           && j ~= i-n-1 && j ~= i-n+1 && j ~= i+n-1 && j ~= i+n+1
            reward(i,j) = -Inf;
        end
    end
end

% Prevent agent from breaking the outter bother
% - down side
for k=1:n
    for j=1:n*n
        if j == k*n+1 || j == k*n+n+1 || j == k*n-n+1
            reward(k*n, j) = -Inf;
            reward(j, k*n) = -Inf;
        end
    end
end
% - up side
for k=1:n-1
    for j=1:n*n
        if j == k*n+1-1 || j == k*n+1+n-1 || j == k*n+1-n-1
            reward(k*n+1, j) = -Inf;
            reward(j, k*n+1) = -Inf;
        end
    end
end

%% Q-learning (epsilon-Greedy)
max_iter = 100;
q = randn(size(reward));
q(goal,:) = 0;
q(:,goal) = 0;
alpha = 0.2;
gamma = 0.9;
epsilon = 0.2;
train_efficiency = zeros(max_iter, 2);
for i=1:max_iter  
    train_efficiency(i,1) = i;
    current_state = start;
    record = 1;
    while (1)
        fprintf('Iteration: %d\n', i);
        disp(current_state);
        possible_actions = find(reward(current_state,:)>=0);
        
        % Epsilon-Greedy
        prob = rand(1);
        if prob >= epsilon
            [best_q, idx] =  max(q(current_state,possible_actions));
            next_state = possible_actions(idx);
        else
            next_state = possible_actions(randi([1 length(possible_actions)]));
        end
        
        % Find possible actions for the next state
        next_pos_actions = find(reward(next_state,:)>=0);
        
        % Find max_q at the next state
        max_q = max(q(next_state, next_pos_actions));
        
        delta_q = reward(current_state, next_state) + gamma*max_q - q(current_state, next_state);
        q(current_state, next_state) = q(current_state, next_state) + alpha*delta_q;
        
        if (current_state == goal)
            break;
        end
        current_state = next_state;
        record = record+1;
    end
    train_efficiency(i,2) = record;
end

% Plotting
figure;
plot(train_efficiency(:,1), train_efficiency(:,2), 'Marker', 'o', 'Color', 'r');
title('Training Efficiency');
xlabel('Episode');
ylabel('Time step');
grid on;

% Saving the q matrix
save('q.mat', 'q');
save('train_efficiency.mat', 'train_efficiency');

