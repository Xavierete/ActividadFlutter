import 'dart:math';

class Game {
  static final int MIN_VALUE = 0;
  static final int MAX_VALUE = 100;

  int _targetValue = 0;
  int _points = 0;
  int _score = 0;
  int _rounds = 0;  
  List<Map<String, dynamic>> _attempts = [];

  int get score => _score;
  int get rounds => _rounds;
  int get targetValue => _targetValue;
  int get points => _points;
  List<Map<String, dynamic>> get attempts => _attempts;

  Game() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
  }

  void calculatePoints(double sliderValue) {
    int sliderValueInt = sliderValue.round().toInt();
    int difference = (_targetValue - sliderValueInt).abs();
    _points = (MAX_VALUE - difference);
    _score += _points;
    _rounds++;
    
    // Guardo el intento actual
    _attempts.add({
      'value': sliderValueInt,
      'points': _points,
    });
    
    // Limito a los 2 últimos intentos
    if (_attempts.length > 2) {
      _attempts.removeAt(0);
    }
  }

  void reset() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
    _points = 0;
  }

  void restartGame() {
    _targetValue = Random().nextInt(MAX_VALUE + 1 - MIN_VALUE) + MIN_VALUE;
    _points = 0;
    _score = 0;
    _rounds = 0;
    _attempts = [];
  }
}
