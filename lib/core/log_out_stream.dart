import 'dart:async';

class LogoutStream {
  final StreamController<String> _controller =
      StreamController<String>.broadcast();

  void addEvent(String event) {
    _controller.sink.add(event);
  }

  Stream<String> get stream => _controller.stream;

  void dispose() {
    _controller.close();
  }
}
