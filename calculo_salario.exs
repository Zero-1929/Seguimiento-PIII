# calculo salario empleado

defmodule CalculoSalario do
  def main do
    Util.show_message("Calculo de Salario del empleado")
    nombre = pedir_nombre()
    salario_base = pedir_salario_base()
    horas_extras = pedir_horas_extras()
    calcular_salario_total(nombre, salario_base, horas_extras)
  end

  def pedir_nombre do
    nombre = Util.input("Ingrese su nombre: ", :string)
    IO.puts "Su nombre es: #{nombre}"
    nombre
  end

  def pedir_salario_base do
    salario_base = Util.input("Ingrese su salario base: ", :float)
    IO.puts "Su salario base es: #{salario_base}"
    salario_base

  end

  def pedir_horas_extras do
    horas_extras = Util.input("Ingrese las horas extras trabajadas: ", :integer)
    IO.puts "La cantidad de horas extras trabajadas es: #{horas_extras}"
    horas_extras
  end

  def calcular_salario_total(nombre, salario_base, horas_extras) do
    horas_extras_pagadas = horas_extras * 1.5
    salario_total = salario_base + horas_extras_pagadas
    Util.show_message("El salario total de #{nombre} es de: #{salario_total}")
  end
end

CalculoSalario.main()
