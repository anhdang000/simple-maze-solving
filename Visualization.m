
clear; close all; clc
load('maze.mat');
load('q.mat');
load('train_efficiency.mat');
n = size(maze, 1);
goal = n*n;
for s=1:3
    figure;
    while(1)
        start = randi([1 goal-1]);
        disp(start);
        if max(start==find(reshape(maze, 1, goal)<0))==0
            break;
        end
    end
    
    x_start = ceil(start / n);
    y_start = mod(start, n);
    if y_start == 0
        y_start = 10;
    end
    
    [n, ~] = size(maze);
    goal = n*n;
    value = 1;
    blocked_value = -50;
    cur_state = start;
    path = [];

    imagesc(maze);
    colormap('Summer');
    title('Solution');
    grid on;
    text(x_start, y_start, 'START', 'HorizontalAlignment', 'center');
    text(n, n, 'GOAL', 'HorizontalAlignment', 'center');
    [x_obs, y_obs] = find(maze'==blocked_value);
    text(x_obs, y_obs, 'X', 'HorizontalAlignment', 'center');
    
    X = [x_start];
    Y = [y_start];
    while cur_state ~= goal
        [~, action] = max(q(cur_state, :));
        path = horzcat(path, action);

        x = ceil(action / n);
        y = mod(action, n);
        if y == 0
            y = 10;
        end
        
        X = horzcat(X, x);
        Y = horzcat(Y, y);
        cur_state = action;
    end
    
    hold on;
    plot(X, Y, 'LineWidth', 1);
    text(X, Y, '\bullet', 'HorizontalAlignment', 'center', 'VerticalAlignment', 'middle', 'Color', 'r', 'FontSize', 20);
end
