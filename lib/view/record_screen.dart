import 'package:ai/viewModel/controllers/audio_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RecordPage extends StatelessWidget {
  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final AudioProvider audioProvider = Get.put(AudioProvider());

    return Center(
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '6th Class, 5th Semester',
              style: TextStyle(fontSize: 25),
            ),
            Text(
              'Artificial Intelligence',
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            Stack(
              children: [
                CircleAvatar(
                  backgroundColor: Color(0xffC16363),
                  radius: height * 0.15,
                ),
                Positioned(
                  top: height * 0.09,
                  left: height * 0.09,
                  child: InkWell(
                    onTap: audioProvider.isStart.value
                        ? audioProvider.startRecording
                        : audioProvider.stopRecording,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: height * 0.06,
                      child: Text(
                        audioProvider.isStart.value ? 'START' : 'STOP',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: height * 0.036,
            ),
            Obx(
              () => Text(
                '${(audioProvider.elapsedTime.value.inMinutes % 60).toString().padLeft(2, '0')}:${(audioProvider.elapsedTime.value.inSeconds % 60).toString().padLeft(2, '0')}',
                style: const TextStyle(fontSize: 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
