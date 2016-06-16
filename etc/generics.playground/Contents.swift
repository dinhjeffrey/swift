//: Playground - noun: a place where people can play

// generic allows us to avoid repetitive code because of type requirements

func printAnyArray<T>(anything: [T]) {
    for element in anything {
        print ("\(element)")
    }
}

printAnyArray(["ONE", "PUNCH", "MAN"])
printAnyArray([1, 2, 3])


func areTheyEqual<T: Equatable>(val1: T, val2: T) -> Bool {
    return val1 == val2
}

print(areTheyEqual("1", val2: "2"))

func compareThem<T: Comparable>(val1: T, val2: T) -> Bool {
    return val1 < val2
}
print(compareThem("a", val2: "b"))



