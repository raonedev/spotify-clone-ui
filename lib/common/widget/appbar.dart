
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotifyclone/routes/app_routes.dart';

import '../../constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          maxRadius: 27,
          backgroundColor: AppColors.primaryBlue,
          child: const CircleAvatar(
            backgroundImage: CachedNetworkImageProvider('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZmlsZSUyMHBpY3R1cmV8ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=500&q=60'),
            backgroundColor: Colors.grey,
            maxRadius: 25,
          ),
        ),
        const SizedBox(width: 10),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome back !',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Opacity(
              opacity: 0.58,
              child: Text(
                'chandrama',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontFamily: 'Century Gothic',
                  fontWeight: FontWeight.w700,
                  height: 0,
                  letterSpacing: 0.36,
                ),
              ),
            )
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: ()=>Navigator.pushNamed(context, AppRoutes.topSongScreen),
            child: SvgPicture.asset('assets/bar.svg'),),
        const SizedBox(width: 10),
        SvgPicture.asset('assets/notification-on.svg'),
        const SizedBox(width: 10),
        SvgPicture.asset('assets/settings.svg'),
      ],
    );
  }
}
