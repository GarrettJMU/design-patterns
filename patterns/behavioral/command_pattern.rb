class Command
  def execute
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class SimpleCommand < Command
  def initialize(payload)
    @payload = payload
  end

  def execute
    puts "SimpleCommand: See, I can do simple things like printing (#{@payload})"
  end
end

class ComplexCommand < Command
  # Complex commands can accept one or several receiver objects along with any
  # context data via the constructor.
  def initialize(receiver, a, b)
    @receiver = receiver
    @a = a
    @b = b
  end

  # Commands can delegate to any methods of a receiver.
  def execute
    print 'ComplexCommand: Complex stuff should be done by a receiver object'
    @receiver.do_something(@a)
    @receiver.do_something_else(@b)
  end
end

# The Receiver classes contain some important business logic. They know how to
# perform all kinds of operations, associated with carrying out a request. In
# fact, any class may serve as a Receiver.
class Receiver
  def do_something(a)
    print "\nReceiver: Working on (#{a}.)"
  end

  def do_something_else(b)
    print "\nReceiver: Also working on (#{b}.)"
  end
end

class Invoker
  def on_start=(command)
    @on_start = command
  end

  def on_finish=(command)
    @on_finish = command
  end

  def do_something_important
    puts 'Invoker: Does anybody want something done before I begin?'
    @on_start.execute if @on_start.is_a? Command

    puts 'Invoker: ...doing something really important...'

    puts 'Invoker: Does anybody want something done after I finish?'
    @on_finish.execute if @on_finish.is_a? Command
  end
end

invoker = Invoker.new
invoker.on_start = SimpleCommand.new('Say Hi!')
receiver = Receiver.new
invoker.on_finish = ComplexCommand.new(receiver, 'Send email', 'Save report')

invoker.do_something_important
