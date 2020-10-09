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
                Spacer()
                KeyPickerView()
                Spacer()
                HStack {
                    Text(self.viewModel.primaryNearKeyFlatLabelString).font(.subheadline)
                    Spacer()
                    Text(self.viewModel.primaryKeyLabelString).font(.headline)
                    Spacer()
                    Text(self.viewModel.primaryNearKeySharpLabelString).font(.subheadline)
                }.padding()
                Spacer()
                VStack {
                    ForEach(0..<self.viewModel.featuredKeyScaleDegreeStrings.count) {i in
                        HStack {
                            Text(self.viewModel.featuredKeyScaleDegreeStrings[i]).font(.headline)
                            Spacer()
                            Text(self.viewModel.chordNoteStrings(forScaleDegree: i)[0])
                            Spacer()
                            Text(self.viewModel.chordNoteStrings(forScaleDegree: i)[1])
                            Spacer()
                            Text(self.viewModel.chordNoteStrings(forScaleDegree: i)[2])
                            Spacer()
                            Text(self.viewModel.relativeKeyScaleDegreeStrings[i]).font(.headline)
                        }.padding()
                    }
                }.padding()
                Spacer()
                HStack {
                    Text(self.viewModel.relativeNearKeyFlatLabelString).font(.subheadline)
                    Spacer()
                    Text(self.viewModel.relativeKeyLabelString).font(.headline)
                    Spacer()
                    Text(self.viewModel.relativeNearKeySharpLabelString).font(.subheadline)
                }.padding()
                Spacer()
            }
            .navigationBarHidden(true)
            .padding()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
