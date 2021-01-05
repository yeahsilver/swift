//
//  ViewController.swift
//  Album
//
//  Created by 허예은 on 2021/01/05.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var containedView: UIView!
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet var dateLabel: UILabel!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
    }

    @IBAction func addAction(_ sender: Any) {
        showActionSheet()
    }
    
    func showActionSheet(){
        let alert =  UIAlertController(title: "원하는 타이틀", message: "원하는 메세지", preferredStyle: .actionSheet)
        let library =  UIAlertAction(title: "사진 앨범", style: .default) { (action) in self.openLibrary()}
        let camera =  UIAlertAction(title: "카메라", style: .default) { (action) in self.openCamera()}

        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alert.addAction(library)
        alert.addAction(camera)
        alert.addAction(cancel)

        present(alert, animated: true, completion: nil)
    }
    
    func openLibrary(){
        picker.sourceType = .photoLibrary
        present(picker, animated: false, completion: nil)
    }

    func openCamera(){
        if(UIImagePickerController .isSourceTypeAvailable(.camera)){
            picker.sourceType = .camera

            present(picker, animated: false, completion: nil)
        } else {
            print("camera not available")
        }
    }
    
    
    @IBAction func screenshotButton(_ sender: AnyObject) {
        let screenshot = self.containedView.takeScreenshot()
        UIImageWriteToSavedPhotosAlbum(screenshot, self, #selector(imageSaved(image:didFinishSavingWithError:contextInfo:)), nil)
        
        let vc = storyboard?.instantiateViewController(identifier: "screenshot") as! ScreenshotViewController
        
        vc.image = screenshot
        vc.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
    
    @objc func imageSaved(image:UIImage, didFinishSavingWithError error:Error, contextInfo:UnsafeMutableRawPointer?){
        let alert =  UIAlertController(title: "저장 완료", message: "갤러리에 이미지가 저장되었습니다.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: nil))
    }
}

extension UIView {
    func takeScreenshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if image != nil {
            return image!
        }
        
        return UIImage()
    }
}

extension MainViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            dateLabel.text = setTime()
        }
        dismiss(animated: true, completion: nil)
    }
    
    func setTime() -> String{
        let now = NSDate()
        let formatter = DateFormatter()
        
        formatter.dateFormat = "YYYY년 MM월 DD일 HH시 mm분 ss초"
        
        let date = formatter.string(from: now as Date)
        
        return date
    }
}
