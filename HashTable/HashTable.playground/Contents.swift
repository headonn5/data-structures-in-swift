var dict = HashTable<String, String>(capacity: 5)

// Assign key val pairs
 dict["firstName"] = "Nishant"
 dict["lastName"] = "Paul"
print(dict)

// Update dictionary
 dict["firstName"] = "Divya"
print(dict)

// Remove key val pair from dictionary
dict["lastName"] = nil
print(dict)
