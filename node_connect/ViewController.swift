import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate {
    
    @IBOutlet weak var webView: WKWebView!
//    var webView: WKWebView!
    
    @IBAction func clickRequestBtn(_ sender: Any) {
        webView.evaluateJavaScript("changeBackgroundColor()", completionHandler: nil)
    }
    
    override func loadView() {
        print("loadView appeared")
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        
        webView.uiDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewDidLoad appeared")
        let serverURL = URL(string: "http://127.0.0.1:3000")
        let request = URLRequest(url: serverURL!)
        webView.load(request)
    }
    
}
