//
//  CameraViewController.swift
//  Project04三屏滑动和相机
//
//  Created by Han Jize on 2020/4/26.
//  Copyright © 2020 Han Jize. All rights reserved.
//

import UIKit
import  AVFoundation

class CameraViewController: UIViewController, AVCapturePhotoCaptureDelegate {
    @IBOutlet weak var cameraView:UIView!
    @IBOutlet weak var tempImageView:UIImageView!
    
    var captureSession : AVCaptureSession?
    var stillImageOutput : AVCapturePhotoOutput?//新类替换AVCaptureStillImageOutput
    var previewLayer : AVCaptureVideoPreviewLayer?
    var photoSettings :AVCapturePhotoSettings?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer?.frame = cameraView.bounds
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        let backCamera = AVCaptureDevice.default(for: AVMediaType.video)!

        var error : NSError?
        var input: AVCaptureDeviceInput!
        
        do {
            input = try AVCaptureDeviceInput(device: backCamera)
        } catch let error1 as NSError {
            error = error1
            input = nil
        }
        
        if (error == nil && captureSession?.canAddInput(input) != nil) {
            captureSession?.addInput(input)
            stillImageOutput = AVCapturePhotoOutput()
        }
        
        if let stillImageOutputTemp = stillImageOutput {
            if captureSession?.canAddOutput(stillImageOutputTemp) != nil {
                captureSession?.addOutput(stillImageOutputTemp)
                if let captureSessionTemp = captureSession {
                    previewLayer = AVCaptureVideoPreviewLayer(session: captureSessionTemp)
                    previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
                    previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                    cameraView.layer.addSublayer(previewLayer!)
                    captureSession?.startRunning()
                }
            }
        }
        photoSettings = AVCapturePhotoSettings.init(format:[AVVideoCodecKey:AVVideoCodecType.jpeg])
    }
    
    func didPressTakePhoto(){
           if let videoConnection = stillImageOutput?.connection(with: .video){
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
            photoSettings = AVCapturePhotoSettings.init(format:[AVVideoCodecKey:AVVideoCodecType.jpeg])
            photoSettings?.flashMode = .auto
            stillImageOutput?.capturePhoto(with:photoSettings!, delegate: self)
           }
       }
       
       
       var didTakePhoto = Bool()
       
       func didPressTakeAnother(){
           if didTakePhoto == true{
               tempImageView.isHidden = true
               didTakePhoto = false
           }
           else{
               captureSession?.startRunning()
               didTakePhoto = true
               didPressTakePhoto()
           }
       }
       
       override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           didPressTakeAnother()
       }

       override var prefersStatusBarHidden: Bool {
           return true
       }
}
