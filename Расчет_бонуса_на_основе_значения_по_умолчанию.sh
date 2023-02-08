#! /bin/bash

# Получите базовое пособие, арендную плату за дом и медицинское пособие сотрудника
echo "Введите базовую зарплату:"
read basic
echo "Введите арендную плату за дом:"
read rent
echo арендной платы "Введите медицинское пособие:"
read medical

#Declare для расчета заработной платы с бонусной
functioncalculate_salary()
{
# Установка значения
bonus=${1:-5}

# Расчет бонуса

bonusAmount=$((basic*bonus/100))

# Расчет общей заработной платы
total=$((basic+rent+medical+bonusAmount))

# Распечатать общую зарплату с суммой бонуса

echo "Общая зарплата с бонусом $bonus % составляет $total"
}

# Функция вызова без процента бонуса
calculate_salary

# Функция вызова с процентным соотношением бонус
calculate_salary 10
