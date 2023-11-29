import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart' show debugPrint;
import 'package:flutter_sound/flutter_sound.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:path_provider/path_provider.dart';

class AudioProvider extends GetxController {
  RxBool isStart = false.obs;
  RxBool isRunning = false.obs;
  RxBool isRecording = false.obs;
  String _audioFilePath = '';

  FlutterSoundRecorder _audioRecorder = FlutterSoundRecorder();
  Rx<Duration> elapsedTime = Duration(seconds: 0).obs;

  Future<void> startRecording() async {
    isStart.value = !isStart.value;
    if (isRunning.value) {
      isRunning.value = false;
    } else {
      isRunning.value = true;
      _updateElapsedTime();
    }

    Directory appDocDir = await getApplicationDocumentsDirectory();
    _audioFilePath =
        '${appDocDir.path}/my_audio_file.mp3'; 
    await _audioRecorder.startRecorder(
      toFile: _audioFilePath,
      codec: Codec.mp3,
    );
    isRecording.value = true;

    debugPrint('Start');
  }

  Future<void> stopRecording() async {
    isStart.value = !isStart.value;
    isRunning.value = false;
    elapsedTime.value = Duration(seconds: 0);

    await _audioRecorder.stopRecorder();

    debugPrint('stop');
  }

  void _updateElapsedTime() {
    const oneSecond = Duration(seconds: 1);

    Timer.periodic(oneSecond, (timer) {
      if (isRunning.value) {
        elapsedTime.value += oneSecond;
      } else {
        timer.cancel();
      }
    });
  }
}
