'''
Author: Xuesu Xiao
Date: 10/30/2019
This script compares cmd_vel values from two csv files
'''

from numpy import genfromtxt

def findClosestTimeStep(current_teleop_time, move_base_time):
    step = len(move_base_time) - 1
    for current_mb_time in reversed(move_base_time): # loop reversed
        if current_mb_time < current_teleop_time:
            return step
        step = step - 1
    return 0


teleop_data = genfromtxt('/home/xuesu/jackal_ws/evaluation/timed_teleop_cmd_vel/_slash_bluetooth_teleop_slash_cmd_vel.csv', delimiter=',')
move_base_data = genfromtxt('/home/xuesu/jackal_ws/evaluation/test_output/_slash_cmd_vel.csv', delimiter=',')

teleop_time = teleop_data[1:, 0]
teleop_vx = teleop_data[1:, 2]
teleop_w = teleop_data[1:,8]

move_base_time = move_base_data[1:, 0]
move_base_vx = move_base_data[1:, 2]
move_base_w = move_base_data[1:,8]

idx = 0
current_time_step = 0
sum_squared_error_vx = 0
sum_squared_error_w = 0
for current_teleop_time in teleop_time:
    closest_time_step = findClosestTimeStep(current_teleop_time, move_base_time)
    if current_teleop_time - move_base_time[closest_time_step] <= 250000000:
        error_vx = abs(move_base_vx[closest_time_step]-teleop_vx[current_time_step])
        error_w = abs(move_base_w[closest_time_step]-teleop_w[current_time_step])
    else:
        error_vx = abs(teleop_vx[current_time_step])
        error_w = abs(teleop_w[current_time_step])
    sum_squared_error_vx = sum_squared_error_vx + error_vx**2
    sum_squared_error_w = sum_squared_error_w + error_w**2
    current_time_step = current_time_step + 1

mse_error_vx = sum_squared_error_vx/(current_time_step)
mse_error_w = sum_squared_error_w/(current_time_step)

print(mse_error_vx)
print(mse_error_w)

