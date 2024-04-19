import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/common/listtiles/search_card.dart';
import 'package:spotifyclone/constants/constvalue.dart';
import '../../../common/widget/bottombar.dart';
import '../../../constants/colors.dart';
import '../../../models/search_card_model.dart';
import '../../../routes/app_routes.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()async{
        Navigator.pushReplacementNamed(context, AppRoutes.homeScreen);
        return true;
      } ,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
            padding: const EdgeInsets.only(top: 40, left: bodyPadding, right: bodyPadding),
            child: Column(
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
                      'Search',
                      style: TextStyle(
                        color: Color(0xFF00C2CB),
                        fontSize: 27,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                //searchBar
                CupertinoSearchTextField(
                  backgroundColor: Colors.white,
                  style: const TextStyle(
                    overflow: TextOverflow.ellipsis,
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.58,
                  ),
                  controller: search,
                  prefixIcon: SvgPicture.asset('assets/browse.svg'),
                  placeholder: 'Songs, Artists, Podcasts & More',
                  padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 10),
                  borderRadius: BorderRadius.circular(18),
                ),
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
                            'Your Top Genres',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GridView.builder(
                            itemCount: topGenres.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return SearchCard(searchCardModel: topGenres[index]);
                            },
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 3 / 2,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Browse All',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GridView.builder(
                            itemCount: browseAll.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return SearchCard(searchCardModel: browseAll[index]);
                            },
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              childAspectRatio: 3 / 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          //bottomBar
          const BottomBar(selected: 1),
        ],
      )),
    );
  }
}
