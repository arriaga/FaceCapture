
import Foundation
import AVFoundation
import UIKit

 public class SdkComponent{
    
    internal var viewController : UIViewController
    internal var configuration: Configuration?
    
   public var username: String = ""
     public var password: String = ""
     public var livenessRequired: Bool = true
     public var level: AntispoofingLevel = .medium
     public var showPreview: Bool = false
     public var showIntro: Bool = true
     public var enableVideoHelp: Bool = false
     public var enableTroubleshootHelp: Bool = false
     public var timeout : Int = 180
     public var maxValidations : Int = 3
    
     public  var aditionalConfigurationParameters : [ComponentCaptureParameter: Any] = [:]
     public var tags : [String: String] = [:]
     public var messagesResource: String = ""
     public var sideView : CameraSideView = .front
     public var allowManualSideView: Bool = false
    
    enum ResponseType{
        case success, fail, error
    }
    
   public init(viewController : UIViewController){
        self.viewController = viewController
        configuration = loadConfiguration()
    }
    
    internal func loadConfiguration() -> Configuration? {
        if let url = Bundle.main.url(forResource: "Configuration", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Configuration.self, from: data)
                return jsonData
            } catch {
                print("Errror:\(error)")
            }
        }
        return nil
    }
    
    internal func getListOfCameras(position: AVCaptureDevice.Position) -> [AVCaptureDevice] {
        let cameras = getListOfCameras()
        var list:[AVCaptureDevice] = []
        for camera in cameras{
            if(camera.position == position){
                list.append(camera)
            }
        }
        return list
    }
    
    /// Returns all cameras on the device.
    internal func getListOfCameras() -> [AVCaptureDevice] {
        
#if os(iOS)
        let session = AVCaptureDevice.DiscoverySession(
            deviceTypes: [
                .builtInWideAngleCamera,
                .builtInTelephotoCamera
            ],
            mediaType: .video,
            position: .unspecified)
#elseif os(macOS)
        let videoDeviceDiscoverySession = AVCaptureDevice.DiscoverySession(
            deviceTypes: [
                .builtInWideAngleCamera
            ],
            mediaType: .video,
            position: .unspecified)
#endif
        
        return session.devices
    }
    
    /// Returns all microphones on the device.
    fileprivate func getListOfMicrophones() -> [AVCaptureDevice] {
        let session = AVCaptureDevice.DiscoverySession(
            deviceTypes: [
                .builtInMicrophone
            ],
            mediaType: .audio,
            position: .unspecified)
        
        return session.devices
    }
    
}

public enum AntispoofingLevel{
    case low, medium, high
    
    var description : String {
        switch self {
        case .low: return "low"
        case .medium: return "medium"
        case .high: return "high"
        }
    }
    
    var value : Int {
        switch self {
        case .low: return 1
        case .medium: return 2
        case .high: return 3
        }
    }
    
}
