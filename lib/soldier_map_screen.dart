import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SoldierMapScreen extends StatefulWidget {
  const SoldierMapScreen({Key? key}) : super(key: key);

  @override
  State<SoldierMapScreen> createState() => _SoldierMapScreenState();
}

class _SoldierMapScreenState extends State<SoldierMapScreen> {
  int selected = 0;
  var _initialCameraPosition;
  Set<Circle> mCircle = {
    // Circle(
    //   strokeWidth: 1,
    //   fillColor: Colors.white.withOpacity(0.4),
    //   strokeColor: Colors.white,
    //   circleId: const CircleId("id1"),
    //   center: const LatLng(45.1589105131836, 28.825975940519047),
    //   radius: 150,
    // ),
    // Circle(
    //   strokeWidth: 1,
    //   fillColor: Colors.white.withOpacity(0.4),
    //   strokeColor: Colors.white,
    //   circleId: const CircleId("id2"),
    //   center: const LatLng(45.15894077462505, 28.82551460059801),
    //   radius: 100,
    // ),
    // Circle(
    //   strokeWidth: 1,
    //   fillColor: Colors.white.withOpacity(0.4),
    //   strokeColor: Colors.white,
    //   circleId: const CircleId("id3"),
    //   center: const LatLng(45.159122342936286, 28.825300023890556),
    //   radius: 60,
    // ),
    // Circle(
    //   strokeWidth: 1,
    //   fillColor: Colors.white.withOpacity(0.4),
    //   strokeColor: Colors.white,
    //   circleId: const CircleId("id4"),
    //   center: const LatLng(45.159023993506196, 28.82563261778711),
    //   radius: 30,
    // ),
    // Circle(
    //   strokeWidth: 1,
    //   fillColor: Colors.white.withOpacity(0.4),
    //   strokeColor: Colors.white,
    //   circleId: const CircleId("id4"),
    //   center: const LatLng(45.15918002858243, 28.82555751593829),
    //   radius: 3,
    // ),
  };

  initialCameraPosition() {
    _initialCameraPosition = CameraPosition(
      target: const LatLng(45.16035546331, 28.824806522288824),
      zoom: 16.5,
      bearing: position!.heading,
    );

    setState(() {});
  }

  GoogleMapController? mapController;

  @override
  void dispose() {
    mapController!.dispose();
    timer!.cancel();
    super.dispose();
  }

  Position? position;
  LocationPermission? permission;
  Timer? timer;
  int radiusDeduct = 0;

  getPosition() async {
    permission = await Geolocator.requestPermission();
    position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    initialCameraPosition();
    mCircle.add(
      Circle(
        strokeWidth: 1,
        fillColor: Colors.white.withOpacity(0.4),
        strokeColor: Colors.black,
        circleId: const CircleId("id1"),
        center: const LatLng(45.15894077462505, 28.82551460059801),
        radius: 150.0,
      ),
    );
    Timer(Duration(minutes: 5), () {
      timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if (radiusDeduct < 50) {
          mCircle.add(
            Circle(
              strokeWidth: 1,
              fillColor: Colors.white.withOpacity(0.4),
              strokeColor: Colors.red,
              circleId: const CircleId("id1"),
              center: const LatLng(45.15894077462505, 28.82551460059801),
              radius: 150.0 - radiusDeduct,
            ),
          );
          setState(() {});
          radiusDeduct++;
          print(radiusDeduct);
          if (radiusDeduct >= 50) {
            mCircle.add(
              const Circle(
                strokeWidth: 1,
                strokeColor: Colors.black,
                circleId: CircleId("id9"),
                center: LatLng(45.159122342936286, 28.825300023890556),
                radius: 51.0,
              ),
            );
          }
        } else if (radiusDeduct > 110 && radiusDeduct < 160) {
          mCircle.add(
            Circle(
              strokeWidth: 1,
              fillColor: Colors.white.withOpacity(0.4),
              strokeColor: Colors.red,
              circleId: const CircleId("id2"),
              center: const LatLng(45.159122342936286, 28.825300023890556),
              radius: 150.0 - (radiusDeduct - 60),
            ),
          );
          setState(() {});
          radiusDeduct++;
          print(radiusDeduct - 60);
          if (radiusDeduct >= 160) {
            mCircle.add(
              const Circle(
                strokeWidth: 1,
                strokeColor: Colors.black,
                circleId: CircleId("id8"),
                center: LatLng(45.159023993506196, 28.82563261778711),
                radius: 21.0,
              ),
            );
          }
        } else if (radiusDeduct > 220 && radiusDeduct < 250) {
          mCircle.add(
            Circle(
              strokeWidth: 1,
              fillColor: Colors.white.withOpacity(0.4),
              strokeColor: Colors.red,
              circleId: const CircleId("id3"),
              center: const LatLng(45.159023993506196, 28.82563261778711),
              radius: 150.0 - (radiusDeduct - 120),
            ),
          );
          setState(() {});
          radiusDeduct++;
          print(radiusDeduct - 120);
          if (radiusDeduct >= 250) {
            mCircle.add(
              const Circle(
                strokeWidth: 1,
                strokeColor: Colors.black,
                circleId: CircleId("id4"),
                center: LatLng(45.15918002858243, 28.82555751593829),
                radius: 2,
              ),
            );
          }
        } else if (radiusDeduct > 310 && radiusDeduct < 328) {
          mCircle.add(
            Circle(
              strokeWidth: 1,
              fillColor: Colors.white.withOpacity(0.4),
              strokeColor: Colors.red,
              circleId: const CircleId("id4"),
              center: const LatLng(45.15918002858243, 28.82555751593829),
              radius: 150.0 - (radiusDeduct - 180),
            ),
          );
          setState(() {});
          radiusDeduct++;
          print(radiusDeduct - 180);
        } else {
          radiusDeduct++;
        }
      });
    });
  }

  @override
  void initState() {
    getPosition();

    super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: _initialCameraPosition == null
                ? const CupertinoActivityIndicator()
                : GoogleMap(
                    myLocationButtonEnabled: true,
                    zoomControlsEnabled: true,
                    compassEnabled: true,
                    initialCameraPosition: _initialCameraPosition,
                    onMapCreated: _onMapCreated,
                    circles: mCircle,
                    mapType: MapType.satellite,
                  ),
          ),
          Positioned(
            left: MediaQuery.of(context).size.width * 0.4,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    height: 30,
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    padding: const EdgeInsets.only(left: 20),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Alive: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(1.0, 1.0),
                              blurRadius: 3.0,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: 300,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.7),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Kill Feed: ",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Denis is killed by player 1",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              shadows: <Shadow>[
                                Shadow(
                                  offset: Offset(1.0, 1.0),
                                  blurRadius: 3.0,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      checkOutDialog(
                          context: context,
                          noTap: () {
                            Navigator.pop(context);
                          },
                          yesTap: () {
                            Navigator.pop(context);
                            killedByDialog(context: context);
                          });
                    },
                    child: Container(
                      width: 100,
                      height: 50,
                      margin: const EdgeInsets.only(right: 40),
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                      ),
                      child: const Center(
                        child: Text(
                          "I'm Dead",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(1.0, 1.0),
                                blurRadius: 3.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 120,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  checkOutDialog({context, yesTap, noTap}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Are you sure you are out of the game?',
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: yesTap,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: noTap,
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "No",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  )
                ],
              ),
            ),
          );
        });
  }

  killedByDialog({context}) {
    return showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'You were killed by which player?',
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          selected = 1;
                          setState(() {});
                          Navigator.pop(context);
                          killedByDialog(context: context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: selected == 1 ? Colors.red : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  offset: const Offset(0, 1),
                                  blurRadius: 2,
                                ),
                              ]),
                          child: Text(
                            'Player 1',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: selected == 1
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          selected = 2;
                          setState(() {});
                          Navigator.pop(context);
                          killedByDialog(context: context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: selected == 2 ? Colors.red : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  offset: const Offset(0, 1),
                                  blurRadius: 2,
                                ),
                              ]),
                          child: Text(
                            'Player 2',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: selected == 2
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          selected = 3;
                          setState(() {});
                          Navigator.pop(context);
                          killedByDialog(context: context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 5),
                          decoration: BoxDecoration(
                              color: selected == 3 ? Colors.red : Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.4),
                                  offset: const Offset(0, 1),
                                  blurRadius: 2,
                                ),
                              ]),
                          child: Text(
                            'Player 3',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: selected == 3
                                    ? Colors.white
                                    : Colors.black),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              "Don't specify!",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          );
        });
  }
}
