//
//  OptionsView.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import SwiftUI

struct OptionsView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section {
                // MARK: KEY SELECTION METHOD
                OptionsTitle(infoKey: InfoKey.allCases[0])
                
                Picker("", selection: self.viewModel.keySelectionBinding) {
                    ForEach(0..<self.viewModel.keySelectionMethods.count) {i in
                        Text(self.viewModel.keySelectionMethods[i].rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
            }
            Section {
                // MARK: FEATURED TONALITY
                OptionsTitle(infoKey: InfoKey.allCases[1])
                
                Picker("", selection: self.viewModel.featuredTonalityBinding) {
                    ForEach(0..<self.viewModel.tonalities.count) {i in
                        Text(self.viewModel.tonalities[i].rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
            }
            Section {
                // MARK: NUMBERING TYPE
                OptionsTitle(infoKey: InfoKey.allCases[2])
                
                Picker("", selection: self.viewModel.symbolTypeBinding) {
                    ForEach(0..<self.viewModel.symbolTypes.count) {i in
                        Text(self.viewModel.symbolTypes[i].rawValue)
                    }
                }.pickerStyle(SegmentedPickerStyle())
                
            }
            Section {
                // MARK: PREFERRED ENHARMONIC SPELLING
                OptionsTitle(infoKey: InfoKey.allCases[3])
                
                Picker("", selection: self.viewModel.preferredSpellingBinding) {
                    ForEach(0..<self.viewModel.preferredSpellingTypes.count) {i in
                        Text(self.viewModel.preferredSpellingStrings[i])
                    }
                }.pickerStyle(SegmentedPickerStyle())
                // TODO: ADD 'SHOW SEVENTH CHORDS'
            }
        }
        .background(AppBackground())
        .showInfoView(self.$viewModel.infoViewIsShowing, withInfoKey: self.viewModel.infoKey)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(
                action: {
                    self.presentationMode.wrappedValue.dismiss()
                    self.viewModel.showInfoClickables = false
                }
            ) {Text("Back")
                
            },
            trailing: Button(action: {self.viewModel.showInfoClickables.toggle()}) {Text("Info")})
        .navigationTitle("OPTIONS")
        .onAppear {
            self.viewModel.showInfoClickables = false
        }
    }
    init() {
        UITableView.appearance().backgroundColor = .clear
    }
    
}

struct OptionsView_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        OptionsView().environmentObject(Self.viewModel)
    }
}
