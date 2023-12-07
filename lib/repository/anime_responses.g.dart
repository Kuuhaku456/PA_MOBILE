// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'anime_responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnimeResponses _$AnimeResponsesFromJson(Map<String, dynamic> json) =>
    AnimeResponses(
      pagination:
          Pagination.fromJson(json['pagination'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Datum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AnimeResponsesToJson(AnimeResponses instance) =>
    <String, dynamic>{
      'pagination': instance.pagination,
      'data': instance.data,
    };

Datum _$DatumFromJson(Map<String, dynamic> json) => Datum(
      malId: json['mal_id'] as int,
      url: json['url'] as String,
      images: json['images'] as Map<String, dynamic>,
      trailer: Trailer.fromJson(json['trailer'] as Map<String, dynamic>),
      approved: json['approved'] as bool,
      titles: (json['titles'] as List<dynamic>)
          .map((e) => Title.fromJson(e as Map<String, dynamic>))
          .toList(),
      title: json['title'] as String,
      titleEnglish: json['title_english'] as String,
      titleJapanese: json['title_japanese'] as String,
      titleSynonyms: (json['title_synonyms'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      type: $enumDecode(_$DatumTypeEnumMap, json['type']),
      source: json['source'] as String,
      episodes: json['episodes'] as int,
      status: $enumDecode(_$StatusEnumMap, json['status']),
      airing: json['airing'] as bool,
      aired: Aired.fromJson(json['aired'] as Map<String, dynamic>),
      duration: json['duration'] as String,
      rating: $enumDecode(_$RatingEnumMap, json['rating']),
      score: (json['score'] as num).toDouble(),
      scoredBy: json['scored_by'] as int,
      rank: json['rank'] as int,
      popularity: json['popularity'] as int,
      members: json['members'] as int,
      favorites: json['favorites'] as int,
      synopsis: json['synopsis'] as String,
      background: json['background'] as String?,
      season: $enumDecodeNullable(_$SeasonEnumMap, json['season']),
      year: json['year'] as int?,
      broadcast: Broadcast.fromJson(json['broadcast'] as Map<String, dynamic>),
      producers: (json['producers'] as List<dynamic>)
          .map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
      licensors: (json['licensors'] as List<dynamic>)
          .map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
      studios: (json['studios'] as List<dynamic>)
          .map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>)
          .map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
      explicitGenres: json['explicit_genres'] as List<dynamic>,
      themes: (json['themes'] as List<dynamic>)
          .map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
      demographics: (json['demographics'] as List<dynamic>)
          .map((e) => Demographic.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DatumToJson(Datum instance) => <String, dynamic>{
      'mal_id': instance.malId,
      'url': instance.url,
      'images': instance.images,
      'trailer': instance.trailer,
      'approved': instance.approved,
      'titles': instance.titles,
      'title': instance.title,
      'title_english': instance.titleEnglish,
      'title_japanese': instance.titleJapanese,
      'title_synonyms': instance.titleSynonyms,
      'type': _$DatumTypeEnumMap[instance.type]!,
      'source': instance.source,
      'episodes': instance.episodes,
      'status': _$StatusEnumMap[instance.status]!,
      'airing': instance.airing,
      'aired': instance.aired,
      'duration': instance.duration,
      'rating': _$RatingEnumMap[instance.rating]!,
      'score': instance.score,
      'scored_by': instance.scoredBy,
      'rank': instance.rank,
      'popularity': instance.popularity,
      'members': instance.members,
      'favorites': instance.favorites,
      'synopsis': instance.synopsis,
      'background': instance.background,
      'season': _$SeasonEnumMap[instance.season],
      'year': instance.year,
      'broadcast': instance.broadcast,
      'producers': instance.producers,
      'licensors': instance.licensors,
      'studios': instance.studios,
      'genres': instance.genres,
      'explicit_genres': instance.explicitGenres,
      'themes': instance.themes,
      'demographics': instance.demographics,
    };

const _$DatumTypeEnumMap = {
  DatumType.MOVIE: 'Movie',
  DatumType.OVA: 'OVA',
  DatumType.SPECIAL: 'Special',
  DatumType.TV: 'TV',
};

const _$StatusEnumMap = {
  Status.CURRENTLY_AIRING: 'Currently Airing',
  Status.FINISHED_AIRING: 'Finished Airing',
};

const _$RatingEnumMap = {
  Rating.PG_13_TEENS_13_OR_OLDER: 'PG-13 - Teens 13 or older',
  Rating.R_17_VIOLENCE_PROFANITY: 'R - 17+ (violence & profanity)',
  Rating.R_MILD_NUDITY: 'R+ - Mild Nudity',
};

const _$SeasonEnumMap = {
  Season.FALL: 'fall',
  Season.SPRING: 'spring',
  Season.SUMMER: 'summer',
  Season.WINTER: 'winter',
};

Aired _$AiredFromJson(Map<String, dynamic> json) => Aired(
      from: DateTime.parse(json['from'] as String),
      to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
      prop: Prop.fromJson(json['prop'] as Map<String, dynamic>),
      string: json['string'] as String,
    );

Map<String, dynamic> _$AiredToJson(Aired instance) => <String, dynamic>{
      'from': instance.from.toIso8601String(),
      'to': instance.to?.toIso8601String(),
      'prop': instance.prop,
      'string': instance.string,
    };

Prop _$PropFromJson(Map<String, dynamic> json) => Prop(
      from: From.fromJson(json['from'] as Map<String, dynamic>),
      to: From.fromJson(json['to'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PropToJson(Prop instance) => <String, dynamic>{
      'from': instance.from,
      'to': instance.to,
    };

From _$FromFromJson(Map<String, dynamic> json) => From(
      day: json['day'] as int?,
      month: json['month'] as int?,
      year: json['year'] as int?,
    );

Map<String, dynamic> _$FromToJson(From instance) => <String, dynamic>{
      'day': instance.day,
      'month': instance.month,
      'year': instance.year,
    };

Broadcast _$BroadcastFromJson(Map<String, dynamic> json) => Broadcast(
      day: json['day'] as String?,
      time: json['time'] as String?,
      timezone: $enumDecodeNullable(_$TimezoneEnumMap, json['timezone']),
      string: json['string'] as String?,
    );

Map<String, dynamic> _$BroadcastToJson(Broadcast instance) => <String, dynamic>{
      'day': instance.day,
      'time': instance.time,
      'timezone': _$TimezoneEnumMap[instance.timezone],
      'string': instance.string,
    };

const _$TimezoneEnumMap = {
  Timezone.ASIA_TOKYO: 'Asia/Tokyo',
};

Demographic _$DemographicFromJson(Map<String, dynamic> json) => Demographic(
      malId: json['mal_id'] as int,
      type: $enumDecode(_$DemographicTypeEnumMap, json['type']),
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$DemographicToJson(Demographic instance) =>
    <String, dynamic>{
      'mal_id': instance.malId,
      'type': _$DemographicTypeEnumMap[instance.type]!,
      'name': instance.name,
      'url': instance.url,
    };

const _$DemographicTypeEnumMap = {
  DemographicType.ANIME: 'anime',
};

Image _$ImageFromJson(Map<String, dynamic> json) => Image(
      imageUrl: json['image_url'] as String,
      smallImageUrl: json['small_image_url'] as String,
      largeImageUrl: json['large_image_url'] as String,
    );

Map<String, dynamic> _$ImageToJson(Image instance) => <String, dynamic>{
      'image_url': instance.imageUrl,
      'small_image_url': instance.smallImageUrl,
      'large_image_url': instance.largeImageUrl,
    };

Title _$TitleFromJson(Map<String, dynamic> json) => Title(
      type: $enumDecode(_$TitleTypeEnumMap, json['type']),
      title: json['title'] as String,
    );

Map<String, dynamic> _$TitleToJson(Title instance) => <String, dynamic>{
      'type': _$TitleTypeEnumMap[instance.type]!,
      'title': instance.title,
    };

const _$TitleTypeEnumMap = {
  TitleType.DEFAULT: 'Default',
  TitleType.ENGLISH: 'English',
  TitleType.FRENCH: 'French',
  TitleType.GERMAN: 'German',
  TitleType.JAPANESE: 'Japanese',
  TitleType.SPANISH: 'Spanish',
  TitleType.SYNONYM: 'Synonym',
};

Trailer _$TrailerFromJson(Map<String, dynamic> json) => Trailer(
      youtubeId: json['youtube_id'] as String?,
      url: json['url'] as String?,
      embedUrl: json['embed_url'] as String?,
      images: Images.fromJson(json['images'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrailerToJson(Trailer instance) => <String, dynamic>{
      'youtube_id': instance.youtubeId,
      'url': instance.url,
      'embed_url': instance.embedUrl,
      'images': instance.images,
    };

Images _$ImagesFromJson(Map<String, dynamic> json) => Images(
      imageUrl: json['image_url'] as String?,
      smallImageUrl: json['small_image_url'] as String?,
      mediumImageUrl: json['medium_image_url'] as String?,
      largeImageUrl: json['large_image_url'] as String?,
      maximumImageUrl: json['maximum_image_url'] as String?,
    );

Map<String, dynamic> _$ImagesToJson(Images instance) => <String, dynamic>{
      'image_url': instance.imageUrl,
      'small_image_url': instance.smallImageUrl,
      'medium_image_url': instance.mediumImageUrl,
      'large_image_url': instance.largeImageUrl,
      'maximum_image_url': instance.maximumImageUrl,
    };

Pagination _$PaginationFromJson(Map<String, dynamic> json) => Pagination(
      lastVisiblePage: json['last_visible_page'] as int,
      hasNextPage: json['has_next_page'] as bool,
      currentPage: json['current_page'] as int,
      items: Items.fromJson(json['items'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaginationToJson(Pagination instance) =>
    <String, dynamic>{
      'last_visible_page': instance.lastVisiblePage,
      'has_next_page': instance.hasNextPage,
      'current_page': instance.currentPage,
      'items': instance.items,
    };

Items _$ItemsFromJson(Map<String, dynamic> json) => Items(
      count: json['count'] as int,
      total: json['total'] as int,
      perPage: json['per_page'] as int,
    );

Map<String, dynamic> _$ItemsToJson(Items instance) => <String, dynamic>{
      'count': instance.count,
      'total': instance.total,
      'per_page': instance.perPage,
    };
