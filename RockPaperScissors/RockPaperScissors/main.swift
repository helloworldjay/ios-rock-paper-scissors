//
//  RockPaperScissors - main.swift
//  Created by yagom.
//  Copyright © yagom academy. All rights reserved.
//

import Foundation


class RockPaperScissors {
    
    var attackingTurn: String = "사용자"
    let rockPaperScissorsGameMessage: [String] = ["이겼습니다!", "졌습니다!", "비겼습니다!"]
    let mukchipaGameMessage: [String] = ["의 턴입니다", "의 승리!"]
    let rockPaperScissorsMode: Bool = true
    let mukchipaMode: Bool = false
    
    private func playGame(with userChoice: Int, on gameMode: Bool) {
        let randomComputerChoice: Int = Int.random(in: 1...3)
        print(randomComputerChoice)
        let criterion: Int = (userChoice - randomComputerChoice + 3) % 3
        if criterion == 1 {
            if gameMode {
                print("이겼습니다!")
                attackingTurn = "사용자"
                print("[\(attackingTurn) 턴]", terminator: " ")
                startGame(on: mukchipaMode)
            }
            else {
                if attackingTurn == "사용자" {
                    attackingTurn = "컴퓨터"
                    print(attackingTurn + mukchipaGameMessage[0])
                }
                print("[\(attackingTurn) 턴]", terminator: " ")
                startGame(on: mukchipaMode)
            }
        } else if criterion == 2 {
            if gameMode {
                print("졌습니다!")
                attackingTurn = "컴퓨터"
                print("[\(attackingTurn) 턴]", terminator: " ")
                startGame(on: mukchipaMode)
            } else {
                if attackingTurn == "컴퓨터" {
                    attackingTurn = "사용자"
                    print(attackingTurn + mukchipaGameMessage[0])
                }
                print("[\(attackingTurn) 턴]", terminator: " ")
                startGame(on: mukchipaMode)
            }
        } else {
            if gameMode {
                print("비겼습니다!")
                startGame(on: gameMode)
            } else {
                print(attackingTurn+mukchipaGameMessage[1])
            }
        }
    }
    
    private func decideGameOption(with convertedUserSelection: Int, on gameMode: Bool) {
        if (1...3).contains(convertedUserSelection) {
            playGame(with: convertedUserSelection, on: gameMode)
        }
    }
    
    private func checkValidation(_ userSelection: String) -> Bool {
        if let selection = Int(userSelection) {
            if (0...3).contains(selection) {
                return true
            }
        }
        return false
    }
    
    private func convert(_ userSelection: String) -> Int {
        if let convertedUserSelection: Int = Int(userSelection) {
            return convertedUserSelection
        } else {
            let notIntError: Int = -1
            return notIntError
        }
    }
    
    private func restartGame(on gameMode: Bool) {
        print("잘못된 입력입니다. 다시 시도해주세요.")
        if !gameMode {
            if self.attackingTurn == "사용자" {
                self.attackingTurn = "컴퓨터"
                print("[\(attackingTurn) 턴]", terminator: " ")
            } else {
                self.attackingTurn = "사용자"
                print("[\(attackingTurn) 턴]", terminator: " ")
            }
        }
        startGame(on: gameMode)
    }
    
    private func getUserSelection(on gameMode: Bool) {
        if let userSelection = readLine() {
            if checkValidation(userSelection) {
                let convertedUserSelection: Int = convert(userSelection)
                decideGameOption(with: convertedUserSelection, on: gameMode)
            } else {
                restartGame(on: gameMode)
            }
        }
    }
    
    func startGame(on gameMode: Bool) {
        if gameMode {
            print("가위(1), 바위(2), 보(3)! <종료:0> : ", terminator: "")
        } else {
            print("묵(1), 찌(2), 빠(3)! <종료:0> : ", terminator: "")
        }
        getUserSelection(on: gameMode)
    }
}

let newGame = RockPaperScissors()
newGame.startGame(on: newGame.rockPaperScissorsMode)
