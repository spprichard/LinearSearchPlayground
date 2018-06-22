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

struct LSSearch<T: Equatable> {
    var array: [T]
    
    init(_ array:[T]) {
        self.array = array
    }
    
    func Find(_ item: T) -> Int? {
        for (index, element) in self.array.enumerated() where item == element {
            return index
        }
        
        return nil
    }
}

let letters = ["L", "B","A", "Q","B", "G","D", "R"]
let lsLetters = LSSearch(letters)
lsLetters.Find("R")

let numbers = [1,5,5,7,4,3,4,6,3,6,43,6,76,7,3,234,6,34,6,85,12]
let lsNumbers = LSSearch(numbers)
// Will return the first occurance of the number
lsNumbers.Find(5)
