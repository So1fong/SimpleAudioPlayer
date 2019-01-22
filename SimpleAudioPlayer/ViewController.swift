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
    @IBOutlet weak var lbl: UILabel!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        player = initializePlayer()
    }

    func initializePlayer() -> AVAudioPlayer?
    {
        if let audioSourceURL = Bundle.main.url(forResource: "03. Kein Liebeslied", withExtension: "mp3")
        {
            do
            {
                player = try  AVAudioPlayer(contentsOf: audioSourceURL)
                player?.prepareToPlay()
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
    

    @IBAction func pbPlayClicked(_ sender: Any)
    {
        lbl.text = "Playing..."
        player?.prepareToPlay()
        player?.play()
    }
    
    @IBAction func pbRewindClicked(_ sender: Any)
    {
        lbl.text = "Rewinding..."
    }
    
    @IBAction func pbFastForwardClicked(_ sender: Any)
    {
        lbl.text = "Fast forwarding..."
    }
    
    //удалить потом
    @IBAction func pushPlay(_ sender: UIButton)
    {
        player?.prepareToPlay()
        player?.play()
    }
    
    @IBAction func pushStop(_ sender: UIButton)
    {
        player?.stop()
    }
 
}

