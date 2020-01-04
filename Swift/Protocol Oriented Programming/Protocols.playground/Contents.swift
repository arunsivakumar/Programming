import UIKit


//protocol BinaryRepresentable {
//    var tag: String { set get }
//    var data: Data { get }
//    static var counter: Int { get }
//    mutating func update(data: Data) -> Bool
//    static func incrementCounter()
//    
//    init(tag: String, data: Data)
//}
//
//
//struct TaggedData: BinaryRepresentable {
//    
//    init(tag: String, data: Data) {
//        self.tag = tag
//        self.data = data
//    }
//
//    static func incrementCounter() {
//        TaggedData.counter += 1
//    }
//
//    mutating func update(data: Data) -> Bool {
//        return false
//    }
//
//    static var counter: Int = 0
//
//    var data: Data
//
//    var tag: String
//
//}

// 02-04

protocol Shape {
    var area: Double { get }
}

struct Square: Shape {
    let side: Double
    
    var area: Double {
        return side * side
    }
}

struct Rectangle: Shape {
    let width: Double
    let height: Double
    
    var area: Double {
        return width * height
    }
}

struct Rhombus: Shape {
    let d1: Double
    let d2: Double
    
    //
    var area: Double {
        return (d1 * d2) / 2
    }
}

struct Circle: Shape {
    let radius: Double
    
    // A = π * r^2
    var area: Double {
        return .pi * radius * radius
    }
}

var square = Rectangle(width: 10, height: 20)
print(square.area)

var circle = Circle(radius: 100)
print(circle.area)


var shapes = [Shape]()
shapes.append(square)
shapes.append(circle)

for shape in shapes{
    print(shape.area)
}

protocol BinaryRepresentable {
    var tag: String { set get }
    var data: Data { get }
    init(tag: String, data: Data)
}


// Protocol inheritance
protocol BinaryPersistable: BinaryRepresentable{
    init (tag: String, contentsOf: URL) throws
    func persist(url: URL) throws
}

protocol Base64Encodable: BinaryRepresentable{
    var base64: String { get }

}

// Protocol Extension
extension BinaryPersistable{
    init (tag: String, contentsOf: URL) throws{
        let data = try Data.init(contentsOf: contentsOf)
        self.init(tag: tag, data: data)
        
    }
    
    func persist(url: URL) throws{
        try self.data.write(to: url)
    }
}

extension Base64Encodable{
    var base64: String{
        return self.data.base64EncodedString()
    }
    
}

struct PersistableData: BinaryPersistable{
    var tag: String
    var data: Data
}

struct EncodableData: Base64Encodable{
    var tag: String
    var data: Data
}


// Protocol Composition
struct MyData: Base64Encodable, BinaryPersistable  {
    var tag: String
    var data: Data
    
}

extension MyData: CustomStringConvertible{
    var description: String{
        return "Mydata \(tag)"
    }
}

extension MyData: Equatable{
    static func  == (lhs: MyData, rhs: MyData) -> Bool{
        return lhs.tag == rhs.tag && lhs.data == rhs.data
    }
}
