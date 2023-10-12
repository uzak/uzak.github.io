# Contents

- [3.11](#311)
- [3.10](#310)
- [3.9](#39)
- [3.8](#38)
    - [f-strings support = for self-documenting expressions and debugging](#f-strings-support-for-self-documenting-expressions-and-debugging)
- [3.7](#37)
- [3.6](#36)
    - [Asynchronous Comprehensions (PEP 530) and Generators (PEP 525)](#asynchronous-comprehensions-pep-530-and-generators-pep-525)
    - [PEP 498: Formatted string literals](#pep-498-formatted-string-literals)
- [3.5](#35)
    - [PEP 485 - Type Hints](#pep-485---type-hints)
    - [PEP 492 - Coroutines with async and await syntax](#pep-492---coroutines-with-async-and-await-syntax)
- [3.4](#34)
- [3.3](#33)
    - [Subgenerators: yield from](#subgenerators-yield-from)
- [3.2](#32)
- [3.1](#31)
- [3.0](#30)
    - [Changes to Exceptions](#changes-to-exceptions)

# 3.11
* Python 3.11 is 10-60% faster than 3.10!
* Exception groups and `except* `

# 3.10
* Parenthesized context managers ` with (CtxManager1() as example, CtxManager2): ...`
* PEP 634: Structural Pattern Matching
```python
match subject:
    case <pattern1>:
        <action1>
    case <pattern2>:
        <action2>
    case _:
        <action_wildcard>
```
    * Several literals can be combined using or `case 401 | 403 | 404: return "Not allowed"`
    * Patterns can contain variables (unpacking) and classes
    * Patterns can be nested, e. g. `case [Point(0, y1), Point(0, y2)]:`
    * Wildcard can be used in more complex patterns: `case ('error', code, _):`
    * Sequence patterns support wildcards: `[x, y, *rest]`
    * Mapping sequences: `{"bandwith": b, "latency": 1, **rest}`
    * There can be a guard: `case Point(x, y) if x == y`
    * Subpatterns may be captured: `case (Point(x1, y1), Point(x2, y2) as p2)`
* `-X warn_default_encoding` option and `PYTHONWARNDEFAULTENCODING` are added to enable the warning.

# 3.9 
[What's New in Python 3.9](https://docs.python.org/3/whatsnew/3.9.html)
* merge (`|`) and update (`|=`) dicts:
```
>>> x = {"key1": "value1 from x", "key2": "value2 from x"}
>>> y = {"key2": "value2 from y", "key3": "value3 from y"}
>>> x | y
{'key1': 'value1 from x', 'key2': 'value2 from y', 'key3': 'value3 from y'}
>>> y | x
{'key2': 'value2 from x', 'key3': 'value3 from y', 'key1': 'value1 from x'}
```
* str.removeprefix(prefix) and str.removesuffix(suffix)
* `list`, `dict`, `tuple` can be used as generic types instead of having to import equivalents from the typing module.
* `zoneinfo` module
* `graphlib` containing `graphlib.TopologicalSorter` offers functionality for topological sorting of graphs.

# 3.8
[What's New in Python 3.8](https://docs.python.org/3/whatsnew/3.8.html)

* PEP 572: "the walrus operator"
```
if (n := len(a)) > 10:
    print(f"List is too long ({n} elements, expected <= 10)")
discount = 0.0
if (mo := re.search(r'(\d+)% discount', advertisement)):
    discount = float(mo.group(1)) / 100.0
[clean_name.title() for name in names
 if (clean_name := normalize('NFC', name)) in allowed_names]
```
* PEP 570: Positional-only parameters. In the following example, parameters a and b are positional-only, while c or d can be positional or keyword, and e or f are required to be keywords:
```
def f(a, b, /, c, d, *, e, f):
    print(a, b, c, d, e, f)
```
* The new PYTHONPYCACHEPREFIX setting (also available as `-X pycache_prefix`) configures the implicit bytecode cache to use a separate parallel filesystem tree, rather than the default `__pycache__` subdirectories within each source directory.
* pickle protocol 5 with out-of-band data buffers, default is now 4 instead of 3.
* bool, int, fractions.Fraction also have `.as_integer_ratio()` just as float and decimal.Decimal.
* The new importlib.metadata provides support for reading metadata from third-party packages
```
>>> import requests
>>> from importlib.metadata import version, requires, files
>>> version('requests')
'2.21.0'
```
* asyncio
    * asyncio.run() provisional -> stable
    * `python3.8 -m asyncio`
    ```
    >>> import asyncio
    >>> async def main():
    ...     await asyncio.sleep(0)
    ...     return 42
    ... 
    >>> await main()
    42
    >>>
    ```
* `functools.singledispatchmethod()` and `functools.cached_property()` computed properties cached for the life of the instance:
```
import functools
import statistics
class Dataset:
   def __init__(self, sequence_of_numbers):
      self.data = sequence_of_numbers
   @functools.cached_property
   def variance(self):
      return statistics.variance(self.data)
```
* `python -m json.tool` supports now `--json-lines` to parse every input line as a separate JSON object.


## f-strings support = for self-documenting expressions and debugging
```
>>> user = 'eric_idle'
>>> member_since = date(1975, 7, 31)
>>> f'{user=} {member_since=}'
"user='eric_idle' member_since=datetime.date(1975, 7, 31)"
>>> delta = date.today() - member_since
>>> f'{user=!s}  {delta.days=:,d}'
'user=eric_idle  delta.days=16,075'
```
The = specifier will display the whole expression so that calculations can be shown:
```
>>> print(f"{a=} {a**a=:0.3f}")
a=2 a**a=4.000
```

# 3.7
[What's New in Python 3.7](https://docs.python.org/3/whatsnew/3.7.html)


* PEP 563: Postponed Evaluation of Annotations. Now this is possible:
```
from __future__ import annotations # This will become default in Python 4.0.
class C:
    @classmethod
    def from_string(cls, source: str) -> C:
        ...
    def validate_b(self, obj: B) -> bool:
        ...
class B:
    ...
```
* PEP 553: includes the new built-in `breakpoint()` function as an easy and consistent way to enter the Python debugger.
* PEP 562: Python 3.7 allows defining `__getattr__()` on modules and will call it whenever a module attribute is otherwise not found. Defining `__dir__()` on modules is now also allowed.
* PEP 564: there are now six new functions with nanosecond resolution, providing approximately 3x better resolution as default `time.time()`.
* PEP 565. Now there are three kinds of deprecation warnings:
    * FutureWarning: always displayed by default, recommended for warnings intended to be seen by application end users (e.g. for deprecated application configuration settings).
    * DeprecationWarning: displayed by default only in `__main__` and when running tests, recommended for warnings intended to be seen by other Python developers where a version upgrade may result in changed behaviour or an error.
    * PendingDeprecationWarning: displayed by default only when running tests, intended for cases where a future version upgrade will change the warning category to DeprecationWarning or FutureWarning.
* The new `-X importtime` option or the PYTHONPROFILEIMPORTTIME environment variable can be used to show the timing of each module import
* new module [contextvars](https://docs.python.org/3/library/contextvars.html#module-contextvars) for context variables. Like thread local variables, but support asynchronous code directly.
* [dataclasses](https://docs.python.org/3/library/dataclasses.html#dataclasses.dataclass) module:
```
@dataclass
class Point:
    x: float
    y: float
    z: float = 0.0
p = Point(1.5, 2.5)
print(p)   # produces "Point(x=1.5, y=2.5, z=0.0)"
```
* argparse: The new `ArgumentParser.parse_intermixed_args()` method allows intermixing options and positional arguments.
* unittest: The new -k command-line option allows filtering tests by a name substring or a Unix shell-like pattern. For example, `python -m unittest -k foo` runs `foo_tests.SomeTest.test_something`, `bar_tests.SomeTest.test_foo`, but not `bar_tests.FooTest.test_something`. 
* Yield expressions (both yield and yield from clauses) are now deprecated in comprehensions and generator expressions (aside from the iterable expression in the leftmost for clause).


# 3.6
[What's New in Python 3.6](https://docs.python.org/3/whatsnew/3.6.html)

* PEP 526: variable annotations
```
from typing import *
primes: List[int] = []
captain: str  # Note: no initial value!
class Starship:
    stats: Dict[str, int] = {}
```
Just as for function annotations, the Python interpreter does not attach any particular meaning to variable annotations and only stores them in the `__annotations__` attribute of a class or module. Use `mypy` module for checking them.
* PEP 515: Underscores in Numeric Literals. `1_000_000` or `0x_FF_FF_FF`. Also string formatting was extended with the `_` option:
```
>>> '{:_}'.format(1000000)
'1_000_000'
>>> '{:_x}'.format(0xFFFFFFFF)
'ffff_ffff'
```
* PEP 487: `__init_subclass__(child_cls)` is called in parent when a new subclass is created.
* PEP 487: `__set_name__(owner_cls, name)` - whenever a new class is defined, the new method will be called on all descriptors included in the definition.
* PEP 520: Attributes in a class definition body have a natural ordering: the same order in which the names appear in the source. This order is now preserved in the new class’s `__dict__` attribute.
* PEP 468: Preserving Keyword Argument Order: `**kwargs` in a function signature is now guaranteed to be an insertion-order-preserving mapping.
* A global or nonlocal statement must now textually appear before the first use of the affected name in the same scope.
* It is now possible to set a special method to None to indicate that the corresponding operation is not available. For example, if a class sets __iter__() to None, the class is not iterable.
* new module [secrets](https://docs.python.org/3/library/secrets.html#module-secrets) to provide an obvious way to reliably generate cryptographically strong pseudo-random values suitable for managing secrets, such as account authentication, tokens, and similar.
* asyncio is not provisional any longer but is stable.
* 
```>>> Decimal('-3.14').as_integer_ratio()
(-157, 50)
```

## Asynchronous Comprehensions (PEP 530) and Generators (PEP 525)
```
async def ticker(delay, to):
    """Yield numbers from 0 to *to* every *delay* seconds."""
    for i in range(to):
        yield i
        await asyncio.sleep(delay)
```
Generators. They add support for `async for`, which requires an object with `__aiter__` method.
```
result = [i async for i in aiter() if i % 2]
result = [await fun() for fun in funcs if await condition()]
```

## PEP 498: Formatted string literals
```
>>> name = "Fred"
>>> f"He said his name is {name}."
'He said his name is Fred.'
>>> width = 10
>>> precision = 4
>>> value = decimal.Decimal("12.34567")
>>> f"result: {value:{width}.{precision}}"  # nested fields
'result:      12.35'
```



# 3.5
[What's New in Python 3.5](https://docs.python.org/3/whatsnew/3.5.html)

* PEP 465 - A dedicated infix operator for matrix multiplication `@`, objects can implement \_\_{matmul,rmatmul,imatmul}()\_\_.
* PEP 448 - Additional Unpacking Generalizations.  It is now possible to use an arbitrary number of unpackings in function calls
```
>>> print(*[1], *[2], 3, *[4, 5])
1 2 3 4 5
>>> def fn(a, b, c, d):
...     print(a, b, c, d)
...
>>> fn(**{'a': 1, 'c': 3}, **{'b': 2, 'd': 4})
1 2 3 4
```
Similarly, tuple, list, set, and dictionary displays allow multiple unpackings
```
>>> *range(4), 4
(0, 1, 2, 3, 4)
>>> [*range(4), 4]
[0, 1, 2, 3, 4]
>>> {*range(4), 4, *(5, 6, 7)}
{0, 1, 2, 3, 4, 5, 6, 7}
>>> {'x': 1, **{'y': 2}}
{'x': 1, 'y': 2}
```
* PEP 461 - percent formatting support for bytes and bytearray
```
>>> b'Hello %b!' % b'World'
b'Hello World!'
>>> b'x=%i y=%f' % (1, 2.5)
b'x=1 y=2.500000'
```
Unicode is not allowed for %b, but it is accepted by %a (equivalent of repr(obj).encode('ascii', 'backslashreplace')):
```
>>> b'price: %a' % '10€'
b"price: '10\\u20ac'"
```
* PEP 485: A function for testing approximate equality
```
>>> import math
>>> a = 5.0
>>> b = 4.99998
>>> math.isclose(a, b, rel_tol=1e-5)
True
>>> math.isclose(a, b, rel_tol=1e-6)
False
>>> math.isclose(a, b, abs_tol=0.00003)
True
>>> math.isclose(a, b, abs_tol=0.00001)
False
```
* PEP 486: Make the Python Launcher aware of virtual environments. When the default interpreter would be used and the `VIRTUAL_ENV` environment variable is set, the interpreter in the virtual environment will be used.
* PEP 488: Elimination of PYO files.
* -b option affects comparisons of bytes with int.
* zipapp module (PEP 441) for creating executable Python Zip Applications. Bundling your application is as simple as putting all the files, including a __main__.py file, into a directory myapp and running
```sh
$ python -m zipapp myapp
$ python myapp.pyz
```
* `__doc__` might now be updated.
* subprocess.run() has been added

## PEP 485 - Type Hints
```
def greeting(name: str) -> str:
    return 'Hello ' + name
```

* `Any`,`NoReturn`, `Union`, `Optional`, `Literal`, `Tuple`, `ClassVar`, `AnyStr` ...  see [typing](https://docs.python.org/3/library/typing.html) module for details.

## PEP 492 - Coroutines with async and await syntax
* async, await, await for
```
>>> import aiohttp
>>> import asyncio
>>> 
>>> async def getpage(client, url):
...     async with client.get(url) as response:
...         assert response.status == 200
...         return await response.read()
... 
>>> async def wc_worker(client, page):
...     print("starting worker for {}".format(page))
...     text = await getpage(client, page)
...     print("url: {} count: {}".format(page, len(text)))
... 
>>> async def main():
...     loop = asyncio.get_event_loop()
...     client = aiohttp.ClientSession(loop=loop)
...     pages = ["http://www.google.com", "http://www.sme.sk", 'http://root.cz']
...     coros = asyncio.gather(*map(lambda p: wc_worker(client, p), pages))
...     await coros
...     await client.close()
... 
>>> asyncio.run(main())
starting worker for http://www.google.com
starting worker for http://www.sme.sk
starting worker for http://root.cz
url: http://www.google.com count: 12689
url: http://www.sme.sk count: 427861
url: http://derstandard.at count: 275782
```

# 3.4
[What's New in Python 3.4](https://docs.python.org/3/whatsnew/3.4.html)

* `python -m pip` if for some reason pip executable is not available.
* PEP 446: Newly Created File Descriptions are Non-Inheritable. See also [os.get_inheritable()](https://docs.python.org/3/library/os.html#os.get_inheritable) and [os.set_inheritable()](https://docs.python.org/3/library/os.html#os.set_inheritable).
* min() and max() now accept a default keyword-only argument that can be used to specify the value they return if the iterable they are evaluating has no elements. 
* [enum](https://docs.python.org/3/library/enum.html#module-enum) module.
* [pathlib](https://docs.python.org/3/library/pathlib.html#module-pathlib) module.
* [selectors](https://docs.python.org/3/library/selectors.html#module-selectors) module allows high-level and efficient I/O multiplexing, built upon the select module primitives.
* [statistics](https://docs.python.org/3/library/statistics.html#module-statistics) module (PEP 450).
* `python -m doctest`.
* functools module has now [partialmethod](https://docs.python.org/3/library/functools.html#functools.partialmethod) and [@singledispatch](https://docs.python.org/3/library/functools.html#functools.singledispatch) for grouping multiple implementations of an operation that allows it to work with different kinds of data.
```
from functools import singledispatch
@singledispatch
def fun(arg, verbose=False):
    if verbose:
        print("Let me just say, ", end = " ")
    print (arg)
@fun.register
def _(arg: int, verbose=False):
    if verbose:
        print("Strength in numbers, eh?", end=" ")
    print(arg)
@fun.register
def _(arg: list, verbose=False):
    if verbose:
        print("Enumerate this:")
    for i, elem in enumerate(arg):
        print(i, elem)
@fun.register(complex)
def _(arg: int, verbose=False):
    if verbose:
        print("Better than complicated.", end=" ")
    print(arg.real, arg.imag)
def nothing(arg, verbose=False):
    print("Nothing.")
fun.register(type(None), nothing)
fun(1, verbose=True)
fun(["carrot", "tomato"], verbose=True)
fun("String", verbose=True)
fun(complex(1, 2), verbose=True)
fun(None)
print(fun.registry.keys())
print(fun.dispatch(float))
print(fun.dispatch(int))
print(fun.dispatch(dict)) # default impl.
fun.dispatch(int)(123, verbose=True)
fun.dispatch(dict)((1,2,3), verbose=True) # default impl.
```
output:
```
# Strength in numbers, eh? 1
# Enumerate this:
# 0 carrot
# 1 tomato
# Let me just say,  String
# Better than complicated. 1.0 2.0
# Nothing.
# dict_keys([<class 'object'>, <class 'int'>, <class 'list'>, <class 'complex'>, <class 'NoneType'>])
# <function fun at 0x7f77553b8830>
# <function _ at 0x7f7755381f80>
# <function fun at 0x7f77553b8830>
# Strength in numbers, eh? 123
# Let me just say,  (1, 2, 3)
```
* `gc.get_stats()`
* pickle suppots now a new pickle protocol, protocol 4.
* unittest.TestCase has a new method [subTest()](https://docs.python.org/3/library/unittest.html#unittest.TestCase.subTest).
* PEP 442: Safe Object Finalization: objects with __del__() methods, as well as generators with finally clauses, can be finalized when they are part of a reference cycle.
* Provisional API for the asyncio module.


# 3.3
[What's New in Python 3.3](https://docs.python.org/3/whatsnew/3.3.html)

* PEP 405: Virtual Environments. See [pipenv](https://pipenv.kennethreitz.org/en/latest/) and [venv](https://docs.python.org/3/library/venv.html#module-venv).
* PEP 420: Implicit Namespace Packages: Native support for package directories that don’t require `__init__.py` marker files and can automatically span multiple path segments.
* PEP 393: Flexible String Representation: to save the memory footprint for strings. The Unicode string type is changed to support multiple internal representations, depending on the character with the largest Unicode ordinal (1, 2, or 4 bytes) in the represented string.
* PEP 3151: Reworking the OS and IO exception hierarchy: You don’t have to worry anymore about choosing the appropriate exception type between OSError, IOError, EnvironmentError, WindowsError, mmap.error, socket.error or select.error. All these exception types are now only one: `OSError`. 
* PEP 409 - Suppressing exception context:
```
raise AttributeError(attr) from None # disables display of chained exception context
```
The original exception context is available as `exc.__context__`
* PEP 3155: qualified name for classes and functions:
```
>>> class C:
...     def meth(self):
...         pass
>>> C.meth.__name__
'meth'
>>> C.meth.__qualname__
'C.meth'
```
* `dict.setdefault(key, default=None)` is now atomic. Doc: If key is in the dictionary, return its value. If not, insert key with a value of default and return default. default defaults to None.
* open() has new mode `'x'`, which fails if the file already exists (exclusive create).
* added [ipaddress](https://docs.python.org/3/library/ipaddress.html#module-ipaddress) module.
* abc module: abstract{property,classmethod,staticmethod} are now deprecated. use property/classmethod/staticmethod together with [abc.abstractmethod()](https://docs.python.org/3/library/abc.html#abc.abstractmethod)

## Subgenerators: yield from
yield from iterable:
```
>>> def g(x):
...  yield from range(x, 0, -1)
...  yield from range(x)
... 
>>> list(g(3))
[3, 2, 1, 0, 1, 2]
```
However, unlike an ordinary loop, yield from allows subgenerators to receive sent and thrown values directly from the calling scope, and return a final value to the outer generator:
```
def accumulate():
    tally = 0
    while 1:
        next = yield
        if next == "stop":
            return tally
        tally += next

def gather_tallies(tallies):
    while 1:
        tally = yield from accumulate()
        tallies.append(tally)

tallies = []
acc = gather_tallies(tallies)
next(acc)      # initialize accumulator

print(tallies) # []
for i in range(4):
    acc.send(i)
acc.send("stop") 

print(tallies) # [6]
for i in range(5):
    acc.send(i)
acc.send("stop")

print(tallies) # [6, 10]
```
* `time.monotonic()` returns HW clock ticks.


# 3.2
[What's New in Python 3.2](https://docs.python.org/3/whatsnew/3.2.html)

* [concurrent.futures](https://docs.python.org/3/whatsnew/3.2.html) module inspired by java.util.concurrent. Future object that abstracts features common to threads, processes, and remote procedure calls. 
```
import concurrent.futures, shutil
with concurrent.futures.ThreadPoolExecutor(max_workers=4) as e:
    e.submit(shutil.copy, 'src1.txt', 'dest1.txt')
    e.submit(shutil.copy, 'src2.txt', 'dest2.txt')
    e.submit(shutil.copy, 'src3.txt', 'dest3.txt')
    e.submit(shutil.copy, 'src3.txt', 'dest4.txt')
```
* `__pychache__` directory and `__cached__` attribute for modules introduced for saving different PYC files for the same module.
```
>>> concurrent.__cached__
'/usr/lib/python3.7/concurrent/__pycache__/__init__.cpython-37.pyc'
```
* range objects support now index(obj) and count(obj) methods
* [@functools.total\_orderning()] to fill in equality and inequality methods. E.g. if you suppy `__eq__` and `__lt__` it will fill-in `__le__`, `__gt__` and `__ge__`
* abc module now supports `abstractclassmethod()` and `abstractstaticmethod()`
* os module now supports fsencode() and fsdecode() for encoding and decoding of filenames.
* GIL check interval for thread switches is now tunable via `sys.setswitchinterval()`

# 3.1
[What's New in Python 3.0](https://docs.python.org/3/whatsnew/3.0.html)

* PEP 378: Format Specifier for Thousands Separator
```
>>> format(12345, ',.2f')
'12,345.00'
```
* The int() type gained a `bit_length` method that returns the number of bits necessary to represent its argument in binary
```
>>> int(123123123).bit_length()
27
```
* The fields in format() strings can now be automatically numbered:
```
>>> 'Sir {} of {}'.format('Gallahad', 'Camelot')
'Sir Gallahad of Camelot'
```
* unittest improvements:
```
class TestGizmo(unittest.TestCase):

    @unittest.skipUnless(sys.platform.startswith("win"), "requires Windows")
    def test_gizmo_on_windows(self):
        ...

    @unittest.expectedFailure
    def test_gimzo_without_required_library(self):
        ...

    def test_division_by_zero(self):
        with self.assertRaises(ZeroDivisionError):
            x / 0
```

# 3.0
[What's New in Python 3.0](https://docs.python.org/3/whatsnew/3.0.html)

* range() replaces xrange() and behaves like the rater
* zip(), map() and filter() return iterators
* dict methods keys(), values(), items() return views instead of lists.
* Now there is only int type, which behaves like long.
* Octal literals are no longer of the form 0720; use 0o720 instead.
* An expression like 1/2 returns a float. Use 1//2 to get the truncating behavior.
* The type used to hold text is str, the type used to hold data is bytes. As the str and bytes types cannot be mixed, you must always explicitly convert between them. Use str.encode() to go from str to bytes, and bytes.decode() to go from bytes to str. You can also use bytes(s, encoding=...) and str(b, encoding=...), respectively.
* The repr() of a string no longer escapes non-ASCII characters. It still escapes control characters and code points with non-printable status in the Unicode standard, however.
* PEP 3131: Non-ASCII letters are now allowed in identifiers. (However, the standard library remains ASCII-only with the exception of contributor names in comments.)
* PEP 3102: Keyword-only arguments. Named parameters occurring after \*args in the parameter list must be specified using keyword syntax in the call. You can also use a bare `*` in the parameter list to indicate that you don’t accept a variable-length argument list, but you do have keyword-only arguments.
* PEP 3132: Extended Iterable Unpacking.
```
>>> a, *rest, b = range(10)
>>> a
0
>>> b
1
>>> rest
[2, 3, 4, 5, 6, 7, 8, 9]
>>> a, b, *rest = range(10)
>>> b
9
>>> rest
[1, 2, 3, 4, 5, 6, 7, 8]
>>> 
```
PEP 3115: New Metaclass Syntax. You must now use:
```
class C(metaclass=M):
    ...
```
* Removed backticks (use repr() instead).
* Integer literals no longer support a trailing l or L.
* The from module import * syntax is only allowed at the module level, no longer inside functions.
* Killed sets. Use the built-in set() class.
* A new system for built-in string formatting operations replaces the % string formatting operator. (However, the % operator is still supported; it will be deprecated in Python 3.1 and removed from the language at some later time.) 
* The concept of “unbound methods” has been removed from the language. When referencing a method as a class attribute, you now get a plain function object.
* `__getslice__()`, `__setslice__()` and `__delslice__()` were killed. The syntax `a[i:j]` now translates to `a.__getitem__(slice(i, j))` (or `__setitem__()` or `__delitem__()`, when used as an assignment or deletion target, respectively).
* PEP 3114: the standard next() method has been renamed to `__next__()`.
* `__nonzero__()` is now `__bool__()`.
* The `__oct__()` and `__hex__()` special methods are removed – oct() and hex() use `__index__()` now to convert the argument to an integer.
* PEP 3135: New super(). You can now invoke super() without arguments and (assuming this is in a regular instance method defined inside a class statement) the right class and instance will automatically be chosen. With arguments, the behavior of super() is unchanged.
* Removed. `dict.has_key()` – use the `in` operator instead.

## Changes to Exceptions
* PEP 352: All exceptions must be derived (directly or indirectly) from BaseException. 
* PEP 3110: Catching exceptions. You must now use except SomeException as variable instead of except SomeException, variable. Moreover, the variable is explicitly deleted when the except block is left.
* PEP 3109: Raising exceptions. You must now use raise Exception(args) instead of raise Exception, args.
* Exceptions no longer behave as sequences. Use the args attribute instead.
* PEP 3134: Exception chaining.
```
raise SecondaryException() from primary_exception
```
* PEP 3134: Exception objects now store their traceback as the `__traceback__` attribute.
