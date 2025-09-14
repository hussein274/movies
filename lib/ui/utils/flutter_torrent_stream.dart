import 'dart:async';
import 'package:flutter/services.dart';

class FlutterTorrentStreamer {
  static const MethodChannel _channel =
  MethodChannel('flutter_torrent_streamer');

  /// Start torrent download and return playable URL
  static Future<String?> start(String torrentUrl) async {
    final String? streamUrl =
    await _channel.invokeMethod<String>('start', {"torrentUrl": torrentUrl});
    return streamUrl;
  }

  /// Stop torrent download / streaming
  static Future<void> stop() async {
    await _channel.invokeMethod('stop');
  }

  /// Optional: get progress in percentage
  static Future<double?> progress() async {
    final double? p = await _channel.invokeMethod<double>('progress');
    return p;
  }
}