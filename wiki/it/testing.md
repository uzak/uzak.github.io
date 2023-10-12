# Testing

* https://uzak.github.io/2019/12/python__testing

## pytest

    pytest --log-cli-level=10       # to show program's debug output

https://salmonmode.github.io/2019/03/29/building-good-tests.html

* A fixture should do or provide only a single thing.
* Do not test the setups (fixtures). Test the end result.
* For every fixture that represents a change in the state, there should be a test for that state
* Use 1 assert per method.
* Use standard assert statements instead of unittest.TestCase methods.
* Don't inherit from unittest.TestCase.
* Use class, module, package scope to hold tests for a single state.
* Names of the package, module, class, method should fullu describe what is being tested.
* Parameterized tests should have unique and readable names.
* Every test should be able to run in parallel w. any other test
* Mock less (the more you mock, the less you test)
* Code hard to test is code hard to use.
* Use classes/namedtupes to pass data arround.
* Code should read like a short story by C.S.Lewis - succinct and idiomatic.

### conftest.py

one time initialization for a test run. Define:

`pytest_configure` and `pytest_unconfigure`
