import 'package:audioplayers/audioplayers.dart';

class MyAudioPlayer {
  // Singleton instance code
  static final MyAudioPlayer _instance = MyAudioPlayer._();
  static MyAudioPlayer get instance => _instance;
  MyAudioPlayer._();

  final AudioCache _audioCache = AudioCache(prefix: 'lib/assets/audio/');

  Future<void> init() => _audioCache.loadAll([
        'applause.mp3',
        'receive.mp3',
        'sent.mp3',
        'failed.mp3',
        'tap.mp3',
        'success.wav',
      ]);

  Future<AudioPlayer> playMessageSent() => _audioCache.play('sent.mp3');

  Future<AudioPlayer> playMessageReceived() => _audioCache.play('receive.mp3');

  Future<AudioPlayer> playApplause() => _audioCache.play('applause.mp3');
  Future<AudioPlayer> playLevelFailed() => _audioCache.play('failed.mp3');
  Future<AudioPlayer> playSuccess() => _audioCache.play('success.wav');
  Future<AudioPlayer> playButtonTap() => _audioCache.play('tap.mp3');
}
