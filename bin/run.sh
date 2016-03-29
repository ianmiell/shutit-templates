#!/bin/bash                                                                                                                                                          
# Example for running                                                                                                                                                
DOCKER=${DOCKER:-docker}                                                                                                                                             
IMAGE_NAME=%s                                                                                                                                                        
CONTAINER_NAME=$IMAGE_NAME                                                                                                                                           
DOCKER_ARGS=''                                                                                                                                                       
while getopts "i:c:a:" opt                                                                                                                                           
do                                                                                                                                                                   
    case "$opt" in                                                                                                                                                   
    i)                                                                                                                                                               
        IMAGE_NAME=$OPTARG                                                                                                                                           
        ;;                                                                                                                                                           
    c)                                                                                                                                                               
        CONTAINER_NAME=$OPTARG                                                                                                                                       
        ;;                                                                                                                                                           
    a)                                                                                                                                                               
        DOCKER_ARGS=$OPTARG                                                                                                                                          
        ;;                                                                                                                                                           
    esac                                                                                                                                                             
done                                                                                                                                                                 
${DOCKER} run -d --name ${CONTAINER_NAME} SHUTIT_TEMPLATE_skel_module_name SHUTIT_TEMPLATE_ports_arg SHUTIT_TEMPLATE_volumes_arg SHUTIT_TEMPLATE_env_arg ${DOCKER_ARGS} ${IMAGE_NAME} SHUTIT_TEMPLATE_dockerfile_entrypoint SHUTIT_TEMPLATE_dockerfile_cmd

