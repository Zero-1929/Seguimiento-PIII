defmodule RegistroVehiculosPeaje do
  def main do
    Util.show_message("Registro de Vehículos en Peaje")

    placa = pedir_placa()
    tipo  = pedir_tipo()
    peso  = pedir_peso()

    {placa_r, tipo_r, tarifa} = calcular_tarifa(placa, tipo, peso)

    Util.show_message("Vehículo #{placa_r} (#{tipo_r}) debe pagar $#{tarifa}")
    {placa_r, tipo_r, tarifa}
  end

  # === Entradas ===

  def pedir_placa do
    placa = Util.input("Ingrese la placa del vehículo:", :string)
    IO.puts("Placa: #{placa}")
    placa
  end

  def pedir_tipo do
    tipo = Util.input("Ingrese el tipo de vehículo (Carro, Moto, Camión):", :string)
    tipo_limpio = tipo |> String.trim() |> String.downcase()

    case tipo_limpio do
      "carro"   -> "Carro"
      "moto"    -> "Moto"
      "camion"  -> "Camión"   # sin tilde
      "camión"  -> "Camión"   # con tilde
      _ ->
        Util.show_message("Tipo inválido. Escriba Carro, Moto o Camión.")
        pedir_tipo()
    end
  end

  def pedir_peso do
    peso = Util.input("Ingrese el peso del vehículo en toneladas:", :float)
    IO.puts("Peso: #{peso} t")
    peso
  end

  # === Cálculo ===

  # Retorna una tupla con {placa, tipo, tarifa_final}
  def calcular_tarifa(placa, "Carro", _peso), do: {placa, "Carro", 10_000}
  def calcular_tarifa(placa, "Moto",  _peso), do: {placa, "Moto",   5_000}

  def calcular_tarifa(placa, "Camión", peso) do
    # Base 20,000 + 2,000 por tonelada adicional (peso puede ser real)
    adicional = round(2_000 * peso)
    {placa, "Camión", 20_000 + adicional}
  end
end

RegistroVehiculosPeaje.main()
