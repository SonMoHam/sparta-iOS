import UIKit

// MARK: - 반복문 연습

//var people = ["철수","영희","민수","형준","기남","동희"]
//for person in people {
//    print(person)
//}
//for i in 0..<people.count {
//    let person = people[i]
//    print(person)
//}

// MARK: - 옵셔널 연습

//var str: String? = "happy"
//print(str?.uppercased())
//print(str!.uppercased())

var value: Int = 3
var valueToBeSet: Int! = 4
var valueCanBeNil: Int? = 5
print("value: \(value) \(type(of: value))")
print("valueToBeSet: \(valueToBeSet) \(type(of: valueToBeSet))")
print("valueCanBeNil: \(valueCanBeNil) \(type(of: valueCanBeNil))")

value = valueToBeSet // 가능
print("value: \(value) \(type(of: value))")
//value = valueCanBeNil // 에러, Int 에 Int? 배정 불가
//value = valueCanBeNil! // 가능

//value = nil // 에러, Int 에 nil 배정 불가
//valueToBeSet = nil // 가능
//valueCanBeNil = nil // 가능
