# The Abstraction defines the interface for the "control" part of the two class
# hierarchies. It maintains a reference to an object of the Implementation
# hierarchy and delegates all of the real work to this object.
class Abstraction
  def initialize(implementation)
    @implementation = implementation
  end

  def operation
    "Abstraction: Base operation with:\n #{@implementation.operation_implementation}"
  end
end

# You can extend the Abstraction without changing the Implementation classes.
class ExtendedAbstraction < Abstraction
  def operation
    "ExtendedAbstraction: Extended operation with:\n #{@implementation.operation_implementation}"
  end
end

# The Implementation defines the interface for all implementation classes. It
# doesn't have to match the Abstraction's interface. In fact, the two interfaces
# can be entirely different. Typically the Implementation interface provides
# only primitive operations, while the Abstraction defines higher-level
# operations based on those primitives.
class Implementation
  def operation_implementation
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

# Each Concrete Implementation corresponds to a specific platform and implements
# the Implementation interface using that platform's API.
class ConcreteImplementationA < Implementation
  def operation_implementation
    'ConcreteImplementationA: Here\'s the result on the platform A.'
  end
end

class ConcreteImplementationB < Implementation
  def operation_implementation
    'ConcreteImplementationB: Here\'s the result on the platform B.'
  end
end

# Except for the initialization phase, where an Abstraction object gets linked
# with a specific Implementation object, the client code should only depend on
# the Abstraction class. This way the client code can support any abstraction-
# implementation combination.
def client_code(abstraction)
  # ...

  print abstraction.operation

  # ...
end

# The client code should be able to work with any pre-configured abstraction-
# implementation combination.

implementation = ConcreteImplementationA.new
abstraction = Abstraction.new(implementation)
client_code(abstraction)


implementation = ConcreteImplementationB.new
abstraction = ExtendedAbstraction.new(implementation)
client_code(abstraction)
