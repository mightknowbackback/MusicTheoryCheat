//
//  MainView.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var optionsViewModel : OptionsViewModel
    @EnvironmentObject var mainViewModel : MainViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: OptionsView()) {
                    Text("Options")
                }
                KeyPickerView()
                Text(self.optionsViewModel.model.currentKey.name(withSpelling: self.optionsViewModel.model.preferredSpelling))
            }.navigationBarHidden(true)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
