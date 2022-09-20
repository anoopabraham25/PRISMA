#!/bin/bash  

#Testing DQN-Routing
cd .. 
example='geant'

#Load factors array. The execution will iterate over the array.
array=(
0.5
1
1.5
2
)
counter=0

#For running different agents, add the following arg:
# --agent_type=sp \   #e.g., for Shortest Path agent
for j in ${array[@]}
	do 
	echo $j
	
    FLOAT=$(echo $j*10000 | bc)
    res1=${FLOAT/.*}
	echo $res1

	python3 main.py --simTime=30 \
		--basePort=$((5655 + (counter*50) )) \
		--train=0 \
		--session_name="test_load_$res1"\
		--logs_parent_folder=examples/$example/ \
		--traffic_matrix_path=examples/$example/traffic_matrices/node_intensity_normalized.txt \
		--adjacency_matrix_path=examples/$example/adjacency_matrix.txt \
		--node_coordinates_path=examples/$example/node_coordinates.txt \
		--load_path=examples/$example/saved_models/q_routing_geant_tiago_lr_1e-4_batch_512_iter_3000_eps_1_step_0_007_load_0_5/iteration1_episode1 \
		--save_models=0 \
		--start_tensorboard=1 \
		--load_factor=$j
	counter=$((counter+1))
	echo $counter
	sleep 5
done





rm -r ../ns3-gym/scratch/prisma
