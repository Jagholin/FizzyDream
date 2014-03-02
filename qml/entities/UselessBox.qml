import QtQuick 1.1
import VPlay 1.0

EntityBase {
    entityType: "uselessBox"
    property alias color:outerRect.color
    
    Rectangle {
        id: outerRect
        width: 100
        height: 100
        
        anchors.centerIn: parent
        
        Rectangle {
            width: 50
            height: 50
            color: "black"
            anchors.centerIn: parent
        }
    }
    
    // we also might add physics components like BoxCollider here
}

