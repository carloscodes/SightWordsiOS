//
//  ViewController.swift
//  SightWords
//
//  Created by Carlos Chavarria on 10/27/18.
//  Copyright © 2018 Carlos Chavarria. All rights reserved.
//


import AVFoundation
import UIKit

class ViewController: UIViewController {

    let allWords = WordBank()
    var wordNumber : Int = 0
    
    let synth = AVSpeechSynthesizer()
    var utterance = AVSpeechUtterance(string: "hello") //initialization
    let voice = AVSpeechSynthesisVoice(identifier: AVSpeechSynthesisVoiceIdentifierAlex) //default, will attempt to use enhanced voice below if found on device

    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var speakButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    
    
    
    func nextWord(){
        if(wordNumber < 49){
            textView.text = allWords.list[wordNumber].wordText
        }
        else {
            let alert = UIAlertController(title: "Awesome!", message: "You practiced all the words", preferredStyle: .alert)
            
            let restart = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in self.startOver() })
            
            alert.addAction(restart)
            present(alert,animated: true, completion: nil)
            
        }
    }
    
    func startOver(){
        wordNumber = 0
        nextWord()
    }
    
    func speakWord(){
        utterance = AVSpeechUtterance(string: textView.text)
        
        synth.speak(utterance)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let someWord = allWords.list[wordNumber]
        textView.text = someWord.wordText
    }

    @IBAction func didPressSpeakButton(_ sender: Any) {
        speakWord()
    }
    
    @IBAction func didPressNextButton(_ sender: Any) {
        wordNumber = wordNumber + 1
        nextWord()
    }
    
    
    
}


