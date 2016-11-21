defmodule Physics.Rocketry do
  import Converter

@moduledoc """
           g    = Gravitational Constant
           gmr  = Grav Const, Mass, Radius
           vms  = Velocity Meters per Second
           vkms = Velocity Kilometers per Second
           """
  
  @moon %{mass: 7.35e22, radius: 1.738e6}
  @mars %{mass: 6.39e23, radius: 3.4e6}
  @earth %{mass: 5.972e24, radius: 6.371e6}
  @newtons_constant 6.67e-11

  def escape_velocity(:moon) do
    @moon  
      |> escape_velocity
  end

  def escape_velocity(:mars) do
    @mars
      |> escape_velocity
  end

  def escape_velocity(:earth) do
    @earth    
      |> escape_velocity
  end        
  

  def escape_velocity(planet) when is_map(planet) do
    planet 
      |> calculate_escape
      |> Converter.to_km
      |> Converter.round_to_nearest_tenth
  end


  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * @newtons_constant * mass / radius
      |> :math.sqrt
  end
end

