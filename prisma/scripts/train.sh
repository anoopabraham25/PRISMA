#!/bin/bash  

## Training DQN

#For running different agents, add the following arg:
# --agent_type=sp \   #e.g., for Shortest Path agent
example='abilene'
cd ..

python3 main.py --simTime=30 \
	--basePort=6555 \
	--train=1 \
	--session_name="train"\
	--logs_parent_folder=examples/$example/ \
	--traffic_matrix_path=examples/$example/traffic_matrices/node_intensity_normalized.txt \
	--adjacency_matrix_path=examples/$example/adjacency_matrix.txt \
	--node_coordinates_path=examples/$example/node_coordinates.txt \
	--training_step=0.007 \
	--batch_size=512 \
	--lr=1e-4 \
	--exploration_final_eps=0.1 \
	--exploration_initial_eps=1.0 \
	--iterationNum=3000 \
	--gamma=1 \
	--training_trigger_type="time" \
	--save_models=1 \
	--start_tensorboard=1 \
	--load_factor=0.5 \
	--logging_timestep=15
sleep 5

rm -r ../ns3-gym/scratch/prisma
