//
//  OptionsTitle.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/12/20.
//

import Foundation
import SwiftUI

struct OptionsTitleNormalView : View {
    let title : String
    var body : some View {
        return Text(self.title)
    }
}
struct OptionsTitleInfoView : View {
    let showInfo : Binding<Bool>
    var body : some View {
        return Button(action: {self.showInfo.wrappedValue = true}) {
            Text("?")
        }
    }
    
}
struct OptionsTitle : InfoDisplayable {


    let title : String

    var isShowingQuestionMark: Binding<Bool>
    var showInfo: Binding<Bool>

    var infoString: Binding<String>

    var normalView: OptionsTitleNormalView

    var infoRequestView: OptionsTitleInfoView


    typealias NormalView = OptionsTitleNormalView

    typealias InfoRequestView = OptionsTitleInfoView

    init(title: String, isShowingAsClickable: Binding<Bool>, infoString: Binding<String>, showInfo: Binding<Bool>) {
        self.title = title
        self.isShowingQuestionMark = isShowingAsClickable
        self.infoString = infoString
        self.normalView = OptionsTitleNormalView(title: title)
        self.infoRequestView = OptionsTitleInfoView(showInfo: showInfo)
        self.showInfo = showInfo
    }

}
