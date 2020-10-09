//
//  KeyPickerView.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import SwiftUI

struct KeyPickerView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    
    var body: some View {
        Picker("", selection: self.viewModel.keyBinding) {
            ForEach(0..<self.viewModel.pickerStrings.count) {i in
                Text(self.viewModel.pickerStrings[i])
            }
        }.pickerStyle(SegmentedPickerStyle())
    }
}

struct KeyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        KeyPickerView()
    }
}
