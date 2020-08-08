//
//  CounterBloC.swift
//  BloC-Pattern
//
//  Created by claudio cavalli on 08/08/20.
//

import Foundation
import SwiftUI

enum CounterState: BlocState {
    case increment
    case decrement
    case none
}

// Example of Bloc
class CounterBloc: Cubit, ObservableObject {
    typealias Store = Int
    typealias Event = CounterState
    
    @Published var currentValue: Store {
        didSet {
            self.objectWillChange.send()
        }
    }
    
    var currentEvent: Event
    
    required init(_ value: Store, state: Event) {
        self.currentValue = value
        self.currentEvent = state
    }
    
    func mapEventToState(_ event: Event) {
        switch event {
        case .increment:
            self.increment(event)
        case .decrement:
            self.decrement(event)
        default:
            self.currentEvent = event
        }
    }
    
    private func increment(_ event: Event) {
        if currentValue < 10 {
            self.currentValue += 1
            self.currentEvent = event
        }
    }
    
    private func decrement(_ event: Event) {
        if currentValue > 0 {
            self.currentValue -= 1
            self.currentEvent = event
        }
    }
}

// Example of Cubit
class CounterCubit: Cubit, ObservableObject {
    typealias Store = Int
    
    @Published var currentValue: Int {
        didSet {
            self.objectWillChange.send()
        }
    }
    
    required init(_ value: Int, state: BlocState) {
        self.currentValue = value
    }
    
    func increment() { currentValue += 1 }
    func decrement() { currentValue -= 1 }
}
