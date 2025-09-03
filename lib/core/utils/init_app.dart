import 'package:dentech_smile/core/utils/static.dart';
import 'package:dentech_smile/main.dart';
import 'package:flutter/material.dart';
import 'package:dentech_smile/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


/// متغير للإشعارات المحلية
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

/// handler للرسائل في الخلفية
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  debugPrint("📩 Handling a background message: ${message.messageId}");
}

/// تهيئة الإشعارات المحلية
Future<void> setupLocalNotifications() async {
  const AndroidInitializationSettings androidInit =
      AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initSettings =
      InitializationSettings(android: androidInit);

  await flutterLocalNotificationsPlugin.initialize(initSettings);
}

Future<void> initApp() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// طلب صلاحيات الإشعارات (خصوصًا Android 13+ / iOS)
  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );
  debugPrint('🔑 User granted permission: ${settings.authorizationStatus}');

  /// جلب وحفظ الـ FCM token
  final fcm = await FirebaseMessaging.instance.getToken();
  debugPrint("📲 FCM Token: $fcm");
  await userInfo?.setString(Static.fcmToken, fcm ?? '');

  /// استماع لتحديث التوكن
  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    userInfo?.setString(Static.fcmToken, fcmToken);
    debugPrint("🔄 Token refreshed: $fcmToken");
  });

  /// استقبال الرسائل عند foreground
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    debugPrint("📩 Foreground message: ${message.notification?.title}");

    // عرض إشعار محلي
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id',
      'General Notifications',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notifDetails = NotificationDetails(android: androidDetails);

    flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      notifDetails,
    );
  });

  /// استقبال الرسائل إذا فتح المستخدم التطبيق من الإشعار
  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    debugPrint("📩 onMessageOpenedApp: ${message.notification?.title}");
  });

  /// استقبال الرسائل إذا التطبيق كان مغلق
  FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? message) {
    if (message != null) {
      debugPrint("📩 getInitialMessage: ${message.notification?.title}");
    }
  });

  /// handler للرسائل في background
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
}