import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotifyclone/common/listtiles/songtilegrid.dart';
import 'package:spotifyclone/constants/colors.dart';
import 'package:spotifyclone/constants/constvalue.dart';
import '../../../common/songtempdata.dart';
import '../../../common/listtiles/songtile.dart';

class TopSongScreen extends StatefulWidget {
  const TopSongScreen({super.key});

  @override
  State<TopSongScreen> createState() => _TopSongScreenState();
}

class _TopSongScreenState extends State<TopSongScreen> {
  bool isList = true;

  void listToggel() {
    setState(() {
      isList = !isList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Transform.scale(
              scale: 0.5,
              child: SvgPicture.asset('assets/arrow.svg',
                  width: 50, fit: BoxFit.contain)),
          centerTitle: true,
          title: const Column(
            children: [
              Text(
                'Top',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: 'Century Gothic',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 2,
                ),
              ),
              SizedBox(height: 4),
              Text(
                'Past 30 Days',
                style: TextStyle(
                  color: Color(0xFF8A9A9D),
                  fontSize: 10,
                  fontFamily: 'Century Gothic',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 0.60,
                ),
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: listToggel,
              child: Transform.scale(
                scale: 0.5,
                child: SvgPicture.asset('assets/menu.svg',
                    width: 50, fit: BoxFit.contain),
              ),
            ),
            Transform.scale(
              scale: 0.5,
              child: SvgPicture.asset('assets/add-lg.svg',
                  width: 50, fit: BoxFit.contain),
            ),
          ],
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorColor: AppColors.primary,
            labelColor: AppColors.primary,
            unselectedLabelColor: Colors.white,
            labelPadding: const EdgeInsets.symmetric(vertical: 8),
            dividerColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(horizontal: bodyPadding),
            tabs: [
              buildTab(text: 'Tracks'),
              buildTab(text: 'Artists'),
              buildTab(text: 'Albums'),
            ],
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: TabBarView(
                children: [
                  isList ? buildTracks() : buildTracksGrid(),
                  isList ? buildTracks() : buildTracksGrid(),
                  isList ? buildTracks() : buildTracksGrid(),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: const Alignment(0.00, -1.00),
                    end: const Alignment(0, 1),
                    colors: [Colors.black.withOpacity(0), Colors.black],
                  ),
                ),
                child: const Row(
                  children: [
                    Expanded(
                      child: Text(
                        '30 days',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.60,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '6 Months',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.60,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        '1 Year',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.60,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Lifetime',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.60,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTracks() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      physics: const BouncingScrollPhysics(),
      itemCount: songList.length,
      itemBuilder: (context, index) {
        return SongTile(songModel: songList[index]);
      },
    );
  }

  Widget buildTracksGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3 / 4, crossAxisCount: 2, crossAxisSpacing: 20),
      physics: const BouncingScrollPhysics(),
      itemCount: songList.length,
      itemBuilder: (context, index) {
        return SongTileGrid(songModel: songList[index]);
      },
    );
  }

  Text buildTab({required String text}) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        height: 0,
        letterSpacing: 0.96,
      ),
    );
  }
}
