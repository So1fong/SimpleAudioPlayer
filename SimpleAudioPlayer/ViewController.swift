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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //player = initializePlayer()
        let audioSourceURL: URL
        audioSourceURL = Bundle.main.url(forResource: "03. Kein Liebeslied", withExtension: "mp3")!
        do
        {
            player = try  AVAudioPlayer(contentsOf: audioSourceURL)
            player?.prepareToPlay()
            //player?.play()
            //return player
        }
        catch
        {
            print("Error")
            //return nil
        }
        player?.play()
        
        //self.player?.play()
        
        //self.bPlay.layer.cornerRadius = 3

        
        //self.player.play()
    }
/*
    func initializePlayer() -> AVAudioPlayer?
    {
        //let path = Bundle.main.path(forResource: "03 - Kein Liebeslied.mp3", ofType: nil)!
        let audioSourceURL: URL!
        audioSourceURL = Bundle.main.url(forResource: "03 - Kein Liebeslied", withExtension: "mp3")
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
 */
/*
    {
        guard let audioPath = Bundle.main.path(forResource: "03. Kein Leibeslied", ofType: "mp3")
            else
        {
            //try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            return nil
        }
        return try? AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
    }
*/
}

