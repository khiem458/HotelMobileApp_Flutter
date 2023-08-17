import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/components/categoryhomepage.dart';
import 'package:travel_app/components/locationstory.dart';
import 'package:travel_app/screens/notificationscreen.dart';
import 'package:travel_app/screens/searchscreen.dart';

class Explorepage extends StatefulWidget {
  const Explorepage({super.key});
  @override
  State<Explorepage> createState() => _ExplorepageState();
}

class _ExplorepageState extends State<Explorepage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final List _gridItems = List.generate(90, (i) => "Item $i");
  int counter = 1;
  late String _location = "India";

  void _changeCategory() {
    print("Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(title: Text("Explore")),
      drawer: Drawer(),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Theme.of(context).colorScheme.background,
            surfaceTintColor: Colors.transparent,
            snap: true,
            elevation: 4,
            floating: true,
            toolbarHeight: 50,
            title: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
              InkWell(
                focusColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  if (scaffoldKey.currentState!.isDrawerOpen) {
                    scaffoldKey.currentState!.closeDrawer();
                    //close drawer, if drawer is open
                  } else {
                    scaffoldKey.currentState!.openDrawer();
                    //open drawer, if drawer is closed
                  }
                },
                child: CircleAvatar(
                  backgroundColor: Colors.blueGrey[200]!,
                  backgroundImage: const NetworkImage(
                    "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80",
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "Hello,",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 2),
                child: Text(
                  "Kailash",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    fontFamily: "Nunito",
                  ),
                ),
              )
            ]),
            actions: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: InkWell(
                  splashFactory: NoSplash.splashFactory,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  child: Image.asset(
                    "assets/images/logo.png",
                  ),
                ),
              )
            ],
          ),
          SliverAppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 50,
            backgroundColor: Theme.of(context).colorScheme.background,
            pinned: true,
            title: InkWell(
              splashFactory: NoSplash.splashFactory,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(
                  builder: (context) {
                    return const SearchScreen();
                  },
                ));
              },
              child: Row(
                children: [
                  const Icon(Icons.location_pin),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Text(_location),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.orange,
                    size: 30,
                  )
                ],
              ),
            ),
            actions: <Widget>[
              // Using Stack to show Notification Badge
              Stack(
                children: <Widget>[
                  IconButton(
                      padding: const EdgeInsets.only(right: 4),
                      icon: const Icon(Icons.notifications),
                      onPressed: () {
                        setState(() {
                          counter = 0;
                        });
                        Navigator.push(context, CupertinoPageRoute(
                          builder: (context) {
                            return const NotificationScreen();
                          },
                        ));
                      }),
                  counter != 0
                      ? Positioned(
                          right: 11,
                          top: 10,
                          child: InkWell(
                            splashFactory: NoSplash.splashFactory,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: () {
                              setState(() {
                                counter = 0;
                              });
                              Navigator.push(context, CupertinoPageRoute(
                                builder: (context) {
                                  return const NotificationScreen();
                                },
                              ));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(6),
                              ),
                              constraints: const BoxConstraints(
                                minWidth: 12,
                                maxHeight: 14,
                                minHeight: 10,
                              ),
                              child: Text(
                                '$counter',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        )
                      : Container()
                ],
              ),
            ],
            surfaceTintColor: Colors.transparent,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(bottom: 10),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      customBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 1,
                          color: Colors.red,
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(
                          builder: (context) {
                            return const SearchScreen();
                          },
                        ));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.fromBorderSide(
                            BorderSide(
                              width: 1,
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                          ),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(100),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        margin: const EdgeInsets.only(left: 20, right: 0),
                        child: const Text("Search here..."),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(right: 15),
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: <Widget>[
                                    ListTile(
                                      leading: new Icon(Icons.photo),
                                      title: new Text('Photo'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: new Icon(Icons.music_note),
                                      title: new Text('Music'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: new Icon(Icons.videocam),
                                      title: new Text('Video'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                    ListTile(
                                      leading: new Icon(Icons.share),
                                      title: new Text('Share'),
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.amber[300]!,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          padding: const EdgeInsets.all(7),
                          child: const Icon(
                            Icons.filter,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                child: Row(
                  children: [
                    Locationstorycomp(
                        country: "India",
                        image:
                            "https://images.unsplash.com/photo-1599457382197-820d65b8bbdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
                    Locationstorycomp(
                        country: "Russia",
                        image:
                            "https://images.unsplash.com/photo-1631947430066-48c30d57b943?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Z2lybHxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                    Locationstorycomp(
                        country: "UK",
                        image:
                            "https://images.unsplash.com/photo-1599457382197-820d65b8bbdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
                    Locationstorycomp(
                        country: "USA",
                        image:
                            "https://images.unsplash.com/photo-1599457382197-820d65b8bbdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
                    Locationstorycomp(
                        country: "Dubai",
                        image:
                            "https://images.unsplash.com/photo-1599457382197-820d65b8bbdc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fGdpcmx8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60"),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 14, right: 10, bottom: 7),
                child: Row(
                  children: [
                    Categorycomp(
                        callBack: _changeCategory,
                        isSelected: true,
                        category: "Popular",
                        icon: Icons.local_fire_department_outlined),
                    Categorycomp(
                        callBack: _changeCategory,
                        isSelected: false,
                        category: "Popular",
                        icon: Icons.local_fire_department_outlined),
                    Categorycomp(
                        callBack: _changeCategory,
                        isSelected: false,
                        category: "Popular",
                        icon: Icons.local_fire_department_outlined),
                    Categorycomp(
                        callBack: _changeCategory,
                        isSelected: false,
                        category: "Popular",
                        icon: Icons.local_fire_department_outlined),
                    Categorycomp(
                        callBack: _changeCategory,
                        isSelected: false,
                        category: "Popular",
                        icon: Icons.local_fire_department_outlined),
                    Categorycomp(
                        callBack: _changeCategory,
                        isSelected: false,
                        category: "Popular",
                        icon: Icons.local_fire_department_outlined),
                    Categorycomp(
                        callBack: _changeCategory,
                        isSelected: true,
                        category: "Popular",
                        icon: Icons.local_fire_department_outlined),
                  ],
                ),
              ),
            ),
          ),
          SliverGrid.builder(
            itemCount: _gridItems.length,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            itemBuilder: (context, index) {
              return Card(
                // generate ambers with random shades
                color: Colors.amber[Random().nextInt(9) * 100],
                child: Container(
                  alignment: Alignment.center,
                  child: Text(_gridItems[index]),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
