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
    @IBOutlet var datepicker: UIDatePicker!
    @IBOutlet var textField: UITextField!
    @IBOutlet var switchLabel: UILabel!
    
    
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
            showAlert(withTitle: "Text field is empty", andMessage: "Please enter your name")
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
    
    
    @IBAction func datePickerAction() {
        mainLabel.text = datepicker.date.formatted(date: .long, time: .omitted)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        datepicker.isHidden = !sender.isOn
        switchLabel.text = sender.isOn ? "Hide Date Picker" : "Show date picker"
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
    private func showAlert(withTitle title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.textField.text = ""
            
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
}
