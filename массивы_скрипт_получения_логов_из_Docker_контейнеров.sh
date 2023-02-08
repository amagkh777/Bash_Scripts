#!/usr/bin/env bash

# To catch STDERR and STDOUT from each Docker container with $API_SERVICES
# to a propriate log file from $API_LOGS
# run: tail -f *.log to watch them
# объявляем два именованных массива
declare -A API_SERVICES
declare -A API_LOGS

# наполняем их
API_SERVICES=( [GATEWAY]=api-gateway \
    [PRODUCERS]=producers \
    [CONFIGURATION]=configuration \
    [PROFILE]=profile \
    [AUTHSERVER]=oauth2-authserver )

API_LOGS=( [GATEWAY]=gateway.log \
    [PRODUCERS]=producers.log \
    [CONFIGURATION]=configuration.log \
    [PROFILE]=profile.log \
    [AUTHSERVER]=authserver.log )

# получаем имя ключа из массива (GATEWAY и т.д.)
for service in ${!API_SERVICES[@]}; do

    # используя имя ключа в виде имени сервиса - получаем значение этой пары ключ-значение
    # например, для GATEWAY - это будет api-gateway
    # по значению находим контейнер (grep), и получаем его ID (awk - print первое поле)
    container_id=$(docker ps | grep ${API_SERVICES[$service]} | awk '{print $1}')

    # используя имя ключа в виде имени сервиса - находим в массиве API_LOGS значение
    # например, для GATEWAY - это будет gateway.log
    log_name=${API_LOGS[$service]}
    echo Service: $service Container ID: $container_id Log file: $log_name

    # и используя $container_id (666555444) и $log_name (gateway.log)
    # выполняем docker logs -f перенаправляя STDERR и STDOUT в соответствующий файл
    docker logs -f $container_id >> $log_name 2>&1 &
done
