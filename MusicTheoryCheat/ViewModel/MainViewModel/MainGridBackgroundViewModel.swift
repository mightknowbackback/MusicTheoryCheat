//
//  MainGridBackgroundViewModel.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/20/20.
//

import Foundation
import SwiftUI

extension ViewModel {
    func colorFor(row: Int) -> Color {
        if self.model.featuredTonality == .major {
            switch row {
            case 0, 3, 4:
                return CustomColors.primaryDarkSwift
            case 1, 2, 5:
                return CustomColors.primaryLightSwift
            default:
                return CustomColors.graySwift
            }
        } else {
            switch row {
            case 0, 3, 4:
                return CustomColors.primaryLightSwift
            case 2, 5, 6:
                return CustomColors.primaryDarkSwift
            default:
                return CustomColors.graySwift
            }
        }
    }
    var featuredColor : Color {
        self.model.featuredTonality == .major ? CustomColors.primaryDarkSwift : CustomColors.primaryLightSwift
    }
    var relativeColor : Color {
        self.model.featuredTonality == .minor ? CustomColors.primaryDarkSwift : CustomColors.primaryLightSwift
    }
}
