class BoardHash < Hash
  def initialize
    super
    self[:a] = [nil, nil, nil]
    self[:b] = [nil, nil, nil]
    self[:c] = [nil, nil, nil]
  end

  def column(index)
    col = []
    self.each { |row, cells| col << cells[index] }
    col
  end

  def columns
    columns = Hash.new
    (0..2).each { |i| columns[i] = column(i)}
    columns
  end

  def cross_left
    [self[:a][0], self[:b][1], self[:c][2]]
  end

  def cross_right
    [self[:a][2], self[:b][1], self[:c][0]]
  end

  def crosses
    {left: cross_left, right: cross_right}
  end
end