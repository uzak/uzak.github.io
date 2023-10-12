# Contents

- [2.7](#2.7)
- [2.6](#2.6)
    - [PEP 371: multiprocessing package](#2.6#PEP 371: multiprocessing package)
    - [PEP 3119: Abstract Base Classes](#2.6#PEP 3119: Abstract Base Classes)
- [2.5](#2.5)
    - [functools](#2.5#functools)
    - [Absolute/Relative imports](#2.5#Absolute/Relative imports)
    - [PEP 343: The 'with' statement](#2.5#PEP 343: The 'with' statement)
- [2.4](#2.4)
    - [itertools](#2.4#itertools)
    - [collections](#2.4#collections)
    - [PEP 318: Decorators for Functions and Methods](#2.4#PEP 318: Decorators for Functions and Methods)
    - [PEP 289: Generator Expressions](#2.4#PEP 289: Generator Expressions)
- [2.3](#2.3)
    - [PEP 218: Set datatype](#2.3#PEP 218: Set datatype)
- [2.2](#2.2)
    - [Descriptors](#2.2#Descriptors)
    - [Multiple Inheritance: The Diamond Rule](#2.2#Multiple Inheritance: The Diamond Rule)
    - [Attribute Access](#2.2#Attribute Access)
    - [Iterators & Generators](#2.2#Iterators & Generators)
- [2.1](#2.1)
- [2.0](#2.0)
    - [Unicode](#2.0#Unicode)
    - [List Comprehension](#2.0#List Comprehension)

# 2.7
[What's New in Python 2.7](https://docs.python.org/3/whatsnew/2.7.html)

* `{1,2,3}` creates a mutable set
* dictionary and set comprehensions - `{i: i*2 for i in range(3)}`
* multiple context managers with a single with statement
```
with A() as a, B() as b:
    ... suite of statements ...
```
which corresponds to:
```
with A() as a:
    with B() as b:
        ... suite of statements ...
```
* PEP 378: "," format specifier for better readability:
```
>>> "{:0,.2f}".format(1231231)
'1,231,231.00'
```
* Added OrderedDict: The OrderedDict API is substantially the same as regular dictionaries but will iterate over keys and values in a guaranteed order depending on when a key was first inserted. If a new entry overwrites an existing entry, the original insertion position is left unchanged. Deleting an entry and reinserting it will move it to the end.
* [argparse](https://docs.python.org/3/library/argparse.html#module-argparse) module was added as replacement for optparse
* PEP 3106: Dictionary Views. There are now viewkeys(), viewvalues() and viewitems() which are sets. In 3.8 they are no more but the default keys(), values(), items() return sets. The view keeps track of the dictionary and its contents change as the dictionary is modified. However, note that you can’t add or remove keys while you’re iterating over the view.
* memoryview object provides a view of another object's memory content that machtes the bytes type's interface.
* unittest was heavily updated. Added discovery. The following command will search the test/ subdirectory for any importable test files named test*.py:
```sh
python -m unittest discover -s test
```


# 2.6
[What's New in Python 2.6](https://docs.python.org/3/whatsnew/2.6.html)

* Uses RST using [Sphinx](http://sphinx-doc.org/) for docs
* PEP-366: Python’s -m switch allows running a module as a script. When you ran a module that was located inside a package, relative imports didn’t work correctly. 2.6 adds a \_\_package\_\_ attribute to modules. When this attribute is present, relative imports will be relative to the value of this attribute instead of the \_\_name\_\_ attribute.
* print is now a function.
* PEP 3101: Advanced String Formatting: classes now might implement \_\_format()\_\_. Usage: 
```
>>> "User ID: {uid}, login: {login}".format(uid=0, login="root")
'User ID: 0, login: root'
>>> '{0:g}'.format(3.75)
'3.75'
>>> '{0:e}'.format(3.75)
'3.750000e+00'
>>> # Field 0: left justify, pad to 15 characters
>>> # Field 1: right justify, pad to 6 characters
>>> fmt = '{0:15} ${1:>6}'
>>> fmt.format('Registration', 35)
'Registration    $    35'
```
* Catching exceptions, new syntax **as** (required in 3):
```
try:
    ...
except TypeError as exc:
    ...
```
* Byte Literals: immutable bytes type and bytearray() mutable. b'' notation.
* `0o21/0O21` for octal integer notation `0b10001/0B10001` for binary.
* PEP 3129: Class level decorators - instead only for functions/methods.
* [fractions](https://docs.python.org/3/library/fractions.html#module-fractions) module to be able to exactly represent numbers as `2/3` which floating-point numbers can only approximate
```
>>> from fractions import Fraction
>>> a = Fraction(2, 3)
>>> float(a)
0.6666666666666666
>>> a
Fraction(2, 3)
>>> a + a
Fraction(4, 3)
```
* Directories and zip archives containing a \_\_main\_\_.py file can now be executed directly by passing their name to the interpreter.
* Properties now have three attributes, getter, setter and deleter
```
>>> 3.7.hex()
'0x1.d99999999999ap+1'
>>> float.fromhex("0x123")
291.0
```
* new ascii() builtin - equivalent to repr().
* [json](https://docs.python.org/3/library/json.html#module-json) module

## PEP 371: multiprocessing package
Some classes [multiprocessing](https://docs.python.org/3/library/multiprocessing.html#module-multiprocessing): Process, Queue, Pool, Manager. Basic usage:
```
from multiprocessing import Pool

def f(x):
    return x*x

if __name__ == '__main__':
    with Pool(5) as p:
        print(p.map(f, [1, 2, 3]))
```

## PEP 3119: Abstract Base Classes 
They declare an interface. Either use interface.register(YourClass) or derive from the interface-class. Use isinstance() and issubclass() for checking.

Here is how to declare an abstract method:
```
from abc import ABCMeta, abstractmethod

class Drawable():
    __metaclass__ = ABCMeta

    @abstractmethod
    def draw(self, x, y, scale=1.0):
        pass

    def draw_doubled(self, x, y):
        self.draw(x, y, scale=2.0)


class Square(Drawable):
    def draw(self, x, y, scale):
        ...

>>> class Circle(Drawable):
...     pass
...
>>> c = Circle()
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: Can't instantiate abstract class Circle with abstract methods draw
>>>
```

Here is how to declare an abstract property:
```
from abc import abstractproperty
...

@abstractproperty
def readonly(self):
   return self._x
```



# 2.5
[What's New in Python 2.5](https://docs.python.org/3/whatsnew/2.5.html)

* PEP 308: conditional expressions: `x = true_value if condition else false_value`
* PEP 338: execute module as script **-m flag** to the python interpreter.
* PEP 357: `__index__()` method: allow any object to be used for slicing
* PEP 341: Unified try/except/finally.
```
try
    block-1 ...
except Exception1:
    handler-1 ...
except Exception2:
    handler-2 ...
else:
    else-block # executed if there is no exception
finally:
    final-block # runs always
```
* PEP 342: New Generator features. Use send(), throw(), close() to manipulate the iterator. Always put parentheses around yield expression.
```
def counter (maximum):                                                          
    i = 0                                                                       
    while i < maximum:                                                          
        print("before")                                                         
        val = (yield i)                                                         
        print("after")                                                          
        # If value provided, change counter                                     
        if val is not None:                                                     
            i = val                                                             
        else:                                                                   
            i += 1                                                              
        print("end (%s) (%s)" % (val, i))  
>>> it = counter(10)
>>> next(it)
before
0
>>> next(it)
after
end (None) (1)
before
1
>>> next(it)
after
end (None) (2)
before
2
>>> it.send(8)
after
end (8) (8)
before
8
>>> next(it)
after
end (None) (9)
before
9
>>> next(it)
after
end (None) (10)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
StopIteration
```
* PEP 352: hierarchy for exceptions:
```text
BaseException       # New in Python 2.5
|- KeyboardInterrupt
|- SystemExit
|- Exception
   |- (all other current built-in exceptions)
```
Usual usage:
```
try:
    ...
except (KeyboardInterrupt, SystemExit):
    raise
except: # can now be `except Exception`
    # Log error...
    # Continue running program...
```
* dict can now implement `__missing__(key)`
```
>>> 'http://www.python.org'.partition('://')
('http', '://', 'www.python.org')
>>> 'www.python.org'.rpartition('.')
('www.python', '.', 'org')
```
* The startswith() and endswith() methods of string types now accept tuples of strings to check for.
```
filename.endswith(('.gif', '.jpg', '.tiff'))
```
* any() -> True if any value returned by the iterator is True. False otherwise
* all() -> True if all values returned by the iterator are true. False otherwise.
* python `-Wd` CLI flag for checking for missing \_\_init\_\_.py in modules where otherwise imports would have been triggered.
* datetime.datetime has now strptime(string, format) <-> strftime().
* added `hashlib` and `sqlite3` to stdlib.

## functools
[functools](https://docs.python.org/3/library/functools.html#module-functools) module
* @lru_cache()
```
>>> import functools
>>> @functools.lru_cache(maxsize=300)
... def get_phone_number(name):
...     c = conn.cursor()
...     c.execute('SELECT phonenumber FROM phonelist WHERE name=?', (name,))
...     return c.fetchone()[0]
>>> for name in user_requests:        
...     get_phone_number(name)        # cached lookup
```
statistics and clearing cache:
```
>>> get_phone_number.cache_info()     
CacheInfo(hits=4805, misses=980, maxsize=300, currsize=300)
>>> get_phone_number.cache_clear()
```
* reduce()
* partial()
```
>>> add = lambda a, b: a+b
>>> two_plus = functools.partial(add, 2)
>>> two_plus(3)
5
```
* @wraps (alternative to functools.update_wrapper()) - copy name, module, docstrings to the wrapper function for easier understanding of tracebacks
```
def my_decorator(f):
    @functools.wraps(f)
    def wrapper(*args, **kwds):
        print 'Calling decorated function'
        return f(*args, **kwds)
    return wrapper
```

## Absolute/Relative imports

    # Import names from pkg.string
    from .string import name1, name2
    # Import pkg.string
    from . import string

A.B.C module can do:
```
from . import D                 # Imports A.B.D
from .. import E                # Imports A.E
from ..F import G               # Imports A.F.G
```

## PEP 343: The 'with' statement
Use where otherwise you'd use `try...finally` to make sure that cleanup code is executed.

```
with open('/etc/passwd', 'r') as f:
    for line in f:
        print line
```
A context manager `type(f)` must implement [\_\_enter\_\_()](https://docs.python.org/3/reference/datamodel.html#object.__enter__) and [\_\_exit\_\_()](https://docs.python.org/3/reference/datamodel.html#object.__exit__) methods.


# 2.4
[What's New in Python 2.4](https://docs.python.org/3/whatsnew/2.4.html)

* frozenset
* PEP 327: **Decimal**
```
>>> decimal.Decimal((1, (1,4,7,1), -1))
Decimal('-147.1')
>>> decimal.Decimal("1.1")
Decimal('1.1')
```
* PEP 292: Simpler String Substitutions
```
>>> import string
>>> t = string.Template("$page: $title")
>>> t.substitute({'page': 2, 'title': 'The Best of Times'})
'2: The Best of Times'
>>> 
```
* reversed(), sorted()
* [subprocess](https://docs.python.org/3/library/subprocess.html#module-subprocess) module
* Multi-line Imports: you can put parentheses around the list of names
```
from module import (a,
                    b,
                    c)
```
* ljust, rjust, center accept now a fillchar:
```
>>> "asdasdf".ljust(70, '-')
'asdasdf---------------------------------------------------------------'
```
* doctest supports ELLIPSIS option (`...`) 

## itertools
[itertools](https://docs.python.org/3/library/itertools.html#module-itertools) module. Contains infinite iterators {count, cycle, repeat}() and finite:
```
>>> show = list
>>> from itertools import *
>>> show(accumulate([1,2,3,4,5], operator.mul))
[1, 2, 6, 24, 120]
>>> show(accumulate([1,2,3,4,5]))
[1, 3, 6, 10, 15]
>>> show(accumulate([1,10,2,3,4,5], max))
[1, 10, 10, 10, 10, 10]
>>> show(itertools.chain("ABC", "EFG"))
['A', 'B', 'C', 'E', 'F', 'G']
>>> show(itertools.compress("ABCD", [1,1,0,1])) # filter
['A', 'B', 'D']
>>> 
>>> _show(dropwhile(lambda x: x<5, [1,4,6,4,1]))
[6, 4, 1]
>>> [(k, list(g)) for k, g in groupby('AAAABBBCCDAABBB')]
[('A', ['A', 'A', 'A', 'A']),
 ('B', ['B', 'B', 'B']),
 ('C', ['C', 'C']),
 ('D', ['D']),
 ('A', ['A', 'A']),
 ('B', ['B', 'B', 'B'])]
>>> show(takewhile(lambda x: x<5, [1,4,6,4,1]) )
[1, 4]
>>> [list(a) for a in tee("ABC123", 3)]
[['A', 'B', 'C', '1', '2', '3'],
 ['A', 'B', 'C', '1', '2', '3'],
 ['A', 'B', 'C', '1', '2', '3']]
>>> show(zip_longest('ABCD', 'xy', fillvalue='-'))
[('A', 'x'), ('B', 'y'), ('C', '-'), ('D', '-')]
>>> show(product('ABC', repeat=2))
[('A', 'A'),
 ('A', 'B'),
 ('A', 'C'),
 ('B', 'A'),
 ('B', 'B'),
 ('B', 'C'),
 ('C', 'A'),
 ('C', 'B'),
 ('C', 'C')]
[('A', 'B'), ('A', 'C'), ('B', 'A'), ('B', 'C'), ('C', 'A'), ('C', 'B')]
>>> show(combinations('ABC', 2))
[('A', 'B'), ('A', 'C'), ('B', 'C')]
>>> show(combinations_with_replacement('ABC', 2))
[('A', 'A'), ('A', 'B'), ('A', 'C'), ('B', 'B'), ('B', 'C'), ('C', 'C')]
```

## collections
\_\_contains\_\_() for checking `elem in collection`. [collections](https://docs.python.org/3/library/collections.html) module:

* **namedtuple**
* **deque** - double ended queue. Deques support thread-safe, memory efficient appends and pops from either side of the deque with approximately the same O(1) performance in either direction. list objects incur O(n) memory movement costs for pop(0) and insert(0, v) operations which change both the size and position of the underlying data representation.
* **ChainMap** - quickly linking a number of mappings so they can be treated as a single unit. Recipe: ChainMap(cli\_args, environ, defaults). Basic example:
```
>>> cm = ChainMap({ 'a': 1, 'b': 2}, {'b': 3}, {'a': 2, 'e': 4}) 
>>> cm['a']
1
>>> cm['e']
4
```
* **Counter**
* **OrderedDict** - useful for LRU cache
* **defaultdict** - dict subclass that calls a factory function to supply missing values
* os.path.lexists(path) returns true if the file specified by path exists, whether or not it’s a symbolic link.


## PEP 318: Decorators for Functions and Methods
```
@A
@B
@C
def f ():
    ...
```
equals to:
```
def f(): ...
f = A(B(C(f)))
```
example:
```
def require_type(t):                                                            
    def decorated(func):                                                        
        def handler(*args, **kw):                                               
            for a in args:                                                      
                assert isinstance(a, t)                                         
            return func(*args, **kw)                                            
        return handler                                                          
    return decorated                                                            
                                                                                
                                                                                
@require_type(int)                                                              
def f(arg):                                                                     
    print(arg)                                                                  
                                                                                
f(12)                                                                           
f("asdf")
```

## PEP 289: Generator Expressions

    links = [link for link in get_all_links() if not link.followed] # list
    links = (link for link in get_all_links() if not link.followed) # generator


# 2.3
[What's New in Python 2.3](https://docs.python.org/3/whatsnew/2.3.html)

* import from zip-modules is now possible
* enumerate()
* boolean type. Derived from int: `assert (True + 2 == 3) is True`
* [logging](https://docs.python.org/3/library/logging.html#module-logging) module. logging.{debug,info,warning,error,critical}. logging.exception(msg)
* [csv](https://docs.python.org/3/library/csv.html) files
* extended slices, supports now a third "step" argument.
```
>>> a = list(range(10))
>>> a[::2]
[0, 2, 4, 6, 8]
>>> a[::-1]
[9, 8, 7, 6, 5, 4, 3, 2, 1, 0]
>>> a[:4:-1]
[9, 8, 7, 6, 5]
>>> 
```
* PEP 263: Source Code Encodings:

    #!/usr/bin/env python
    # -*- coding: UTF-8 -*-

##  PEP 218: Set datatype
```
>>> s1 = {1,2,3}
>>> s2 = {3,4,5}
>>> s2.add(6)
>>> s2.remove(5)
>>> s2
{3, 4, 6}
>>> s1.union(s2)
{1, 2, 3, 4, 6}
>>> s1.intersection(s2)
{3}
>>> s1 | s2
{1, 2, 3, 4, 6}
>>> s1 & s2
{3}
>>> s1.symmetric_difference(s2)
{1, 2, 4, 6}
>>> s1 ^ s2
{1, 2, 4, 6}
>>> s1.issubset({1,2,3,4,9})
True
>>> s1.issuperset({1})
True
>>> s1.issuperset({1,9})
False
>>> s1
{1, 2, 3}
>>> s1.update(s2)
>>> s1
{1, 2, 3, 4, 6}
>>> 
```

# 2.2
[What's New in Python 2.2](https://docs.python.org/3/whatsnew/2.2.html)

Introduces new style objects/types, along with it \_\_metaclass\_\_.

* PEP 238: **Division Operator**:
```
>>> 2 / 2
1.0
>>> 2 // 2 # floor division operator
1
>>> 
```
* PEP 227: **Nested Scopes**: when a given variable name is not assigned a value within a function (by an assignment, or the def, class, or import statements), references to the variable will be looked up in the local namespace of the enclosing scope.

## Descriptors
Live inside class objects. Interface: \_\_{name,doc,get,set,delete}\_\_. **staticmethod()**, **classmethod()**

## Multiple Inheritance: The Diamond Rule

```
class D(B, C):
    def save (self):
        super(D, self).save()
```
## Attribute Access
* \_\_getattr\_\_() vs. \_\_getattribute\_\_() - is *always* called whenever any attribute is accessed, while the first one is only when the attribute is not found in the instance's dictionary.
* [property](https://docs.python.org/3/library/functions.html#property) - get, set, delete.
* \_\_slots\_\_() class attribute to define what attributes are supported (legal).

## Iterators & Generators
* \_\_getitem\_\_() - for random access, [\_\_iter\_\_()](https://docs.python.org/3/reference/datamodel.html#object.__iter__) for iterators. See also [iter()](https://docs.python.org/3/library/functions.html#iter), [next()](https://docs.python.org/3/library/functions.html#next), [StopIteration]().
* `for line in file:` calls readline().
* **yield**, designed to work nicely with iterators.


# 2.1
[What's New in Python 2.1](https://docs.python.org/3/whatsnew/2.1.html)

* PEP 207: **Rich Comparisons**: \_\_{lt,le,gt,ge,eq,ne}\_\_()
* PEP 230: **Warnings Framework**
* PEP 205: **Weak References**.  If an object is only accessible through weak references, the object will be deallocated and the weak references will now indicate that the object it referred to no longer exists. [weakref](https://docs.python.org/3/library/weakref.html).{proxy,ref}
* PEP 232: **Function Attributes**

# 2.0

[What's New in Python 2.0](https://docs.python.org/3/whatsnew/2.0.html)

* zip()
* int() and long() have an optional `base` parameter.
* sys.getrecursionlimit() and sys.setrecursionlimit()
* Augmented Assignment: \_\_iadd\_\_  for += etc.

## Unicode

```
>>> ord('अ')
2309
>>> hex(ord('अ')+2)
'0x907'
>>> "\u0907"
'इ'
```
[codecs](https://docs.python.org/3/library/codecs.html) module:

```
>>> f = codecs.open('/tmp/latin2.txt', 'w', 'iso-8859-2')
>>> codecs.encode("ľubim ťa", "iso-8859-2")
b'\xb5ubim \xbba'
>>> codecs.decode(b'\xb5ubim \xbba', "iso-8859-2")
'ľubim ťa'
>>> 'ľubim ťa'.encode("iso-8859-2")
b'\xb5ubim \xbba'
>>> b'\xb5ubim \xbba'.decode("iso-8859-2")
'ľubim ťa'
```

## List Comprehension
```
>>> seq1 = 'abc'
>>> seq2 = (1,2,3)
>>> [ (a, b) for a in seq1 for b in seq2]
[('a', 1), ('a', 2), ('a', 3), ('b', 1), ('b', 2), ('b', 3), ('c', 1), ('c', 2), ('c', 3)]
```
