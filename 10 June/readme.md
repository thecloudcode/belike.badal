# Python Collections 📚🐍

Python offers several built-in collection data types to manage groups of data. Here, we'll explore **Dictionaries**, **Sets**, **Lists**, and **Tuples**.

## 1. Dictionaries 📖

**Dictionaries** are unordered collections of key-value pairs. Each key is unique and maps to a value.

### Creating a Dictionary

```python
my_dict = {
    "name": "Alice",
    "age": 25,
    "city": "Wonderland"
}
```

### Accessing Values

```python
print(my_dict["name"])  # Output: Alice
```

### Adding/Updating Entries

```python
my_dict["email"] = "alice@example.com"  # Add a new key-value pair
my_dict["age"] = 26  # Update the value for the key "age"
```

### Removing Entries

```python
del my_dict["city"]  # Remove the key-value pair with key "city"
```

## 2. Sets 🌟

**Sets** are unordered collections of unique elements. They are useful for membership tests and eliminating duplicate entries.

### Creating a Set

```python
my_set = {1, 2, 3, 4, 5}
```

### Adding Elements

```python
my_set.add(6)  # Add a new element
```

### Removing Elements

```python
my_set.remove(3)  # Remove an element
```

### Set Operations

```python
# Union
another_set = {4, 5, 6, 7}
union_set = my_set | another_set

# Intersection
intersection_set = my_set & another_set
```

## 3. Lists 📋

**Lists** are ordered collections of elements. They allow duplicate entries and are mutable (modifiable).

### Creating a List

```python
my_list = [1, 2, 3, 4, 5]
```

### Accessing Elements

```python
print(my_list[0])  # Output: 1
```

### Adding Elements

```python
my_list.append(6)  # Add an element to the end
```

### Removing Elements

```python
my_list.remove(3)  # Remove the first occurrence of the element 3
```

### Slicing a List

```python
sub_list = my_list[1:3]  # Get elements from index 1 to 2
```

## 4. Tuples 🎁

**Tuples** are ordered, immutable collections of elements. They can be used to group related data.

### Creating a Tuple

```python
my_tuple = (1, 2, 3, 4, 5)
```

### Accessing Elements

```python
print(my_tuple[0])  # Output: 1
```

### Immutability

```python
# This will raise an error since tuples are immutable
my_tuple[0] = 10
```

### Tuple Unpacking

```python
a, b, c, d, e = my_tuple
print(a, b, c, d, e)  # Output: 1 2 3 4 5
```

## Summary 🎯

- **Dictionaries** are key-value pairs with unique keys.
- **Sets** are unordered collections of unique elements.
- **Lists** are ordered collections of elements allowing duplicates.
- **Tuples** are ordered, immutable collections of elements.

Explore these collections to effectively manage data in your Python programs! 🚀
```
