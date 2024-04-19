import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/views/screens/home/homepage.dart';
import 'package:spotifyclone/views/screens/liberary/liberary.dart';
import 'package:spotifyclone/views/screens/search/search.dart';

import '../../constants/colors.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({
    super.key,
    required this.selected,
  });

  final int selected;
  Route _createRoute(Widget child) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => FadeTransition(opacity: animation ,child: child),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: const Alignment(0.00, -1.00),
            end: const Alignment(0, 1),
            colors: [Colors.black.withOpacity(0), Colors.black],
          ),
        ),
        child: SizedBox(
          height: 70,
          child: Row(
            children: [
              //home
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: ()=>Navigator.of(context).pushReplacement(_createRoute(const HomeScreen())),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/home.svg',
                        colorFilter:selected==0? ColorFilter.mode(AppColors.primary, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      Text(
                        'Home',
                        style: TextStyle(
                          color: selected==0?AppColors.primary:Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //search
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap:()=>Navigator.of(context).pushReplacement(_createRoute(const SearchScreen())),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/search.svg',
                        colorFilter:selected==1? ColorFilter.mode(AppColors.primary, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          color: selected==1?AppColors.primary:Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //library
              Expanded(
                flex: 1,
                child: GestureDetector(
                  onTap: ()=>Navigator.of(context).pushReplacement(_createRoute(const YourLibrary())),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset('assets/folder.svg', colorFilter:selected==2? ColorFilter.mode(AppColors.primary, BlendMode.srcIn):const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                      ),
                      Text(
                        'Library',
                        style: TextStyle(
                          color: selected==2?AppColors.primary:Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}