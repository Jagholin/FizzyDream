import VPlay 1.0
import QtQuick 1.1

SceneBase {
    id:gameScene
    // the name of the current level gets stored here
    property string activeLevelString
    // the current level gets stored here
    property variant activeLevel
    
    // background image (-hd and -hd2 will be automatically used for higher resolutions)
    MultiResolutionImage {
        source: "img/gamebg-sd.png"
        anchors.centerIn: parent
    }
    
    // back button to leave scene
    SimpleButton {
        text: "Back to menu"
        anchors.right: parent.right
        onClicked: backPressed()
    }
    
    // name of the current level
    Text {
        color: "blue";
        text: activeLevel === undefined? "" : gameScene.activeLevel.levelName;
    }
    
    // load levels at runtime
    Loader {
        id: loader
        source: "levels/" + gameScene.activeLevelString + ".qml"
        onLoaded: {
            // do not forget to call loadItemWithCocos or the item might not be displayed!
            loadItemWithCocos(item)
            activeLevel = item
            item.width = gameScene.width
            item.height = gameScene.height
        }
    }
    
    // set the name of the current level, this will cause the Loader to load the corresponding level
    function setLevel(level) {
        activeLevelString = level
    }
}

