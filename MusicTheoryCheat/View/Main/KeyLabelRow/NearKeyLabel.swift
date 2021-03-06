//
//  NearKeyLabel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/14/20.
//

import SwiftUI

struct NearKeyNormalLabel : View {
    let letter : String
    let accidental : String?
    var body: some View {
        ZStack {
            Color.white
            ZStack {
                Text(self.letter).font(CustomFonts.nearKey).padding(8).foregroundColor(CustomColors.accentSwift)
                if let a = self.accidental {
                    Text(a).offset(x: 10, y: -6).font(CustomFonts.nearAccidental).padding(8).foregroundColor(CustomColors.accentSwift)
                }
                
            }
            
        }.clipShape(Circle()).aspectRatio(1, contentMode: .fit)
    }
    init(text: String) {
        var text = text
        self.letter = String(text.removeFirst())
        if let a = text.last {
            self.accidental = String(a)
        } else {
            self.accidental = nil
        }
    }
}
struct NearKeyQuestionMark : View {
    var body: some View {
        NearKeyNormalLabel(text: "?")
    }
}
struct NearKeyInfoLabel : InfoRequestDisplay {
    
    @EnvironmentObject var viewModel: ViewModel
    var infoKey: InfoKey
    var questionMarkView = NearKeyQuestionMark()
    
}
struct NearKeyPlayable : View, Playable {
    @EnvironmentObject var viewModel : ViewModel
    
    let text : String
    let infoKey: InfoKey
    
    var notes: [UInt8] {
        var scale : [UInt8] = []
        switch self.infoKey {
        case .primaryNearKeyFlat:
            scale = self.viewModel.model.currentKey.nearKeyFlat.playableScale
        case .primaryNearKeySharp:
            scale = self.viewModel.model.currentKey.nearKeySharp.playableScale
        case .relativeNearKeyFlat:
            scale = self.viewModel.model.currentKey.relativeKey.nearKeyFlat.playableScale
        case .relativeNearKeySharp:
            scale = self.viewModel.model.currentKey.relativeKey.nearKeySharp.playableScale
        default:
            return []
        }
        let first = scale[0] + 12
        scale.append(first)
        return scale
    }
    func play() {
        self.viewModel.model.sequencer.playMelody(withNotes: self.notes)
    }
    var body: some View {
        Button(action: self.play) {
            NearKeyNormalLabel(text: self.text)
        }
    }
    
}

struct NearKeyLabel: InfoDisplayable {
    
    @EnvironmentObject var viewModel : ViewModel
    
    var isShowingQuestionMark: Binding<Bool> {
        self.$viewModel.showInfoClickables
    }
    
    var infoKey: InfoKey
    var normalView: NearKeyPlayable
    var infoRequestView: NearKeyInfoLabel
    
    init(text: String, infoKey: InfoKey) {
        self.normalView = NearKeyPlayable(text: text, infoKey: infoKey)
        self.infoKey = infoKey
        self.infoRequestView = InfoRequestView(infoKey: infoKey)
    }
    
}

struct NearKeyLabel_Previews: PreviewProvider {
    static let text : String = "A\(flatSymbol)"
    static let viewModel = ViewModel()
    static let infoKey = InfoKey.allCases[6]
    static var previews: some View {
        NearKeyNormalLabel(text: Self.text).previewLayout(PreviewLayout.sizeThatFits)
        NearKeyQuestionMark().previewLayout(PreviewLayout.sizeThatFits)
        HStack {
            NearKeyLabel(text: Self.text, infoKey: Self.infoKey).environmentObject(Self.viewModel).frame(maxWidth: .infinity)
            NearKeyLabel(text: Self.text, infoKey: Self.infoKey).environmentObject(Self.viewModel).frame(maxWidth: .infinity)
            NearKeyLabel(text: Self.text, infoKey: Self.infoKey).environmentObject(Self.viewModel).frame(maxWidth: .infinity)
        }
        MainView().environmentObject(Self.viewModel)
    }
}
