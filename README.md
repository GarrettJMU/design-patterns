
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
## Behavioral Patterns
