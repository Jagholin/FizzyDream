import VPlay 1.0
import QtQuick 1.1

GameWindow { 
    id: window
    
    // create and remove entities at runtime
    EntityManager {
        id: entityManager
    }
    
    // menu scene
    MenuScene {
        id: menuScene
        onSelectLevelPressed: window.state = "selectLevel"
        onCreditsPressed: window.state = "credits"
        onBackPressed: {
            nativeUtils.displayMessageBox(qsTr("Really quit the game?"), "", 2);
        }
        // listen to the return value of the MessageBox
        Connections {
            target: nativeUtils
            onMessageBoxFinished: {
                if(accepted)
                    Qt.quit()
            }
        }
    }
    
    // scene for selecting levels
    SelectLevelScene {
        id: selectLevelScene
        onLevelPressed: window.state = "game"
        onBackPressed: window.state = "menu"
    }
    
    // credtis scene
    CreditsScene {
        id: creditsScene
        onBackPressed: window.state = "menu"
    }
    
    // game scene to play a level
    GameScene {
        id: gameScene
        onBackPressed: window.state = "selectLevel"
    }
    
    // default state is menu -> default scene is menuScene
    state: "menu"
    
    // state machine, takes care reversing the PropertyChanges when changing the state like changing the opacity back to 0
    states: [
        State {
            name: "menu"
            PropertyChanges {target: menuScene; opacity: 1}
            PropertyChanges {target: window; activeScene: menuScene}
        },
        State {
            name: "selectLevel"
            PropertyChanges {target: selectLevelScene; opacity: 1}
            PropertyChanges {target: window; activeScene: selectLevelScene}
        },
        State {
            name: "credits"
            PropertyChanges {target: creditsScene; opacity: 1}
            PropertyChanges {target: window; activeScene: creditsScene}
        },
        State {
            name: "game"
            PropertyChanges {target: gameScene; opacity: 1}
            PropertyChanges {target: window; activeScene: gameScene}
            StateChangeScript {
                script: {
                    gameScene.setLevel(selectLevelScene.selectedLevel)
                }
            }
        }
    ]
    
    // every change in opacity will be done with an animation
    transitions: [
        Transition {
            NumberAnimation {property: "opacity"; easing.type: Easing.InOutQuad}
        }
    ]
}

