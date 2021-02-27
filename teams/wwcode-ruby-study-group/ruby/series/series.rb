class Series
  attr_accessor :string

  def initialize(string)
    @string=string
  end

  def slices(num)
    l = self.string.length
    raise ArgumentError.new(
      "Slice length #{num} must be <= string length #{l}"
    ) if num > l
    series_array = []
    l = l - num + 1
    i = 0
    l.times do
      series_array << string.slice(i, num)
      i += 1
    end
    series_array
  end
end