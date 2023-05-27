//
//  ViewController.swift
//  UIKitElements
//
//  Created by m.korovin on 24.05.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var mainLabel: UILabel!
    @IBOutlet var slider: UISlider!
    
    @IBOutlet var textField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        segmentedControl.insertSegment(withTitle: "Third!", at: 2, animated: false)
        setupSlider()
        setupMainLabel()
        
    }


     // MARK: - IBActions
    @IBAction func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "the first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "the second segment is selected"
            mainLabel.textColor = .green
//        case 2:
//            mainLabel.text = "the third segment is selected"
//            mainLabel.textColor = .blue
        default:
            mainLabel.text = "the third segment is selected"
            mainLabel.textColor = .blue
        }
    }
    
    
    @IBAction func sliderAction() {
        mainLabel.text = slider.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }
    
    
    @IBAction func doneButtonTapped() {
        guard let inputText = textField.text, !inputText.isEmpty else {
            print("Text field is empty")
            return
        }
        
        let usernamePattern = "^[a-zA-Z]{3,20}$"
        let isUsernameValid = NSPredicate(format: "SELF MATCHES %@", usernamePattern)
            .evaluate(with: inputText)
        
        if !isUsernameValid {
            print("Wrong format")
            return
        }
        
        mainLabel.text = textField.text
    }
    
    
    // MARK: - Private Methods
    private func setupMainLabel() {
        mainLabel.text = slider.value.formatted()
        mainLabel.font = .systemFont(ofSize: 44)
        mainLabel.textAlignment = .center
        mainLabel.numberOfLines = 2
    }
    
    private func setupSlider() {
        slider.value = 1
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.minimumTrackTintColor = .yellow
        slider.maximumTrackTintColor = .red
        slider.thumbTintColor = .black
    }
}


// MARK: - UIAlertController
extension ViewController {
    
}
