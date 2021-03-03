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
        let criterion: Int = (userChoice - randomComputerChoice + 3) % 3
        if criterion == 1 {
            if gameMode { // 가위 바위 보
                print("이겼습니다!")
                // 묵찌빠 게임 시작 (사용자 턴) !gameMode
                attackingTurn = "사용자"
                startGame(on: mukchipaMode)
            }
            else{ // 묵찌빠
                // 묵찌빠 게임 playGame(userChoice, gameMode)
            }
        } else if criterion == 2 {
            if gameMode{
                print("졌습니다!")
                // 묵찌빠 게임 시작 (컴퓨터 턴)
                attackingTurn = "컴퓨터"
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
    
//    private func playMukchipaGame(with attackerTurn: String) {
//        // [~ 턴] 묵 찌 빠 ~ 입력 받기
//        // 잘못된 입력일 때
//            // 턴을 바꿔서 묵찌빠 게임 다시 진행
//        // 제대로 된 입력일 때
//            //
//    }
    
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
            } else {
                self.attackingTurn = "사용자"
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
