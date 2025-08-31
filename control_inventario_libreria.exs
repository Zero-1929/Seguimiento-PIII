# control_inventario_libreria.exs

defmodule ControlInventarioLibreria do
  def main do
    Util.show_message("Bienvenido al Control de Inventario de la Librería")
    titulo = pedir_titulo()
    cantidad_unidades = cantidad_unidades_disponibles()
    precio = pedir_precio()
    calcular_valor_inventario(titulo, cantidad_unidades, precio)
  end

  def pedir_titulo do
    titulo = Util.input("Ingrese el título del libro:", :string)
    IO.puts "El título del libro es: #{titulo}"
    titulo
  end

  def cantidad_unidades_disponibles do
    cantidad_unidades = Util.input("Ingrese la cantidad de unidades disponibles:", :integer)
    IO.puts "La cantidad de unidades disponibles es de: #{cantidad_unidades}"
    cantidad_unidades
  end

  def pedir_precio do
    precio = Util.input("Ingrese el precio del libro:", :float)
    IO.puts "El precio del libro es de: #{precio}"
    precio
  end

  def calcular_valor_inventario(titulo, cantidad_unidades, precio) do
    valor_inventario = cantidad_unidades * precio
    valor_inventario_redondeado = :erlang.float_to_binary(valor_inventario, decimals: 3)
    Util.show_message("El libro #{titulo} tiene #{cantidad_unidades} unidades disponibles y un valor total de: #{valor_inventario_redondeado}")
  end
end

ControlInventarioLibreria.main()
