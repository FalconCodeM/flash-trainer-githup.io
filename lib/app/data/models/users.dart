import 'package:equatable/equatable.dart';

class Users extends Equatable {
  final String userName;
  final List<TrainingModel> training;

  const Users({
    required this.userName,
    required this.training,
  });

  @override
  List<Object?> get props => [userName, training];

  Users copyWith({
    String? userName,
    List<TrainingModel>? training,
  }) {
    return Users(
      userName: userName ?? this.userName,
      training: training ?? this.training,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'training':
          training.map((trainingModel) => trainingModel.toJson()).toList(),
    };
  }

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      userName: json['userName'] as String,
      training: (json['training'] as List)
          .map((trainingJson) => TrainingModel.fromJson(trainingJson))
          .toList(),
    );
  }
}

class TrainingModel extends Equatable {
  final String trainingTime;
  final String trainingDay;
  final int podsUsedCount;
  final List<Pods> pods;

  const TrainingModel({
    required this.trainingTime,
    required this.trainingDay,
    required this.podsUsedCount,
    required this.pods,
  });

  @override
  List<Object?> get props => [trainingTime, trainingDay, podsUsedCount, pods];

  TrainingModel copyWith({
    String? trainingTime,
    String? trainingDay,
    int? podsUsedCount,
    List<Pods>? pods,
  }) {
    return TrainingModel(
      trainingTime: trainingTime ?? this.trainingTime,
      trainingDay: trainingDay ?? this.trainingDay,
      podsUsedCount: podsUsedCount ?? this.podsUsedCount,
      pods: pods ?? this.pods,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'trainingTime': trainingTime,
      'trainingDay': trainingDay,
      'podsUsedCount': podsUsedCount,
      'pods': pods.map((pod) => pod.toJson()).toList(),
    };
  }

  factory TrainingModel.fromJson(Map<String, dynamic> json) {
    return TrainingModel(
      trainingTime: json['trainingTime'] as String,
      trainingDay: json['trainingDay'] as String,
      podsUsedCount: json['podsUsedCount'] as int,
      pods: (json['pods'] as List)
          .map((podJson) => Pods.fromJson(podJson))
          .toList(),
    );
  }
}

class Pods extends Equatable {
  final String wrongTouch;
  final String rightTouch;
  final String averageTime;
  final String podName;
  final String activePods;

  const Pods({
    required this.wrongTouch,
    required this.rightTouch,
    required this.averageTime,
    required this.podName,
    required this.activePods,
  });

  @override
  List<Object?> get props =>
      [wrongTouch, rightTouch, averageTime, podName, activePods];

  Pods copyWith({
    String? wrongTouch,
    String? rightTouch,
    String? averageTime,
    String? podName,
    String? activePods,
  }) {
    return Pods(
      wrongTouch: wrongTouch ?? this.wrongTouch,
      rightTouch: rightTouch ?? this.rightTouch,
      averageTime: averageTime ?? this.averageTime,
      podName: podName ?? this.podName,
      activePods: activePods ?? this.activePods,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'wrongTouch': wrongTouch,
      'rightTouch': rightTouch,
      'averageTime': averageTime,
      'podName': podName,
      'activePods': activePods,
    };
  }

  factory Pods.fromJson(Map<String, dynamic> json) {
    return Pods(
      wrongTouch: json['wrongTouch'] as String,
      rightTouch: json['rightTouch'] as String,
      averageTime: json['averageTime'] as String,
      podName: json['podName'] as String,
      activePods: json['activePods'] ?? "",
    );
  }
}
