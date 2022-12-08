import 'package:demo/src/view/notifications/notification_provider/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import '../../widget/other/app_bar.dart';
import '../../widget/other/custom_back.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      final provider =
          Provider.of<NotificationProvider>(context, listen: false);
      provider.notification(
          'http://192.168.0.121:8001/api/notification-list', context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer<NotificationProvider>(builder: (context, provider, _) {
        return Scaffold(
          appBar: CustomAppBar(
            size: MediaQuery.of(context).size,
            text: "Notification",
            centerTitleValue: true,
            leading: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                children: const [
                  CustomBack()
                  // Container(
                  //   margin: const EdgeInsets.all(5),
                  //   height: 36,
                  //   width: 36,
                  //   decoration: const BoxDecoration(
                  //     color: Color(0xffFFFFFF),
                  //     borderRadius: BorderRadius.all(
                  //       Radius.circular(10),
                  //     ),
                  //   ),
                  //   child: Image.asset(
                  //     AssetUtils.back,
                  //     fit: BoxFit.cover,
                  //     color: const Color(0xff2F3A4B),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          body: provider.notificationData!.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: ListView.builder(
                      itemCount: provider.notificationData!.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // const Text(
                            //   "Recent Notifications",
                            //   style: TextStyle(
                            //       fontSize: 18, fontWeight: FontWeight.w500),
                            // ),
                            // const Text(
                            //   "Showed Notifications",
                            //   style: TextStyle(
                            //       fontSize: 18, fontWeight: FontWeight.w500),
                            // ),
                            Text(
                              "${provider.notificationData![index].title}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "${provider.notificationData![index].description}",
                              style: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ),

                            // CustomNotification(
                            //     text:
                            //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                            //     time: "12 min")
                          ],
                        );
                      }),
                )
              : Container(),
        );
      }),
    );
  }
}
