import QtQuick 2.0

Flickable {
    id: root

    property int zoomLevel: noZoom

    readonly property real zoomStep: 1.1
    readonly property int minZoom: noZoom - 10
    readonly property int noZoom: 0
    readonly property int maxZoom: noZoom + 10

    transform: Scale {id: scale}

    function centerOf(item)
    {
        return Qt.point(item.x + item.width / 2,
                        item.y + item.height / 2);
    }

    function zoomAt(level, origin)
    {
        if (level === root.zoomLevel)
            return;

        root.zoomLevel = level;

        var prevScale = scale.xScale;
        var nextScale = root.zoomLevel === root.noZoom ?
                    1 : Math.pow(1.1, root.zoomLevel - root.noZoom);

        var oldCx = root.contentX;
        var oldCy = root.contentY;

        scale.xScale = nextScale;
        scale.yScale = nextScale;

        root.contentX = origin.x
                - (origin.x - oldCx) * (prevScale / nextScale);
        root.contentY = origin.y
                - (origin.y - oldCy) * (prevScale / nextScale);
    }

    MouseArea {
        id: mouseArea

        anchors.fill: root.contentItem
        acceptedButtons: Qt.LeftButton

        onWheel: {
            wheel.accepted = false;
            if (wheel.modifiers & Qt.ControlModifier) {
                wheel.accepted = true;

                var newLevel = wheel.angleDelta.y > 0 ?
                            root.zoomLevel + 1 : root.zoomLevel - 1;

                if (root.zoomLevel >= root.minZoom && root.zoomLevel <= root.maxZoom)
                    newLevel = Math.min(Math.max(newLevel, root.minZoom), root.maxZoom);

                root.zoomAt(newLevel, wheel);
            }
        }
    }
}

