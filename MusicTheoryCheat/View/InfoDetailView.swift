//
//  InfoDetailView.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/12/20.
//

import SwiftUI

struct InfoDetailView: View {
    let text : Binding<String>
    let isShowing : Binding<Bool>
    var body: some View {
        VStack {
            Text("Info")
            Text(self.text.wrappedValue)
            Button(action: {
                
                    self.isShowing.wrappedValue = false
                
            }) {
                Text("Done")
            }
        }
    }
}

struct InfoDetailView_Previews: PreviewProvider {
    static var test : Binding<String> = Binding(get: {return "Testing, 1, 2, 3?"}, set: {_ in})
    static var isShowing : Bool = true
    static var previews: some View {
        InfoDetailView(text: Self.test  , isShowing: Binding<Bool>(get: {Self.isShowing}, set: {_ in}))
    }
}

extension View {
    
    func showInfoView(_ isShowing: Binding<Bool>, withText text: Binding<String>) -> some View {
        if isShowing.wrappedValue {
            return AnyView(ZStack {
                self
                InfoDetailView(text: text, isShowing: isShowing)
            })
        } else {
            return AnyView(self)
        }
    }
    
}
