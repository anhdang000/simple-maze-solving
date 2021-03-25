# Solving Simple Maze Using Q-Learning

## 1. Introduction
The maze is generated randomly. My implementation is to find a way to the <b>GOAL</b> (located at bottom-right of the maze) from <b>START</b> cell.
Q-Learning algorithm is illustrated in the following figure:
![](https://github.com/anhdang000/simple-maze-solving/blob/master/q-learning-algorithm.png)

![](https://github.com/anhdang000/simple-maze-solving/blob/master/maze.png)

## 2. Training
Training log linegraph that illustrates the training efficiency of the algorithm.

![](https://github.com/anhdang000/simple-maze-solving/blob/master/training_log.png)

The algorithm let the agent to find the whole way by itself from scratch. At early episodes, time intervals spending on an episode is extremely costly. In a worse case, these numbers are more considerable. The problem can be slightly solved 

## 3. Evaluation
I randomly generate start points for the agent to show its understanding about the learned maze.

<b> First case: </b>

![](https://github.com/anhdang000/simple-maze-solving/blob/master/1.png)

<b> Second case: </b>

![](https://github.com/anhdang000/simple-maze-solving/blob/master/2.png)

<b> Third case: </b>

![](https://github.com/anhdang000/simple-maze-solving/blob/master/3.png)
