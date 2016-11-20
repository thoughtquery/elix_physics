defmodule Physics.Rocketry do
@moduledoc """
           g    = Gravitational Constant
           gmr  = Grav Const, Mass, Radius
           vms  = Velocity Meters per Second
           vkms = Velocity Kilometers per Second
           """
           



  def escape_velocity(planet) when is_map(planet) do
    planet 
      |> calculate_escape
      |> convert_to_km
      |> round_to_nearest_tenth
  end

  defp rounded_to_nearest_tenth(val) do
   Float.ceil(val,1)
  end

  defp convert_to_km(val) do
    val / 1000
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    newtons_constant = 6.67e-11
    2 * newtons_constant * mass / radius
      |> :math.sqrt
  end
end

