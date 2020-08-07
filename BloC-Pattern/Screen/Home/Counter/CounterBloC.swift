//
//  CounterBloC.swift
//  BloC-Pattern
//
//  Created by claudio cavalli on 08/08/20.
//

import Foundation

enum CounterState: BlocState {
    case increment
    case decrement
    case none
}

class CounterCubic: Cubit, ObservableObject {
    typealias Store = Int
    typealias Event = CounterState
    
    @Published var currentValue: Store {
        didSet {
            self.objectWillChange.send()
        }
    }
    
    var currentEvent: Event?
    
    required init(_ value: Store, state: Event?) {
        self.currentValue = value
        self.currentEvent = state
    }
    
    func mapEventToState(_ event: Event) -> (() -> Void) {
        return {
            switch event {
            case .increment:
                self.currentValue += 1
                self.currentEvent = event
            case .decrement:
                self.currentValue -= 1
                self.currentEvent = event
            default:
                self.currentEvent = event
            }
        }
    }
}

class CounterCubit: Cubit, ObservableObject {
    typealias Store = Int
    
    @Published var currentValue: Int {
        didSet {
            self.objectWillChange.send()
        }
    }
    
    required init(_ value: Int, state: BlocState?) {
        self.currentValue = value
    }
    
    func increment() { currentValue += 1 }
    func decrement() { currentValue -= 1 }
}
