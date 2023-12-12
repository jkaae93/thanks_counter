import 'package:thanks_counter/model/next_params.dart';
import 'package:thanks_counter/model/post.dart';

class BoardDto {
  int? resultCode;
  ResultData? resultData;

  BoardDto({this.resultCode, this.resultData});

  BoardDto.fromJson(Map<String, dynamic> json) {
    resultCode = (json["result_code"] as num).toInt();
    resultData = json["result_data"] == null
        ? null
        : ResultData.fromJson(json["result_data"]);
  }

  static List<BoardDto> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => BoardDto.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["result_code"] = resultCode;
    if (resultData != null) {
      _data["result_data"] = resultData?.toJson();
    }
    return _data;
  }

  @override
  String toString() => resultData!.toJson().toString();
}

class ResultData {
  List<Post>? items;
  Paging? paging;

  ResultData({this.items, this.paging});

  ResultData.fromJson(Map<String, dynamic> json) {
    items = json["items"] == null
        ? null
        : (json["items"] as List).map((e) => Post.fromJson(e)).toList();
    paging = json["paging"] == null ? null : Paging.fromJson(json["paging"]);
  }

  static List<ResultData> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => ResultData.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    if (paging != null) {
      _data["paging"] = paging?.toJson();
    }
    return _data;
  }

  @override
  String toString() => {
        'items': items!.map((e) => e.toJson()).toList().toString(),
        'paging': paging!.toJson(),
      }.toString();
}

class Paging {
  PreviousParams? previousParams;
  NextParams? nextParams;

  Paging({this.previousParams, this.nextParams});

  Paging.fromJson(Map<String, dynamic> json) {
    previousParams = json["previous_params"] == null
        ? null
        : PreviousParams.fromJson(json["previous_params"]);
    nextParams = json["next_params"];
  }

  static List<Paging> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => Paging.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    if (previousParams != null) {
      _data["previous_params"] = previousParams?.toJson();
    }
    _data["next_params"] = nextParams;
    return _data;
  }

  @override
  String toString() => toJson().toString();
}

class PreviousParams {
  String? before;
  String? limit;
  String? orderBy;
  String? from;
  String? to;
  String? bandNo;

  PreviousParams(
      {this.before, this.limit, this.orderBy, this.from, this.to, this.bandNo});

  PreviousParams.fromJson(Map<String, dynamic> json) {
    before = json["before"];
    limit = json["limit"];
    orderBy = json["order_by"];
    from = json["from"];
    to = json["to"];
    bandNo = json["band_no"];
  }

  static List<PreviousParams> fromList(List<Map<String, dynamic>> list) {
    return list.map((map) => PreviousParams.fromJson(map)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["before"] = before;
    _data["limit"] = limit;
    _data["order_by"] = orderBy;
    _data["from"] = from;
    _data["to"] = to;
    _data["band_no"] = bandNo;
    return _data;
  }

  @override
  String toString() => toJson().toString();
}

// class Items {
//   Attachment? attachment;
//   List<dynamic>? featuredComment;
//   List<dynamic>? latestComment;
//   String? content;
//   int? createdAt;
//   int? photoCount;
//   Band? band;
//   int? postNo;
//   int? commentCount;
//   int? emotionCount;
//   List<String>? commonEmotionType;
//   Author1? author;
//   bool? isRestricted;
//   String? writtenIn;
//   int? sharedCount;
//   bool? isBookmarked;
//   String? copiableState;
//   int? readCount;
//   bool? shouldDisableComment;
//   String? webUrl;
//   bool? isTranslatable;
//   int? videoCount;
//   bool? isMajorNotice;

//   Items(
//       {this.attachment,
//       this.featuredComment,
//       this.latestComment,
//       this.content,
//       this.createdAt,
//       this.photoCount,
//       this.band,
//       this.postNo,
//       this.commentCount,
//       this.emotionCount,
//       this.commonEmotionType,
//       this.author,
//       this.isRestricted,
//       this.writtenIn,
//       this.sharedCount,
//       this.isBookmarked,
//       this.copiableState,
//       this.readCount,
//       this.shouldDisableComment,
//       this.webUrl,
//       this.isTranslatable,
//       this.videoCount,
//       this.isMajorNotice});

//   Items.fromJson(Map<String, dynamic> json) {
//     attachment = json["attachment"] == null
//         ? null
//         : Attachment.fromJson(json["attachment"]);
//     featuredComment = json["featured_comment"] ?? [];
//     latestComment = json["latest_comment"] ?? [];
//     content = json["content"];
//     createdAt = (json["created_at"] as num).toInt();
//     photoCount = (json["photo_count"] as num).toInt();
//     band = json["band"] == null ? null : Band.fromJson(json["band"]);
//     postNo = (json["post_no"] as num).toInt();
//     commentCount = (json["comment_count"] as num).toInt();
//     emotionCount = (json["emotion_count"] as num).toInt();
//     commonEmotionType = json["common_emotion_type"] == null
//         ? null
//         : List<String>.from(json["common_emotion_type"]);
//     author = json["author"] == null ? null : Author1.fromJson(json["author"]);
//     isRestricted = json["is_restricted"];
//     writtenIn = json["written_in"];
//     sharedCount = (json["shared_count"] as num).toInt();
//     isBookmarked = json["is_bookmarked"];
//     copiableState = json["copiable_state"];
//     readCount = (json["read_count"] as num).toInt();
//     shouldDisableComment = json["should_disable_comment"];
//     webUrl = json["web_url"];
//     isTranslatable = json["is_translatable"];
//     videoCount = (json["video_count"] as num).toInt();
//     isMajorNotice = json["is_major_notice"];
//   }

//   static List<Items> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => Items.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     if (attachment != null) {
//       _data["attachment"] = attachment?.toJson();
//     }
//     if (featuredComment != null) {
//       _data["featured_comment"] = featuredComment;
//     }
//     if (latestComment != null) {
//       _data["latest_comment"] = latestComment;
//     }
//     _data["content"] = content;
//     _data["created_at"] = createdAt;
//     _data["photo_count"] = photoCount;
//     if (band != null) {
//       _data["band"] = band?.toJson();
//     }
//     _data["post_no"] = postNo;
//     _data["comment_count"] = commentCount;
//     _data["emotion_count"] = emotionCount;
//     if (commonEmotionType != null) {
//       _data["common_emotion_type"] = commonEmotionType;
//     }
//     if (author != null) {
//       _data["author"] = author?.toJson();
//     }
//     _data["is_restricted"] = isRestricted;
//     _data["written_in"] = writtenIn;
//     _data["shared_count"] = sharedCount;
//     _data["is_bookmarked"] = isBookmarked;
//     _data["copiable_state"] = copiableState;
//     _data["read_count"] = readCount;
//     _data["should_disable_comment"] = shouldDisableComment;
//     _data["web_url"] = webUrl;
//     _data["is_translatable"] = isTranslatable;
//     _data["video_count"] = videoCount;
//     _data["is_major_notice"] = isMajorNotice;
//     return _data;
//   }

//   @override
//   String toString() => toJson().toString();
// }

// class Author1 {
//   int? userNo;
//   int? bandNo;
//   String? name;
//   String? profileImageUrl;
//   String? description;
//   String? role;
//   String? memberType;
//   bool? memberCertified;
//   bool? me;
//   String? memberKey;
//   bool? isMuted;
//   String? profileKey;
//   int? createdAt;

//   Author1(
//       {this.userNo,
//       this.bandNo,
//       this.name,
//       this.profileImageUrl,
//       this.description,
//       this.role,
//       this.memberType,
//       this.memberCertified,
//       this.me,
//       this.memberKey,
//       this.isMuted,
//       this.profileKey,
//       this.createdAt});

//   Author1.fromJson(Map<String, dynamic> json) {
//     userNo = (json["user_no"] as num).toInt();
//     bandNo = (json["band_no"] as num).toInt();
//     name = json["name"];
//     profileImageUrl = json["profile_image_url"];
//     description = json["description"];
//     role = json["role"];
//     memberType = json["member_type"];
//     memberCertified = json["member_certified"];
//     me = json["me"];
//     memberKey = json["member_key"];
//     isMuted = json["is_muted"];
//     profileKey = json["profile_key"];
//     createdAt = (json["created_at"] as num).toInt();
//   }

//   static List<Author1> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => Author1.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["user_no"] = userNo;
//     _data["band_no"] = bandNo;
//     _data["name"] = name;
//     _data["profile_image_url"] = profileImageUrl;
//     _data["description"] = description;
//     _data["role"] = role;
//     _data["member_type"] = memberType;
//     _data["member_certified"] = memberCertified;
//     _data["me"] = me;
//     _data["member_key"] = memberKey;
//     _data["is_muted"] = isMuted;
//     _data["profile_key"] = profileKey;
//     _data["created_at"] = createdAt;
//     return _data;
//   }

//   @override
//   String toString() => toJson().toString();
// }

// class Band {
//   String? type;
//   bool? isRecruiting;
//   int? bandNo;
//   String? name;
//   String? cover;
//   String? themeColor;
//   List<String>? availableActions;
//   List<String>? permissions;

//   Band(
//       {this.type,
//       this.isRecruiting,
//       this.bandNo,
//       this.name,
//       this.cover,
//       this.themeColor,
//       this.availableActions,
//       this.permissions});

//   Band.fromJson(Map<String, dynamic> json) {
//     type = json["type"];
//     isRecruiting = json["is_recruiting"];
//     bandNo = (json["band_no"] as num).toInt();
//     name = json["name"];
//     cover = json["cover"];
//     themeColor = json["theme_color"];
//     availableActions = json["available_actions"] == null
//         ? null
//         : List<String>.from(json["available_actions"]);
//     permissions = json["permissions"] == null
//         ? null
//         : List<String>.from(json["permissions"]);
//   }

//   static List<Band> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => Band.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["type"] = type;
//     _data["is_recruiting"] = isRecruiting;
//     _data["band_no"] = bandNo;
//     _data["name"] = name;
//     _data["cover"] = cover;
//     _data["theme_color"] = themeColor;
//     if (availableActions != null) {
//       _data["available_actions"] = availableActions;
//     }
//     if (permissions != null) {
//       _data["permissions"] = permissions;
//     }
//     return _data;
//   }

//   @override
//   String toString() => toJson().toString();
// }

// class Attachment {
//   List<dynamic>? video;
//   List<Photo>? photo;
//   List<dynamic>? file;
//   List<dynamic>? dropboxFile;
//   List<dynamic>? externalFile;

//   Attachment(
//       {this.video, this.photo, this.file, this.dropboxFile, this.externalFile});

//   Attachment.fromJson(Map<String, dynamic> json) {
//     video = json["video"] ?? [];
//     photo = json["photo"] == null
//         ? null
//         : (json["photo"] as List).map((e) => Photo.fromJson(e)).toList();
//     file = json["file"] ?? [];
//     dropboxFile = json["dropbox_file"] ?? [];
//     externalFile = json["external_file"] ?? [];
//   }

//   static List<Attachment> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => Attachment.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     if (video != null) {
//       _data["video"] = video;
//     }
//     if (photo != null) {
//       _data["photo"] = photo?.map((e) => e.toJson()).toList();
//     }
//     if (file != null) {
//       _data["file"] = file;
//     }
//     if (dropboxFile != null) {
//       _data["dropbox_file"] = dropboxFile;
//     }
//     if (externalFile != null) {
//       _data["external_file"] = externalFile;
//     }
//     return _data;
//   }

//   @override
//   String toString() => toJson().toString();
// }

// class Photo {
//   Author? author;
//   String? postId;
//   String? photoId;
//   int? height;
//   int? width;
//   int? createdAt;
//   int? postNo;
//   int? commentCount;
//   int? emotionCount;
//   String? registeredAt;
//   int? photoNo;
//   bool? isRestricted;
//   String? savableState;
//   String? photoUrl;
//   String? photoThumbnail;
//   String? originalPostId;
//   String? contentType;
//   int? size;
//   String? source;

//   Photo(
//       {this.author,
//       this.postId,
//       this.photoId,
//       this.height,
//       this.width,
//       this.createdAt,
//       this.postNo,
//       this.commentCount,
//       this.emotionCount,
//       this.registeredAt,
//       this.photoNo,
//       this.isRestricted,
//       this.savableState,
//       this.photoUrl,
//       this.photoThumbnail,
//       this.originalPostId,
//       this.contentType,
//       this.size,
//       this.source});

//   Photo.fromJson(Map<String, dynamic> json) {
//     author = json["author"] == null ? null : Author.fromJson(json["author"]);
//     postId = json["post_id"];
//     photoId = json["photo_id"];
//     height = (json["height"] as num).toInt();
//     width = (json["width"] as num).toInt();
//     createdAt = (json["created_at"] as num).toInt();
//     postNo = (json["post_no"] as num).toInt();
//     commentCount = (json["comment_count"] as num).toInt();
//     emotionCount = (json["emotion_count"] as num).toInt();
//     registeredAt = json["registered_at"];
//     photoNo = (json["photo_no"] as num).toInt();
//     isRestricted = json["is_restricted"];
//     savableState = json["savable_state"];
//     photoUrl = json["photo_url"];
//     photoThumbnail = json["photo_thumbnail"];
//     originalPostId = json["original_post_id"];
//     contentType = json["content_type"];
//     size = (json["size"] as num).toInt();
//     source = json["source"];
//   }

//   static List<Photo> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => Photo.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     if (author != null) {
//       _data["author"] = author?.toJson();
//     }
//     _data["post_id"] = postId;
//     _data["photo_id"] = photoId;
//     _data["height"] = height;
//     _data["width"] = width;
//     _data["created_at"] = createdAt;
//     _data["post_no"] = postNo;
//     _data["comment_count"] = commentCount;
//     _data["emotion_count"] = emotionCount;
//     _data["registered_at"] = registeredAt;
//     _data["photo_no"] = photoNo;
//     _data["is_restricted"] = isRestricted;
//     _data["savable_state"] = savableState;
//     _data["photo_url"] = photoUrl;
//     _data["photo_thumbnail"] = photoThumbnail;
//     _data["original_post_id"] = originalPostId;
//     _data["content_type"] = contentType;
//     _data["size"] = size;
//     _data["source"] = source;
//     return _data;
//   }

//   @override
//   String toString() => toJson().toString();
// }

// class Author {
//   int? userNo;
//   int? bandNo;
//   String? name;
//   String? profileImageUrl;
//   String? description;
//   String? role;
//   String? memberType;
//   bool? memberCertified;
//   bool? me;
//   String? memberKey;
//   bool? isMuted;
//   String? profileKey;
//   int? createdAt;

//   Author(
//       {this.userNo,
//       this.bandNo,
//       this.name,
//       this.profileImageUrl,
//       this.description,
//       this.role,
//       this.memberType,
//       this.memberCertified,
//       this.me,
//       this.memberKey,
//       this.isMuted,
//       this.profileKey,
//       this.createdAt});

//   Author.fromJson(Map<String, dynamic> json) {
//     userNo = (json["user_no"] as num).toInt();
//     bandNo = (json["band_no"] as num).toInt();
//     name = json["name"];
//     profileImageUrl = json["profile_image_url"];
//     description = json["description"];
//     role = json["role"];
//     memberType = json["member_type"];
//     memberCertified = json["member_certified"];
//     me = json["me"];
//     memberKey = json["member_key"];
//     isMuted = json["is_muted"];
//     profileKey = json["profile_key"];
//     createdAt = (json["created_at"] as num).toInt();
//   }

//   static List<Author> fromList(List<Map<String, dynamic>> list) {
//     return list.map((map) => Author.fromJson(map)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> _data = <String, dynamic>{};
//     _data["user_no"] = userNo;
//     _data["band_no"] = bandNo;
//     _data["name"] = name;
//     _data["profile_image_url"] = profileImageUrl;
//     _data["description"] = description;
//     _data["role"] = role;
//     _data["member_type"] = memberType;
//     _data["member_certified"] = memberCertified;
//     _data["me"] = me;
//     _data["member_key"] = memberKey;
//     _data["is_muted"] = isMuted;
//     _data["profile_key"] = profileKey;
//     _data["created_at"] = createdAt;
//     return _data;
//   }

//   @override
//   String toString() => toJson().toString();
// }
