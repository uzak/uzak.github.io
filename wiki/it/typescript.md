# Contents

- [Theory](#theory)
- [Installation](#installation)
    - [Usage](#usage)
- [Code](#code)
    - [Types](#types)
    - [Functions](#functions)
    - [Interfaces](#interfaces)
    - [Classes](#classes)

# Theory
* Superset of JavaScript by M$; compiles to JS
* Designed for creation of large apps
* Static Type Checking (completely optional). Types:
    * String
    * Number
    * Boolean
    * Array
    * Any
    * Void
    * Null (undefined)
    * Tuple
    * Enum
    * Generics
* Class Base Objects
    * No prototypes required
    * Access modifiers
    * Encapsulation
    * Inheritance
* Modularity

# Installation
```bash
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
sudo apt-get install -y nodejs
sudo npm install -g typescript
```

## Usage
```bash
$ tsc types.tsc
$ tsc types.tsc -w                # watch mode
```

# Code
## Types
```typescript
let myString: string;
let myNum: number;
let myBool: boolean;
let myVar: any;

let myVoid: void = null;
let myUndefined: undefined = null;

/*
let strArray: string[];
let numArr: number[] = [1, 2, 3];
*/

let strArray: Array<string>;
let numArr: Array<number> = [1, 2, 3];

let strNumTuple: [string, number];

myString = "Hello" + "World".slice(0);
myNum = -22;
myNum = 0o31;
myBool = true;
myVar = "Omega";

strArray = ["Hello", 'World'];
strNumTuple = ["Hello", 4];

console.log(strNumTuple);
```

## Functions
```typescript
function getSum(num1: number, num2: number): number {
    return num1 + num2;
}

console.log(getSum(1, 4));

let mySum = function(num1: any, num2: any): number {
    if (typeof num1 == 'string') {
        num1 = parseInt(num1);
    }
    if (typeof num2 == 'string') {
        num2 = parseInt(num2);
    }
    return num1 + num2;
}

console.log(mySum('3', '5'));

// optional parameter with ?
function getName(firstName: string, lastName?: string): string {
    if (lastName == undefined) {
        return firstName;
    }
    return firstName + ' ' + lastName;
}

console.log(getName("John", 'Doe'))
console.log(getName("John"))
```

## Interfaces
```typescript
interface Todo {
    title: string;
    text: string;
}

function showTodo(todo: Todo) {
    console.log(todo.title + ' ' + todo.text)
}

let myTodo = {title: 'Trash', 'text': 'Take out trash'};
showTodo(myTodo)
```

## Classes
```typescript
interface UserInterface {
    name: string;
    email: string;
    age: number;

    register();
    payInvoice();
}

class User implements UserInterface {
    public name: string;
    public email: string;
    age: number;

    constructor(name: string, email: string, age: number) {
        this.name = name;
        this.email = email;
        this.age = age;

        console.log('User Created: ' + this.name)
    }

    register() {
        console.log(this.name + ' is now registered')
    }

    payInvoice() {
        console.log(this.name + ' paid invoice')
    }
}

class Member extends User {
    id: number;

    constructor(id: number, name: string, email: string, age: number) {
        super(name, email, age);
        this.id = id;
    }

    payInvoice() {
        super.payInvoice()
    }
}

let john = new User('John Doe', 'john@doe.com', 33)
john.register()

let mike = new Member(42, 'Mike X', 'mikex@gmail.com', 11)
mike.payInvoice()
```
