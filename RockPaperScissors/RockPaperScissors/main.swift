//
//  main.swift
//  RockPaperScissors
//
//  Created by YB on 2021/05/20.
//

import Foundation

class RockPaperScissors {
    var userSelect: String = ""
    var computerHand: Int = 2
    var userHand: Int = 2
    
    enum HandShape: Int {
        case scissors = 1
        case rock = 2
        case paper = 3
    }
    
    enum GameResultMessage: String {
        case draw = "비겼습니다!"
        case win = "이겼습니다!"
        case lose = "졌습니다!"
        case endGame = "게임 종료"
        case inputError = "잘못된 입력입니다. 다시 시도해주세요."
    }
    
    private func endGame() {
        print(GameResultMessage.endGame.rawValue)
        exit(0)
    }
    
    private func randomComputerHand() -> Int {
        let computerHand = Int.random(in : 1...3)
        return computerHand
    }
    
    private func inputUserHand() -> Int {
        if readLine() != nil {
        }
        return Int(userHand)
    }
    
    private func resultGame(computerHand: Int, userHand: Int) {
        
        let result = computerHand - userHand
        
        switch result {
        case 2, -1:
            print(GameResultMessage.win.rawValue)
        case 1, -2:
            print(GameResultMessage.lose.rawValue)
        default:
            print(GameResultMessage.draw.rawValue)
            startGame()
        }
    }
    
    private func gamelaunch() {
        
        switch userHand {
        case 1...3:
            resultGame(computerHand: randomComputerHand(), userHand: inputUserHand())
        case 0:
            endGame()
        default:
            print(GameResultMessage.inputError.rawValue)
        }
    }

    func startGame() {
        print("가위(1), 바위(2), 보(3)! <종료:0> : ", terminator: "")
        gamelaunch()
    }
}

var game = RockPaperScissors()
game.startGame()
