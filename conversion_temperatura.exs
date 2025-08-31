# conversión de unidades de temperatura

defmodule ConversionTemperatura do
  def main do
    Util.show_message("Conversión de unidades de temperatura")
    nombre = pedir_nombre()
    temperatura_celsius =pedir_temperatura_celsius()
    convertir_temperatura(nombre, temperatura_celsius)
  end

  def pedir_nombre do
    nombre = Util.input("Ingrese su nombre:", :string)
    IO.puts "Su nombre es: #{nombre}"
    nombre
  end

  def pedir_temperatura_celsius do
    temperatura_celsius = Util.input("Ingrese la temperatura (celsius): ", :float)
    IO.puts "La temperatura en celsius es: #{temperatura_celsius} °C"
    temperatura_celsius
  end

  def convertir_temperatura(nombre, temperatura_celsius) do
    temperatura_fahrenheit = (temperatura_celsius * 9/5) + 32
    temperatura_kelvin = temperatura_celsius + 273.15
    Util.show_message(" #{nombre}, la temperatura es:\n" <>
      " #{temperatura_fahrenheit} °F\n" <>
      " #{temperatura_kelvin} °K")
  end



end

ConversionTemperatura.main()
