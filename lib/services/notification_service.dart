import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  static final _notifications = FlutterLocalNotificationsPlugin();

  static Future _notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        "channel id ",
        "AirPlan",
        channelDescription: "Yeay, you'r Payment has been successful",
        importance: Importance.max,
      ),
    );
  }

  static Future init() async {
    final android = AndroidInitializationSettings('ic_stat_plane_app');
    final settings = InitializationSettings(android: android);
    await _notifications.initialize(settings);
  }

  static Future showNotification({
    int id = 0,
    String title = "Payment Successfully",
    String body = "Yeay, you'r Payment has been successful",
  }) async =>
      _notifications.show(
        id,
        title,
        body,
        await _notificationDetails(),
      );
}
