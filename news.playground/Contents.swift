//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground 😀"

//str.forEach {
//    print($0)
//}

//for char in str {
//    print(char);
//}

print(str.isEmpty)
//print(str.dropFirst())
print(String(str.reversed()))
str.count
print(str.last!.unicodeScalars.first!.isASCII)
let str1 = str.filter { c in
    let isASCII = c.unicodeScalars.reduce(true, { x, y in
        y.isASCII
    })
    return isASCII
}
print(str1)

let numbers = [1, 2, 3, 4]
let numberSum = numbers.reduce(0, { x, y in
    x + y
})
print(numberSum)

// Multiple line String literals
let text = """
First row,
Second row,
Third row
"""

// Dictionary and Set
// Sequence based initialization
let keys = ["Viet Nam", "Japan", "China", "Jamaica"]
let values = ["Ha Noi", "Tokyo", "Beijing", "Jamaica"]

var countries = Dictionary(uniqueKeysWithValues: zip(keys, values))
for (key, value) in countries {
    print("\(value) is the capital of \(key)\n")
}

// Duplicate Key Resolution
let favoriteStarVotes = ["Alpha Centauri A", "Wolf 359", "Alpha Centauri A", "Barnard's Star"]
favoriteStarVotes.count
let mergedKeysAndValues = Dictionary(zip(favoriteStarVotes, repeatElement(1, count: favoriteStarVotes.count)), uniquingKeysWith: +)

// Filtering
let closeStars = countries.filter { $0.key.count < 6 }
closeStars

// Dictionary Mapping
let mapped = countries.mapValues {"\($0) mapped-action"}
mapped

// Dictionary Default Values

// Dictionary Grouping
let favoriteStarVotesByFirstLetter = Dictionary(grouping: favoriteStarVotes) { $0.first! }
favoriteStarVotesByFirstLetter

// Reserving Capacity
countries.capacity
countries.reserveCapacity(20)
countries.capacity

// Private access modifier fileprivate -> private

// archival and serialization
struct CuriosityLog: Codable {
    enum Discovery: String, Codable {
        case rock, water, martian
    }
    
    var sol: Int
    var discoveries: [Discovery]
}

let logSol42 = CuriosityLog(sol: 42, discoveries: [.rock, .rock, .rock])

let jsonEncoder = JSONEncoder()

let jsonData = try jsonEncoder.encode(logSol42)

let jsonString = String(data: jsonData, encoding: .utf8)

let jsonDecoder = JSONDecoder()
let decodedLog = try jsonDecoder.decode(CuriosityLog.self, from: jsonData)
decodedLog.sol


// Key-Value Coding
struct Lightsaber {
    enum Color {
        case blue, green, red
    }
    let color: Color
}

class ForceUser {
    var name: String
    var lightsaber: Lightsaber
    var master: ForceUser?
    
    init(name: String, lightsaber: Lightsaber, master: ForceUser? = nil) {
        self.name = name
        self.lightsaber = lightsaber
        self.master = master
    }
}

let sidious = ForceUser(name: "Darth Sidious", lightsaber: Lightsaber(color: .red))
let obiwan = ForceUser(name: "Obi-Wan Kenobi", lightsaber: Lightsaber(color: .blue))
let anakin = ForceUser(name: "Anakin Skywalker", lightsaber: Lightsaber(color: .blue), master: obiwan)
let nameKeyPath = \ForceUser.name
let obiwanName = obiwan[keyPath: nameKeyPath]
let anakinSaberColor = anakin[keyPath: \ForceUser.lightsaber.color]

// One-Sided Ranges
var planets = ["Mercury", "Venus", "Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune"]
let outsideAsteroidBelt = planets[4...]
outsideAsteroidBelt
let firstFouth = planets[..<4]
firstFouth

// Infinite Sequence
var numberedPlanets = Array(zip(1..., planets))
numberedPlanets

// Pattern matching
func temperature(planetNumber: Int) {
    switch planetNumber {
    case ...2:
        print("Too hot")
    case 4...:
        print("Too cold")
    default:
        print("Just right")
    }
}

temperature(planetNumber: 3)

// Generic Subscripts
struct GenericDictionary<Key: Hashable, Value> {
    private var data: [Key: Value]
    
    init(data: [Key: Value]) {
        self.data = data
    }
    subscript<T>(key: Key) -> T? {
        return data[key] as? T
    }
}

var earthData = GenericDictionary(data: ["name": "Earth", "population": 7500000000, "moons": 1])

let name: String? = earthData["name"]
name

let population: Int? = earthData["population"]
population
