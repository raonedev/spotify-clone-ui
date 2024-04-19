import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/common/listtiles/songtile.dart';

import '../../../common/songtempdata.dart';
import '../../../common/widget/bottombar.dart';
import '../../../constants/colors.dart';
import '../../../constants/constvalue.dart';
import '../../../routes/app_routes.dart';

class YourLibrary extends StatefulWidget {
  const YourLibrary({super.key});

  @override
  State<YourLibrary> createState() => _YourLibraryState();
}

class _YourLibraryState extends State<YourLibrary> {
  List<String> tabList = [
    "Folders",
    "Playlists",
    "Artists",
    "Albums",
    "Podcasts",
    "Folders",
    "Playlists",
    "Artists",
    "abcdced Artists",
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        return true;
      } ,
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 40, left: bodyPadding, right: bodyPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //topBar
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/music-note-2.svg',
                        colorFilter: ColorFilter.mode(
                            AppColors.primaryBlue, BlendMode.srcIn),
                        width: 40,
                        height: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Your Library',
                        style: TextStyle(
                          color: Color(0xFF00C2CB),
                          fontSize: 27,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const Spacer(),
                      SvgPicture.asset('assets/search.svg'),
                    ],
                  ),
                  const SizedBox(height: 30),
                  // tabBar
                  SizedBox(
                      height: 30,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: tabList.length,
                        itemBuilder: (context, index) {
                          return Container(
                              width: 70,
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(horizontal: 5),
                              decoration: ShapeDecoration(
                                color: const Color(0x00D9D9D9),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1, color: Colors.white),
                                  borderRadius: BorderRadius.circular(23),
                                ),
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                tabList[index],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ));
                        },
                      )),
                  const SizedBox(height: 30),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          // body
                          buildListTile('Add New Playlist'),
                          const SizedBox(height: 20),
                          buildListTile('Your Liked Songs'),
                          const SizedBox(height: 40),
                          const ListTile(
                           contentPadding: EdgeInsets.zero,
                           leading: Icon(CupertinoIcons.sort_up_circle,color: Color(0xff979797)),
                           horizontalTitleGap: 10,
                           title: Text(
                             'Recently played',
                             style: TextStyle(
                               color: Color(0xFF39C0D4),
                               fontSize: 16,
                               fontWeight: FontWeight.w700,
                               letterSpacing: 0.96,
                             ),
                           ),
                         ),
                          // songs
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: songList.length,
                            itemBuilder: (context, index) {
                              return SongTile(songModel: songList[index]);
                            },
                          ),
                          const SizedBox(height: 50),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            //bottomBar
            const BottomBar(selected: 2),
          ],
        ),
      ),
    );
  }

  ListTile buildListTile(String title) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.primaryLight, AppColors.primary],
          ),
        ),
        child: SvgPicture.asset('assets/add-lg.svg'),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.20,
        ),
      ),
    );
  }
}
