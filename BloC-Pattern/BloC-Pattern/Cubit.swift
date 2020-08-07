//
//  Cubit.swift
//  BloC-Pattern
//
//  Created by claudio cavalli on 08/08/20.
//

import Foundation

protocol Cubit {
    associatedtype Stored
    associatedtype Event
    
    var currentValue: Stored { get set }
    var currentEvent: Event? { get set }
    
    init(_ value: Stored, state: Event?)
    
    func mapEventToState(_ event: Event)
}

extension Cubit {
    var currentEvent: Event? {
        get { return currentEvent }
        set { currentEvent = newValue }
     }
    
    func mapEventToState(_ event: Event) { }
}
