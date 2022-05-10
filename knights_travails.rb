class Node
  def validator(*point)
    valid_range = (1..8)
    point.each do |x, y|
      if valid_range.include?(x) && valid_range.include?(y)
        true
      else
        false
      end
    end
  end
end

p Node.new.validator([1,9])