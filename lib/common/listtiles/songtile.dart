import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:spotifyclone/routes/app_routes.dart';

import '../../models/SongsModel.dart';

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.songModel,
  });

  final SongsModel songModel;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){
        if(songModel.type == 'playlist'){
          Navigator.pushReplacementNamed(context, AppRoutes.platListScreen);
        }else{
          debugPrint("not a playlist");
        }
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      leading: songModel.type == 'channel'
          ? CircleAvatar(
              radius: 41,
              backgroundImage:
                  CachedNetworkImageProvider(songModel.thumbnail.toString()))
          : Container(
              width: 84,
              height: 84,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      songModel.thumbnail.toString()),
                  fit: BoxFit.fill,
                ),
              ),
            ),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //title
          Text(
            songModel.type == 'channel'
                ? songModel.name.toString()
                : songModel.type == 'playlist'
                    ? songModel.name.toString()
                    : songModel.title.toString(),
            maxLines: 1,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.20,
            ),
          ),
          Text(
            songModel.type == 'channel'
                ? ''//songModel.type.toString()
                : songModel.type == 'playlist'
                ? "playlist: ${songModel.videos} songs"
                : songModel.uploaderName.toString(),
            maxLines: 1,
            style: const TextStyle(
              overflow: TextOverflow.ellipsis,
              color: Color(0xFF8A9A9D),
              fontSize: 12,
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: 0.82,
            ),
          ),
        ],
      ),
    );
  }
}
