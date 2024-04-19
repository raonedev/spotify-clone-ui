import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/common/widget/bottombar.dart';
import 'package:spotifyclone/constants/colors.dart';
import 'package:spotifyclone/constants/constvalue.dart';
import 'package:spotifyclone/routes/app_routes.dart';

import '../../../common/listtiles/songtile.dart';
import '../../../common/songtempdata.dart';

class PlayListScreen extends StatelessWidget {
  const PlayListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushReplacementNamed(context, AppRoutes.libraryScreen);
        return true;
      } ,
      child: Scaffold(
        // appBar: AppBar(),
        body: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverAppBar(
                  leading: IconButton(icon: const Icon(CupertinoIcons.back,color: Colors.white,),onPressed: ()=>Navigator.pushReplacementNamed(context, AppRoutes.homeScreen)),
                  backgroundColor: AppColors.backgroudDark,
                  pinned: true,
                  stretch: true,
                  expandedHeight: MediaQuery.of(context).size.height*0.5,
                  centerTitle: true,
                  flexibleSpace:  FlexibleSpaceBar(
                    background: Center(
                      child: Container(
                        width: 263,
                        height: 252,
                        decoration: ShapeDecoration(
                          image: const DecorationImage(
                            image: CachedNetworkImageProvider("https://pipedproxy.kavin.rocks/vi/rQCdEuyVriU/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLDlWQZAL7tYA_rfExzrYusfkv6fqg&host=i.ytimg.com"),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                        ),
                      ),
                    ),
                    title:Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Lofi Loft',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 3.23,
                          ),
                        ),
                        Text(
                          'soft, chill, dreamy, lo-fi beats',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.699999988079071),
                            fontSize: 12,
                            fontFamily: 'Century Gothic',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: 0.78,
                          ),
                        ),
                      ],
                    ),
                    centerTitle: true,

                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((BuildContext context, int index) {
                    return Container(
                        margin: const EdgeInsets.symmetric(horizontal: bodyPadding,vertical: 5),
                        child: SongTile(songModel: songList[index]));
                  },
                    childCount: songList.length,
                  ),
                ),
              ],
            ),
            const BottomBar(selected: 2),
          ],
        ),
      ),
    );
  }
}
