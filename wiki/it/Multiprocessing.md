# Multiprocessing

fork:

    import os
    newpid = os.fork()
    if newpid == 0:
        child()
    else:
        parent()
    print(os.getpid())
    

https://serverfault.com/a/598005

https://docs.python.org/3/library/multiprocessing.html   

* [Raymond 2017](https://pybay.com/site_media/slides/raymond2017-keynote/process.html#scripting-style)
* [Parallelism in one line (multiprocessing.Pool.map)](https://chriskiehl.com/article/parallelism-in-one-line)
* https://timber.io/blog/multiprocessing-vs-multithreading-in-python-what-you-need-to-know/
    * Lot of I/O or Network usage. **Multithreading** is your best bet because of its low overhead
    * GUI: **Multithreading** so your UI thread doesn't get locked up
    * If your code is CPU bound. Use **multiprocessing** (if your machine has multiple cores) 
    
## Threading

https://docs.python.org/3/library/threading.html

* **Daemon thread** - entire program exists only when daemon threads are left.
* `join()` waits until the thread terminates
* **Lock** 
    * locked/unlocked (default state)
    * `acquire()`: set locked=True and return if unlocked; otherwise block
    * `release()`: set locked=False
* **Rlock** Reentrant lock. May be acquired several times by the same thread. It introduces the concept of "owning thread" and "recursion level". Only after final `release()` the lock is released.
* **Condition** - for consumer/producer
    * `wait()`
    * `notify()`, `notify_all()`
* **Semaphore** - one of the oldest sync primitives, introduced by Dijkstra. Guards resources with limited capacity. E.g. connection pool.
    * `P()` ->  `acquire()`: counter--; block if counter == 0 
    * `V()` -> `release()`: counter++
* **Event** simple mechanism. `set()`/`clear()`, `wait()`
* **Timer** - call action after a certain time
* **Barrier** - block until a given threshold has been reached. Then release all threads simultaneously.

A Lock, Condition and a Semaphores (all w. `acquire()` and `release()`) can be used in the `with` statement.
