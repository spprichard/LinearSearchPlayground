// Errors that Linear Search can throw
enum LSErrors: Error {
    case NotFound
}


func LinearSearch<T: Equatable>(_ array:[T], _ item:T) -> Int? {
    for (index, object) in array.enumerated() where item == object {
        return index
    }
    
    return nil
}

let testArray = [1,4,5,21,56,20,65,4,6,75,100,1,0]


// An Item in the Array
guard let r1 = LinearSearch(testArray, 20) else {
    print("Item not found")
    throw LSErrors.NotFound
}
print("r1: \(r1)")


// An Item NOT in the Array
guard let r2 = LinearSearch(testArray, 7) else {
    print("Item not found")
    throw LSErrors.NotFound
}
print("r2: \(r2)")



// So the stuff above is cool, but I want something better.
// I want to create my own "object" (LSSearch) that I can init with the array,
// then have a method on it called "Find" that takes anything that is Equatable
// and returns an optional Int representing the index of that item if found, if not it returns nil.
//struct LSSearch {
//    var array: [Equatable]
//   
//    init(_ array:[Equatable]) {
//        self.array = array
//    }
//    
//    func Find(_ item: Equatable) -> Int? {
//        for (index, object) in self.array.enumerated() where item == object {
//            return index
//        }
//        
//        return nil
//    }
//}

// You'll need to make LSSearch a generic type like this:
struct LSSearch<T: Equatable> {
    var array: [T]
    
    init(_ array:[T]) {
        self.array = array
    }
    
    func find(_ elementToFind: T) -> Int? {
        for (index, element) in self.array.enumerated() where element == elementToFind {
            return index
        }
        
        return nil
    }
}

// When you're done with that check out the Swift standard library's implementation of `index(of:)` at https://github.com/apple/swift/blob/ca6c6b1d362cb50d9ae48fb23be68ef3e975bec5/stdlib/public/core/CollectionAlgorithms.swift.gyb#L37
