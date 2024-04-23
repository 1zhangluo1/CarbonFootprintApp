class Record {
  int id;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  num calculateResult;
  String useType;
  String useName;
  num useCounts;
  String remedialMeasure;
  int userId;

  Record({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.deletedAt,
    required this.calculateResult,
    required this.useType,
    required this.useName,
    required this.useCounts,
    required this.remedialMeasure,
    required this.userId,
  });

  factory Record.fromJson(Map<String, dynamic> json) {
    return Record(
      id: json['omitempty']['ID'],
      createdAt: json['omitempty']['CreatedAt'],
      updatedAt: json['omitempty']['UpdatedAt'],
      deletedAt: json['omitempty']['DeletedAt'],
      calculateResult: json['calculate_result'],
      useType: json['use_type'],
      useName: json['use_name'],
      useCounts: json['use_counts'],
      remedialMeasure: json['remedial_measure'],
      userId: json['user_id'],
    );
  }
}
