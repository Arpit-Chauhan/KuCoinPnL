import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';

class SocketManager {
  late IOWebSocketChannel _channel;
  late Timer _pingTimer;
  late String _connectId;

  void connect(String token) {
    final endpoint = 'wss://ws-api-spot.kucoin.com/';
    _channel = IOWebSocketChannel.connect('$endpoint?token=$token');
    _channel.stream.listen(_onData, onDone: onDone, onError: _onError);
  }

  void startPing(String connectId, int pingInterval) {
    _connectId = connectId;
    final pingDuration = Duration(seconds: pingInterval);

    _pingTimer = Timer.periodic(pingDuration, (_) {
      _sendPing();
    });
  }

  void _sendPing() {
    final pingMessage = json.encode({'id': _connectId, 'type': 'ping'});
    _channel.sink.add(pingMessage);
    print('Sent ping message with id: $_connectId');
  }

  void _onData(dynamic message) {
    final decodedMessage = json.decode(message);
    final type = decodedMessage['type'];

    if (type == 'pong') {
      print('Received pong message with id: ${decodedMessage['id']}');
    } else if (type == 'ping') {
      _sendPong(decodedMessage['id']);
    } else if (type == 'welcome') {
      print('Received welcome message with id: ${decodedMessage['id']}');
      // Start the ping mechanism after receiving the welcome message
      startPing(decodedMessage['id'], 10); // Change 10 to your desired ping interval
    } else if (type == 'message') {
      print('Received subscribed message with data: ${decodedMessage['subject']}');
      print('Received subscribed message with price: ${decodedMessage['data']['price']}');
    }
  }

  void _sendPong(String id) {
    final pongMessage = json.encode({'id': id, 'type': 'pong'});
    _channel.sink.add(pongMessage);
    print('Sent pong message with id: $id');
  }

  void onDone() {
    print('CLOSING');
    _pingTimer.cancel();
    _channel.sink.close();
  }

  void _onError(error) {
    print('WebSocket error occurred: $error');
  }

  void subscribeToTopics(List<String> topics) {
    final subscribeMessage = {
      'id': DateTime.now().millisecondsSinceEpoch, // Unique ID for the subscription
      'type': 'subscribe',
      'topic': topics.join(','), // Concatenate topics with a comma
      'privateChannel': false,
      'response': false,
    };

    final message = json.encode(subscribeMessage);
    _channel.sink.add(message);
    print('Subscribed to topics: $topics');
  }
}
