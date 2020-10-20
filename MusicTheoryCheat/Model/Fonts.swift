//
//  Fonts.swift
//  MusicTheoryCheat
//
//  Created by mightknow on 10/16/20.
//

import Foundation
import SwiftUI

struct CustomFonts {
    
    static let one : Font = .custom(fontStrings[1], size: 12)
    
    static let keyPickerLetter : Font = .custom(fontStrings[123], size: 14)
    static let keyPickersymbol : Font = .custom(fontStrings[18], size: 12)
    static let keyPickerAcidentalLabel : Font = .custom(fontStrings[123], size: 14)
    
    static func printAll() {
        var i = 0
        for family in UIFont.familyNames {
                print("\n// Family:", family)
                for font in UIFont.fontNames(forFamilyName: family) {
                    print("\"\(font)\", //\(i)")
                    i += 1
            }
        }
    }
    
}
let fontStrings : [String] = [
    
    // Family: Academy Engraved LET
    "AcademyEngravedLetPlain", //0

    // Family: Al Nile
    "AlNile", //1
    "AlNile-Bold", //2

    // Family: American Typewriter
    "AmericanTypewriter", //3
    "AmericanTypewriter-Light", //4
    "AmericanTypewriter-Semibold", //5
    "AmericanTypewriter-Bold", //6
    "AmericanTypewriter-Condensed", //7
    "AmericanTypewriter-CondensedLight", //8
    "AmericanTypewriter-CondensedBold", //9

    // Family: Apple Color Emoji
    "AppleColorEmoji", //10

    // Family: Apple SD Gothic Neo
    "AppleSDGothicNeo-Regular", //11
    "AppleSDGothicNeo-Thin", //12
    "AppleSDGothicNeo-UltraLight", //13
    "AppleSDGothicNeo-Light", //14
    "AppleSDGothicNeo-Medium", //15
    "AppleSDGothicNeo-SemiBold", //16
    "AppleSDGothicNeo-Bold", //17

    // Family: Apple Symbols
    "AppleSymbols", //18

    // Family: Arial
    "ArialMT", //19
    "Arial-ItalicMT", //20
    "Arial-BoldMT", //21
    "Arial-BoldItalicMT", //22

    // Family: Arial Hebrew
    "ArialHebrew", //23
    "ArialHebrew-Light", //24
    "ArialHebrew-Bold", //25

    // Family: Arial Rounded MT Bold
    "ArialRoundedMTBold", //26

    // Family: Avenir
    "Avenir-Book", //27
    "Avenir-Roman", //28
    "Avenir-BookOblique", //29
    "Avenir-Oblique", //30
    "Avenir-Light", //31
    "Avenir-LightOblique", //32
    "Avenir-Medium", //33
    "Avenir-MediumOblique", //34
    "Avenir-Heavy", //35
    "Avenir-HeavyOblique", //36
    "Avenir-Black", //37
    "Avenir-BlackOblique", //38

    // Family: Avenir Next
    "AvenirNext-Regular", //39
    "AvenirNext-Italic", //40
    "AvenirNext-UltraLight", //41
    "AvenirNext-UltraLightItalic", //42
    "AvenirNext-Medium", //43
    "AvenirNext-MediumItalic", //44
    "AvenirNext-DemiBold", //45
    "AvenirNext-DemiBoldItalic", //46
    "AvenirNext-Bold", //47
    "AvenirNext-BoldItalic", //48
    "AvenirNext-Heavy", //49
    "AvenirNext-HeavyItalic", //50

    // Family: Avenir Next Condensed
    "AvenirNextCondensed-Regular", //51
    "AvenirNextCondensed-Italic", //52
    "AvenirNextCondensed-UltraLight", //53
    "AvenirNextCondensed-UltraLightItalic", //54
    "AvenirNextCondensed-Medium", //55
    "AvenirNextCondensed-MediumItalic", //56
    "AvenirNextCondensed-DemiBold", //57
    "AvenirNextCondensed-DemiBoldItalic", //58
    "AvenirNextCondensed-Bold", //59
    "AvenirNextCondensed-BoldItalic", //60
    "AvenirNextCondensed-Heavy", //61
    "AvenirNextCondensed-HeavyItalic", //62

    // Family: Baskerville
    "Baskerville", //63
    "Baskerville-Italic", //64
    "Baskerville-SemiBold", //65
    "Baskerville-SemiBoldItalic", //66
    "Baskerville-Bold", //67
    "Baskerville-BoldItalic", //68

    // Family: Bodoni 72
    "BodoniSvtyTwoITCTT-Book", //69
    "BodoniSvtyTwoITCTT-BookIta", //70
    "BodoniSvtyTwoITCTT-Bold", //71

    // Family: Bodoni 72 Oldstyle
    "BodoniSvtyTwoOSITCTT-Book", //72
    "BodoniSvtyTwoOSITCTT-BookIt", //73
    "BodoniSvtyTwoOSITCTT-Bold", //74

    // Family: Bodoni 72 Smallcaps
    "BodoniSvtyTwoSCITCTT-Book", //75

    // Family: Bodoni Ornaments
    "BodoniOrnamentsITCTT", //76

    // Family: Bradley Hand
    "BradleyHandITCTT-Bold", //77

    // Family: Chalkboard SE
    "ChalkboardSE-Regular", //78
    "ChalkboardSE-Light", //79
    "ChalkboardSE-Bold", //80

    // Family: Chalkduster
    "Chalkduster", //81

    // Family: Charter
    "Charter-Roman", //82
    "Charter-Italic", //83
    "Charter-Bold", //84
    "Charter-BoldItalic", //85
    "Charter-Black", //86
    "Charter-BlackItalic", //87

    // Family: Cochin
    "Cochin", //88
    "Cochin-Italic", //89
    "Cochin-Bold", //90
    "Cochin-BoldItalic", //91

    // Family: Copperplate
    "Copperplate", //92
    "Copperplate-Light", //93
    "Copperplate-Bold", //94

    // Family: Courier
    "Courier", //95
    "Courier-Oblique", //96
    "Courier-Bold", //97
    "Courier-BoldOblique", //98

    // Family: Courier New
    "CourierNewPSMT", //99
    "CourierNewPS-ItalicMT", //100
    "CourierNewPS-BoldMT", //101
    "CourierNewPS-BoldItalicMT", //102

    // Family: Damascus
    "Damascus", //103
    "DamascusLight", //104
    "DamascusMedium", //105
    "DamascusSemiBold", //106
    "DamascusBold", //107

    // Family: Devanagari Sangam MN
    "DevanagariSangamMN", //108
    "DevanagariSangamMN-Bold", //109

    // Family: Didot
    "Didot", //110
    "Didot-Italic", //111
    "Didot-Bold", //112

    // Family: DIN Alternate
    "DINAlternate-Bold", //113

    // Family: DIN Condensed
    "DINCondensed-Bold", //114

    // Family: Euphemia UCAS
    "EuphemiaUCAS", //115
    "EuphemiaUCAS-Italic", //116
    "EuphemiaUCAS-Bold", //117

    // Family: Farah
    "Farah", //118

    // Family: Futura
    "Futura-Medium", //119
    "Futura-MediumItalic", //120
    "Futura-Bold", //121
    "Futura-CondensedMedium", //122
    "Futura-CondensedExtraBold", //123

    // Family: Galvji
    "Galvji", //124
    "Galvji-Bold", //125

    // Family: Geeza Pro
    "GeezaPro", //126
    "GeezaPro-Bold", //127

    // Family: Georgia
    "Georgia", //128
    "Georgia-Italic", //129
    "Georgia-Bold", //130
    "Georgia-BoldItalic", //131

    // Family: Gill Sans
    "GillSans", //132
    "GillSans-Italic", //133
    "GillSans-Light", //134
    "GillSans-LightItalic", //135
    "GillSans-SemiBold", //136
    "GillSans-SemiBoldItalic", //137
    "GillSans-Bold", //138
    "GillSans-BoldItalic", //139
    "GillSans-UltraBold", //140

    // Family: Helvetica
    "Helvetica", //141
    "Helvetica-Oblique", //142
    "Helvetica-Light", //143
    "Helvetica-LightOblique", //144
    "Helvetica-Bold", //145
    "Helvetica-BoldOblique", //146

    // Family: Helvetica Neue
    "HelveticaNeue", //147
    "HelveticaNeue-Italic", //148
    "HelveticaNeue-UltraLight", //149
    "HelveticaNeue-UltraLightItalic", //150
    "HelveticaNeue-Thin", //151
    "HelveticaNeue-ThinItalic", //152
    "HelveticaNeue-Light", //153
    "HelveticaNeue-LightItalic", //154
    "HelveticaNeue-Medium", //155
    "HelveticaNeue-MediumItalic", //156
    "HelveticaNeue-Bold", //157
    "HelveticaNeue-BoldItalic", //158
    "HelveticaNeue-CondensedBold", //159
    "HelveticaNeue-CondensedBlack", //160

    // Family: Hiragino Maru Gothic ProN
    "HiraMaruProN-W4", //161

    // Family: Hiragino Mincho ProN
    "HiraMinProN-W3", //162
    "HiraMinProN-W6", //163

    // Family: Hiragino Sans
    "HiraginoSans-W3", //164
    "HiraginoSans-W6", //165
    "HiraginoSans-W7", //166

    // Family: Hoefler Text
    "HoeflerText-Regular", //167
    "HoeflerText-Italic", //168
    "HoeflerText-Black", //169
    "HoeflerText-BlackItalic", //170

    // Family: Kailasa
    "Kailasa", //171
    "Kailasa-Bold", //172

    // Family: Kefa
    "Kefa-Regular", //173

    // Family: Khmer Sangam MN
    "KhmerSangamMN", //174

    // Family: Kohinoor Bangla
    "KohinoorBangla-Regular", //175
    "KohinoorBangla-Light", //176
    "KohinoorBangla-Semibold", //177

    // Family: Kohinoor Devanagari
    "KohinoorDevanagari-Regular", //178
    "KohinoorDevanagari-Light", //179
    "KohinoorDevanagari-Semibold", //180

    // Family: Kohinoor Gujarati
    "KohinoorGujarati-Regular", //181
    "KohinoorGujarati-Light", //182
    "KohinoorGujarati-Bold", //183

    // Family: Kohinoor Telugu
    "KohinoorTelugu-Regular", //184
    "KohinoorTelugu-Light", //185
    "KohinoorTelugu-Medium", //186

    // Family: Lao Sangam MN
    "LaoSangamMN", //187

    // Family: Malayalam Sangam MN
    "MalayalamSangamMN", //188
    "MalayalamSangamMN-Bold", //189

    // Family: Marker Felt
    "MarkerFelt-Thin", //190
    "MarkerFelt-Wide", //191

    // Family: Menlo
    "Menlo-Regular", //192
    "Menlo-Italic", //193
    "Menlo-Bold", //194
    "Menlo-BoldItalic", //195

    // Family: Mishafi
    "DiwanMishafi", //196

    // Family: Mukta Mahee
    "MuktaMahee-Regular", //197
    "MuktaMahee-Light", //198
    "MuktaMahee-Bold", //199

    // Family: Myanmar Sangam MN
    "MyanmarSangamMN", //200
    "MyanmarSangamMN-Bold", //201

    // Family: Noteworthy
    "Noteworthy-Light", //202
    "Noteworthy-Bold", //203

    // Family: Noto Nastaliq Urdu
    "NotoNastaliqUrdu", //204
    "NotoNastaliqUrdu-Bold", //205

    // Family: Noto Sans Kannada
    "NotoSansKannada-Regular", //206
    "NotoSansKannada-Light", //207
    "NotoSansKannada-Bold", //208

    // Family: Noto Sans Myanmar
    "NotoSansMyanmar-Regular", //209
    "NotoSansMyanmar-Light", //210
    "NotoSansMyanmar-Bold", //211

    // Family: Noto Sans Oriya
    "NotoSansOriya", //212
    "NotoSansOriya-Bold", //213

    // Family: Optima
    "Optima-Regular", //214
    "Optima-Italic", //215
    "Optima-Bold", //216
    "Optima-BoldItalic", //217
    "Optima-ExtraBlack", //218

    // Family: Palatino
    "Palatino-Roman", //219
    "Palatino-Italic", //220
    "Palatino-Bold", //221
    "Palatino-BoldItalic", //222

    // Family: Papyrus
    "Papyrus", //223
    "Papyrus-Condensed", //224

    // Family: Party LET
    "PartyLetPlain", //225

    // Family: PingFang HK
    "PingFangHK-Regular", //226
    "PingFangHK-Ultralight", //227
    "PingFangHK-Thin", //228
    "PingFangHK-Light", //229
    "PingFangHK-Medium", //230
    "PingFangHK-Semibold", //231

    // Family: PingFang SC
    "PingFangSC-Regular", //232
    "PingFangSC-Ultralight", //233
    "PingFangSC-Thin", //234
    "PingFangSC-Light", //235
    "PingFangSC-Medium", //236
    "PingFangSC-Semibold", //237

    // Family: PingFang TC
    "PingFangTC-Regular", //238
    "PingFangTC-Ultralight", //239
    "PingFangTC-Thin", //240
    "PingFangTC-Light", //241
    "PingFangTC-Medium", //242
    "PingFangTC-Semibold", //243

    // Family: Rockwell
    "Rockwell-Regular", //244
    "Rockwell-Italic", //245
    "Rockwell-Bold", //246
    "Rockwell-BoldItalic", //247

    // Family: Savoye LET
    "SavoyeLetPlain", //248

    // Family: Sinhala Sangam MN
    "SinhalaSangamMN", //249
    "SinhalaSangamMN-Bold", //250

    // Family: Snell Roundhand
    "SnellRoundhand", //251
    "SnellRoundhand-Bold", //252
    "SnellRoundhand-Black", //253

    // Family: Symbol
    "Symbol", //254

    // Family: Tamil Sangam MN
    "TamilSangamMN", //255
    "TamilSangamMN-Bold", //256

    // Family: Thonburi
    "Thonburi", //257
    "Thonburi-Light", //258
    "Thonburi-Bold", //259

    // Family: Times New Roman
    "TimesNewRomanPSMT", //260
    "TimesNewRomanPS-ItalicMT", //261
    "TimesNewRomanPS-BoldMT", //262
    "TimesNewRomanPS-BoldItalicMT", //263

    // Family: Trebuchet MS
    "TrebuchetMS", //264
    "TrebuchetMS-Italic", //265
    "TrebuchetMS-Bold", //266
    "Trebuchet-BoldItalic", //267

    // Family: Verdana
    "Verdana", //268
    "Verdana-Italic", //269
    "Verdana-Bold", //270
    "Verdana-BoldItalic", //271

    // Family: Zapf Dingbats
    "ZapfDingbatsITC", //272

    // Family: Zapfino
    "Zapfino", //273


]
