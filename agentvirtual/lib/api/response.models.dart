class VirtualAgentResponse {
  final String? id;
  final String object;
  final int? created;
  final String? model;
  final List<dynamic>? choices; // This list contains the completions
  final Map<String, dynamic>? usage;
  final int? promptTokens;
  final int? completionTokens;
  final int? totalTokens;
  final String? firstCompletion;

  const VirtualAgentResponse({
    required this.id,
    required this.object,
    required this.created,
    required this.model,
    required this.choices,
    required this.usage,
    required this.promptTokens,
    required this.completionTokens,
    required this.totalTokens,
    required this.firstCompletion,
  });

  VirtualAgentResponse copyWith({
    String? id,
    String? object,
    int? created,
    String? model,
    List<dynamic>? choices,
    Map<String, dynamic>? usage,
    int? promptTokens,
    int? completionTokens,
    int? totalTokens,
    String? firstCompletion,
  }) {
    return VirtualAgentResponse(
      id: id ?? this.id,
      object: object ?? this.object,
      created: created ?? this.created,
      model: model ?? this.model,
      choices: choices ?? this.choices,
      usage: usage ?? this.usage,
      promptTokens: promptTokens ?? this.promptTokens,
      completionTokens: completionTokens ?? this.completionTokens,
      totalTokens: totalTokens ?? this.totalTokens,
      firstCompletion: firstCompletion ?? this.firstCompletion,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'object': object,
      'created': created,
      'model': model,
      'choices': choices,
      'usage': usage,
      'promptTokens': promptTokens,
      'completionTokens': completionTokens,
      'totalTokens': totalTokens,
      'firstCompletion': firstCompletion,
    };
  }

  factory VirtualAgentResponse.fromMap(Map<String, dynamic> map) {
    return VirtualAgentResponse(
      id: map['id'],
      object: map['object'],
      created: map['created'],
      model: map['model'],
      choices: map['choices'],
      usage: map['usage'],
      promptTokens: map['promptTokens'],
      completionTokens: map['completionTokens'],
      totalTokens: map['totalTokens'],
      firstCompletion: map['firstCompletion'],
    );
  }
}
