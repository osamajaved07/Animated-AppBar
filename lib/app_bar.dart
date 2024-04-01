// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:insta_image_viewer/insta_image_viewer.dart';

class SliverExample extends StatelessWidget {
   SliverExample({super.key});
  List<String> imagePaths = [
  "images/c1.jpg",
  "images/c2.jpg",
  "images/c3.jpg",
    "images/c4.jpg",
  "images/c5.jpg",
  "images/c6.jpg",
  "images/c7.jpg",
  "images/c8.jpg",
  "images/c9.jpg",
  "images/c10.jpg",
  // Add other image paths here
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            toolbarHeight: 50,
            leading: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            actions: [
              Icon(
                Icons.coffee_rounded,
                color: Colors.white,
                size: 28,
              ),
              SizedBox(
                width: 20,
              )
            ],
            // floating: true,
            backgroundColor: Colors.brown,
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                "images/coffee.jpg",
                fit: BoxFit.cover,
              ),
              title: Text(
                " Coffee Cafe ☕",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // SliverToBoxAdapter(
          //   child: MasonryGridView.count(
          //     padding: EdgeInsets.all(0),
          //     shrinkWrap: true,
          //     itemCount: 10,
          //     physics: NeverScrollableScrollPhysics(),
          //     crossAxisCount: 2,
          //     itemBuilder: (context, index) {
          //       double ht = ((index % 3) + 1) * 150;
                 
          //       return Padding(
          //         padding: EdgeInsets.all(10),
          //         child: ClipRRect(
          //           borderRadius: BorderRadius.circular(12),
          //           child: InstaImageViewer(
          //             child: Image.network(
          //               "https://www.pexels.com/search/coffee%20cup/",
          //               fit: BoxFit.cover,
          //               height: ht,
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   ),
          // )
          SliverToBoxAdapter(
  child: MasonryGridView.count(
    padding: EdgeInsets.all(0),
    shrinkWrap: true,
    itemCount: 10, // Assuming you want to display 10 images
    physics: NeverScrollableScrollPhysics(),
    crossAxisCount: 2,
    itemBuilder: (context, index) {
      double ht = ((index % 3) + 1) * 150;
      // Calculate the index of the image path to use based on the current index
      int imagePathIndex = index ~/ 2; // Each pair of images will use the same path
      if (imagePathIndex >= imagePaths.length) {
        imagePathIndex = imagePaths.length - 1; // Ensure we don't exceed the bounds of the list
      }
      return Padding(
        padding: EdgeInsets.all(10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: InstaImageViewer(
            child: Image.asset(
              imagePaths[imagePathIndex],
              fit: BoxFit.cover,
              height: ht,
            ),
          ),
        ),
      );
    },
  ),
)
        ],
      ),
    );
  }
}
