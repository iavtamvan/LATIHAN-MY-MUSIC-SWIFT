//
//  ViewController.swift
//  MyMusic
//
//  Created by Ade Fajr Ariav on 15/02/23.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var stopBtn: UIButton!
    @IBOutlet var playBtn: UIButton!
    
    @IBOutlet var musicLbl: UILabel!
    private var player: AVAudioPlayer?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: Memastikan bahwa url dari asset tidak null.
            guard let url = Bundle.main.url(forResource: "astrid", withExtension: "mp3") else {
              return
            }
                
            do {
              try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    
                musicLbl.text = "Astrid"
              // MARK: Kode ini untuk iOS 11 ke atas.
              player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
                    
              // MARK: Kode ini untuk iOS 10 ke bawah.
              // player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3)
                    
            } catch let error {
              print(error.localizedDescription)
            }
        
    }

    @IBAction func playMusic(_ sender: Any) {
        guard let audiuoPlayer = player else {return}
        audiuoPlayer.play()
        playBtn.isEnabled = false
        
        isPlaying(state: true)

        
        
    }
    
    @IBAction func stopMusic(_ sender: Any) {
        guard let audiuoPlayer = player else {return}
        audiuoPlayer.stop()
        
        isPlaying(state: false)
        
    }
    
    
    private func isPlaying(state: Bool) {
      stopBtn.isEnabled = state
      playBtn.isEnabled = !state
    }

}


