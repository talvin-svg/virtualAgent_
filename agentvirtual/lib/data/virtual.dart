import 'dart:convert';

import 'package:agentvirtual/api/request_models.dart';
import 'package:agentvirtual/api/response.models.dart';
import 'package:http/http.dart' as http;

class VirtualAgentAPI {
  static Future getResponseFromAgent(String prompt) async {
    String apiKey = "";
    final headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": "Bearer $apiKey"
    };

    VirtualAgentRequest request = VirtualAgentRequest(
      model: 'gpt-3.5-turbo',
      prompt: prompt,
      maxTokens: 150,
      temperature: 0.7,
      topP: 1,
      n: 1,
      stream: false,
      longprobs: null,
      stop: null,
    );
    final Uri virtualAgentEndpoint =
        Uri.parse('https://api.openai.com/v1/completions');

    http.Response response = await http.post(virtualAgentEndpoint,
        headers: headers, body: request.toMap());

    if (response.statusCode == 200) {
      VirtualAgentResponse.fromMap(json.decode(response.body));
    } else {
      throw Exception('Failed to get response from agent');
    }
  }
}