import 'dart:convert';

import 'package:agentvirtual/api/request_models.dart';
import 'package:agentvirtual/api/response.models.dart';
import 'package:agentvirtual/config.dart';
import 'package:http/http.dart' as http;

class VirtualAgentAPI {
  static Future getResponseFromAgent(String prompt) async {
    String apiKey = Env.apiKey;
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
        headers: headers, body: json.encode(request.toMap()));

    if (response.statusCode == 200) {
      VirtualAgentResponse agent =
          VirtualAgentResponse.fromMap(json.decode(response.body));
      return agent;
    } else {
      return const VirtualAgentResponse(
        id: 'error',
        object: 'error',
        created: 0,
        model: 'error',
        choices: [
          'Error getting response from agent,\n please try again later'
        ],
        usage: {},
        promptTokens: 0,
        completionTokens: 0,
        totalTokens: 0,
        firstCompletion: 'error',
      );
    }
  }
}
