import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hio_mobile_candidate/helpers/notification_helper.dart';
import 'package:hio_mobile_candidate/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'controllers/shared_prefs_controller.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  final fcmToken = await FirebaseMessaging.instance.getToken();
  NotificationHelper notificationHelper = NotificationHelper();
  await notificationHelper.initLocalNotification();
  log("$fcmToken   ========fcmToken");
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.get('userId');
  await sharedPreferences.setString("fcmToken", fcmToken!);
  log('${sharedPreferences.getString("fcmToken")} tokennnnfcmMain');
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  SharedPrefsController sharedPrefsController = SharedPrefsController();

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await sharedPrefsController.initSharedPrefs();
      await sharedPrefsController.getUserId();
      // await notificationController.getNotificationsByUserId();
      // startinitsetup();
    });
    WidgetsBinding.instance!.addObserver(this);

    //call it when share preference is initialized properly
    backgroundPushNotification();

    String? messageBody;
    FirebaseMessaging.instance.getInitialMessage().then((value) async {
      // NotificationController notif = NotificationController();
      // await notificationController.getNotificationsByUserId();
      if (value != null) {
        messageBody = value.data["body"];
        log("$messageBody   ========messageBody");
      }
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage) async {
      // NotificationController notif = NotificationController();

      Map<String, dynamic>? notificationData = remoteMessage.data;
      NotificationHelper? notificationHelper = NotificationHelper();

      RemoteNotification? notification = remoteMessage.notification;
      AndroidNotification? android = remoteMessage.notification?.android;
      // log('${remoteMessage.notification} ===========NotificationData');

      // log('$notification ===========NotificationData');
      // log('${remoteMessage.notification?.body} ===========Notification');
      //    await sharedPrefsController.getUserId();
      // // await notificationController.getNotificationsByUserId();
      // log('${remoteMessage.data} =========== remote message ');
      // log('${remoteMessage.data['userId']} ===========userID remote message data ');
      // log('${remoteMessage.data['senderId']} ===========remote message data senderId');
      // if (remoteMessage.data['senderId'] != null &&
      //     remoteMessage.data['senderId'].toString().trim() !=
      //         sharedPrefsController.userId.toString().trim()) {
      //   //getData(false);
      //   String? title = notification?.title;
      //   messageBody = notification?.body;
      //   Get.snackbar(
      //     'New Message', '$messageBody',
      //     // snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.green,
      //     colorText: Colors.white,
      //     borderRadius: 10,
      //     borderColor: Colors.white,
      //     borderWidth: 0.5,
      //     margin: const EdgeInsets.all(10),
      //     snackStyle: SnackStyle.FLOATING,
      //     duration: const Duration(seconds: 5),
      //     icon: const Icon(Icons.notifications, color: Colors.white),
      //     shouldIconPulse: true,
      //   );

      //   // notificationHelper.showNotification(title: title, body: messageBody);
      // } else if (remoteMessage.data['userId'] != null &&
      //     remoteMessage.data['userId'].toString().trim() !=
      //         sharedPrefsController.userId.toString().trim()) {
      //   String? title = notification?.title;
      //   messageBody = notification?.body;
      //   Get.snackbar(
      //     'New Message', '$messageBody',
      //     // snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.green,
      //     colorText: Colors.white,
      //     borderRadius: 10,
      //     borderColor: Colors.white,
      //     borderWidth: 0.5,
      //     margin: const EdgeInsets.all(10),
      //     snackStyle: SnackStyle.FLOATING,
      //     duration: const Duration(seconds: 5),
      //     icon: const Icon(Icons.notifications, color: Colors.white),
      //     shouldIconPulse: true,
      //   );
      // }

      // if (messageBody != null) {
      //   if (messageBody!.isNotEmpty) {}
      // }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      // NotificationController notif = NotificationController();
      // await notificationController.getNotificationsByUserId();
      // log('A new onMessageOpenedApp event was published!');
      // // NotificationHelper? notificationHelper = NotificationHelper();
      // Map<String, dynamic>? notificationData = message.data;
      // String? title = notificationData['title'];
      // messageBody = notificationData['body'];

      // log('$notificationData ===========NotificationData onMessageOpened');
      // log('${message.notification?.body} ===========NotificationonMessageOpened');
      // log('${message.data['groupId1']} ===========GroupID onMessageOpened');

      // if (message.data['type'].toString().trim() == 'message'.trim()) {
      //   // Navigator.push(navigatorKey.currentState!.context,
      //   //     MaterialPageRoute(builder: (context) {
      //   //   return GroupChatScreen(
      //   //       groupChatId: message.data['groupId1'],
      //   //       groupChatName: message.data['groupName']);

      //   // }));
      //   Get.to(
      //     () => GroupChatScreen(
      //       groupChatId: message.data['groupId1'],
      //       groupChatName: message.data['groupName'],
      //     ),
      //     preventDuplicates: true,
      //   );
      // } else if (message.data['type'].toString().trim() == 'Question'.trim()) {
      //   Get.to(() => const QuestionsList());
      // }
      // // notificationHelper.showNotification(title: title, body: messageBody);
      // //  Get.snackbar(
      //     'New Message', '$messageBody',
      //     // snackPosition: SnackPosition.BOTTOM,
      //     backgroundColor: Colors.green,
      //     colorText: Colors.white,
      //     borderRadius: 10,
      //     borderColor: Colors.white,
      //     borderWidth: 0.5,
      //     margin: const EdgeInsets.all(10),
      //     snackStyle: SnackStyle.FLOATING,
      //     duration: const Duration(seconds: 5),
      //     icon: const Icon(Icons.notifications, color: Colors.white),
      //   );
      // notificationHelper.groupNotifications();
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  void backgroundPushNotification() {
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (child) {
        return GetMaterialApp(
          title: 'Hio Mobile',
          debugShowCheckedModeBanner: false,
          // defaultTransition: Transition.cupertino,
          // opaqueRoute: Get.isOpaqueRouteDefault,
          // popGesture: Get.isPopGestureEnable,
          builder: (context, widget) {
            //add this line
            // ScreenUtil.setContext(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0.sp),
              child: widget!,
            );
          },
          theme: ThemeData(
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: child,
        );
      },
      child: const SplashScreen(),
    );
  }
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // String? body;

  // NotificationController notificationController = Get.put( NotificationController());
  Map<String, dynamic> notificationData = message.data;
  // NotificationHelper notificationHelper = NotificationHelper();
//  await notificationController.getNotificationsByUserId();
  log('${message.data} ===========NotificationData');
  log('$notificationData ===========NotificationData BackGround');
  if (notificationData.isNotEmpty) {
//  await notificationController.getNotificationsByUserId();
    // notificationHelper.showNotification();
    // notificationHelper.groupNotifications();

    //SharedPreferences.setMockInitialValues({});
    //Global.init().then((value) {
    //SharedPreferences preferences = await SharedPreferences.getInstance();
    try {
      //bool isSoundAlertOn = _MyAppState.isSoundAlertOn;

    } catch (e) {
      /*print(e);
        flutterTts.awaitSpeakCompletion(true);
        flutterTts.speak(body);*/
    }

    // });

  }
}
