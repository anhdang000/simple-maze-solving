# Solving Simple Maze Using Q-Learning

# Table of contents
1. [Introduction](#introduction)
2. [Usage](#usage)
    1. [Initialize and train](#init_train)
    2. [Visualize the result](#visualize)
4. [Training](#training)
5. [Evaluation](#evaluation)

## 1. Introduction <a name="introduction"></a>
The maze is generated randomly. My implementation is to find a way to the <b>GOAL</b> (located at bottom-right of the maze) from <b>START</b> cell.
Q-Learning algorithm is simply illustrated in the following figure:
![](https://github.com/anhdang000/simple-maze-solving/blob/master/q-learning-algorithm.png)

Obatacles on the maze are generated with random positions. Here is an example of my work:

![](https://github.com/anhdang000/simple-maze-solving/blob/master/maze.png)

## 2. Usage <a name="usage"></a>
### 2.1. Initialize and train <a name="init_train"></a>

Run `maze_solving.m` for implementing on a randomly generated environment. Initial maze will be saved in `maze.png`. Learned optimal Q values will be saved in `q.mat` as a 2D matrix. Time steps spended on an episode throughtout the training process will be stored in `train_efficiency.mat` as well.

### 2.2. Visualize the result <a name="visualize"></a>

Run `Visualization.m` for result visualization. The script is to provide illustrations for 3 situations corresponding to 3 specific start points for the agent.

## 3. Training <a name="training"></a>
Training log linegraph that illustrates the training efficiency of the algorithm.

![](https://github.com/anhdang000/simple-maze-solving/blob/master/training_log.png)

The algorithm lets the agent to find the whole way by itself from scratch. At early episodes, time interval spending on an episode is extremely costly. In a worse case, these numbers are more considerable. The problem can be slightly solved by increasing `epsilon` for actions balancing.

## 4. Evaluation <a name="evaluation"></a>
I randomly generate start points for the agent to show its understanding about the learned maze.

<b> First case: </b>

![](https://github.com/anhdang000/simple-maze-solving/blob/master/1.png)

<b> Second case: </b>

![](https://github.com/anhdang000/simple-maze-solving/blob/master/2.png)

<b> Third case: </b>

![](https://github.com/anhdang000/simple-maze-solving/blob/master/3.png)
