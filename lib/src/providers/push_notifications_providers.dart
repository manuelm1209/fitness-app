import 'dart:io';
import 'dart:async';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _mensajesStreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes => _mensajesStreamController.stream;
  final _mensajes2StreamController = StreamController<String>.broadcast();
  Stream<String> get mensajes2 => _mensajes2StreamController.stream;

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token) {
      //Para pruebas de notifications (TOKEN)
      //print('===== FCM Token =====');
      //print(token);
    });

    _firebaseMessaging.configure(
      // ignore: missing_return
      onMessage: (info) {
        //Para pruebas de Notifications (onMessage):
        //print('===== On Message =====');
        //print(info);

        String argumento = 'no-data';
        if (Platform.isAndroid) {
          argumento = info['data']['Clave'] ?? 'no-data';
        } else {
          argumento = info['data']['Clave'] ?? 'no-data-ios';
        }

        _mensajesStreamController.sink.add(argumento);
      },
      // ignore: missing_return
      onLaunch: (info) {
        //Para pruebas de Notifications (onLaunch):
        //print('===== On Launch =====');
        //print(info);

        String argumento = 'no-data';
        if (Platform.isAndroid) {
          argumento = info['data']['Clave'] ?? 'no-data';
        } else {
          argumento = info['data']['Clave'] ?? 'no-data-ios';
        }
        //Prueba para en onLaunch no se quede la pantalla negra el recibir un mensaje.
        //_mensajesStreamController.sink.add(argumento);
        _mensajes2StreamController.sink.add(argumento);
      },
      // ignore: missing_return
      onResume: (info) {
        //Para pruebas de Notifications (onResume):
        //print('===== On Resume =====');
        //print(info);

        String argumento = 'no-data';
        if (Platform.isAndroid) {
          argumento = info['data']['Clave'] ?? 'no-data';
        } else {
          argumento = info['data']['Clave'] ?? 'no-data-ios';
        }

        _mensajesStreamController.sink.add(argumento);
      },
    );
  }

  dispose() {
    _mensajesStreamController?.close();
    _mensajes2StreamController?.close();
  }
}
