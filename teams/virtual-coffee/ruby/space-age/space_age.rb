class SpaceAge
  attr_accessor :seconds

  def initialize(seconds)
    @seconds = seconds.to_f
    @earth_year = 31557600.00
  end

  # REFACTORED CODE
  def method_missing(method_id)
    calculate_age(method_id)
  end

  def calculate_age(method_name)
    # method_name is a symbol
    one_year = {
      on_earth: @earth_year,
      on_mercury: @earth_year * 0.2408467,
      on_venus: @earth_year * 0.61519726,
      on_mars: @earth_year * 1.8808158,
      on_jupiter: @earth_year * 11.862615,
      on_saturn: @earth_year * 29.447498,
      on_uranus: @earth_year * 84.016846,
      on_neptune: @earth_year * 164.79132
    }

    @seconds / one_year[method_name]
  end

  # ORIGINAL SOLUTION

  # def on_earth
  #   @seconds / @earth_year
  # end

  # def on_mercury
  #   @seconds / (@earth_year * 0.2408467)
  # end

  # def on_venus
  #   @seconds / (@earth_year * 0.61519726)
  # end

  # def on_mars
  #   @seconds / (@earth_year * 1.8808158)
  # end

  # def on_jupiter
  #   @seconds / (@earth_year * 11.862615)
  # end

  # def on_saturn
  #   @seconds / (@earth_year * 29.447498)
  # end

  # def on_uranus
  #   @seconds / (@earth_year * 84.016846)
  # end

  # def on_neptune
  #   @seconds / (@earth_year * 164.79132)
  # end
end