
public struct HashTable<Key: Hashable, Value> {
    typealias ElementPair = (key: Key, value: Value)
    
    var array: [[ElementPair]]
    
    public init(capacity: Int) {
        array = [[ElementPair]](repeating: [], count: capacity)
    }
    
    func index(forKey key: Key) -> Int {
        let retVal = abs(key.hashValue) % array.count
        return retVal
    }
    
    func value(forKey key: Key) -> Value? {
        let index = index(forKey: key)
        let list = array[index]
        for pair in list {
            if pair.key == key {
                return pair.value
            }
        }
        return nil // Key not found in hash table
    }
    
    mutating func updateValue(val: Value, forKey key: Key) {
        let index = index(forKey: key)
        for (idx, pair) in array[index].enumerated() {
            if pair.key == key {
                array[index][idx] = (key, val)
                return
            }
        }
        
        // Key not found in hash table
        array[index].append((key,val))
    }
    
    mutating func removeValue(forKey key: Key) {
        let index = index(forKey: key)
        for (idx, pair) in array[index].enumerated() {
            if pair.key == key {
                array[index].remove(at: idx)
            }
        }
    }
    
    subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set(newValue) {
            if let val = newValue {
                updateValue(val: val, forKey: key)
            }
            else {
                removeValue(forKey: key)
            }
        }
    }
}

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
 





