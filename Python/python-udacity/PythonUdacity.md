# Python
### 1.Data Structures

###### Lists
ordered - mutable
```
month = ['J','F']
list_of_random_things = [1, 3.4, 'a string', True]

```
###### Slice and Dice
```
month[:2]
eclipse_dates  = eclipse_dates[-3:] //last 3 items
```

###### Strings

'this' in 'this is a string'


Strings are immutable
Lists are mutable and contain any data type
Both are ordered so indexing works good

Lists are references
Strings are value types
```
len()
max() - doesnt work on list with in-compatable types
min()
sorted()
```

```
Strings
join()

name = "-".join(["García", "O'Kelly"])
print(name)
García-O'Kelly

append()
letters = ['a', 'b', 'c', 'd']
letters.append('z')
['a', 'b', 'c', 'd', 'z']
```

###### Tuples
immutable - ordered

###### Sets
unique - unordered
use in

```
pop()
union, intersection and difference
```

###### Dictionaries
keys and values
```
elements = {"hydrogen": 1, "helium": 2, "carbon": 6}
print(elements["helium"])
```
get is a better lookup that returns NONE
KeyError occurs if there is no value

== for comparing value
is for comparing same object type


Data Structure	Ordered	Mutable	Constructor	Example   
List	Yes	Yes	[ ] or list()	[5.7, 4, 'yes', 5.7]   
Tuple	Yes	No	( ) or tuple()	(5.7, 4, 'yes', 5.7)   
Set	No	Yes	{}* or set()	{5.7, 4, 'yes'}   
Dictionary	No	No**	{ } or dict()	{'Jun': 75, 'Jul': 89}   
* You can use curly braces to define a set like this: {1, 2, 3}. However, if you leave the curly braces empty like this: {} Python will instead create an empty dictionary. So to create an empty set, use set().   
** A dictionary itself is mutable, but each of its individual keys must be immutable.


### 2. Control Flow

###### Conditional Statements
```
if phone_balance < 5:
    phone_balance += 10
    bank_balance -= 10
```
```
if season == 'spring':
    print('plant the garden!')
elif season == 'summer':
    print('water the garden!')
elif season == 'fall':
    print('harvest the garden!')
elif season == 'winter':
    print('stay indoors!')
else:
    print('unrecognized season')
```

###### Boolean Expressions

==, and, or , not

###### For and While Loops

```
for city in cities:
  print(city.title())

for i in range(5):

for i in range(5, 35, 5):
    print(i)

while sum(hand) <=17:
  print("less")
```

###### Break and Continue
###### Zip and Enumerate
```
letters = ['a', 'b', 'c']
nums = [1, 2, 3]

for letter, num in zip(letters, nums):
    print("{}: {}".format(letter, num))

[('a', 1), ('b', 2), ('c', 3)]

some_list = [('a', 1), ('b', 2), ('c', 3)]
letters, nums = zip(*some_list)

letters = ('a','b','c')
nums = (1,2,3)

```
```
letters = ['a', 'b', 'c', 'd', 'e']
for i, letter in enumerate(letters):
    print(i, letter)
    0 a
    1 b
    2 c
    3 d
    4 e

```
###### List Comprehensions

### Functions
```
def cylinder_volume(height, radius):
    pi = 3.14159
    return height * pi * radius ** 2

egg_count = 0

    def buy_eggs():
        egg_count += 12 # buggy

buy_eggs()

egg_count = 0

def buy_eggs(count):
    return count + 12  # purchase a dozen eggs

egg_count = buy_eggs(egg_count) //assign works

```


###### Docstrings

```
def readable_timedelta(days):
    """
    Return a string of the number of weeks and days included in days.

    Parameters:
    days -- number of days to convert (int)

    Returns:
    string of the number of weeks and days included in days
    """
    weeks = days // 7
    remainder = days % 7
    return "{} week(s) and {} day(s)".format(weeks, remainder)
```

###### Lambda Expressions

```
def multiply(x, y):
    return x * y

multiply = lambda x, y: x * y

multiply(4, 7)


cities = ["New York City", "Los Angeles", "Chicago", "Mountain View", "Denver", "Boston"]

def is_short(name):
    return len(name) < 10

short_cities = list(filter(lambda x: len(x) < 10, cities))
print(short_cities)

```

### Scripting
###### Files

```
Read
f = open('my_path/my_file.txt', 'r')
file_data = f.read()
f.close()

Write
f = open('my_path/my_file.txt', 'w')
f.write("Hello there!")
f.close()
```

###### Import

```
import useful_functions as uf
uf.add_five([1, 2, 3, 4])
```
```
if __name__ == '__main__':
    main()
```


To import an individual function or class from a module:
```  
from module_name import object_name   
```

To import multiple individual objects from a module:
```   
from module_name import first_object, second_object
```

To rename a module:
```
import module_name as new_name
```

To import an object from a module and rename it:
```
from module_name import object_name as new_name
```

To import every object individually from a module (DO NOT DO THIS):
```
from module_name import *
```

If you really want to use all of the objects from a module, use the standard import module_name statement instead and access each of the objects with the dot notation.
```
import module_name
```

###### Submodule
```
import package_name.submodule_name
```

###### 3-rd party libraries
```
pip install -r requirements.txt
```

###### Errors & Exceptions

###### Iterators & Generators
