#!/bin/bash
### How to use:
### ./save-status.sh status_key status_value
### Examples:
### ./save-status.sh "bla.bla.bla" "connected"
### ./save-status.sh "hlo.hlo.hlo" "timeout"

sendToOutput(){
  echo $1
}

saveToFile(){
  FILE_PATH=$1
  FILE_NAME=$2
  FILE_CONTENT=$3

  if [ ! -d ${FILE_PATH} ]; then
    mkdir -p ${FILE_PATH};
  fi

  echo ${FILE_CONTENT} > ${FILE_PATH}/${FILE_NAME}
}

main(){
  KEY=$1
  VALUE=$2
  OUTPUT_JSON="{\"${KEY}\":\"${VALUE}\"}"
  OUTPUT_PATH=./status

  sendToOutput ${OUTPUT_JSON}
  saveToFile ${OUTPUT_PATH} "${KEY}.json" ${OUTPUT_JSON}
}

main $@
