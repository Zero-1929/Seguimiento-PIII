# calculo_combustible.exs
defmodule CalculoCombustible do
  def main do
     Util.show_message("Calculando el combustible de un vehiculo")
     pedir_nombre()
     distancia = pedir_distancia()
     cantidad_combustible = pedir_cantidad_combustible()
     calcular_rendimiento(distancia, cantidad_combustible)
  end

  def pedir_nombre do
    nombre = Util.input("Ingrese su nombre señor conductor:", :string)
    IO.puts "Su nombre es: #{nombre}"
  end

  def pedir_distancia do
    distancia = Util.input("Ingrese la distancia que recorrio en km:", :float)
    IO.puts "Su distancia es: #{distancia} km"
    distancia
  end

  def pedir_cantidad_combustible do
    cantidad_combustible = Util.input("Ingrese la cantidad de combustible consumido en litros:", :float)
    IO.puts "Su cantidad de combustible es: #{cantidad_combustible} litros"
    cantidad_combustible
  end

  def calcular_rendimiento(distancia, cantidad_combustible) do
    rendimiento = distancia / cantidad_combustible
    rendimiento_redondeado = :erlang.float_to_binary(rendimiento, decimals: 2)
    Util.show_message("El rendimiento de su vehiculo es: #{rendimiento_redondeado} km/l")
  end
end

CalculoCombustible.main()
