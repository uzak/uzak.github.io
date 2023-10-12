[#](#) Python

* [What's new in Python 3](python_whats_new_3)
* [What's new in Python 2](python_whats_new_2)

logging levels:

    print(logging.Logger.manager.loggerDict)

yapf:

    $ cat .pre-commit-config.yaml 
    ---
    repos:
    - repo: https://github.com/pre-commit/mirrors-yapf
        rev: ''  # Use the sha / tag you want to point at
        hooks:
        - id: yapf
        - 
    $ cat .style.yapf 
    [style]
    column_limit = 79


* [testing](testing)
  
requests/urllib3 disable logging:

    import logging

    logging.getLogger("requests").setLevel(logging.WARNING)
    logging.getLogger("urllib3").setLevel(logging.WARNING)

or rather
    
    logging.basicConfig(format='%(asctime)s %(filename)s:%(lineno)s - %(message)s')
    log = logging.getLogger(__name__)
    log.setLevel(logging.DEBUG)

  
# String Formatting

    f"{x=:.2f}"
  
# Libs

# Decorators

    def reconnect(try_for=30, repeat_after=5,
                exceptions=(requests.exceptions.ConnectionError,)):
        """This is a decorator that will repeat the function `func` until
        no exception is thrown. On `exceptions` a reconnect attempt will be
        made after `repeat_after` seconds."""
        def decorator(func):
            def wrapper(self):
                last_ex = None
                start = time.time()
                while (start + try_for) > time.time():
                    try:
                        func(self)
                        last_ex = None
                        log.debug("Successfully executed `%s`", func.__name__)
                        break
                    except exceptions as ex:
                        log.error("Executing of `%s` failed because of %s (%s)",
                                func.__name__, type(ex), ex)
                        last_ex = ex
                        log.debug("Sleeping for %ss", repeat_after)
                        time.sleep(repeat_after)
                if last_ex:
                    raise last_ex
            return wrapper
        return decorator

* [re module](re-module)
* [datetime](datetime)
* [peewee](peewee)
* [pre commmit](pre-commmit)

