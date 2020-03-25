#!/bin/bash
 
NOW=$(date +"%m-%d-%Y-%H")
yamels_name="${1}-yamels-${NOW}"
helm template $1 > ${yamels_name}
directory_name="images-${NOW}"
mkdir -p ${directory_name} 

for i in $(egrep -v "^$|^[[:space:]]*#" ${yamels_name} |grep "image: "  |awk '{print $2}'| sed 's/"//g'); do
  image_repo_name="${i}"
  echo ${image_repo_name}
  image_name=$(basename ${image_repo_name})
  file_to_save=$(echo "${image_name}" | sed s/\\./-/g | sed s/\\:/_/g) 
  echo ${file_to_save}
  sudo docker pull $i;
  sudo docker save $i -o ${directory_name}/${file_to_save}
done




###    for line in $(sudo docker images | awk '{print $1":"$2}')

###    do
#  sudo docker save $line | gzip >
###      IMAGE_NAME=$($line | sed 's/.*\///' | sed 's/:.*//')
###      echo "$IMAGE_NAME"
#  echo $line | sed 's/.*\///g' | sed 's//\.*//'
###    done

# sudo docker images | awk '{print $1":"$2}' | sed 's/.*\///' | sed 's/:.*//'

