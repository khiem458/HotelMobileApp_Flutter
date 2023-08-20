import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Homegridcardloadingcomp extends StatelessWidget {
  const Homegridcardloadingcomp({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 1,
        color: Colors.white,
        shadowColor: Colors.white,
        child: ClipRRect(
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: SizedBox(
              height: 360,
              width: 270,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: SizedBox(
                      height: 250,
                      child: Shimmer.fromColors(
                        baseColor: Colors.red,
                        highlightColor: Colors.yellow,
                        child: Container(
                          height: 200,
                          color: Colors.white24,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 4, top: 2),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  width: 140,
                                  height: 20,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.red,
                                    highlightColor: Colors.yellow,
                                    child: Container(
                                      height: 20,
                                      color: Colors.white24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4, top: 5),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: 20,
                                  width: 130,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.red,
                                    highlightColor: Colors.yellow,
                                    child: Container(
                                      height: 20,
                                      color: Colors.white24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4, top: 5),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: 20,
                                  width: 120,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.red,
                                    highlightColor: Colors.yellow,
                                    child: Container(
                                      height: 20,
                                      color: Colors.white24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 4, top: 5),
                              child: ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5)),
                                child: SizedBox(
                                  height: 20,
                                  width: 100,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.red,
                                    highlightColor: Colors.yellow,
                                    child: Container(
                                      height: 20,
                                      color: Colors.white24,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            child: SizedBox(
                              height: 20,
                              width: 50,
                              child: Shimmer.fromColors(
                                baseColor: Colors.red,
                                highlightColor: Colors.yellow,
                                child: Container(
                                  height: 20,
                                  color: Colors.white24,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}