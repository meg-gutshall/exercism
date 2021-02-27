class ResistorColorDuo

  @@map = {
    black: "0",
    brown: "1",
    red: "2",
    orange: "3",
    yellow: "4",
    green: "5",
    blue: "6",
    violet: "7",
    grey: "8",
    white: "9"
  }

  def self.value(colors)
    num = @@map[(colors[0].to_sym)] + @@map[(colors[1].to_sym)]
    num.to_i
  end
end
