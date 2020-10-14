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
    var infoKey : InfoKey {get}
    associatedtype NormalView : View
    var normalView : NormalView {get}
    associatedtype InfoRequestView : InfoRequestDisplay
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

protocol InfoRequestDisplay : View {
    
    var viewModel : ViewModel {get}
    var infoKey : InfoKey {get}
    associatedtype QuestionMarkView : View
    var questionMarkView : QuestionMarkView {get}
}

extension InfoRequestDisplay {
    
    var body : some View {
        return Button(action: {
            self.viewModel.infoKey = self.infoKey
            self.viewModel.infoViewIsShowing = true
        }) {
            self.questionMarkView
        }
    }
    
}


