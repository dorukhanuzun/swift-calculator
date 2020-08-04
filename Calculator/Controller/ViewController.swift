import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get{
            guard let displayValue = Double(displayLabel.text!) else {
                fatalError("Can not convert display label text to a double")
            }
            return displayValue
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        isFinishedTypingNumber = true
        
        calculator.setNumber(displayValue)
  
        if let calcMethod = sender.currentTitle{
            if let result = calculator.calculate(symbol: calcMethod) {
                displayValue = result
            }
        }
    }
    
     @IBAction func numButtonPressed(_ sender: UIButton) {
            
            //What should happen when a number is entered into the keypad
            
            if let numValue = sender.currentTitle {
                if isFinishedTypingNumber {
                    displayLabel.text = numValue
                    isFinishedTypingNumber = false
                } else {
                    if let labelText = displayLabel.text {
                        if !labelText.contains(".") || numValue != "."{
                            displayLabel.text = labelText + numValue
                        }
                    }
                }
            }
        }
    }


