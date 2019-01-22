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
    var isPlaying = false
    var imagePause: UIImage?
    var imagePlay: UIImage?
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var pbPlay: UIBarButtonItem!
    
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
        if !isPlaying
        {
            setOnPlay()
        }
        else
        {
            setOnPause()
        }
    }
    
    @IBAction func pbRewindClicked(_ sender: Any)
    {
        lbl.text = "Rewinding..."
        setOnPause()
    }
    
    @IBAction func pbFastForwardClicked(_ sender: Any)
    {
        lbl.text = "Fast forwarding..."
        setOnPause()
    }
    
    func setOnPlay()
    {
        isPlaying = true
        imagePause = UIImage(named: "Pause")
        lbl.text = "Playing..."
        if imagePause != nil
        {
            pbPlay.image = imagePause
        }
        player?.prepareToPlay()
        player?.play()
    }
    
    func setOnPause()
    {
        isPlaying = false
        lbl.text = "Paused..."
        imagePlay = UIImage(named: "Play")
        if imagePlay != nil
        {
            pbPlay.image = imagePlay
        }
        player?.stop()
    }
 
}

