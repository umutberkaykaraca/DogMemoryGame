class GameData {
  final int? id;
  final int score;
  final int move;
  final String time;
  final String mode;

  GameData({
    this.id,
    required this.score,
    required this.move,
    required this.time,
    required this.mode,
  });

  GameData.fromMap(Map<String, dynamic> res)
      : id = res["id"],
        score = res["score"],
        move = res["move"],
        time = res["time"],
        mode = res["mode"];

  Map<String, Object?> toMap() {
    return {'id': id, 'score': score, 'move': move, 'time': time, 'mode': mode};
  }
}
