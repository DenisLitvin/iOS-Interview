import Foundation

class Person {
    typealias ID = Int
    
    let id: ID
    var credit: [ID: Int] = [:]
    
    init(_ id: ID) {
        self.id = id
    }
    
    func give(to person: Person, amount: Int) {
        if amount == 0 { return }
        
        credit[person.id] = (credit[person.id] ?? 0) - amount
        person.credit[id] = (person.credit[id] ?? 0) + amount
        
        //clean up if settled
        if credit[person.id] == 0 {
            credit[person.id] = nil
        }
        if person.credit[id] == 0 {
            person.credit[id] = nil
        }
    }
}

extension Person: CustomStringConvertible {
    var description: String {
        let negative = credit.filter { $0.value < 0 }
        let positive = credit.filter { $0.value >= 0 }
        return "Person \(id)\n-debit: \(negative)\n-credit: \(positive)\n"
    }
}

let p1 = Person(1)
let p2 = Person(2)
let p3 = Person(3)
let p4 = Person(4)
let p5 = Person(5)
let people = [p1,p2,p3,p4,p5]

p1.give(to: p4, amount: 4)
p1.give(to: p5, amount: 1)
p2.give(to: p4, amount: 5)
p2.give(to: p5, amount: 2)
p3.give(to: p4, amount: 3)
p3.give(to: p5, amount: 8)

print("Before")
print(p1)
print(p2)
print(p3)
print(p4)
print(p5)

func splitwizeSimple(between people: [Person]) {
    
    var lookUpTable = [Person.ID: Person]()
    for person in people {
        lookUpTable[person.id] = person
    }
    
    for person in people {
        for connection in person.credit {
            print("Person \(person.credit[connection.key] ?? 0 > 0 ? connection.key : person.id) pays \(connection.value) to Person \(person.credit[connection.key] ?? 0 > 0 ? person.id : connection.key)")
            person.credit[connection.key] = nil
            lookUpTable[connection.key] = nil
        }
    }
}

//print("Splitwize Simple")
//splitwizeSimple(between: people)
//print()

func splitwizeMinimumCashflow(between people: [Person]) {
    var balance = [Person.ID: Int]()
    
    for person in people {
        //sum all credit
        balance[person.id] = person.credit.reduce(0) { return $0 + $1.value }
    }
    print(balance)
    splitwizeMinimumCashflowHelper(balance: &balance)
}

func splitwizeMinimumCashflowHelper(balance: inout [Person.ID: Int]) {
    
    let maxDebetor = balance.min { $0.value < $1.value }!
    let maxCredetor = balance.max { $0.value < $1.value }!
    
    if maxDebetor.value == 0 && maxCredetor.value == 0 {
        return
    }
    
    //non negative
    let minAmount = min(-maxDebetor.value, maxCredetor.value)
    balance[maxCredetor.key] = (balance[maxCredetor.key] ?? 0) - minAmount
    balance[maxDebetor.key] = (balance[maxDebetor.key] ?? 0) + minAmount

    print("Person \(maxCredetor.key) pays \(minAmount) to Person \(maxDebetor.key)")
    
    splitwizeMinimumCashflowHelper(balance: &balance)
}

print("splitwize minimum cashflow")
splitwizeMinimumCashflow(between: people)
print()

print("After")
print(p1)
print(p2)
print(p3)
print(p4)
print(p5)

/*
 Person 4 pays 5 to Person 1
 Person 4 pays 7 to Person 2
 Person 5 pays 11 to Person 3
**/
