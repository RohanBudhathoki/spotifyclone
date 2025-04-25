import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spotifyclone/core/error/exception.dart';
import 'package:spotifyclone/features/home/data/models/songs_model.dart';

abstract interface class SongRemoteDataSource {
  Stream<List<SongModel>> getSong();
}

class SongDataSource implements SongRemoteDataSource {
  final FirebaseFirestore firestore;

  SongDataSource(this.firestore);

  @override
  Stream<List<SongModel>> getSong() {
    try {
      final songSttream = firestore.collection('songs').snapshots().map((
        snapshot,
      ) {
        return snapshot.docs.map((doc) {
          final data = doc.data();

          return SongModel.fromMap(data);
        }).toList();
      });

      songSttream.listen((songlist) {
        if (songlist.isNotEmpty) {}
      });

      return songSttream;
    } catch (e) {
      throw ServerException('Error fetching tasks: ${e.toString()}');
    }
  }
}
