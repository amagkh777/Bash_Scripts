#!/bin/bash

echo -n "Введите имя планеты: "

read PLANET

case $PLANET in

Mercury | Venus | Earth | Mars | Jupiter | Saturn | Uranus | Neptune)

echo "$PLANET это планета из солнечной системы"

;;

Pluto)

echo "$PLANET является карликовой планетой"

;;

"Planet Nine")

echo "$PLANET еще не обнаружено"

;;

*)

echo "Не из солнечной системы"

;;
esac
