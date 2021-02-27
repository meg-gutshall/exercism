class Gigasecond
  def initialize
    @time=time
  end

  def self.from(time)
    # seconds = time.to_i + 1000000000
    # local = Time.at(seconds)
    # giga = local.getutc
    time + 1000000000
  end
end