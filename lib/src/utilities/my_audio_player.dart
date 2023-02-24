import 'package:just_audio/just_audio.dart';

class MyAudioPlayer {
  // Singleton instance code
  static final MyAudioPlayer _instance = MyAudioPlayer._();
  static MyAudioPlayer get instance => _instance;
  MyAudioPlayer._();
  static const assetPrefix = 'lib/assets/audio';
  bool isInitialized = false;

  final _sentPlayer = AudioPlayer();
  final _receivePlayer = AudioPlayer();
  final _applausePlayer = AudioPlayer();
  final _failedPlayer = AudioPlayer();
  final _successPlayer = AudioPlayer();
  final _tapPlayer = AudioPlayer();

  Future<void> init() async {
    if (isInitialized) return Future.value();

    _sentPlayer.setAudioSource(AudioSource.asset('$assetPrefix/sent.mp3'));
    _receivePlayer
        .setAudioSource(AudioSource.asset('$assetPrefix/receive.mp3'));
    _applausePlayer
        .setAudioSource(AudioSource.asset('$assetPrefix/applause.mp3'));
    _failedPlayer.setAudioSource(AudioSource.asset('$assetPrefix/failed.mp3'));
    _successPlayer
        .setAudioSource(AudioSource.asset('$assetPrefix/success.wav'));
    await _tapPlayer.setAudioSource(AudioSource.asset('$assetPrefix/tap.mp3'));
    await Future.delayed(const Duration(seconds: 2));
    isInitialized = true;
  }

  void playMessageSent() {
    _sentPlayer.play();
    _sentPlayer.load();
  }

  void playMessageReceived() {
    _receivePlayer.play();
    _receivePlayer.load();
  }

  void playApplause() {
    _applausePlayer.play();
    _applausePlayer.load();
  }

  void playLevelFailed() {
    _failedPlayer.play();
    _failedPlayer.load();
  }

  void playSuccess() {
    _successPlayer.play();
    _successPlayer.load();
  }

  void playButtonTap() {
    _tapPlayer.play();
    _tapPlayer.load();
  }
}
