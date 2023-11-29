import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  Future<void> sendAudioFile(_audioPath) async {
    if (_audioPath.isNotEmpty) {
      File audioFile = File(_audioPath);

      if (audioFile.existsSync()) {
        Uri apiUrl = Uri.parse('YOUR_API_ENDPOINT');

        var request = http.MultipartRequest('POST', apiUrl);
        request.files.add(
          await http.MultipartFile.fromPath('audio', audioFile.path),
        );

        try {
          var response = await request.send();
          if (response.statusCode == 200) {
            print('Audio file sent successfully.');
          } else {
            print(
                'Failed to send audio file. Status code: ${response.statusCode}');
          }
        } catch (error) {
          print('Error sending audio file: $error');
        }
      }
    }
  }
}
