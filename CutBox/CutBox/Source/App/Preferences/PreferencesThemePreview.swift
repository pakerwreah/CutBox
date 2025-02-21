//
//  PreferencesThemePreview.swift
//  CutBox
//
//  Created by Jason Milkins on 22/5/18.
//  Copyright © 2018-2023 ocodo. All rights reserved.
//

import Cocoa
import RxSwift

class PreferencesThemePreview: NSBox {

    @IBOutlet weak var topBar: NSBox!
    @IBOutlet weak var searchCutBox: NSTextField!
    @IBOutlet weak var footerBox: NSBox!
    @IBOutlet weak var itemsBox: NSBox!

    @IBOutlet weak var previewBox: NSBox!
    @IBOutlet weak var previewText: NSTextField!

    @IBOutlet weak var selectedItem: NSTextField!

    @IBOutlet weak var label1: NSTextField!
    @IBOutlet weak var label2: NSTextField!
    @IBOutlet weak var label3: NSTextField!
    @IBOutlet weak var label4: NSTextField!
    @IBOutlet weak var label5: NSTextField!
    @IBOutlet weak var label6: NSTextField!

    let prefs = CutBoxPreferencesService.shared

    let disposeBag = DisposeBag()

    func applyTheme() {
        let theme = prefs.currentTheme

        fillColor = theme.popupBackgroundColor
        searchCutBox.textColor = theme.searchText.textColor
        topBar.fillColor = theme.searchText.backgroundColor
        footerBox.fillColor = theme.popupBackgroundColor

        previewBox.fillColor = theme.preview.backgroundColor
        previewText.textColor = theme.preview.textColor

        itemsBox.fillColor = theme.clip.backgroundColor
        selectedItem.backgroundColor = theme.clip.highlightColor
        selectedItem.textColor = theme.clip.highlightTextColor
        label1.textColor = theme.clip.textColor
        label2.textColor = theme.clip.textColor
        label3.textColor = theme.clip.textColor
        label4.textColor = theme.clip.textColor
        label5.textColor = theme.clip.textColor
        label6.textColor = theme.clip.textColor
    }

    override func awakeFromNib() {
        applyTheme()

        prefs.events.bind {
            switch $0 {
            case .themeChanged:
                self.applyTheme()

            case .themesReloaded:
                self.applyTheme()

            default:
                break
            }
        }.disposed(by: disposeBag)
    }
}
