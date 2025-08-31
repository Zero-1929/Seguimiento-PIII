# calculo paquete.exs

defmodule CostoEnvioPaquete do
  # Programa 6: Cálculo del Costo de Envío de un Paquete
  # Retorna {cliente, peso, tipo_envio, costo_total}

  def main do
    Util.show_message("Cálculo del Costo de Envío de un Paquete")

    cliente = pedir_cliente()
    peso = pedir_peso()
    tipo_envio = pedir_tipo_envio()

    costo_total = calcular_costo(peso, tipo_envio)

    # Mostrar resultado (2 decimales para claridad)
    costo_txt = :erlang.float_to_binary(costo_total, decimals: 2)
    Util.show_message("#{cliente}, el costo total de envío (#{tipo_envio}) para #{peso} kg es: $#{costo_txt}")

    {cliente, peso, tipo_envio, costo_total}
  end

  # === Entradas ===

  def pedir_cliente do
    nombre = Util.input("Ingrese el nombre del cliente:", :string)
    IO.puts("Cliente: #{nombre}")
    nombre
  end

  def pedir_peso do
    # Usamos if para validar de forma sencilla
    peso = Util.input("Ingrese el peso del paquete en kg:", :float)

    if peso >= 0 do
      IO.puts("Peso: #{peso} kg")
      peso
    else
      Util.show_message("El peso debe ser mayor o igual a 0.")
      pedir_peso()
    end
  end

  def pedir_tipo_envio do
    tipo = Util.input("Ingrese el tipo de envío (Económico, Express, Internacional):", :string)
    tipo_norm = tipo |> String.trim() |> String.downcase()

    # case con pattern matching sobre cadenas normalizadas
    case tipo_norm do
      "económico" -> "Económico"
      "economico" -> "Económico"
      "express"   -> "Express"
      "internacional" -> "Internacional"
      _ ->
        Util.show_message("Tipo inválido. Escriba Económico, Express o Internacional.")
        pedir_tipo_envio()
    end
  end

  # === Cálculo ===

  @doc """
  Calcula el costo total según el tipo de envío.
  - Económico:  $5,000 por kg
  - Express:    $8,000 por kg
  - Internacional:
      si peso <= 5 kg -> $15,000 por kg
      si peso > 5 kg  -> $12,000 por kg
  """
  def calcular_costo(peso, "Económico") when is_number(peso) do
    5_000 * peso
  end

  def calcular_costo(peso, "Express") when is_number(peso) do
    8_000 * peso
  end

  def calcular_costo(peso, "Internacional") when is_number(peso) do
    # cond para seleccionar la tarifa por kg dependiendo del peso
    tarifa_por_kg =
      cond do
        peso <= 5 -> 15_000
        peso > 5  -> 12_000
      end

    tarifa_por_kg * peso
  end
end

CostoEnvioPaquete.main()
