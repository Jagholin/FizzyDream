import VPlay 1.0
import QtQuick 1.1

Scene {
    id: sceneBase
    
    // by default, set the opacity to 0 - this is changed from the main.qml with PropertyChanges
    // the Scene sets its visible property to false automatically if opacity is 0 and the renderer skips invisible items, this is an important performance improvement
    opacity: 0
    
    // signal indicating that back has been pressed
    signal backPressed
    
    Keys.onPressed: {
        // only simulate on desktop platforms!
        if(event.key === Qt.Key_Backspace && system.desktopPlatform) {
            backPressed()
        }
    }
    
    // the Android back button
    Keys.onBackPressed: {
        backPressed()
    }
}

