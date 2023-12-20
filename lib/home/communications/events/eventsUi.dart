import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:incube/models/Events.dart';
import 'package:incube/uiThemes.dart';
import 'package:cached_network_image/cached_network_image.dart';

class EventsUi extends StatefulWidget {
  final Events event;
  EventsUi({required this.event});

  @override
  State<EventsUi> createState() => _EventsUiState();
}

class _EventsUiState extends State<EventsUi> {
  late Uint8List webImage;
  @override
  void initState() {
    super.initState();
    List<int> list = widget.event.eventImage.codeUnits;
    webImage = Uint8List.fromList(list);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final iconSize = screenWidth * 0.01;
    return Container(
      margin: EdgeInsets.only(
          left: screenWidth * 0.04,
          bottom: screenWidth * 0.02,
          top: screenWidth * 0.02,
          right: screenWidth * 0.04),
      decoration: BoxDecoration(
        color: secondaryColor(),
      ),
      constraints: const BoxConstraints(
        minHeight: 200,
      ),
      //inner container
      child: Container(
        margin: EdgeInsets.only(left: screenWidth * 0.003, bottom: 0),
        padding:
            EdgeInsets.only(left: screenWidth * 0.01, top: screenWidth * 0.01),
        decoration: BoxDecoration(
          color: tertiaryColor2(),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth * 0.09,
                      height: screenWidth * 0.09,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(6.0),
                        // image: DecorationImage(
                        //   image: NetworkImage(widget.event.eventImage),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                      // child: Image.memory(
                      //   webImage,
                      //   // widget.event.eventImage,
                      //   // errorBuilder: (context, error, stackTrace) {
                      //   //   return Text('Error loading image' + error.toString());
                      //   // },
                      // ),
                      child: CachedNetworkImage(
                        // cacheKey: trip.tripImageKey,
                        imageUrl: widget.event.eventImage,
                        width: double.maxFinite,
                        height: 500,
                        alignment: Alignment.topCenter,
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.01,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.event.eventName,
                          style: TitleMedium().copyWith(
                            color: textColor(),
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(
                          height: screenWidth * 0.007,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                  top: screenWidth * 0.005,
                                  bottom: screenWidth * 0.005,
                                  left: screenWidth * 0.01,
                                  right: screenWidth * 0.01),
                              decoration: BoxDecoration(
                                  color: secondaryColor(),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(MainBorderRadius()))),
                              child: Text(
                                // _formatDaysRemaining(
                                widget.event.eventTiming,
                                // ),
                                style: BodySmall().copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: screenWidth * 0.1,
                            ),
                            widget.event.isEventOnline
                                ? Container(
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.globe,
                                          color: Colors.black.withOpacity(0.7),
                                          size: iconSize,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.002,
                                        ),
                                        Text(
                                          'Online',
                                          style: BodySmall()
                                              .copyWith(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  )
                                : Container(
                                    child: Row(
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.locationDot,
                                          color: Colors.black.withOpacity(0.7),
                                          size: iconSize,
                                        ),
                                        SizedBox(
                                          width: screenWidth * 0.002,
                                        ),
                                      ],
                                    ),
                                  )
                          ],
                        ),
                        SizedBox(
                          height: screenWidth * 0.014,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //row 1
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text('Event fee:'),
                                SizedBox(
                                  width: screenWidth * 0.003,
                                ),
                                FaIcon(
                                  FontAwesomeIcons.dollarSign,
                                  size: screenWidth * 0.01,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                SizedBox(
                                  width: screenWidth * 0.002,
                                ),
                                Text(
                                  widget.event.eventFee,
                                  style: BodySmall().copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: screenWidth * 0.09,
                            ),

                            //row 2
                            Row(
                              children: [
                                Container(
                                  child: Row(
                                    children: [
                                      Text(
                                        widget.event.eventParticipants,
                                        style: BodySmall().copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black),
                                      ),
                                      SizedBox(
                                        width: screenWidth * 0.003,
                                      ),
                                      Text(
                                        'participants',
                                        style: BodySmall()
                                            .copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: screenWidth * 0.2,
                    )
                  ],
                ),
                //middle part of row ends here

                // second and last part Column
                SizedBox(
                  width: screenWidth * 0.02,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                    color: Colors.grey[700]!,
                    width: 1.0,
                  ),
                ),
              ),
              padding: EdgeInsets.only(left: screenWidth * 0.01),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.solidFlag,
                        color: Colors.black.withOpacity(0.7),
                        size: iconSize,
                      ),
                      SizedBox(
                        width: screenWidth * 0.005,
                      ),

                      //event provider name
                      Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(MainBorderRadius())),
                            border: Border.all(
                              color: secondaryColor(),
                              width: 1.0,
                            ),
                          ),
                          child: Text(
                            widget.event.eventProvider,
                            style: TextStyle(color: secondaryColor()),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: screenWidth * 0.007,
                  ),
                  // Row(
                  //   children: [
                  //     FaIcon(
                  //       FontAwesomeIcons.solidCalendar,
                  //       color: Colors.black.withOpacity(0.7),
                  //       size: iconSize,
                  //     ),
                  //     SizedBox(
                  //       width: screenWidth * 0.005,
                  //     ),
                  //     Text(
                  //         // '${_formatDateTime(
                  //         widget.event.eventTiming
                  //         // )}',
                  //         ),
                  //   ],
                  // ),
                  SizedBox(
                    height: screenWidth * 0.007,
                  ),
                  // Row(
                  //   children: [
                  //     FaIcon(
                  //       FontAwesomeIcons.tags,
                  //       color: Colors.black.withOpacity(0.7),
                  //       size: iconSize,
                  //     ),
                  //     SizedBox(
                  //       width: screenWidth * 0.005,
                  //     ),
                  //     Text(
                  //       widget.event.eventTag,
                  //       style: TextStyle(
                  //         color: secondaryColor(),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
