class Context
  # A reference to the current state of the Context.
  attr_accessor :state
  private :state

  # @param [State] state
  def initialize(state)
    transition_to(state)
  end

  # The Context allows changing the State object at runtime.
  def transition_to(state)
    puts "Context: Transition to #{state.class}"
    @state = state
    @state.context = self
  end

  # The Context delegates part of its behavior to the current State object.

  def request1
    @state.handle1
  end

  def request2
    @state.handle2
  end
end

class State
  attr_accessor :context

  def handle1
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def handle2
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteStateA < State
  def handle1
    puts 'ConcreteStateA handles request1.'
    puts 'ConcreteStateA wants to change the state of the context.'
    @context.transition_to(ConcreteStateB.new)
  end

  def handle2
    puts 'ConcreteStateA handles request2.'
  end
end

class ConcreteStateB < State
  def handle1
    puts 'ConcreteStateB handles request1.'
  end

  def handle2
    puts 'ConcreteStateB handles request2.'
    puts 'ConcreteStateB wants to change the state of the context.'
    @context.transition_to(ConcreteStateA.new)
  end
end

# The client code.

context = Context.new(ConcreteStateA.new)
context.request1
context.request2
