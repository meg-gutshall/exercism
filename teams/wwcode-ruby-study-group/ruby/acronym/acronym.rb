class Acronym
  def self.abbreviate(string)
    string.upcase.scan(/\b\w/).join
  end
end