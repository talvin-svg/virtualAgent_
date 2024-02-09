class VirtualAgentRequest {
  final String model;
  final String prompt;
  final int maxTokens;
  final double? temperature;
  final int? topP;
  final int? n;
  final bool? stream;
  final int? longprobs;
  final String? stop;

  VirtualAgentRequest({
    required this.model,
    required this.prompt,
    required this.maxTokens,
    required this.temperature,
    this.topP,
    this.n,
    this.stream,
    this.longprobs,
    this.stop,
  });

  VirtualAgentRequest copyWith({
    String? model,
    String? prompt,
    int? maxTokens,
    double? temperature,
    int? topP,
    int? n,
    bool? stream,
    int? longprobs,
    String? stop,
  }) {
    return VirtualAgentRequest(
      model: model ?? this.model,
      prompt: prompt ?? this.prompt,
      maxTokens: maxTokens ?? this.maxTokens,
      temperature: temperature ?? this.temperature,
      topP: topP ?? this.topP,
      n: n ?? this.n,
      stream: stream ?? this.stream,
      longprobs: longprobs ?? this.longprobs,
      stop: stop ?? this.stop,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'model': model,
      'prompt': prompt,
      'maxTokens': maxTokens,
      'temperature': temperature,
      'topP': topP,
      'n': n,
      'stream': stream,
      'longprobs': longprobs,
      'stop': stop,
    };
  }

  factory VirtualAgentRequest.fromMap(Map<String, dynamic> map) {
    return VirtualAgentRequest(
      model: map['model'],
      prompt: map['prompt'],
      maxTokens: map['maxTokens'],
      temperature: map['temperature'],
      topP: map['topP'],
      n: map['n'],
      stream: map['stream'],
      longprobs: map['longprobs'],
      stop: map['stop'],
    );
  }
}
