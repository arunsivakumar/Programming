//: Playground - noun: a place where people can play

import UIKit
import RxSwift
import RxCocoa

//MARK: - Chapter 2 - Observables

example(of: "just, of from") {
    
    let one = 1
    let two = 2
    let three = 3
    
    let observable = Observable<Int>.just(one)
    let observable2 = Observable.of(one, two, three)
    let observable3 = Observable.of([one, two, three])
    let observable4 = Observable.from([one, two, three])
    
    observable.subscribe { (event) in
        print(event)
    }
    observable2.subscribe { (event) in
        print(event)
    }
    observable3.subscribe { (event) in
        print(event)
    }
    observable4.subscribe { (event) in
        print(event)
    }
    
    observable.subscribe { (event) in
        if let e = event.element {
            print(e)
        }
    }
    
    observable.subscribe(onNext: { element in
        print(element)
    })
}

example(of: "empty") {
    let observable = Observable<Void>.empty()
    
    observable.subscribe(onNext: { (element) in
        print(element)
    }, onError: { (error) in
        print(error)
    }, onCompleted: {
        print("Completed")
    }) {
        print("disposed")
    }
}

example(of: "never") {
    let observable = Observable<Any>.never()
    
    observable.subscribe(onNext: { (element) in
        print(element)
    }, onError: { (error) in
        print(error)
    }, onCompleted: {
        print("Completed")
    }) {
        print("disposed")
    }
}

example(of: "range") {
    let observable = Observable<Int>.range(start: 1, count: 10)
    
    observable.subscribe(onNext: { (element) in
        print(element)
    }, onError: { (error) in
        print(error)
    }, onCompleted: {
        print("Completed")
    }) {
        print("disposed")
    }
}

example(of: "Disposebag") {
    
    let disposeBag = DisposeBag()
    
    let observable = Observable<String>.of("A", "B", "C")
    
    observable.subscribe(onNext: { (element) in
        print("element")
    }, onError: { (error) in
        print("error")
    }, onCompleted: {
        print("completed")
    }, onDisposed: {
        print("disposed")
    }).disposed(by: disposeBag)
}


example(of: "Subscriptions") {
    
    let disposeBag = DisposeBag()
    
    let observable = Observable<String>.of("A", "B", "C")
    
    observable.subscribe({ (event) in
         print(event)
    })
    
//    next(A)
//    next(B)
//    next(C)
//    completed
    
    observable.subscribe({ (event) in
        if let element = event.element {
         print(element)
        }
    })
    
//    A
//    B
//    C
    
    observable.subscribe(onNext: { (element) in
          print(element)
      }, onError: { (error) in
          print("error")
      }, onCompleted: {
          print("completed")
      }, onDisposed: {
          print("disposed")
      })
    
//    A
//    B
//    C
//    completed
//    disposed
}

enum MyError: Error {
    case anError
}

example(of: "create") {
    let disposeBag = DisposeBag()
    
    Observable<String>.create { (observer) -> Disposable in
        observer.onNext("1")
        observer.onError(MyError.anError)
        observer.onCompleted()
        observer.onNext("?")
        return Disposables.create()
    }.subscribe(onNext: { print($0) },
                onError: { print($0) },
                onCompleted: { print("completed")
    }) { print("disposed") }.disposed(by: disposeBag)
}

example(of: "deferred") {
  let disposeBag = DisposeBag()
  
  // 1
  var flip = false
  
  // 2
  let factory: Observable<Int> = Observable.deferred {
    
    // 3
    flip.toggle()
    
    // 4
    if flip {
      return Observable.of(1, 2, 3)
    } else {
      return Observable.of(4, 5, 6)
    }
  }
    
    factory.subscribe { (event) in
        print(event)
    }
    
    factory.subscribe { (event) in
        print(event)
    }
}

