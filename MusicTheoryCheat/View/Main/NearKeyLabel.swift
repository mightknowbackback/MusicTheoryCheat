//
//  NearKeyLabel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/14/20.
//

import SwiftUI

struct NearKeyNormalLabel : View {
    let text : String
    var body: some View {
        Text(self.text)
    }
}
struct NearKeyQuestionMark : View {
    var body: some View {
        Text("?")
    }
}
struct NearKeyInfoLabel : InfoRequestDisplay {
    
    @EnvironmentObject var viewModel: ViewModel
    var infoKey: InfoKey
    var questionMarkView = NearKeyQuestionMark()
    
}

struct NearKeyLabel: InfoDisplayable {
    
    
    @EnvironmentObject var viewModel : ViewModel
    
    var isShowingQuestionMark: Binding<Bool> {
        self.$viewModel.showInfoClickables
    }
    
    var infoKey: InfoKey
    var normalView: NearKeyNormalLabel
    var infoRequestView: NearKeyInfoLabel
    
    init(text: String, infoKey: InfoKey) {
        self.normalView = NormalView(text: text)
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
