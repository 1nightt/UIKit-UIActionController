import UIKit

final class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{
    var picker = UIPickerView()
    var pickerData = ["one", "two", "share"]
    
    var textField = UITextField()
    
    var button = UIButton(type: .system)
    
    var activityController: UIActivityViewController? = nil
    
    // MARK: -Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupForPicker()
        setupForTextField()
        setupForButton()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // MARK: - Private Methods
    private func setupForPicker() {
        self.picker.delegate = self
        self.picker.dataSource = self
        self.picker.frame = CGRect(x: 0, y: 100, width: 200, height: 200)
        self.picker.center.x = self.view.center.x
        self.view.addSubview(picker)
    }
    
    private func setupForTextField() {
        self.textField.frame = CGRect(x: 0, y: 0, width: 200, height: 25)
        self.textField.center = self.view.center
        self.textField.borderStyle = .roundedRect
        self.textField.placeholder = "Enter text for share"
        self.view.addSubview(self.textField)
    }
    
    private func setupForButton() {
        self.button.frame = CGRect(x: 0, y: 480, width: 100, height: 20)
        self.button.center.x = self.view.center.x
        self.button.setTitle("Пошарить", for: .normal)
        self.view.addSubview(self.button)
        self.button.addTarget(self, action: #selector(sharedText), for: .touchUpInside)
    }
    
    @objc func sharedText() {
        let text = textField.text
        if text?.count == 0 {
            let alertController = UIAlertController(title: nil, message: "Введите текс", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .default)
            alertController.addAction(okButton)
            self.present(alertController, animated: true)
        }
        self.activityController = UIActivityViewController(activityItems: [self.textField.text ?? "nil"], applicationActivities: nil)
        self.present(activityController!, animated: true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if row == 2 {
            self.activityController = UIActivityViewController(activityItems: [self.pickerData[2]], applicationActivities: nil)
            self.present(activityController!, animated: true)
        }
    }
    
    
}

