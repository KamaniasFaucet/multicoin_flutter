import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationSettings {
  // static const IOSNotificationDetails iOSPlatformChannelSpecifics =
  //     IOSNotificationDetails(sound: 'money'); //TODO doesn't work

  static const AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
    'ppc',
    'Deutsche eMark',
    channelDescription: 'Notification channel for Deutsche eMark app',
    importance: Importance.max,
    priority: Priority.high,
    showWhen: true,
    sound: RawResourceAndroidNotificationSound('money'),
  );

  static NotificationDetails get platformChannelSpecifics {
    return const NotificationDetails(
      android: androidPlatformChannelSpecifics,
      // iOS: iOSPlatformChannelSpecifics,
    );
  }
}
