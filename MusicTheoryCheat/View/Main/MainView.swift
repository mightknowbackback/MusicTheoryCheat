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
                // MARK: Key Picker
                KeyPickerView()
                VStack {
                    // MARK: Main Key Row (Chart Header)
                    KeyLabelRow(textForFlatKey: self.viewModel.primaryNearKeyFlatLabelString, main: self.viewModel.primaryKeyLabelString, sharp: self.viewModel.primaryNearKeySharpLabelString)
                    
                    // MARK: Chord Rows
                    VStack {
                        
                        ForEach(0..<self.viewModel.featuredKeyScaleDegreeStrings.count) {i in
                            HStack {
                                
                                ScaleDegreeLabel(text: self.viewModel.featuredKeyScaleDegreeStrings[i], infoKey: InfoKey.allCases[(i * 6) + 9]).frame(maxWidth: .infinity)
                                Spacer()
                                ChordToneLabel(text: self.viewModel.chordNoteStrings(forScaleDegree: i)[0], infoKey: InfoKey.allCases[(i * 6) + 10]).frame(maxWidth: .infinity)
                                Spacer()
                                ChordToneLabel(text: self.viewModel.chordNoteStrings(forScaleDegree: i)[1], infoKey: InfoKey.allCases[(i * 6) + 11]).frame(maxWidth: .infinity)
                                Spacer()
                                ChordToneLabel(text: self.viewModel.chordNoteStrings(forScaleDegree: i)[2], infoKey: InfoKey.allCases[(i * 6) + 12]).frame(maxWidth: .infinity)
                                Spacer()
                                if self.viewModel.model.showSevenths {
                                    ChordToneLabel(text: self.viewModel.chordNoteStrings(forScaleDegree: i)[3], infoKey: InfoKey.allCases[(i * 6) + 13]).frame(maxWidth: .infinity)
                                    Spacer()
                                }
                                ScaleDegreeLabel(text: self.viewModel.relativeKeyScaleDegreeStrings[i], infoKey: InfoKey.allCases[(i * 6) + 14]).frame(maxWidth: .infinity)
                                
                            }.frame(maxHeight: .infinity)
                        }
                    }
                    // MARK: Relative Key Row (Chart Footer)
                    KeyLabelRow(textForFlatKey: self.viewModel.relativeNearKeyFlatLabelString, main: self.viewModel.relativeKeyLabelString, sharp: self.viewModel.relativeNearKeySharpLabelString, isMain: false)
                }.layoutPriority(1)
            }
                
                
            .showInfoView(self.$viewModel.infoViewIsShowing, withInfoKey: self.viewModel.infoKey)
            .navigationBarItems(
                leading: Button(action: {self.viewModel.showInfoClickables.toggle()}) {
                    Text("Info")
            },
                trailing: NavigationLink(destination: OptionsView()) {
                    Text("Options")
            })
            .navigationTitle(appName.uppercased())
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct MainView_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        MainView().environmentObject(Self.viewModel)
    }
}
