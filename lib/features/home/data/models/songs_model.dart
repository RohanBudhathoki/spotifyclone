import 'dart:convert';

import 'package:spotifyclone/features/home/domain/entity/songs_entity.dart';

class SongModel extends Song {
  SongModel({
    required super.title,
    required super.artist,
    required super.coverArt,
    required super.audioUrl,
    required super.duration,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'artist': artist,
      'duration': duration,
      'audio': audioUrl,
      'cover_art': coverArt,
    };
  }

  factory SongModel.fromMap(Map<String, dynamic> map) {
    return SongModel(
      title: map['title'] as String,
      artist: map['artist'] as String,
      duration: map['duration'] as String,
      audioUrl: map['audio'] as String,
      coverArt: map['cover_art'] as String,
    );
  }

  SongModel copyWith({
    String? title,
    String? artist,
    String? duration,
    String? audioUrl,
    String? coverArt,
  }) {
    return SongModel(
      title: title ?? this.title,
      artist: artist ?? this.artist,
      duration: duration ?? this.duration,
      audioUrl: audioUrl ?? this.audioUrl,
      coverArt: coverArt ?? this.coverArt,
    );
  }

  Map<String, dynamic> toJson() => toMap();

  factory SongModel.fromJson(String source) =>
      SongModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
