import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/constants/constvalue.dart';

import '../../../common/listtiles/catergorytile.dart';
import '../../../common/widget/appbar.dart';
import '../../../common/widget/bottombar.dart';
import '../../../models/catagory.dart';
import '../../../models/continue_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Display a confirmation dialog before popping the current screen.
        bool shouldPop = await showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Confirmation'),
              content: const Text('Are you sure you want to exit?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Yes'),
                ),
              ],
            );
          },
        );

        // Return the result of the confirmation dialog.
        return shouldPop;
      },
      child: Scaffold(
          body: Stack(
        children: [
          // gradient
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color.fromARGB(255, 28, 108, 112), Colors.transparent],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 40, left: bodyPadding, right: bodyPadding),
            child: Column(
              children: [
                const CustomAppBar(),
                const SizedBox(height: 20),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: SizedBox(
                      width: double.maxFinite,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Continue Listening',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GridView.builder(
                            itemCount: continueList.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Container(
                                height: 25,
                                padding: const EdgeInsets.only(right: 10),
                                decoration: ShapeDecoration(
                                  color: const Color(0x33436369),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    CachedNetworkImage(
                                      width: 60,
                                      imageUrl: continueList[index].imageUrl,
                                      imageBuilder: (context, imageProvider) =>
                                          ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                      progressIndicatorBuilder: (context, url,
                                              downloadProgress) =>
                                          Center(
                                              child: CircularProgressIndicator(
                                                  value:
                                                      downloadProgress.progress)),
                                      errorWidget: (context, url, error) =>
                                          const Icon(Icons.error),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          continueList[index].title,
                                          maxLines: 2,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 3 / 1.2,
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Your Top Mixes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 130,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: catList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CategoryListTile(category: catList[index],);
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Your Top Mixes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 130,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: catList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CategoryListTile(category: catList[index],);
                              },
                            ),
                          ),
                          const SizedBox(height: 30),
                          const Text(
                            'Your Top Mixes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 130,
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: catList.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return CategoryListTile(category: catList[index],);
                              },
                            ),
                          ),
                          const SizedBox(height: 50),

                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //bottomBar
          const BottomBar(selected: 0),
        ],
      )),
    );
  }
}


