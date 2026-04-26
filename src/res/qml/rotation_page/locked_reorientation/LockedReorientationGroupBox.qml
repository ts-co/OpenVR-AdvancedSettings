import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import ovras.advsettings 1.0
import "../../common"

GroupBox {
    id: lockedReorientationGroupBox
    Layout.fillWidth: true

    label: MyText {
        leftPadding: 10
        text: "Locked Reorientation"
        bottomPadding: -12
    }
    background: Rectangle {
        color: "transparent"
        border.color: "#d9dbe0"
        radius: 8
    }

    ColumnLayout {
        anchors.fill: parent

        Rectangle {
            color: "#d9dbe0"
            height: 1
            Layout.fillWidth: true
            Layout.bottomMargin: 3
        }

        RowLayout {
            Layout.fillWidth: true

            MyToggleButton {
                id: lockedReorientationToggle
                text: "Enable Locked Reorientation"
                Layout.preferredWidth: 350
                onCheckedChanged: {
                    RotationTabController.setLockedReorientationEnabled(this.checked, true);
                }
            }

            Item {
                Layout.fillWidth: true
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.topMargin: 4

            MyText {
                text: "Bind \"Locked Reorientation\" in SteamVR controller bindings (hold or toggle). While held, the view fades to black so you can rotate your body freely; on release, the playspace receives a single rotation correction so your virtual facing is unchanged."
                wrapMode: Text.WordWrap
                Layout.fillWidth: true
                font.pointSize: 14
            }
        }
    }

    Component.onCompleted: {
        lockedReorientationToggle.checked = RotationTabController.lockedReorientationEnabled
    }

    Connections {
        target: RotationTabController

        onLockedReorientationEnabledChanged: {
            lockedReorientationToggle.checked = RotationTabController.lockedReorientationEnabled
        }
    }
}
