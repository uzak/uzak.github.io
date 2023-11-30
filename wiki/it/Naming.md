# Naming

*There are only two hard things in Computer Science: cache invalidation and naming things.* -- Phil Karlton

*There are two hard things in computer science: cache invalidation, naming things, and off-by-one errors.* – Leon Bambrick

Name is used for communication.

pragmatic programmer:
    Names are deeply meaningful to your brain, and misleading names can add chaos to your code.

    TIP 54 Use a Project Glossary

    It’s very hard to succeed on a project where users and developers refer to the same thing by different names, or even worse, refer to different things by the same name.

Good names


Bad names

    for relative_path in relative_paths:
        ...
        

https://www.mediawiki.org/wiki/Naming_things
    avoid ambiguity
    make it easy to pronounce, type, remember
    abbreviations
    stick with a single name
    
https://carlalexander.ca/importance-naming-programming/
    understand the problem your code is solving
    use words that everywone can understand
    who is a user?
        empathize with others
    be explicit in your code
        clear names
        don't use abbrefiations
        keep functions and methods small
    the comment smell
    
https://medium.com/hackernoon/naming-the-things-in-programming-230590016f00
    variables or functions should be named by its work
    naming should be simple enough to be understood by everyone
    prefer concrete names over abstract ones
    don't hesitate to user longer names
    Prepare yourself to make a mindset that you won’t be writing more comments now, your naming will provide an insight into the process.
    

Context qualifies. Once speaking about American politics you don't need to say American Republican Party but "Republican Party" is good enough. Speaking about your family you don't need to say Peter Adams Senior but just "Vater".

    
## Workshop

### Name them
* Goal: understand that naming is a play between: namespace (context) + name
* Sufficient qualification is required.
* Qualification should be only as much is required to get rid of ambiguity.

#### Schol
1) context: Harvard Elementary School
2) roles: Director, Secretary, Profesor of Spanish, Profesor of Music, Accountant, Accountant

Provide good variable names for the roles and the school.


#### Jungle
1) context: A vet and warm forest somewhere in India
2) observations: 
    * big catlike animals with stripes that gave me fear
    * big green jungle parrot, super noisy. I did not like.
    * small green parrot
    * black monkey with light head and short tail
    * stripped jungle monkey making noises
    * a very big predator bird with big talons and huge beak. All the other animals fear it.


### Magic Constants

Determine the out the meaning:

#### Task 1
* 7
* Snowwhite and 7
* Snowwhite and NO_OF_DWARFS.
  
#### Task 2
* for _ in range(10): get_lock(); break
* for _ in range(MAX_ATTEMPTS): get_lock(); break

#### Task 3
* 10
* sleep 10
* sleep TIMEOUT_BEFORE_KILL

# Misc

don't make the context part of the name:
    for hhme in hhm.email_addresses  VS.
    for email in hhm.email_addresses
    
    
## Task2: Naming

Inheritance was all about finding similarities and pushing them up. Naming, on the contrary, is about finding differences. Given two objects, I want their names (handles) to identify the corresponding object without doubt.

Names `lisi` and `lizi` won't provide too much difference. Neither will `animal1`, `animal2`, `animal3` nor `zoo_chucky_animal`, `zoo_chicky_animal` and `zoo_checky_animal`.

So be creative, our goal is now to find names that unmistakenly identify the one or the other. The names should be as different as possible to prevent mistakes. And the name should be related to the objects, otherwise you won't be able to make the association easily.

Now name the animals from above.
