import VPlay 1.0
import QtQuick 1.1

SceneBase {
    id: selectLevelScene
    
    // the name of the level that has been selected gets stored here
    property string selectedLevel
    // signal indicating that a level has been selected
    signal levelPressed
    
    // background image (-hd and -hd2 will be automatically used for higher resolutions)
    MultiResolutionImage {
        source: "img/selectlevelbg-sd.png"
        anchors.centerIn: parent
    }
    
    // back button to leave scene
    SimpleButton {
        text: "Back"
        anchors.right: parent.right
        onClicked: backPressed()
    }
    
    // levels to be selected
    Column {
        anchors.centerIn: parent
        SimpleButton {
            text: "Level1"
            onClicked: {
                selectedLevel = "Level1"
                levelPressed()
            }
        }
        SimpleButton {
            text: "Level2"
            onClicked: {
                selectedLevel = "Level2"
                levelPressed()
            }
        }
        SimpleButton {
            text: "Level3"
            onClicked: {
                selectedLevel = "Level3"
                levelPressed()
            }
        }
    }
}

