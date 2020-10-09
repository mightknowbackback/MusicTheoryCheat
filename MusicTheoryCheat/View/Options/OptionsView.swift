//
//  OptionsView.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import SwiftUI

struct OptionsView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    
    var body: some View {
        Form {
            Section(header: Text("KEY SELECTION METHOD")) {
                Picker("", selection: self.viewModel.keySelectionBinding) {
                    ForEach(0..<self.viewModel.keySelectionMethods.count) {i in
                        Text(self.viewModel.keySelectionMethods[i].rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("FEATURED TONALITY")) {
                Picker("", selection: self.viewModel.featuredTonalityBinding) {
                    ForEach(0..<self.viewModel.tonalities.count) {i in
                        Text(self.viewModel.tonalities[i].rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("SYMBOL TYPE")) {
                Picker("", selection: self.viewModel.symbolTypeBinding) {
                    ForEach(0..<self.viewModel.symbolTypes.count) {i in
                        Text(self.viewModel.symbolTypes[i].rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
            Section(header: Text("PREFERRED ENHARMONIC SPELLING")) {
                Picker("", selection: self.viewModel.preferredSpellingBinding) {
                    ForEach(0..<self.viewModel.preferredSpellingTypes.count) {i in
                        Text(self.viewModel.preferredSpellingStrings[i])
                    }
                }.pickerStyle(SegmentedPickerStyle())
            }
        }
    }
}

struct OptionsView_Previews: PreviewProvider {
    static var previews: some View {
        OptionsView()
    }
}
