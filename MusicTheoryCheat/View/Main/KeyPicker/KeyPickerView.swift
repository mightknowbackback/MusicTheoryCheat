//
//  KeyPickerView.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/6/20.
//

import SwiftUI

struct KeyPickerView: View {
    
    @EnvironmentObject var viewModel : ViewModel
    
    private func multiplier(for spelling: KeySpelling) -> CGFloat {
        switch self.viewModel.model.keySelectionMethod {
        case .byAccidentals:
            let single : CGFloat = 1/12
            if self.viewModel.model.preferredSpelling == spelling {
                return single * 6
            } else {
                return single * 5
            }
        default:
            return 0.5
        }
    }
    
    var body: some View {
        
        VStack(spacing: 4) {
            // Main picker
            HStack(spacing: 4) {
                ForEach(0..<self.viewModel.pickerStrings.count) {i in
                    Button(action: {self.viewModel.keyBinding.wrappedValue = i}) {
                        if self.viewModel.keyBinding.wrappedValue == i {
                            KeyPickerButtonLabel(self.viewModel.pickerStrings[i], color: CustomColors.accentSwift, padding: -3)
                        } else {
                            KeyPickerButtonLabel(self.viewModel.pickerStrings[i])
                        }
                    }
                }
            }
            // Flats/Sharps labels
            GeometryReader {geometry in
                HStack {
                    Text(self.viewModel.flatsString).shadow(radius: 6).padding(4).frame(width: geometry.size.width*self.multiplier(for: .flats)).background(self.viewModel.flatsColor).clipShape(Capsule()).foregroundColor(Color.white).font(CustomFonts.keyPickerAcidentalLabel)
                    Spacer()
                    Text(self.viewModel.sharpsString).shadow(radius: 6).padding(4).frame(width: geometry.size.width*self.multiplier(for: .sharps)).background(self.viewModel.sharpsColor).clipShape(Capsule()).foregroundColor(Color.white).font(CustomFonts.keyPickerAcidentalLabel)
                }
            }.frame(height: 32)
            
        }.padding([.leading, .trailing])
        
        
    }
}

struct KeyPickerView_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        KeyPickerView().environmentObject(Self.viewModel).previewLayout(PreviewLayout.sizeThatFits)
        MainView().environmentObject(Self.viewModel)
    }
}
