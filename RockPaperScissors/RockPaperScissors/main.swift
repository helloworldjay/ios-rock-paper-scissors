//
//  main.swift
//  RockPaperScissors
//
//  Created by YB on 2021/05/20.
//

import Foundation

class RockPaperScissor {
    var computerHand = 0
    var userHand = 0
    
    enum HandType: Int, CustomStringConvertible {
        case end = 0
        case scissors = 1
        case rock = 2
        case paper = 3
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    enum GameResultMessage: String, CustomStringConvertible {
        case draw = "비겼습니다!"
        case win = "이겼습니다!"
        case lose = "졌습니다!"
        case endGame = "게임 종료"
        case inputError = "잘못된 입력입니다. 다시 시도해주세요."
        
        var description: String {
            return "\(self.rawValue)"
        }
    }
    
    private func endGame() {
        print(GameResultMessage.endGame)
        return
    }
    
    private func restartGame() {
        print(GameResultMessage.inputError)
        startGame()
    }
    
    private func randomComputerHand() -> Int {
        let computerHand = Int.random(in : 1...3)
        return computerHand
    }
    
    private func showGameResult(computerHand: Int, userHand: Int) {
        
        let result = (3 + userHand - computerHand) % 3
        
        if result == 1 {
            print(GameResultMessage.win)
        } else if result == 2 {
            print(GameResultMessage.lose)
        } else {
            print(GameResultMessage.draw)
            startGame()
        }
    }
    
    //사용자 입력을 받아서, String을 Int로 변환후 반환
    private func inputUserHand() {
        guard let userHand = readLine(), let changeUserHand = Int(userHand) else {
            restartGame()
            return
        }
        checkUserInput(with: changeUserHand)
    }

    // 입력값 타입별 분류
    private func checkUserInput(with changeUserHand: Int) {
        switch changeUserHand {
        case HandType.rock.rawValue, HandType.scissors.rawValue, HandType.paper.rawValue:
            showGameResult(computerHand: randomComputerHand(), userHand: changeUserHand)
        case HandType.end.rawValue:
            endGame()
        default:
            restartGame()
        }
    }

    func startGame() {
        print("가위(1), 바위(2), 보(3)! <종료:0> : ", terminator: "")
        inputUserHand()
    }
}

let game = RockPaperScissor()
game.startGame()
