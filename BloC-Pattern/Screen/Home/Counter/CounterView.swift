//
//  CounterView.swift
//  BloC-Pattern
//
//  Created by claudio cavalli on 08/08/20.
//

import SwiftUI
import Combine

struct CounterView: View {
    @ObservedObject var asd = CounterCubic(0, state: CounterState.none)
    
    var body: some View {
        NavigationView {
            VStack {
                Text(asd.currentValue.description)
                    .fontWeight(.black)
                    .font(Font.system(size: 100))
                    .animation(nil)
                HStack {
                    Button(action: asd.mapEventToState(.decrement)) {
                        Image(systemName: "minus.circle")
                    }
                    Button(action: asd.mapEventToState(.increment)) {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .font(.largeTitle)
        }
    }
}
