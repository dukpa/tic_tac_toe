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
end