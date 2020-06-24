//
//  PlayerViewController.swift
//  PlayerSample
//
//  Created by Fabrício Masiero on 23/06/20.
//  Copyright © 2020 Fabrício Masiero. All rights reserved.
//

import UIKit
import Foundation
import AVFoundation

class PlayerViewController: UIViewController {

    @IBOutlet weak var viewCover: UIView!
    @IBOutlet weak var imageViewAlbumCover: UIImageView!
    @IBOutlet weak var buttonPlay: UIButton!
    @IBOutlet weak var buttonPrevious: UIButton!
    @IBOutlet weak var buttonForward: UIButton!
    @IBOutlet weak var labelName: UILabel!
    
    var player: AVQueuePlayer = {
        guard let url = Bundle.main.url(forResource: "joydivision", withExtension: "mp3"), let url1 = Bundle.main.url(forResource: "america", withExtension: "mp3") else {
            return AVQueuePlayer()
        }
        do { try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback) } catch {}
        let item1 = AVPlayerItem(url: url)
        let item2 = AVPlayerItem(url: url1)
        let player = AVQueuePlayer(items: [item1, item2])
        player.actionAtItemEnd = .none
        return player
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewCover.addShadow()
        viewCover.addParallax(size: 30.0)
        viewCover.redimensione(to: 0.75)
        player.pause()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = imageViewAlbumCover.image?.averageColor
    }
    
    @IBAction func previous(_ sender: Any) {
    }
    @IBAction func play(_ sender: Any) {
        if player.timeControlStatus == .playing {
            buttonPlay.setBackgroundImage(UIImage(systemName: "play"), for: .normal)
            player.pause()
            viewCover.redimensione(to: 0.75)
            return
        }
        buttonPlay.setBackgroundImage(UIImage(systemName: "pause"), for: .normal)
        player.play()
        viewCover.redimensione(to: 1.0)
        viewCover.pulse()
    }
    @IBAction func forward(_ sender: Any) {
        player.advanceToNextItem()
        UIView.animate(withDuration: 0.5) {
            self.imageViewAlbumCover.image = UIImage(named: "america")
            self.labelName.text = "America - A horse with no name"
            self.view.backgroundColor = self.imageViewAlbumCover.image?.averageColor
        }
    }
}
