import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class LocalNotificationService {
  final _localNotiService = FlutterLocalNotificationsPlugin();
  LocalNotificationService();

  Future<void> initialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('mipmap/ic_launcher');
    IOSInitializationSettings iosInitSetting = IOSInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
        onDidReceiveLocalNotification: onDidReceiveLocalNotification);

    InitializationSettings settings = InitializationSettings(
        android: androidInitSettings, iOS: iosInitSetting);

    await _localNotiService.initialize(
      settings,
    );
  }

  void onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) {
    // ignore: avoid_print
    print("id =  $id");
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id', 'channelname',
            channelDescription: 'description',
            priority: Priority.high,
            playSound: true,
            importance: Importance.max);

    const IOSNotificationDetails iosNotificationDetails =
        IOSNotificationDetails();
    return const NotificationDetails(
        android: androidNotificationDetails, iOS: iosNotificationDetails);
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await _localNotiService.show(id, title, body, details);
  }

  Future<void> showScheduledNotification({
    required int id,
    required String title,
    required String body,
    required int second,
  }) async {
    final details = await _notificationDetails();
    await _localNotiService.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
            DateTime.now().add(const Duration(seconds: 30)), tz.local),
        details,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime);
  }

  void onSelectNotification(String? payload) {
    // ignore: avoid_print
    print("payload = $payload");
  }
}
