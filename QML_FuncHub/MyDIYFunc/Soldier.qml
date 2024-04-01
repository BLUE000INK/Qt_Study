import QtQuick 2.15
import QtQuick.Window 2.15
import QtMultimedia 5.15

import "../MyDIYBtn"

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("soldier")
    color: "transparent"

    //flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint
    Item {
        id: item_Actor
        width: 140
        height: 140
        opacity: 0
        anchors.centerIn: parent
        property int actState: 0
        SpriteSequence {
            id: sprite_Stand
            anchors.fill: parent
            //自动插帧
            interpolate: false
            goalSprite: ""
            running: item_Actor.actState == 0 ? true : false
            visible: item_Actor.actState == 0 ? true : false
            sprites: [
                Sprite {
                    name: "A0"
                    source: "qrc:/MySrc/picture/spritePNG/Idle.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 0
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "A1": 1
                    }
                },
                Sprite {
                    name: "A1"
                    source: "qrc:/MySrc/picture/spritePNG/Idle.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 1
                    frameCount: 1
                    frameSync: true
                    frameDuration: 200
                    to: {
                        "A2": 1
                    }
                },
                Sprite {
                    name: "A2"
                    source: "qrc:/MySrc/picture/spritePNG/Idle.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 2
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "A3": 1
                    }
                },
                Sprite {
                    name: "A3"
                    source: "qrc:/MySrc/picture/spritePNG/Idle.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 3
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "A4": 1
                    }
                },
                Sprite {
                    name: "A4"
                    source: "qrc:/MySrc/picture/spritePNG/Idle.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 4
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "A5": 1
                    }
                },
                Sprite {
                    name: "A5"
                    source: "qrc:/MySrc/picture/spritePNG/Idle.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 5
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "A6": 1
                    }
                },
                Sprite {
                    name: "A6"
                    source: "qrc:/MySrc/picture/spritePNG/Idle.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 6
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "A7": 1
                    }
                },
                Sprite {
                    name: "A7"
                    source: "qrc:/MySrc/picture/spritePNG/Idle.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 7
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "A8": 1
                    }
                },
                Sprite {
                    name: "A8"
                    source: "qrc:/MySrc/picture/spritePNG/Idle.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 8
                    frameCount: 1
                    duration: 10
                    frameDuration: 200
                    to: {
                        "A9": 1
                    }
                },
                Sprite {
                    name: "A9"
                    source: "qrc:/MySrc/picture/spritePNG/Idle.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 9
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "A10": 1
                    }
                },
                Sprite {
                    name: "A10"
                    source: "qrc:/MySrc/picture/spritePNG/Idle.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 10
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "A0": 1
                    }
                }
            ]
        }
        SpriteSequence {
            id: sprite_RightRun
            anchors.fill: parent
            //自动插帧
            interpolate: false
            goalSprite: ""
            running: item_Actor.actState == 1 ? true : false
            visible: item_Actor.actState == 1 ? true : false
            sprites: [
                Sprite {
                    name: "_0"
                    source: "qrc:/MySrc/picture/spritePNG/RightRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 0
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_1": 1
                    }
                },
                Sprite {
                    name: "_1"
                    source: "qrc:/MySrc/picture/spritePNG/RightRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 1
                    frameCount: 1
                    frameSync: true
                    frameDuration: 200
                    to: {
                        "_2": 1
                    }
                },
                Sprite {
                    name: "_2"
                    source: "qrc:/MySrc/picture/spritePNG/RightRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 2
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_3": 1
                    }
                },
                Sprite {
                    name: "_3"
                    source: "qrc:/MySrc/picture/spritePNG/RightRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 3
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_4": 1
                    }
                },
                Sprite {
                    name: "_4"
                    source: "qrc:/MySrc/picture/spritePNG/RightRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 4
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_5": 1
                    }
                },
                Sprite {
                    name: "_5"
                    source: "qrc:/MySrc/picture/spritePNG/RightRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 5
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_6": 1
                    }
                },
                Sprite {
                    name: "_6"
                    source: "qrc:/MySrc/picture/spritePNG/RightRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 6
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_7": 1
                    }
                },
                Sprite {
                    name: "_7"
                    source: "qrc:/MySrc/picture/spritePNG/RightRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 7
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_0": 1
                    }
                }
            ]
        }
        SpriteSequence {
            id: sprite_LeftRun
            anchors.fill: parent
            //自动插帧
            interpolate: false
            goalSprite: ""
            running: item_Actor.actState == 2 ? true : false
            visible: item_Actor.actState == 2 ? true : false
            sprites: [
                Sprite {
                    name: "_0"
                    source: "qrc:/MySrc/picture/spritePNG/LeftRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 0
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_1": 1
                    }
                },
                Sprite {
                    name: "_1"
                    source: "qrc:/MySrc/picture/spritePNG/LeftRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 1
                    frameCount: 1
                    frameSync: true
                    frameDuration: 200
                    to: {
                        "_2": 1
                    }
                },
                Sprite {
                    name: "_2"
                    source: "qrc:/MySrc/picture/spritePNG/LeftRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 2
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_3": 1
                    }
                },
                Sprite {
                    name: "_3"
                    source: "qrc:/MySrc/picture/spritePNG/LeftRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 3
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_4": 1
                    }
                },
                Sprite {
                    name: "_4"
                    source: "qrc:/MySrc/picture/spritePNG/LeftRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 4
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_5": 1
                    }
                },
                Sprite {
                    name: "_5"
                    source: "qrc:/MySrc/picture/spritePNG/LeftRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 5
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_6": 1
                    }
                },
                Sprite {
                    name: "_6"
                    source: "qrc:/MySrc/picture/spritePNG/LeftRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 6
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_7": 1
                    }
                },
                Sprite {
                    name: "_7"
                    source: "qrc:/MySrc/picture/spritePNG/LeftRun.png"
                    frameHeight: 140
                    frameWidth: 140
                    frameX: 140 * 7
                    frameCount: 1
                    frameDuration: 200
                    to: {
                        "_0": 1
                    }
                }
            ]
        }

        Keys.enabled: true
        focus: true
        Keys.onPressed: {
            if (event.key === Qt.Key_D) {
                item_Actor.actState = 1
            } else if (event.key === Qt.Key_A) {
                item_Actor.actState = 2
            }
        }
        Keys.onReleased: {
            if (event.key === Qt.Key_D) {
                item_Actor.actState = 0
            } else if (event.key === Qt.Key_A) {
                item_Actor.actState = 0
            }
        }
    }

    MediaPlayer {
        id: bgMusic
        loops: MediaPlayer.Infinite
        source: "qrc:/MySrc/music/Cyberpunk Moonlight Sonata.mp3"
        volume: 0.0
        onVolumeChanged: {
            console.log(volume)
        }
    }

    ParallelAnimation {
        id: anime_AppStart
        NumberAnimation {
            target: bgMusic
            property: "volume"
            from: 0.0
            to: 1.0
            duration: 10000
        }
        NumberAnimation {
            target: item_Actor
            property: "opacity"
            from: 0.0
            to: 1.0
            duration: 3000
        }
    }

    Component.onCompleted: {
        //        root.x = (Screen.width - root.width) / 2
        //        root.y = (Screen.height - root.height) / 2
        bgMusic.play()
        anime_AppStart.start()
    }
}
