import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

ApplicationWindow {
    id: window

    readonly property int kCircleShape: 1
    readonly property int kRectangleShape: 2

    property int highestZ: zoomable.z + 1

    title: qsTr("QML Zoom")
    width: 640
    height: 480
    visible: true

    menuBar: MenuBar {
        Menu {
            title: qsTr("&File")

            MenuItem {
                text: qsTr("E&xit")
                onTriggered: Qt.quit()
            }
        }
    }

    function makeTopmost(item)
    {
        item.z = window.highestZ++;
    }

    Rectangle {
        anchors.fill: parent
        color: "lightblue"

        Text {
            anchors.centerIn: parent
            color: "white"
            font.pointSize: 12
            horizontalAlignment: Text.AlignHCenter
            text: qsTr("Right-click to create content.\nUse wheel to zoom in/zoom out")
        }

        Zoomable {
            id: zoomable

            anchors.fill: parent
            contentWidth: 10000
            contentHeight: 10000

            Component.onCompleted: {
                // Move to center
                contentX = (contentWidth - width) / 2;
                contentY = (contentHeight - height) / 2;
            }

            MouseArea {
                id: mouseArea

                anchors.fill: parent
                acceptedButtons: Qt.RightButton

                Menu {
                    id: contextMenu

                    MenuItem {
                        text: qsTr("New Rectangle")
                        onTriggered: {
                            var rect = shapeComponent.createObject(zoomable.contentItem, {
                                                                       "x": mouseArea.mouseX,
                                                                       "y": mouseArea.mouseY,
                                                                       "type": kRectangleShape});
                            // When a shape is clicked, move it on top of all other shapes
                            rect.clicked.connect(window.makeTopmost);
                        }
                    }

                    MenuItem {
                        text: qsTr("New Circle")
                        onTriggered: {
                            var circle = shapeComponent.createObject(zoomable.contentItem, {
                                                                         "x": mouseArea.mouseX,
                                                                         "y": mouseArea.mouseY,
                                                                         "type": kCircleShape});
                            circle.clicked.connect(window.makeTopmost);
                        }
                    }

                    MenuSeparator { }

                    MenuItem {
                        text: qsTr("Reset Zoom")
                        onTriggered: {
                            // Invert previous zoom operations around click position
                            var origin = mouseArea.mapToItem(zoomable.contentItem,
                                                             mouseArea.mouseX,
                                                             mouseArea.mouseY);
                            zoomable.zoomAt(zoomable.noZoom, origin);
                        }
                    }
                }

                onPressed: {
                    contextMenu.popup();
                    mouse.accepted = true;
                }
            }
        }
    }

    Component {
        id: shapeComponent

        Rectangle {
            id: shape

            property int type: kCircleShape

            signal clicked(Item item)

            color: type === kCircleShape ? "yellow" : "red"
            width: type === kCircleShape ? 50 : 100
            height: 50
            radius: type === kCircleShape ? width / 2 : 0

            MouseArea {
                anchors.fill: parent
                drag.target: parent

                onClicked: shape.clicked(shape)
                drag.onActiveChanged: shape.clicked(shape)
            }
        }
    }
}
