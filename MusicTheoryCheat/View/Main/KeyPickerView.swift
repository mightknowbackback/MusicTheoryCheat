//
//  KeyPickerView.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import SwiftUI

struct KeyPickerView: View {
    
    @EnvironmentObject var optionsViewModel : OptionsViewModel
    @EnvironmentObject var mainViewModel : MainViewModel
    
    var body: some View {
        Picker("", selection: self.mainViewModel.keyBinding) {
            ForEach(0..<self.mainViewModel.pickerStrings.count) {i in
                Text(self.mainViewModel.pickerStrings[i])
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}

struct KeyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        KeyPickerView()
    }
}
