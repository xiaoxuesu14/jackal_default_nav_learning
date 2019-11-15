#!/bin/bash         

while getopts x:t:o:p:g: option
do
case "${option}"
in
x) VX_SAMPLES_VALUE=${OPTARG};; # default 6
t) VTHETA_SAMPLES_VALUE=${OPTARG};; # default 20
o) OCCDIST_SCALE_VALUE=${OPTARG};; # default 0.1
p) PDIST_SCALE_VALUE=${OPTARG};; # default 0.75
g) GDIST_SCALE_VALUE=${OPTARG};; # default 1.0

esac
done

source /home/xuesu/jackal_ws/devel/setup.bash

#param_name="vx_samples"
#param_value=6
#sed -i "/^\([[:space:]]*$param_name: \).*/s//\1$param_value/" /home/xuesu/jackal_ws/evaluation/params/base_local_planner_params.yaml

#param_name="vtheta_samples"
#param_value=20
#sed -i "/^\([[:space:]]*$param_name: \).*/s//\1$param_value/" /home/xuesu/jackal_ws/evaluation/params/base_local_planner_params.yaml

sed -i "/^\([[:space:]]*vx_samples: \).*/s//\1$VX_SAMPLES_VALUE/" /home/xuesu/jackal_ws/evaluation/params/base_local_planner_params.yaml

sed -i "/^\([[:space:]]*vtheta_samples: \).*/s//\1$VTHETA_SAMPLES_VALUE/" /home/xuesu/jackal_ws/evaluation/params/base_local_planner_params.yaml

sed -i "/^\([[:space:]]*occdist_scale: \).*/s//\1$OCCDIST_SCALE_VALUE/" /home/xuesu/jackal_ws/evaluation/params/base_local_planner_params.yaml

sed -i "/^\([[:space:]]*pdist_scale: \).*/s//\1$PDIST_SCALE_VALUE/" /home/xuesu/jackal_ws/evaluation/params/base_local_planner_params.yaml

sed -i "/^\([[:space:]]*gdist_scale: \).*/s//\1$GDIST_SCALE_VALUE/" /home/xuesu/jackal_ws/evaluation/params/base_local_planner_params.yaml
