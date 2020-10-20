//
//  KeyPickerButtonLabel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/19/20.
//

import SwiftUI

struct KeyPickerButtonLabel: View {
    
    let text : String
    let letter : String
    var accidental : String?
    let padding : CGFloat
    let color : Color
    let mainFont : Font = CustomFonts.keyPickerLetter
    let symbolFont : Font = CustomFonts.keyPickersymbol
    
    var body: some View {
        ZStack {
            self.color.clipShape(Circle()).padding(self.padding)
            Text(self.letter).font(self.mainFont).shadow(radius: 4).padding(8)
            if let acc = self.accidental {
                Text(acc).font(self.symbolFont).shadow(radius: 4).offset(x: 6, y: -4)
            }
        }.foregroundColor(.white)
    }
    
    init(_ text: String, color: Color = CustomColors.graySwift, padding: CGFloat = 0) {
        self.text = text
        var full = text
        self.letter = String(full.removeFirst())
        if let ch = full.first {
            self.accidental = String(ch)
        }
        self.color = color
        self.padding = padding
    }
}

struct KeyPickerButtonLabel_Previews: PreviewProvider {
    static let viewModel = ViewModel()
    static var previews: some View {
        KeyPickerButtonLabel("A\(flatSymbol)").previewLayout(PreviewLayout.fixed(width: 40, height: 40))
        KeyPickerView().environmentObject(Self.viewModel).previewLayout(PreviewLayout.sizeThatFits)
        MainView().environmentObject(Self.viewModel)
    }
}
