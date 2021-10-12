import QtQuick 2.0
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.14
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
Item {

    width: parent.width
    height: parent.height
    anchors.bottom: parent.bottom
    visible: true
    property int current: 0
    property string latitudeFU: ""
    property string longitudeFU: ""

        SwipeView {
            id: ops
            currentIndex: 0
            anchors.fill: parent
            Item {

                id: readpage
                property int current: 0

                Rectangle
                      {
                       id:lblNameforRead
                       Layout.fillWidth: true
                       Layout.preferredWidth: parent.width * 0.20
                       Layout.fillHeight: true
                       radius: 2
                       anchors.horizontalCenter: parent.horizontalCenter
                       color: "#3b5998"

                        Rectangle
                              {
                              width: parent.radius
                              height: parent.height
                              anchors.top: parent.top
                              color: parent.color
                              }

                         Text
                              {
                              anchors.fill: parent
                              fontSizeMode: Text.Fit
                              color: "black"
                              text: "READ"
                              font.pixelSize: 20
                              minimumPixelSize: 15
                              horizontalAlignment: Text.AlignHCenter
                              verticalAlignment: Text.AlignVCenter
                              }
                        }
                InfoTagRow{
                            id: ndefmessage1
                            lblName: "Message1:"
                            lblValue: NFCReader.readNdefMessagesSend
                            anchors.top: lblNameforRead.bottom
                            anchors.topMargin: parent.height * 0.02

                                            }


    }//PAGE END

            Item {
                id: writepage
                property int current: 1
                /*Rectangle
                      {
                       id:lblNameforWrite
                       Layout.fillWidth: true
                       Layout.preferredWidth: parent.width * 0.20
                       Layout.fillHeight: true
                       radius: 2
                       anchors.horizontalCenter: parent.horizontalCenter
                       color: "#3b5998"

                        Rectangle
                              {
                              width: parent.radius
                              height: parent.height
                              anchors.top: parent.top
                              color: parent.color
                              }

                         Text
                              {
                              anchors.fill: parent
                              fontSizeMode: Text.Fit
                              color: "black"
                              text: "WRITE"
                              font.pixelSize: 20
                              minimumPixelSize: 15
                              horizontalAlignment: Text.AlignHCenter
                              verticalAlignment: Text.AlignVCenter
                              }
                        }*/


               HeaderModel{
                    id: writeHeader
                    lblName: "WRITE"
                    anchors.top: writepage.top
                    anchors.topMargin: parent.height * 0.01
                }
               RowLayout{
                  id: longitude
                  width:  parent.width *0.95
                  height: parent.height * 0.06
                  anchors.horizontalCenter: parent.horizontalCenter
                  anchors.top: writeHeader.bottom
                  anchors.topMargin: parent.height * 0.01
                  spacing: 0
                  Rectangle
                        {
                         id:longitudeGetter
                         Layout.fillWidth: false
                         Layout.preferredWidth: parent.width * 0.40
                         Layout.fillHeight: true
                         radius: 2
                         color: "transparent"//"#daf8e3"

                          Rectangle
                                {
                                width: parent.radius
                                height: parent.height
                                anchors.left: parent.left
                                color: parent.color
                                }

                           Text
                                {
                                anchors.fill: parent
                                fontSizeMode: Text.Fit
                                color: "#3b5998" //#3b5998
                                text: "Enter Longitude"
                                font.pixelSize: 20
                                minimumPixelSize: 15
                                horizontalAlignment: Text.AlignLeft
                                verticalAlignment: Text.AlignVCenter
                                }
                        }

                  Rectangle
                       {
                      id:longitudeGetterValue
                      Layout.fillWidth: false
                      Layout.preferredWidth: parent.width * 0.60
                      Layout.fillHeight: true
                      Layout.alignment: longitudeGetter.AlignHCenter
                      radius: 2
                      color: "transparent"//"#daf8e3"

                            Rectangle
                               {
                               width: parent.radius
                               height: parent.height
                               anchors.top : parent.top
                               anchors.left:  parent.right
                               color: parent.color


                               }
                              TextField {
                              placeholderText: "30.473992"
                              anchors.fill: parent
                              font.pixelSize: height*0.5


                              onAccepted: longitudeFU = text



                  }
                       }}
/*
              TextFieldModel {
                   id: longitudeValue
                   lblName: "Enter Longitude:"
                   lbltext: "30.473992"
                   anchors.top: writeHeader.bottom
                   anchors.topMargin: parent.height *0.02
*/
              RowLayout{
                 id: latitude
                 width:  parent.width *0.95
                 height: parent.height * 0.06
                 anchors.horizontalCenter: parent.horizontalCenter
                 anchors.top: longitude.bottom
                 anchors.topMargin: parent.height * 0.01
                 spacing: 0
                 Rectangle
                       {
                        id:latitudeGetter
                        Layout.fillWidth: false
                        Layout.preferredWidth: parent.width * 0.40
                        Layout.fillHeight: true
                        radius: 2
                        color: "transparent"//"#daf8e3"

                         Rectangle
                               {
                               width: parent.radius
                               height: parent.height
                               anchors.left: parent.left
                               color: parent.color
                               }

                          Text
                               {
                               anchors.fill: parent
                               fontSizeMode: Text.Fit
                               color: "#3b5998" //#3b5998
                               text: "Enter Latitude"
                               font.pixelSize: 20
                               minimumPixelSize: 15
                               horizontalAlignment: Text.AlignLeft
                               verticalAlignment: Text.AlignVCenter
                               }
                       }

                 Rectangle
                      {
                     id:latitudeGetterValue
                     Layout.fillWidth: false
                     Layout.preferredWidth: parent.width * 0.60
                     Layout.fillHeight: true
                     Layout.alignment: latitudeGetter.AlignHCenter
                     radius: 2
                     color: "transparent"//"#daf8e3"

                           Rectangle
                              {
                              width: parent.radius
                              height: parent.height
                              anchors.top : parent.top
                              anchors.left:  parent.right
                              color: parent.color


                              }
                             TextField {
                             placeholderText: "39.746764"
                             anchors.fill: parent
                             font.pixelSize: height*0.5
                             onAccepted: latitudeFU = text



                 }
                      }}
               RoundButton {
               id:sendCoordinatesButton
               anchors.top: latitude.bottom
               anchors.topMargin: parent.height * 0.03
               anchors.horizontalCenter: parent.horizontalCenter
               text: "Send"
               onClicked: {
                            NFCReader.latitudeFromUser = latitudeFU
                            NFCReader.longitudeFromUser = longitudeFU
                          }

             }
               RoundButton {
               id:resetButton
               anchors.bottom: parent.bottom
               anchors.bottomMargin: parent.height * 0.03
               anchors.horizontalCenter: parent.horizontalCenter
               text: "RESET"
               onClicked: {
                            NFCReader.doYouWantToReset = true

                   //__nfcr.setReset(true)

                   console.log << "is true" << NFCReader.doYouWantToReset
                          }

             }


       }//WRITE END ITEM
    }//SWIPE RAW END
        PageIndicator {
            id: indicator

            count: ops.count
            currentIndex: ops.currentIndex

            anchors.bottom: ops.bottom
            anchors.horizontalCenter: parent.horizontalCenter
        }
}//ITEM END
/*    double longitude = 30.473992;
    double latitude = 39.746764; */