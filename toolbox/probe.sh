#!/bin/bash

SESSION=phoenix_log

process=$1

workers=$(ps -e | grep $process | awk '{ print $NF }') # as a list
worker_array=($workers) # as an array

#echo $workers

number_of_workers=$(echo $workers | awk '{ print NF-1 }')

# make a new tmux session
tmux new-session -s $SESSION -d


for worker in $(seq 0 $number_of_workers); do
  # create a windows for each session
  tmux new-window -t phoenix_log -n worker_${worker}

  #echo "$worker: " "'${worker_array[$worker]}'"
done

for worker in $(seq 1 $number_of_workers); do
  # and combine all the windows into a single window with
  # multiple panes.  Re-tile every windows to work around
  # minimum pane size limitations in tmux.
  tmux join-pane -t phoenix_log:worker_0 -s :worker_${worker} 
  tmux select-layout -t phoenix_log tiled

  #echo "$worker: " "'${worker_array[$worker]}'"
done


