import VPlay 1.0
import QtQuick 1.1

SceneBase {
    id:creditsScene
    
    // background image (-hd and -hd2 will be automatically used for higher resolutions)
    MultiResolutionImage {
        source: "img/creditsbg-sd.png"
        anchors.centerIn: parent
    }
    
    // back button to leave scene
    SimpleButton {
        text: "Back"
        anchors.right: parent.right
        onClicked: backPressed()
    }
    
    // credits
    Text {
        text: "Credits to: YOU :)"
        color: "white"
        anchors.centerIn: parent
    }
}

