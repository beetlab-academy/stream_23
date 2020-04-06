import UIKit

var array = [Int]()

for i in 0..<20000 {
    DispatchQueue.global().async {
        array.append(i)
    }
}

class ThreadSafeArray<T> {
    var wrapee = [T]()
    
    private let queue = DispatchQueue(label: "ThreadSafeArray.queue",
                                      attributes: .concurrent)
    
    func append(_ element: T) {
        let workItem = DispatchWorkItem(qos: .userInitiated,
                                        flags: .barrier,
                                        block: {
            self.wrapee.append(element)
        })
        
        queue.async(execute: workItem)
        
        queue.sync(execute: workItem)

        queue.async(flags: .barrier) {
            self.wrapee.append(element)
        }
    }
    
    subscript(index: Int) -> T {
        get {
            var value: T!
            queue.sync {
                value = self.wrapee[index]
            }
            return value
            
        }
        set(newValue) {
            queue.async(flags: .barrier) {
                self.wrapee[index] = newValue
            }
        }
    }
}

func viewDidLOad() {
    DispatchQueue.main.async {
        //
    }
    
    DispatchQueue.main.sync {
        //dead lock
    }

}

let lock = NSLock()
lock.lock()
// один тред за раз
lock.unlock()

let recursiveLock = NSRecursiveLock()
recursiveLock.lock()
// один тред за раз
recursiveLock.unlock()

// сейм шыт

queue.async(flags: .barrier) {
    self.wrapee.append(element)
}

// семафор

let sem = DispatchSemaphore(value: 3)

sem.wait()

// value тредов за раз

sem.signal()

// вопрос на лоха про таймер

Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
    
}

// для главного треда замыкание не работает, если он занят задачами по взаимодествию с юзером - по сути обсчет дерева лайаута

DispatchSourceTimer
https://gist.github.com/danielgalasko/1da90276f23ea24cb3467c33d2c05768


