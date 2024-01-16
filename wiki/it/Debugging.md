# Debugging
## Exercise 1
* 100 lines of code
* It's completely new to you, all the lines look the same
* There is one bug inside
* Find the bug in the most efficient way

## Exercise 2
* Labyrinth
* You're inside. Get out. All you have is a stacktrace (how you got in). 
* Find the bug, the needle in the haystack.

## [Why is it slow? Strategies for solving performance problems - presented by Caleb Hattingh](https://www.youtube.com/watch?v=3BnGyoyhSmM)
* You want to get the call stack!
* When possible, **CTRL+C** is fast and direct
* If you need more detail, use **pytest-profiling**
* If it's complicated, use **py-spy**
* If it's distributed, use a tracing system like **Honeycomb**
