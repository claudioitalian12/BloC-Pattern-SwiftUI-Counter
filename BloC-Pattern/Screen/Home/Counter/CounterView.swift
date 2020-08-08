//
//  CounterView.swift
//  BloC-Pattern
//
//  Created by claudio cavalli on 08/08/20.
//

import SwiftUI
import Combine

struct CounterView: View {
    @ObservedObject var asd = ContentViewBlocProvider(CounterBloc(0, state: CounterState.none))
    
    var body: some View {
        NavigationView {
            VStack {
                Text(asd.value.currentValue.description)
                    .fontWeight(.black)
                    .font(Font.system(size: 100))
                    .animation(nil)
                HStack {
                    Button(action: asd.action(.decrement)) {
                        Image(systemName: "minus.circle")
                    }
                    Button(action: asd.action(.increment)) {
                        Image(systemName: "plus.circle")
                    }
                }
            }
            .font(.largeTitle)
            .accentColor(Color.red)
            .navigationBarTitle("Navigation")
        }.colorInvert()
    }
}
