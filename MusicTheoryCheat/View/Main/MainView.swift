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
                            
                            Text(self.viewModel.featuredKeyScaleDegreeStrings[i]).font(.headline).frame(maxWidth: .infinity)
                            Spacer()
                            Text(self.viewModel.chordNoteStrings(forScaleDegree: i)[0]).frame(maxWidth: .infinity)
                            Spacer()
                            Text(self.viewModel.chordNoteStrings(forScaleDegree: i)[1]).frame(maxWidth: .infinity)
                            Spacer()
                            Text(self.viewModel.chordNoteStrings(forScaleDegree: i)[2]).frame(maxWidth: .infinity)
                            Spacer()
                            Text(self.viewModel.relativeKeyScaleDegreeStrings[i]).font(.headline).frame(maxWidth: .infinity)
                            
                        }.padding([.top, .bottom])
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
            .padding()
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
        // TODO: DEBUG - This causes OptionsView to be dismissed when the InfoDetailView appears over that view.
//        .showInfoView(self.$viewModel.infoViewIsShowing, withInfoKey: self.viewModel.infoKey)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
