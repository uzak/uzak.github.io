* Interface - abstract
* interface Runnable, extend Thread class
* this() - call other constructor
* Set interface - no duplicat elements. Inherited from collection.
* TreeSet interface - sorted set
* Object based programming languages follow all the features of OOPs except Inheritance. JavaScript is an example of object based programming languages.
* Default constructor
* Constructor cannot be made final
* Static block is executed at the time of classloading
* overloading - same name, different parameters; overriding 
* A thread can enter the waiting state by invoking its sleep() method, by blocking on IO, by unsuccessfully attempting to acquire an object's lock, or by invoking an object's wait() method. It can also enter the waiting state by invoking its (deprecated) suspend() method.
* After a thread is started, via its start() method of the Thread class, the JVM invokes the thread's run() method when the thread is initially executed.
* Exception's subclasses have to be caught first.
* When a task invokes its yield() method, it returns to the ready state. When a task invokes its sleep() method, it returns to the waiting state.
* The Vector class provides the capability to implement a growable array of objects. Vector proves to be very useful if you don't know the size of the array in advance
* The Reader/Writer class hierarchy is character-oriented, and the InputStream/OutputStream class hierarchy is byte-oriented.
* The Class class is used to obtain information about an object's design and java.lang.Class class instance represent classes, interfaces in a running Java application.
* Serialization is the process of writing the state of an object to a byte stream. Deserialization is the process of restoring these objects.
* Constructors must have the same name as the class and can not return a value. They are only called once while regular methods could be called many times.
* The code sleep(2000); puts thread aside for exactly two seconds. The code wait(2000), causes a wait of up to two second. A thread could stop waiting earlier if it receives the notify() or notifyAll() call. The method wait() is defined in the class Object and the method sleep() is defined in the class Thread.
* A transient variable is a variable that may not be serialized during Serialization and which is initialized by its default value during de-serialization,
* Synchronization is the capability to control the access of multiple threads to shared resources. synchronized keyword in java provides locking which ensures mutual exclusive access of shared resource and prevent data race.
* The = operator is right associative.
* The Java runtime system generates RuntimeException and Error exceptions.
* The garbage collector invokes an object's finalize() method when it detects that the object has become unreachable.
* A dead thread cannot be restarted.
* An abstract class can have instance methods that implement a default behavior. An Interface can only declare constants and instance methods, but cannot implement default behavior and all methods are implicitly abstract. An interface has all public members and no implementation.
* a top level class can not be private or protected. It can have either "public" or no modifier.
* It is not necessary that each try block must be followed by a catch block. It should be followed by either a catch block or a finally block.
* A thread is in the ready state as initial state after it has been created and started.
* Runtime polymorphism or dynamic method dispatch is a process in which a call to an overridden method is resolved at runtime rather than at compile-time. In this process, an overridden method is called through the reference variable of a superclass.
* Dynamic binding means that the code associated with a given procedure call is not known until the time of the call at run-time.
* constructor cannot be inherited
* ArrayList can grow dynamically and provides more powerful insertion and search mechanisms than arrays
* Deletion in linked list is fast because it involves only updating the next pointer in the node before the deleted node and updating the previous pointer in the node after the deleted node.
* If you need to frequently add and remove elements from the middle of the list and only access the list elements sequentially, then LinkedList should be used. If you need to support random access, without inserting or removing elements from any place other than the end, then ArrayList should be used.
* Private constructor is used if you do not want other classes to instantiate the object and to prevent subclassing
* A thread is a execution in a program. The life cycle of a thread include − Newborn, Runnable, Running, Blocked, Dead state
* The >> operator carries the sign bit when shifting right. The >>> zero-fills bits that have been shifted out.
* Braek statements can be used as labels
* Thread.suspend - It is used to pause or temporarily stop the execution of the thread.
* Sockets provide the communication mechanism between two computers using TCP. A client program creates a socket on its end of the communication and attempts to connect that socket to a server.
* java.net.ServerSocket class is used by server applications to obtain a port and listen for client requests
* java.net.Socket class represents the socket that both the client and server use to communicate with each other.
* If a class is declared within a class and specify the static modifier, the compiler treats the class just like any other top-level class. Nested top-level class is an Inner class.
* Externalizable is an interface which contains two methods readExternal and writeExternal. These methods give you a control over the serialization mechanism.
* setDaemon method is used to create a daemon thread.
* All tasks must implement the run() method
* The GregorianCalendar provides support for traditional Western calendars
* A static method should not refer to instance variables without creating an instance and cannot use "this" operator to refer the instance.
* An object's lock is a mechanism that is used by multiple threads to obtain synchronized access to the object. A thread may execute a synchronized method of an object only after it has acquired the object's lock.
* Downcasting: It is the casting from a general to a more specific type, i.e. casting down the hierarchy.
* A protected method may only be accessed by classes or interfaces of the same package or by subclasses of the class in which it is declared.
* When a class is defined within a scope of another class, then it becomes inner class. If the access modifier of the inner class is static, then it becomes nested class.
* If the array is an array of primitive types, then all the elements of the array will be initialized to the default value corresponding to that primitive type.

- Which two method you need to implement for key Object in HashMap (equals, hashCode)

public class JavaHungrySingleton
{
    
    private static  volatile JavaHungrySingleton  uniqueInstance;
    
    private JavaHungrySingleton(){}
    
    public static   JavaHungrySingleton  getInstance()
    {
        if (uniqueInstance ==null )
        {
            synchronized(JavaHungrySingleton.class)
            {
                if (uniqueInstance ==null )
                {
                    uniqueInstance=new JavaHungrySingleton();
                }
            }
        }
        return uniqueInstance ;
    }
    
    // other useful methods here
}

-  What will be the problem if you don't override hashcode() method ?
You will not be able to recover your object from hash Map if that is used as key in HashMap.
- Is it better to synchronize critical section of getInstance() method or whole getInstance() method ?
Answer is critical section because if we lock whole method than every time some one call this method will have to wait even though we are not creating any object)
- you can not override private or static method in Java, if you create similar method with same return type and same method arguments that's called method hiding. 
- you can very well throw super class of RuntimeException in overridden method but you can not do same if its checked Exception. 
-  if you acquire resources in a particular order and release resources in reverse order you can prevent deadlock. 
