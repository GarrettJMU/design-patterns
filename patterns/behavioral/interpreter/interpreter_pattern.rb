##Setting up classes to be used (this is similar to command patter pretty sure)

class Number
  def initialize(value)
    @value = value
  end

  def execute
    @value
  end
end

class Plus
  def initialize(left, right)
    @left = left
    @right = right
  end

  def execute
    @left.execute + @right.execute
  end
end

class Minus
  def initialize(left, right)
    @left = left
    @right = right
  end

  def execute
    @left.execute - @right.execute
  end
end

class Multiply
  def initialize(left, right)
    @left = left
    @right = right
  end

  def execute
    @left.execute * @right.execute
  end
end

def parse(input)
  stack = []

  input.lstrip!
  while input.length > 0
    case input
    when /\A-?\d+(\.\d+)?/
      stack << Number.new($&.to_i)
    else
      second, first = stack.pop(), stack.pop()

      case input
      when /\A\+/
        stack << Plus.new(first, second)
      when /\A\-/
        stack << Minus.new(first, second)
      when /\A\*/
        stack << Multiply.new(first, second)
      else
        raise 'Token unknown'
      end
    end

    input = $'
    input.lstrip!
  end

  raise 'Syntax error' unless stack.size == 1

  stack.first.execute
end

# calculate reverse polish notation
parse('4 5 2 + *')
