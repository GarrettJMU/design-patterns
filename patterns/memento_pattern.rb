class Originator
  attr_accessor :state
  private :state

  def initialize(state)
    @state = state
    puts "Originator: My initial state is: #{@state}"
  end

  def do_something
    puts 'Originator: I\'m doing something important.'
    @state = generate_random_string(30)
    puts "Originator: and my state has changed to: #{@state}"
  end

  private def generate_random_string(length = 10)
    ascii_letters = [*'a'..'z', *'A'..'Z']
    (0...length).map { ascii_letters.sample }.join
  end

  # Saves the current state inside a memento.
  def save
    ConcreteMemento.new(@state)
  end

  # Restores the Originator's state from a memento object.
  def restore(memento)
    @state = memento.state
    puts "Originator: My state has changed to: #{@state}"
  end
end

# The Memento interface provides a way to retrieve the memento's metadata, such
# as creation date or name. However, it doesn't expose the Originator's state.
class Memento
  def name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def date
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ConcreteMemento < Memento
  def initialize(state)
    @state = state
    @date = Time.now.strftime('%F %T')
  end

  attr_reader :state

  def name
    "#{@date} / (#{@state[0, 9]}...)"
  end

  attr_reader :date
end

class Caretaker
  def initialize(originator)
    @mementos = []
    @originator = originator
  end

  def backup
    puts "\nCaretaker: Saving Originator's state..."
    @mementos << @originator.save
  end

  def undo
    return if @mementos.empty?

    memento = @mementos.pop
    puts "Caretaker: Restoring state to: #{memento.name}"

    begin
      @originator.restore(memento)
    rescue StandardError
      undo
    end
  end

  def show_history
    puts 'Caretaker: Here\'s the list of mementos:'
    @mementos.each { |memento| puts memento.name }
  end
end

originator = Originator.new('Super-duper-super-puper-super.')
caretaker = Caretaker.new(originator)

caretaker.backup
originator.do_something

caretaker.backup
originator.do_something

caretaker.backup
originator.do_something

caretaker.show_history
caretaker.undo
caretaker.undo
