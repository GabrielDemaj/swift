
import UIKit


struct CalculatorBrain {
    var bmi: BMI?
    
    func getBMIValue() -> String {
        let formatted = String(format: "%.1f", bmi?.value ?? "0.0")
        return formatted
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getColor () -> UIColor {
        return bmi?.color ?? UIColor.white
    }
    
    mutating  func calculateBMI (height: Float, weight: Float) {
        let bmiValue = weight / (height * height)
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "Eat more!", color: UIColor.systemTeal)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "Fit as a fiddle!", color: UIColor.green)
        } else {
            bmi = BMI(value: bmiValue, advice: "Eat less!", color: UIColor.red)
        }
        
        //        bmi(value: bmiValue, advice: <#T##String#>, color: <#T##UIColor#>)
        //        return bmi?.value
    }
    
    
    
}
