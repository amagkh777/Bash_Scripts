##!/bin/bash
# Генерируется случайное с помощью `shuf` команды
echo "How many random numbers do you want to generate?:"
read number

#Print сгенерированные случайные числа
echo "The generated random numbers are:"
for n in `seq "$number"`
do
randomNumber=$(shuf -i 1-100 -n1)
echo $randomNumber
done
