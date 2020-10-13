//
//  InfoDisplayable.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/12/20.
//

import Foundation
import SwiftUI

protocol InfoDisplayable : View {
    var isShowingQuestionMark : Binding<Bool> {get}
    var showInfo: Binding<Bool> {get}
    var infoString : String {get}
    associatedtype NormalView : View
    var normalView : NormalView {get}
    associatedtype InfoRequestView : View
    var infoRequestView : InfoRequestView {get}
}

extension InfoDisplayable {
    var body: some View {
        switch self.isShowingQuestionMark.wrappedValue {
        case true:
            return AnyView(self.infoRequestView)
        case false:
            return AnyView(self.normalView)
        }
    }
}


