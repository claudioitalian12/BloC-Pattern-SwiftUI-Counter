//
//  CounterBlocProvider.swift
//  BloC-Pattern
//
//  Created by claudio cavalli on 08/08/20.
//

import SwiftUI

class ContentViewBlocProvider<GenericBloc: Cubit>: ObservableObject {
    public var value: GenericBloc
    
    required init(_ value: GenericBloc) {
        self.value = value
    }
    
    public func send(_ event: GenericBloc.Event) {
        value.mapEventToState(event)
        self.objectWillChange.send()
    }
    
    public func action(_ event: GenericBloc.Event) -> (() -> Void) {
        return {
            self.send(event)
        }
    }
}
