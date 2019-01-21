//
//  ViewController.swift
//  SimpleAudioPlayer
//
//  Created by Ekaterina Kozlova on 21.01.2019.
//  Copyright © 2019 Ekaterina Kozlova. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController
{
    var player: AVAudioPlayer?
    @IBOutlet weak var bPlay: UIButton!
    @IBOutlet weak var bStop: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        player = initializePlayer()
        player?.prepareToPlay()
        player?.play()
        self.bPlay.layer.cornerRadius = 10
        self.bStop.layer.cornerRadius = 10

    }

    func initializePlayer() -> AVAudioPlayer?
    {
        if let audioSourceURL = Bundle.main.url(forResource: "03. Kein Liebeslied", withExtension: "mp3")
        {
            do
            {
                player = try  AVAudioPlayer(contentsOf: audioSourceURL)
                player?.prepareToPlay()
                //player?.play()
                return player
            }
            catch
            {
                print("Error")
                return nil
            }
        }
        else
        {
            return nil
        }
    }
 
}

