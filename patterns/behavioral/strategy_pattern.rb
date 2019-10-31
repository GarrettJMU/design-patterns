class Context
  attr_accessor :strategy

  def initialize(strategy)
    @strategy = strategy
  end

  def strategy(strategy)
    @strategy = strategy
  end

  def do_some_business_logic
    puts @strategy.do_algorithm(%w[a b c d e])
  end
end

class Strategy
  def do_algorithm(_data)
    raise NotImplementedError, "Not implemented"
  end
end

class ConcreteStrategyA < Strategy
  def do_algorithm(data)
    data.sort
  end
end

class ConcreteStrategyB < Strategy
  def do_algorithm(data)
    data.sort.reverse
  end
end

context = Context.new(ConcreteStrategyA.new)
context.do_some_business_logic

context.strategy = ConcreteStrategyB.new
context.do_some_business_logic
