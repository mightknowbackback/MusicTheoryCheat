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
                
                Spacer()
                KeyPickerView()
                Spacer()
                
                HStack {
                    
                    NearKeyLabel(text: self.viewModel.primaryNearKeyFlatLabelString, infoKey: InfoKey.allCases[6])
                    Spacer()
                    MainKeyLabel(text: self.viewModel.primaryKeyLabelString, infoKey: InfoKey.allCases[7])
                    Spacer()
                    NearKeyLabel(text: self.viewModel.primaryNearKeySharpLabelString, infoKey: InfoKey.allCases[8])
                    
                }.padding()
                Spacer()
                
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
                
                Spacer()
                HStack {
                    
                    NearKeyLabel(text: self.viewModel.relativeNearKeyFlatLabelString, infoKey: InfoKey.allCases[51])
                    Spacer()
                    MainKeyLabel(text: self.viewModel.relativeKeyLabelString, infoKey: InfoKey.allCases[52])
                    Spacer()
                    NearKeyLabel(text: self.viewModel.relativeNearKeySharpLabelString, infoKey: InfoKey.allCases[53])
                    
                }.padding()
                Spacer()
                
            }
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
        .onAppear {
            self.viewModel.showInfoClickables = false
        }
        // TODO: DEBUG - This causes OptionsView to be dismissed when the InfoDetailView appears over that view.
//        .showInfoView(self.$viewModel.infoViewIsShowing, withInfoKey: self.viewModel.infoKey)
    }
}

struct MainView_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        MainView().environmentObject(Self.viewModel)
    }
}
