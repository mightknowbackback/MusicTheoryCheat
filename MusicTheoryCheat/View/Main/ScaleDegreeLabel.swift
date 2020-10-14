//
//  ScaleDegreeLabel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/14/20.
//

import SwiftUI

struct ScaleDegreeNormalView : View {
    let text : String
    var body: some View {
        Text(self.text)
    }
}
struct ScaleDegreeQuestionMark : View {
    var body: some View {
        Text("?")
    }
}
struct ScaleDegreeInfoLabel : InfoRequestDisplay {
    
    @EnvironmentObject var viewModel: ViewModel
    var questionMarkView = ScaleDegreeQuestionMark()
    let infoKey: InfoKey
    
}
struct ScaleDegreeLabel: InfoDisplayable {
    
    var infoKey: InfoKey
    
    @EnvironmentObject var viewModel : ViewModel
    
    var isShowingQuestionMark: Binding<Bool> {
        self.$viewModel.showInfoClickables
    }
    var normalView : ScaleDegreeNormalView
    var infoRequestView : ScaleDegreeInfoLabel
    
    init(text: String, infoKey: InfoKey) {
        self.infoKey = infoKey
        self.normalView = ScaleDegreeNormalView(text: text)
        self.infoRequestView = ScaleDegreeInfoLabel(infoKey: infoKey)
    }
}

struct ScaleDegreeLabel_Previews: PreviewProvider {
    static let text : String = "I"
    static let viewModel = ViewModel()
    static let infoKey = InfoKey.allCases[9]
    static var previews: some View {
        ScaleDegreeNormalView(text: Self.text).previewLayout(PreviewLayout.sizeThatFits)
        ScaleDegreeQuestionMark().previewLayout(PreviewLayout.sizeThatFits)
        ScaleDegreeLabel(text: Self.text, infoKey: Self.infoKey).environmentObject(Self.viewModel)
        MainView().environmentObject(Self.viewModel)
    }
}
