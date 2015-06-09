class Array
  def all_values_match?
    self.uniq.length == 1
  end

  def any_nil?
    self.any? { |item| item.nil? }
  end
end