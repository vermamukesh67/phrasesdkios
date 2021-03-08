//
//  ViewController.swift
//  PhraseiOS
//
//  Created by venveh on 4/3/21.
//

import UIKit
import PhraseSDK

enum Languages: String, CaseIterable {
    case EN = "en"
    case TH = "th"
    case ID = "id"
}

class ViewController: UIViewController {
    @IBOutlet weak var actView: UIActivityIndicatorView!
    @IBOutlet weak var lblValue: UILabel!
    @IBOutlet weak var btnUpdate: UIButton!
    @IBOutlet weak var imgView: UIImageView!
    var allSupportedLanguages: [Languages] = Languages.allCases
    var selectedLang = Languages.EN
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateLanguageAndLabel()
        self.btnUpdateLanguageTapped(btnUpdate)
    }
    
    func updateLanguageAndLabel() {
        lblValue.text = NSLocalizedString("general.message", comment: "")
        self.title = selectedLang.rawValue
    }
    
    @IBAction func btnUpdateLanguageTapped(_ sender: Any?){
        Phrase.shared.localeOverride = selectedLang.rawValue
        self.actView.startAnimating()
        self.btnUpdate.setTitle("", for: UIControl.State.normal)
        OTATranslations.shared.updateTranslations {
            DispatchQueue.main.async {
                self.actView.stopAnimating()
                self.btnUpdate.setTitle("Update", for: UIControl.State.normal)
                self.updateLanguageAndLabel()
            }
        }
    }
    
    @IBAction func btnSelectLanguageTapped(_ sender: Any) {
        print("change language")
        let actionSheet = UIAlertController(title: "Phrase", message: "Please select language", preferredStyle: .actionSheet)
        for language in allSupportedLanguages {
            actionSheet.addAction(UIAlertAction(title: language.rawValue, style: .default, handler: { (action)in
                if let actionTitle =  action.title, let language = Languages.init(rawValue: actionTitle) {
                    self.selectedLang = language
                }
                self.btnUpdateLanguageTapped(self.btnUpdate)
            }))
        }
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(actionSheet, animated: true, completion: nil)
    }
    
}

