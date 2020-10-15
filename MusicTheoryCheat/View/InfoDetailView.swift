//
//  InfoDetailView.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/12/20.
//

import SwiftUI

struct InfoDetailView<BaseView>: View where BaseView : View {
    let infoKey : InfoKey
    let isShowing : Binding<Bool>
    let baseView : BaseView
    var body: some View {
        ZStack {
            self.baseView.allowsHitTesting(false)
            VStack {
                Text(self.infoKey.rawValue.uppercased()).padding()
                Text(Info.details[self.infoKey.rawValue]!).padding()
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
    
    func showInfoView(_ isShowing: Binding<Bool>, withInfoKey infoKey: InfoKey) -> some View {
        if isShowing.wrappedValue {
            return AnyView(ZStack {
                InfoDetailView(
                    infoKey: infoKey,
                    isShowing: isShowing,
                    baseView: self)
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
        MainView().environmentObject(Self.viewModel).showInfoView(Self.isShowing, withInfoKey: Self.viewModel.infoKey)
    }
}


