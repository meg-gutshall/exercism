=begin
Write your code for the 'Space Age' exercise in this file. Make the tests in
`space_age_test.rb` pass.

To get started with TDD, see the `README.md` file in your
`ruby/space-age` directory.
=end

class SpaceAge
  attr_accessor :seconds

  def initialize(seconds)
    @seconds = seconds.to_f
    @earth_year = 31557600.00
  end

  # REFACTORED CODE

  def calculate_age(method_name)
    one_year = {
      on_earth: 31557600.00,
      on_mercury: one_year[on_earth] * 0.2408467,
      on_venus: one_year[on_earth] * 0.61519726,
      on_mars: one_year[on_earth] * 1.8808158,
      on_jupiter: one_year[on_earth] * 11.862615,
      on_saturn: one_year[on_earth] * 29.447498,
      on_uranus: one_year[on_earth] * 84.016846,
      on_neptune: one_year[on_earth] * 164.79132
    }

    @seconds / one_year[method_name]
  end

  # ORIGINAL SOLUTION

  def on_earth
    @seconds / @earth_year
  end

  def on_mercury
    @seconds / (@earth_year * 0.2408467)
  end

  def on_venus
    @seconds / (@earth_year * 0.61519726)
  end

  def on_mars
    @seconds / (@earth_year * 1.8808158)
  end

  def on_jupiter
    @seconds / (@earth_year * 11.862615)
  end

  def on_saturn
    @seconds / (@earth_year * 29.447498)
  end

  def on_uranus
    @seconds / (@earth_year * 84.016846)
  end

  def on_neptune
    @seconds / (@earth_year * 164.79132)
  end
end