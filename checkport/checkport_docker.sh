#!/bin/bash

main() {
    declare -a arrPort=()

    get_ports_as_array

    is_port_in_array 8080
    is_port_in_array 8081
    is_port_in_array 8181
    is_port_in_array 8082

    list_port_array "${!arrPort[@]}"
    
}

get_ports_as_array(){
    for container in $(docker ps -aq); do
        IFS=$'\n'
        for container_port in $(docker port $container); do
            arrPort+=([${container_port#*:}]=1)
        done;
    done;
}

is_port_in_array(){
    [[ -n "${arrPort[$1]}" ]] && printf '%s is in array\n' "$1" || printf '%s is not in array\n' "$1"
}

list_port_array(){
    local array=($@)
    echo "Array: ${!array[@]}"
    for i in "${!array[@]}"
    do
        echo "key  : $i"
        echo "value: ${array[$i]}"
    done
}


main $@