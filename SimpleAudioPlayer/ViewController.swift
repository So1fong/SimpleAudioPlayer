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
    var isRewindingOrForwarding = false
    var songDurationTimer: Timer!
    @IBOutlet weak var toolBar: UIToolbar!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var pbPlay: UIBarButtonItem!
    @IBOutlet weak var imageOfAlbum: UIImageView!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        player = initializePlayer()
        player?.prepareToPlay()
        initializeSlider()
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
    
    func initializeSlider()
    {
        slider.value = 0.0
        slider.minimumValue = 0.0
        if let duration = player?.duration
        {
            slider.maximumValue = Float(duration)
        }
    }
    
    @objc func changeSongDurationValues()
    {
        if let curTime = player?.currentTime
        {
            if isPlaying
            {
                slider.value = Float(curTime)
            }
            else if isRewindingOrForwarding
            {
                slider.value = 0.0
            }
            print(curTime)
        }
    }
    
    @IBAction func onSliderTouchUpInside(_ sender: UISlider)
    {
        if sender == self.slider
        {
            player?.currentTime = TimeInterval(sender.value)
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
        isRewindingOrForwarding = true
        player?.currentTime = 0
        slider.value = 0.0
        setOnPause()
    }
    
    @IBAction func pbFastForwardClicked(_ sender: Any)
    {
        lbl.text = "Fast forwarding..."
        isRewindingOrForwarding = true
        player?.currentTime = 0
        slider.value = 0.0
        setOnPause()
    }
    
    func setOnPlay()
    {
        isPlaying = true
        lbl.text = "Playing..."
        if let imagePause = UIImage(named: "Pause")
        {
            pbPlay.image = imagePause
        }
        player?.play()
        songDurationTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(changeSongDurationValues), userInfo: nil, repeats: true)
    }
    
    func setOnPause()
    {
        isPlaying = false
        isRewindingOrForwarding = false
        songDurationTimer.invalidate()
        print(songDurationTimer.isValid)
        lbl.text = "Paused..."
        if let imagePlay = UIImage(named: "Play")
        {
            pbPlay.image = imagePlay
        }
        player?.pause()
    }
}

