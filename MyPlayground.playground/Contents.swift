import UIKit

var str = "Hello, playground"

let closure = {
    print("test")
}

closure()

let action = { (a: Int, b: Int) -> Int in
    return a * b
}

print(action(4,5))

class A {
    let closure: (Int, Int) -> Int /*тип замыкание*/
    
    init(closure: @escaping/*признак того, что замыкание - объект*/ (Int, Int) -> Int) {
        self.closure = closure
    }
    
    func run() {
        print(closure(4,5))
    }
}

let a1 = A(closure: action)
let a2 = A { (a, b) -> Int in
    return a + b
}

a1.run()
a2.run()

/*замыкание - не объект*/

func doSmth(action: ()-> Void) {
    action()
}

doSmth {
    print("хуй")
}

//вопросы на лоха

var x = 0

let closure1 = {
    x += 1
}

let closure2 = { [x]/*capture list*/ in
//    x += 1
}

closure1()
closure1()

print(x)



// ARC

weak var a3 = a1
weak var a4 = A { (a, v) -> Int in
    return 5
}

// reference cycle

class X {
    var y: Y?
    
    deinit {
        //
    }
}

class Y {
    weak var x: X?
    var callback: (() -> Void)?
}

let y = Y()

y.callback = { [weak y] in
    y?.x = X()
}

let closureRef = { [weak y] in
    y?.x = X()
}

let closureRef1 = { [unowned y] in
    y.x = X()
}

let closureRef2 = { [weak y] in
    guard let y = y else { return }
    
    y.x = X()
}



autoreleasepool {
    
}

// интернет


let url = URL(string: "https://www.flickr.com/services/rest/?method=flickr.interestingness.getList&api_key=59a8d76fe0e570afc02b97f1270dea83&format=json&nojsoncallback=1")!

// стандартная конфигурация
print("до")
let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    print("готово - \(data?.count)")
}
print("после")

task.resume()
// кастомная конфигурация
//let conf = URLSessionConfiguration()
//conf.timeoutIntervalForRequest = 5.0
//conf.allowsCellularAccess = false
//conf.httpAdditionalHeaders = [:]
//
//let session = URLSession(configuration: conf)
//session.dataTask(with: url) { (data, response, error) in
//
//}

// парсинг

struct Post {
    let id: String
    let title: String
    let url: URL
}

extension Post: Decodable {
    // описываем ключи
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case secret
        case server
        case farm
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        title = try values.decode(String.self, forKey: .title)
        
        let secret = try values.decode(String.self, forKey: .secret)
        let server = try values.decode(String.self, forKey: .server)
        let farm = try values.decode(Int.self, forKey: .farm)
        
        url = URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret).jpg")!
    }
}

struct Photos: Decodable {
    let photo: [Post]
}

struct Response: Decodable {
    let photos: Photos
}

// стандартная конфигурация
print("до")
let task2 = URLSession.shared.dataTask(with: url) { (data, response, error) in
    guard let data = data else { return }
    
    do {
        let response = try JSONDecoder().decode(Response.self, from: data)
        print("получили фотки 0 \(response.photos.photo.count)")
    } catch {
        print("ошибкв - \(error)")
    }
}
print("после")
task2.resume()

func flickr(then: @escaping ([Post]) -> Void) {
    let task2 = URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        
        do {
            let response = try JSONDecoder().decode(Response.self, from: data)
            print("получили фотки 0 \(response.photos.photo.count)")
            then(response.photos.photo)
        } catch {
            print("ошибкв - \(error)")
            then([])
        }
    }
    task2.resume()
}

// Kingfisher
