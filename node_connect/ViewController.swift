import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate {
 
    @IBOutlet weak var inputLabel: UITextField!
    @IBAction func buttonClicked(_ sender: Any) {
        let dic:Dictionary = ["message" : inputLabel.text ?? ""]
        
        guard let url = URL(string: "http://127.0.0.1:3000") else {
            return
        }
        var request = URLRequest(url:url)
        request.httpMethod = "POST"
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
        } catch { print(error.localizedDescription) }
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept-Type")
        
        // URLSession으로 데이터를 서버에 전송
        print("URLSession 진입")
        let session = URLSession.shared
        session.dataTask(with: request, completionHandler: {(data, response, error) in
            print("전송완료")
        }).resume()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print("viewDidLoad appeared")
//        let serverURL = URL(string: "http://127.0.0.1:3000")
//        let request = URLRequest(url: serverURL!)
//        webView.load(request)
    }
    
}
