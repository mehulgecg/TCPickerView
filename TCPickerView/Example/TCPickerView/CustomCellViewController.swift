//
//  CustomCellViewController.swift
//  TCPickerViewExample
//
//  Created by Taras Chernyshenko on 6/11/18.
//  Copyright © 2018 Taras Chernyshenko. All rights reserved.
//

import UIKit
import TCPickerView

class CustomCellViewController: UIViewController, TCPickerViewOutput {
    @IBAction private func showButtonPressed(button: UIButton) {
        let screenWidth: CGFloat = UIScreen.main.bounds.width
        let screenHeight: CGFloat = UIScreen.main.bounds.height
        let width: CGFloat = screenWidth - 64
        let height: CGFloat = screenHeight - 160
        var picker: TCPickerViewInput = TCPickerView(size: CGSize(width: width, height: height))
        picker.title = "Cars"
        let cars = [
            "Chevrolet Bolt EV",
            "Subaru WRX",
            "Porsche Panamera",
            "BMW 330e",
            "Chevrolet Volt",
            "Ford C-Max Hybrid",
            "Ford Focus"
        ]
        let values = cars.map { TCPickerView.Value(title: $0) }
        picker.values = values
        picker.delegate = self
        picker.cornerRadius = 0.0
        picker.itemsFont = UIFont.systemFont(ofSize: 15, weight: .bold)
        picker.mainColor = .black
        picker.textColor = .white
        picker.closeButtonColor = .black
        picker.background = .black
        picker.selection = .multiply
        picker.register(UINib(nibName: "ExampleTableViewCell", bundle: nil), forCellReuseIdentifier: "ExampleTableViewCell")
        picker.completion = { (selectedIndexes) in
            for i in selectedIndexes {
                print(values[i].title)
            }
        }
        picker.show()
    }
    
    //MARK: TCPickerViewDelegate methods
    
    func pickerView(_ pickerView: TCPickerViewInput, didSelectRowAtIndex index: Int) {
        print("Uuser select row at index: \(index)")
    }
    
    func pickerView(_ pickerView: TCPickerViewInput,
        cellForRowAt indexPath: IndexPath) -> (UITableViewCell & TCPickerCellType)? {
        let cell = pickerView.dequeueReusableCell(withIdentifier: "ExampleTableViewCell", for: indexPath)
        return cell
    }
}
