import VPlay 1.0
import QtQuick 1.1

SceneBase {
    id: menuScene
    
    // signal indicating that the selectLevelScene should be displayed
    signal selectLevelPressed
    // signal indicating that the creditsScene should be displayed
    signal creditsPressed
    
    // background image (-hd and -hd2 will be automatically used for higher resolutions)
    MultiResolutionImage {
        source: "img/menubg-sd.png"
        anchors.centerIn: parent
    }
    
    // logo (-hd and -hd2 will be automatically used for higher resolutions)
    MultiResolutionImage {
        source: "img/logo-sd.png"
        anchors.centerIn: parent
    }
    
    // menu
    Column {
        anchors.centerIn: parent
        SimpleButton {
            text: "Levels"
            onClicked: selectLevelPressed()
        }
        SimpleButton {
            text: "Credits"
            onClicked: creditsPressed()
        }
    }
}

