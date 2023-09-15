import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:travel_app/models/places.dart';
import 'package:travel_app/screens/detailsscreen.dart';

class Homegridcardcomp extends StatefulWidget {
  const Homegridcardcomp({super.key, data}) : _data = data;
  final Places _data;

  @override
  State<Homegridcardcomp> createState() => _HomegridcardcompState();
}

class _HomegridcardcompState extends State<Homegridcardcomp> {
  static int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        elevation: 0.6,
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
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return const DetailScreen();
                            },
                            settings: RouteSettings(
                              arguments: {
                                "tag": widget._data.id,
                                "image": widget._data.imageSrc[0],
                                "data": widget._data
                              },
                            ),
                          ),
                        );
                      },
                      child: CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 250,
                          // autoPlay: true,
                          // reverse: true,
                          enlargeFactor: 0.4,
                          // scrollDirection: Axis.vertical,
                          enlargeCenterPage: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index + 1;
                            });
                          },
                        ),
                        itemCount: widget._data.imageSrc.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Hero(
                          tag: widget._data.id,
                          child: Image.network(
                            errorBuilder: (context, error, stackTrace) {
                              return SizedBox(
                                height: 250,
                                child: Shimmer.fromColors(
                                  baseColor: Colors.red,
                                  highlightColor: Colors.yellow,
                                  child: Container(
                                    height: 250,
                                    color: Colors.white24,
                                  ),
                                ),
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress != null) {
                                return SizedBox(
                                  height: 250,
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.red,
                                    highlightColor: Colors.yellow,
                                    child: Container(
                                      height: 250,
                                      color: Colors.white24,
                                    ),
                                  ),
                                );
                              }
                              return child;
                            },
                            widget._data.imageSrc[itemIndex],
                            width: MediaQuery.of(context).size.width + 100,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    widget._data.title,
                                    style: const TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 18,
                                        color: Colors.orange,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                        text: widget._data.location,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w300,
                                          color: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.color,
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  size: 18,
                                  color: Colors.orange,
                                ),
                                Text(widget._data.rating)
                              ],
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 12,
                            top: 2,
                            bottom: 3,
                          ),
                          child: RichText(
                              text: TextSpan(
                            text: "Aug 20 - 25",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300,
                              color:
                                  Theme.of(context).textTheme.titleLarge?.color,
                            ),
                          )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "₹${widget._data.price}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 17,
                                      color: Theme.of(context)
                                          .textTheme
                                          .titleLarge
                                          ?.color,
                                    )),
                                TextSpan(
                                  text: " night",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.color,
                                  ),
                                ),
                              ],
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
