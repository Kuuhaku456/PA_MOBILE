// To parse this JSON data, do
//
//     final animeResponses = animeResponsesFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'anime_responses.g.dart';

AnimeResponses animeResponsesFromJson(String str) => AnimeResponses.fromJson(json.decode(str));

String animeResponsesToJson(AnimeResponses data) => json.encode(data.toJson());

@JsonSerializable()
class AnimeResponses {
    @JsonKey(name: "pagination")
    Pagination pagination;
    @JsonKey(name: "data")
    List<Datum> data;

    AnimeResponses({
        required this.pagination,
        required this.data,
    });

    factory AnimeResponses.fromJson(Map<String, dynamic> json) => _$AnimeResponsesFromJson(json);

    Map<String, dynamic> toJson() => _$AnimeResponsesToJson(this);
}

@JsonSerializable()
class Datum {
    @JsonKey(name: "mal_id")
    int malId;
    @JsonKey(name: "url")
    String url;
    @JsonKey(name: "images")
    Map<String, dynamic> images;
    @JsonKey(name: "trailer")
    Trailer trailer;
    @JsonKey(name: "approved")
    bool approved;
    @JsonKey(name: "titles")
    List<Title> titles;
    @JsonKey(name: "title")
    String title;
    @JsonKey(name: "title_english")
    String titleEnglish;
    @JsonKey(name: "title_japanese")
    String titleJapanese;
    @JsonKey(name: "title_synonyms")
    List<String> titleSynonyms;
    @JsonKey(name: "type")
    DatumType type;
    @JsonKey(name: "source")
    String source;
    @JsonKey(name: "episodes")
    int episodes;
    @JsonKey(name: "status")
    Status status;
    @JsonKey(name: "airing")
    bool airing;
    @JsonKey(name: "aired")
    Aired aired;
    @JsonKey(name: "duration")
    String duration;
    @JsonKey(name: "rating")
    Rating rating;
    @JsonKey(name: "score")
    double score;
    @JsonKey(name: "scored_by")
    int scoredBy;
    @JsonKey(name: "rank")
    int rank;
    @JsonKey(name: "popularity")
    int popularity;
    @JsonKey(name: "members")
    int members;
    @JsonKey(name: "favorites")
    int favorites;
    @JsonKey(name: "synopsis")
    String synopsis;
    @JsonKey(name: "background")
    String? background;
    @JsonKey(name: "season")
    Season? season;
    @JsonKey(name: "year")
    int? year;
    @JsonKey(name: "broadcast")
    Broadcast broadcast;
    @JsonKey(name: "producers")
    List<Demographic> producers;
    @JsonKey(name: "licensors")
    List<Demographic> licensors;
    @JsonKey(name: "studios")
    List<Demographic> studios;
    @JsonKey(name: "genres")
    List<Demographic> genres;
    @JsonKey(name: "explicit_genres")
    List<dynamic> explicitGenres;
    @JsonKey(name: "themes")
    List<Demographic> themes;
    @JsonKey(name: "demographics")
    List<Demographic> demographics;

    Datum({
        required this.malId,
        required this.url,
        required this.images,
        required this.trailer,
        required this.approved,
        required this.titles,
        required this.title,
        required this.titleEnglish,
        required this.titleJapanese,
        required this.titleSynonyms,
        required this.type,
        required this.source,
        required this.episodes,
        required this.status,
        required this.airing,
        required this.aired,
        required this.duration,
        required this.rating,
        required this.score,
        required this.scoredBy,
        required this.rank,
        required this.popularity,
        required this.members,
        required this.favorites,
        required this.synopsis,
        required this.background,
        required this.season,
        required this.year,
        required this.broadcast,
        required this.producers,
        required this.licensors,
        required this.studios,
        required this.genres,
        required this.explicitGenres,
        required this.themes,
        required this.demographics,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => _$DatumFromJson(json);

    Map<String, dynamic> toJson() => _$DatumToJson(this);
}

@JsonSerializable()
class Aired {
    @JsonKey(name: "from")
    DateTime from;
    @JsonKey(name: "to")
    DateTime? to;
    @JsonKey(name: "prop")
    Prop prop;
    @JsonKey(name: "string")
    String string;

    Aired({
        required this.from,
        required this.to,
        required this.prop,
        required this.string,
    });

    factory Aired.fromJson(Map<String, dynamic> json) => _$AiredFromJson(json);

    Map<String, dynamic> toJson() => _$AiredToJson(this);
}

@JsonSerializable()
class Prop {
    @JsonKey(name: "from")
    From from;
    @JsonKey(name: "to")
    From to;

    Prop({
        required this.from,
        required this.to,
    });

    factory Prop.fromJson(Map<String, dynamic> json) => _$PropFromJson(json);

    Map<String, dynamic> toJson() => _$PropToJson(this);
}

@JsonSerializable()
class From {
    @JsonKey(name: "day")
    int? day;
    @JsonKey(name: "month")
    int? month;
    @JsonKey(name: "year")
    int? year;

    From({
        required this.day,
        required this.month,
        required this.year,
    });

    factory From.fromJson(Map<String, dynamic> json) => _$FromFromJson(json);

    Map<String, dynamic> toJson() => _$FromToJson(this);
}

@JsonSerializable()
class Broadcast {
    @JsonKey(name: "day")
    String? day;
    @JsonKey(name: "time")
    String? time;
    @JsonKey(name: "timezone")
    Timezone? timezone;
    @JsonKey(name: "string")
    String? string;

    Broadcast({
        required this.day,
        required this.time,
        required this.timezone,
        required this.string,
    });

    factory Broadcast.fromJson(Map<String, dynamic> json) => _$BroadcastFromJson(json);

    Map<String, dynamic> toJson() => _$BroadcastToJson(this);
}

enum Timezone {
    @JsonValue("Asia/Tokyo")
    ASIA_TOKYO
}

final timezoneValues = EnumValues({
    "Asia/Tokyo": Timezone.ASIA_TOKYO
});

@JsonSerializable()
class Demographic {
    @JsonKey(name: "mal_id")
    int malId;
    @JsonKey(name: "type")
    DemographicType type;
    @JsonKey(name: "name")
    String name;
    @JsonKey(name: "url")
    String url;

    Demographic({
        required this.malId,
        required this.type,
        required this.name,
        required this.url,
    });

    factory Demographic.fromJson(Map<String, dynamic> json) => _$DemographicFromJson(json);

    Map<String, dynamic> toJson() => _$DemographicToJson(this);
}

enum DemographicType {
    @JsonValue("anime")
    ANIME
}

final demographicTypeValues = EnumValues({
    "anime": DemographicType.ANIME
});

@JsonSerializable()
class Image {
    @JsonKey(name: "image_url")
    String imageUrl;
    @JsonKey(name: "small_image_url")
    String smallImageUrl;
    @JsonKey(name: "large_image_url")
    String largeImageUrl;

    Image({
        required this.imageUrl,
        required this.smallImageUrl,
        required this.largeImageUrl,
    });

    factory Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

    Map<String, dynamic> toJson() => _$ImageToJson(this);
}

enum Rating {
    @JsonValue("PG-13 - Teens 13 or older")
    PG_13_TEENS_13_OR_OLDER,
    @JsonValue("R - 17+ (violence & profanity)")
    R_17_VIOLENCE_PROFANITY,
    @JsonValue("R+ - Mild Nudity")
    R_MILD_NUDITY
}

final ratingValues = EnumValues({
    "PG-13 - Teens 13 or older": Rating.PG_13_TEENS_13_OR_OLDER,
    "R - 17+ (violence & profanity)": Rating.R_17_VIOLENCE_PROFANITY,
    "R+ - Mild Nudity": Rating.R_MILD_NUDITY
});

enum Season {
    @JsonValue("fall")
    FALL,
    @JsonValue("spring")
    SPRING,
    @JsonValue("summer")
    SUMMER,
    @JsonValue("winter")
    WINTER
}

final seasonValues = EnumValues({
    "fall": Season.FALL,
    "spring": Season.SPRING,
    "summer": Season.SUMMER,
    "winter": Season.WINTER
});

enum Status {
    @JsonValue("Currently Airing")
    CURRENTLY_AIRING,
    @JsonValue("Finished Airing")
    FINISHED_AIRING
}

final statusValues = EnumValues({
    "Currently Airing": Status.CURRENTLY_AIRING,
    "Finished Airing": Status.FINISHED_AIRING
});

@JsonSerializable()
class Title {
    @JsonKey(name: "type")
    TitleType type;
    @JsonKey(name: "title")
    String title;

    Title({
        required this.type,
        required this.title,
    });

    factory Title.fromJson(Map<String, dynamic> json) => _$TitleFromJson(json);

    Map<String, dynamic> toJson() => _$TitleToJson(this);
}

enum TitleType {
    @JsonValue("Default")
    DEFAULT,
    @JsonValue("English")
    ENGLISH,
    @JsonValue("French")
    FRENCH,
    @JsonValue("German")
    GERMAN,
    @JsonValue("Japanese")
    JAPANESE,
    @JsonValue("Spanish")
    SPANISH,
    @JsonValue("Synonym")
    SYNONYM
}

final titleTypeValues = EnumValues({
    "Default": TitleType.DEFAULT,
    "English": TitleType.ENGLISH,
    "French": TitleType.FRENCH,
    "German": TitleType.GERMAN,
    "Japanese": TitleType.JAPANESE,
    "Spanish": TitleType.SPANISH,
    "Synonym": TitleType.SYNONYM
});

@JsonSerializable()
class Trailer {
    @JsonKey(name: "youtube_id")
    String? youtubeId;
    @JsonKey(name: "url")
    String? url;
    @JsonKey(name: "embed_url")
    String? embedUrl;
    @JsonKey(name: "images")
    Images images;

    Trailer({
        required this.youtubeId,
        required this.url,
        required this.embedUrl,
        required this.images,
    });

    factory Trailer.fromJson(Map<String, dynamic> json) => _$TrailerFromJson(json);

    Map<String, dynamic> toJson() => _$TrailerToJson(this);
}

@JsonSerializable()
class Images {
    @JsonKey(name: "image_url")
    String? imageUrl;
    @JsonKey(name: "small_image_url")
    String? smallImageUrl;
    @JsonKey(name: "medium_image_url")
    String? mediumImageUrl;
    @JsonKey(name: "large_image_url")
    String? largeImageUrl;
    @JsonKey(name: "maximum_image_url")
    String? maximumImageUrl;

    Images({
        required this.imageUrl,
        required this.smallImageUrl,
        required this.mediumImageUrl,
        required this.largeImageUrl,
        required this.maximumImageUrl,
    });

    factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);

    Map<String, dynamic> toJson() => _$ImagesToJson(this);
}

enum DatumType {
    @JsonValue("Movie")
    MOVIE,
    @JsonValue("OVA")
    OVA,
    @JsonValue("Special")
    SPECIAL,
    @JsonValue("TV")
    TV
}

final datumTypeValues = EnumValues({
    "Movie": DatumType.MOVIE,
    "OVA": DatumType.OVA,
    "Special": DatumType.SPECIAL,
    "TV": DatumType.TV
});

@JsonSerializable()
class Pagination {
    @JsonKey(name: "last_visible_page")
    int lastVisiblePage;
    @JsonKey(name: "has_next_page")
    bool hasNextPage;
    @JsonKey(name: "current_page")
    int currentPage;
    @JsonKey(name: "items")
    Items items;

    Pagination({
        required this.lastVisiblePage,
        required this.hasNextPage,
        required this.currentPage,
        required this.items,
    });

    factory Pagination.fromJson(Map<String, dynamic> json) => _$PaginationFromJson(json);

    Map<String, dynamic> toJson() => _$PaginationToJson(this);
}

@JsonSerializable()
class Items {
    @JsonKey(name: "count")
    int count;
    @JsonKey(name: "total")
    int total;
    @JsonKey(name: "per_page")
    int perPage;

    Items({
        required this.count,
        required this.total,
        required this.perPage,
    });

    factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

    Map<String, dynamic> toJson() => _$ItemsToJson(this);
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
