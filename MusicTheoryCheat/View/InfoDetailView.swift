//
//  InfoDetailView.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/12/20.
//

import SwiftUI

struct InfoDetailView<Presenting>: View where Presenting : View {
    let text : String
    let isShowing : Binding<Bool>
    let presenting : () -> Presenting
    var body: some View {
        ZStack {
            self.presenting().allowsHitTesting(false)
            VStack {
                Text("Info").padding()
                Text(self.text).padding()
                Button(action: {
                        self.isShowing.wrappedValue = false
                    
                }) {
                    Text("Done").padding()
                }
            }
            .background(Color.gray)
            .padding(32)
        }
    }
}

extension View {
    
    func showInfoView(_ isShowing: Binding<Bool>, withText text: String) -> some View {
        if isShowing.wrappedValue {
            return AnyView(ZStack {
                InfoDetailView(text: text, isShowing: isShowing,
                               presenting: { self })
            })
        } else {
            return AnyView(self)
        }
    }
    
}

struct InfoDetailView_Previews: PreviewProvider {
    static var isShowing : Binding<Bool> = Binding<Bool>(get: {return true}, set: {_ in})
    static let viewModel = ViewModel()
    static var previews: some View {
        MainView().showInfoView(Self.isShowing, withText: Self.viewModel.infoText)
    }
}


