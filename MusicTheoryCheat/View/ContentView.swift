//
//  ContentView.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 9/29/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MainView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        ContentView().environmentObject(Self.viewModel)
    }
}
