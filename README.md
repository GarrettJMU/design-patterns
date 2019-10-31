
# Design Patterns

## Creational Patterns
-   ## Abstract Factory
    -   ### What is is used for:
	    -   Offers the interface for creating a family of related objects, without explicitly specifying their classes
    -   ### Participants
	    - AbstractFactory
		    - Declares an interface for operations that create abstract products
		- ConcreteFactory
			- Implements operations to create concrete products
	    -  AbstractProduct
		    - Declares an interface for a type of product object
		- Product
			- Defines a product to be created by the corresponding ConcreteFactory; it implements the AbstractProduct interface
		- Client
			- Uses the interfaces declared by the AbstractFactory and AbstractProduct classes
    -   ### Pros
		-   You can be sure that the products you’re getting from a factory are compatible with each other
		-   You avoid tight coupling between concrete products and client code
		-   Single Responsibility Principle - you can extract the product creation code into one place, making the code easier to support
		-   Open/Closed Principle - You can introduce new variants of products without breaking existing client code
    -   ### Cons    
	    - The code may become more complicated than it should be, since a lot of new interfaces and classes are introduced along with the pattern

-   ## Builder Factory
    -   ### What is is used for:
	    -   Defines an instance for creating an object but letting subclasses decide which class to instantiate
    -   ### Participants
	    - Builder
		    - Specifies an abstract interface for creating parts of a Product object
		- ConcreteBuilder  
			- Constructs and puts together parts of the product by implementing the Builder interface. It defines and keeps track of the representation. It creates and provides an interface for saving the product  
	    -  Director
		    - Class constructs the complex object using the Builder interface  
		- Product
			- Represents the complex object that is being built  
    -   ### Pros
		-   You can construct objects step by step, defer construction steps or run steps recursively  
		- You can reuse the same construction code when building various representations of products  
		- Single Responsibility Principle - You can isolate complex construction code from the business logic of the product  
    -   ### Cons    
	    - Overall complexity of the code increases since the pattern requires creating multiple new classes


-   ## Factory Method
    -   ### What is is used for:
	    -   Defines an interface for creating objects, but let subclasses decide which class to instantiate
	    - Refers to the newly created object through a common interface
    -   ### Participants
	    - Product
		    - Defines the interface for objects the factory method creates
		- ConcreteProduct  
			- Implements the Product interface
	    -  Creator
		    - Also referred as Factory because it creates the Product objects
		    - Declares the method FactoryMethod, which returns a Product object.
		    - May call the generating method for creating Product objects
		- ConcreteCreator
			- Overrides the generating method for creating ConcreteProduct objects  
    -   ### Pros
		-   You avoid tight coupling between the creator and the concrete products		
		- Single Responsibility Principle - you can move the product creation code into one place in the program, making the code easier to support
		- Open/Closed Principle - You can introduce new types of products into the program without breaking existing client code
    -   ### Cons    
	    - The code may become more complicated since you need to introduce a lot of new subclasses to implement the patter. The best case scenario is when you’re introducing the pattern into an existing hierarchy of creator classes
-   ## Prototype
	- to be added
-   ## Singleton
    -   ### What is is used for:
	    -   Ensure that only one instance of a class is created
	    - Provide a global point of access to the object
	-   ### Participants
	    - Singleton class
		    - Involves one constructor and a static public method that returns a reference to the static member
    -   ### Pros
		-   You can be sure that a class has only a single instance		
		- Singleton object is initialized only when it’s requested for the first time
    -   ### Cons
	    - Violates the single responsibility principle - the pattern solves two problems at the time
	    - Can mask bad design, for instance, when the components of the program know too much about each other
	    - Requires special treatment in a multithreaded environment so that multiple threads won’t create a singleton object several times
	    - May be difficult to unit test the client code of the singleton because many test frameworks rely on inheritance when producing mock objects. Since the constructor of the singleton class is private and overriding static methods are impossible in most languages, you will need to think of a creative way to mock the singleton. Or just don’t write tests… or don’t use singleton pattern
## Structural Patterns

-   ## Adapter
    -   ### What is is used for:
	    -   Convert the interface of a class into another interface clients expect
	    - Adapter lets classes work together, that could not otherwise because of incompatible interfaces
	-   ### Participants
	    - Target
		    - Defines the domain-specfic interface that Client uses
		 - Adapter
			- Adapts the interface adaptee to the target interface
		 - Adaptee
		    - Defines an existing interface that needs adapting
		 - Client
		    - Collaborates with objects conforming to the Target interface
    -   ### Pros
		-   Single Responsibility Principle - you can separate the interface or data conversion code from the primary business logic of the program
		- Open/Closed Principle - you can introduce new types of adapters into the program without breaking the existing client code, as long as they work with the adapters through the client interface
	-   ### Cons
	    - Overall complexity of the code increases because you need to introduce a set of new interfaces and classes.
	    - Sometimes it’s simpler just to change the service class so that it matches the rest of your code
-   ## Bridge
    -   ### What is is used for:
	    -   Intent of this pattern is to decouple abstraction from implementation so that the two can vary independently
	-   ### Participants
	    - Abstraction
		    - Abstraction defines abstraction interface
		 - AbstractionImpl
			- Implements the abstraction interface using a reference to an object of type Implementor
		 - Implementor
		    - Defines the interface for implementation classes
		    - This interface does not need to correspond directly to abstraction interface and can be very different
		    - Abstraction imp provides an implementation in terms of operations provided by Implementor interface
		 - ConcreteImplementor1, ConcreteImplementor2
		    - Implements the implementor interface
    -   ### Pros
		-   Create platform-independent classes and apps
		- Client code works with high level abstractions. It isn’t exposed to the platform details
		- Open/Closed Principle - You can introduce new abstractions and implementations independently from each other
		- Single Responsibility Principle - You can focus on high-level logic in the abstraction and on platform details in the implementation
	-   ### Cons
	    - Might make the code more complicated by applying the pattern to a highly cohesive class
-   ## Composite
    -   ### What is is used for:
	    -   Intent of this pattern is to compose objects into tree structures to represent part-whole hierarchies
	    - Composite lets clients treat individual objects and compositions of objects uniformly
	-   ### Participants
	    - Component
		    - Component is the abstraction for leafs and composites. It defines the interface that must be implemented by the objects in the composition. For example a file system resource defines move, copy, rename, and getSize methods for files and folders
		 - Leaf
			- Leafs are objects that have no children. They implements services described by the Component interface. For example a file object implements move, copy, rename, as well as getSize methods which are related to the Component interface
		 - Composite
		    - A composite stores child components in addition to implementing methods defined by the component interface. Composite implement methods defined in the Component interface by delegating to child components. In addition composites provide additional methods for adding, removing, as well as getting components
		 - Client
		    - Client manipulates objects in the hierarchy using the component interface
    -   ### Pros
		-  You can work with complex tree structures more conveniently: use polymorphism and recursion to your advantage
		- Open/Closed Principle - You can introduce new element types into the app without breaking the existing code, which now works with the object tree
	-   ### Cons
	    - It might be difficult to provide a common interface for classes whose functionality differs too much. In certain scenarios, you’d need to overgeneralize the component interface, making it harder to comprehend











## Behavioral Patterns
