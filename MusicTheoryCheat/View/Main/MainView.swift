//
//  MainView.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: OptionsView()) {
                    Text("Options")
                }
                KeyPickerView()
                Text(self.viewModel.primaryKeyName)
            }.navigationBarHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
