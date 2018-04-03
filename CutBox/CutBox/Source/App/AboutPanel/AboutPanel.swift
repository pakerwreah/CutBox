//
//  AboutPanel.swift
//  CutBox
//
//  Created by Jason on 31/3/18.
//  Copyright © 2018 ocodo. All rights reserved.
//

import Cocoa

class LinkText: NSTextField {

    override func mouseDown(with event: NSEvent) {
        NSWorkspace
            .shared
            .open(URL(string: Constants.cutBoxProductHomeUrl)!)
    }

}

class AboutPanel: NSPanel {

    @IBOutlet weak var productTitle: NSTextField!
    @IBOutlet weak var productVersion: NSTextField!
    @IBOutlet weak var productHomeUrl: LinkText!
    @IBOutlet weak var productLicense: NSTextField!

    override func awakeFromNib() {
        self.titlebarAppearsTransparent = true

        productTitle.stringValue = Constants.cutBoxProductTitle
        productHomeUrl.stringValue = Constants.cutBoxProductHomeUrl
        productLicense.stringValue = Constants.cutBoxCopyrightLicense
        productVersion.stringValue = VersionService.version
    }
}