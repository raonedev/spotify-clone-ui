/// url : "/watch?v=yz9bS7pRvBc"
/// type : "stream"
/// title : "Pardes katenda Song | Slowed & Reverb | Adnan Dhool | #tiktok #trending"
/// thumbnail : "https://pipedproxy.kavin.rocks/vi/yz9bS7pRvBc/hq720.jpg?sqp=-oaymwE2CNAFEJQDSFXyq4qpAygIARUAAIhCGAFwAcABBvABAfgB1AiAAtAFigIMCAAQARh_IDIoIzAP&rs=AOn4CLCKsj0YyWwltvX6xvDT0kH_7eMaPQ&host=i.ytimg.com"
/// uploaderName : "Blackish World"
/// uploaderUrl : "/channel/UC0SD4DbW7uP7wVUvKwjRmRA"
/// uploaderAvatar : "https://pipedproxy.kavin.rocks/IycCDfWXR1hMmLhf6gxKlFVi7B9mcp7oe55L4j4a3wF2stL_4duXAKD0Fl3mOTlWLqjcWGB7=s68-c-k-c0x00ffffff-no-rw?host=yt3.ggpht.com"
/// uploadedDate : "2 months ago"
/// shortDescription : "song #siraiki #saraikisong #trending #viral #viralvideo #viralshorts #slowedandreverb amazing song awesome song siraiki song ..."
/// duration : 183
/// views : 149720
/// uploaded : 1692349200000
/// uploaderVerified : false
/// isShort : false
/// name : "Pardes Katenda Radio"
/// playlistType : "NORMAL"
/// description : "The official YouTube channel of Adnan Dhool For booking and queries Manager: Rao Saad Call/Whatsapp: +92 332 271 9999."
/// videos : 24
/// subscribers : 74800
/// verified : true

class SongsModel {
  SongsModel({
      String? url, 
      String? type, 
      String? title, 
      String? thumbnail, 
      String? uploaderName, 
      String? uploaderUrl, 
      String? uploaderAvatar, 
      String? uploadedDate, 
      String? shortDescription, 
      num? duration, 
      num? views, 
      num? uploaded, 
      bool? uploaderVerified, 
      bool? isShort, 
      String? name, 
      String? playlistType, 
      String? description, 
      num? videos, 
      num? subscribers, 
      bool? verified,}){
    _url = url;
    _type = type;
    _title = title;
    _thumbnail = thumbnail;
    _uploaderName = uploaderName;
    _uploaderUrl = uploaderUrl;
    _uploaderAvatar = uploaderAvatar;
    _uploadedDate = uploadedDate;
    _shortDescription = shortDescription;
    _duration = duration;
    _views = views;
    _uploaded = uploaded;
    _uploaderVerified = uploaderVerified;
    _isShort = isShort;
    _name = name;
    _playlistType = playlistType;
    _description = description;
    _videos = videos;
    _subscribers = subscribers;
    _verified = verified;
}

  SongsModel.fromJson(dynamic json) {
    _url = json['url'] as String? ?? '';
    _type = json['type'] as String? ?? '';
    _title = json['title'] as String? ?? '';
    _thumbnail = json['thumbnail'] as String? ?? '';
    _uploaderName = json['uploaderName'] as String? ?? '';
    _uploaderUrl = json['uploaderUrl'] as String? ?? '';
    _uploaderAvatar = json['uploaderAvatar'] as String? ?? '';
    _uploadedDate = json['uploadedDate'] as String? ?? '';
    _shortDescription = json['shortDescription'] as String? ?? '';
    _duration = json['duration'] as num? ?? 0;
    _views = json['views'] as num? ?? 0;
    _uploaded = json['uploaded'] as num? ?? 0;
    _uploaderVerified = json['uploaderVerified'] as bool? ?? false;
    _isShort = json['isShort'] as bool? ?? false;
    _name = json['name'] as String? ?? '';
    _playlistType = json['playlistType'] as String? ?? '';
    _description = json['description'] as String? ?? '';
    _videos = json['videos'] as num? ?? 0;
    _subscribers = json['subscribers'] as num? ?? 0;
    _verified = json['verified'] as bool? ?? false;
  }

  String? _url;
  String? _type;
  String? _title;
  String? _thumbnail;
  String? _uploaderName;
  String? _uploaderUrl;
  String? _uploaderAvatar;
  String? _uploadedDate;
  String? _shortDescription;
  num? _duration;
  num? _views;
  num? _uploaded;
  bool? _uploaderVerified;
  bool? _isShort;
  String? _name;
  String? _playlistType;
  String? _description;
  num? _videos;
  num? _subscribers;
  bool? _verified;
SongsModel copyWith({  String? url,
  String? type,
  String? title,
  String? thumbnail,
  String? uploaderName,
  String? uploaderUrl,
  String? uploaderAvatar,
  String? uploadedDate,
  String? shortDescription,
  num? duration,
  num? views,
  num? uploaded,
  bool? uploaderVerified,
  bool? isShort,
  String? name,
  String? playlistType,
  String? description,
  num? videos,
  num? subscribers,
  bool? verified,
}) => SongsModel(  url: url ?? _url,
  type: type ?? _type,
  title: title ?? _title,
  thumbnail: thumbnail ?? _thumbnail,
  uploaderName: uploaderName ?? _uploaderName,
  uploaderUrl: uploaderUrl ?? _uploaderUrl,
  uploaderAvatar: uploaderAvatar ?? _uploaderAvatar,
  uploadedDate: uploadedDate ?? _uploadedDate,
  shortDescription: shortDescription ?? _shortDescription,
  duration: duration ?? _duration,
  views: views ?? _views,
  uploaded: uploaded ?? _uploaded,
  uploaderVerified: uploaderVerified ?? _uploaderVerified,
  isShort: isShort ?? _isShort,
  name: name ?? _name,
  playlistType: playlistType ?? _playlistType,
  description: description ?? _description,
  videos: videos ?? _videos,
  subscribers: subscribers ?? _subscribers,
  verified: verified ?? _verified,
);
  String? get url => _url;
  String? get type => _type;
  String? get title => _title;
  String? get thumbnail => _thumbnail;
  String? get uploaderName => _uploaderName;
  String? get uploaderUrl => _uploaderUrl;
  String? get uploaderAvatar => _uploaderAvatar;
  String? get uploadedDate => _uploadedDate;
  String? get shortDescription => _shortDescription;
  num? get duration => _duration;
  num? get views => _views;
  num? get uploaded => _uploaded;
  bool? get uploaderVerified => _uploaderVerified;
  bool? get isShort => _isShort;
  String? get name => _name;
  String? get playlistType => _playlistType;
  String? get description => _description;
  num? get videos => _videos;
  num? get subscribers => _subscribers;
  bool? get verified => _verified;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['url'] = _url;
    map['type'] = _type;
    map['title'] = _title;
    map['thumbnail'] = _thumbnail;
    map['uploaderName'] = _uploaderName;
    map['uploaderUrl'] = _uploaderUrl;
    map['uploaderAvatar'] = _uploaderAvatar;
    map['uploadedDate'] = _uploadedDate;
    map['shortDescription'] = _shortDescription;
    map['duration'] = _duration;
    map['views'] = _views;
    map['uploaded'] = _uploaded;
    map['uploaderVerified'] = _uploaderVerified;
    map['isShort'] = _isShort;
    map['name'] = _name;
    map['playlistType'] = _playlistType;
    map['description'] = _description;
    map['videos'] = _videos;
    map['subscribers'] = _subscribers;
    map['verified'] = _verified;
    return map;
  }

}