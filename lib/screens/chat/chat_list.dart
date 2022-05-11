import 'dart:async';
import 'dart:developer';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import '../../configs/app_configs.dart';

class QuestionsList extends StatefulWidget {
  const QuestionsList({Key? key}) : super(key: key);

  @override
  State<QuestionsList> createState() => _QuestionsListState();
}

class _QuestionsListState extends State<QuestionsList> {
  // UserController userController = Get.put(UserController());
  String chatId = '';
  // FireBaseChatController fireBaseChatController =
  //     Get.put(FireBaseChatController());
  Timer? timer;

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    if (mounted) {
      timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: const SharedAppBarWidget(
      //     title: 'Questions',
      //     leadingSVG: 'assets/icons/arrowback.svg',
      //     actions: [
      //       // SvgPicture.asset(
      //       //   'assets/icons/delete.svg',
      //       //   color: Colors.white,
      //       // ),
      //       // SizedBox(width: width * 0.04)
      //     ],
      //     leadingWidth: 38,
      //     isHome: false),
      body: SafeArea(
        top: true,
        child: PaginateFirestore(
          onEmpty:const Center(
            child: AutoSizeText(
              'No Questions Yet!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          //item builder type is compulsory.
          itemBuilder: (context, documentSnapshots, index) {
            final data = documentSnapshots[index].data() as Map?;
            log('${data!.entries.first}  dataa');
            chatId = documentSnapshots[index].id;
            return ListTile(
              // onLongPress: userController.singleUserModel.result!.userId !=
              //         data['userData']['result']['userId']
              //     ? null
              //     : () {

              //         showDialog(
              //             context: context,
              //             builder: (context) => DeletionDialog(
              //                 title: 'Question',
              //                 buttonName: 'Delete',
              //                 onDelete: () async {
              //                    showDialog(
              //                         barrierDismissible: false,
              //                         context: context,
              //                         builder: (BuildContext context) {
              //                           return SharedLoadingDialog(
              //                             title: 'Deleting Your Question..',
              //                           );
              //                         },
              //                       );
              //                   await fireBaseChatController.deleteQuestion(
              //                       documentSnapshots[index].id);
              //                   Get.back(closeOverlays:true);    
              //                   Get.back(closeOverlays:true);    
              //                 }));

              //       },
              onTap: () {
                // Get.to(() => GroupChatScreen(
                //       groupChatId: documentSnapshots[index].id,
                //       groupChatName: data['question'],
                //     ));
              },
              leading:const CircleAvatar(
                backgroundColor: AppConfigs.primaryColor,
                child: Center(
                  child:Icon(Icons.group, color: Colors.white, size: 30,),
                ),
              ),
              title: AutoSizeText(
                "Question : ${data['question']}",
                style: AppConfigs.appBarTitle.copyWith(
                  fontSize: 14,
                  color: AppConfigs.primaryColor,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              // subtitle: GetBuilder<FireBaseChatController>(
              //   init: FireBaseChatController(),
              //   initState: (_) {},
              //   builder: (_cnt) {
              //     if (mounted) {
              //       // fireBaseChatController.getNewMessages(
              //       //     chatId,
              //       //     userController.singleUserModel.result?.userId
              //       //             .toString() ??
              //       //         "");
              //     }
              //     return Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       children: [
              //         AutoSizeText("Sender : ${data['userData']['result']['name']}",
              //             style: AppConfigs.appBarTitle.copyWith(
              //               fontSize: 14,
              //               color: AppConfigs.overLayColor,
              //               fontWeight: FontWeight.w400,
              //             )),
              //       data['LastSeenBy'] !=
              //               userController.singleUserModel.result!.userId.toString()
              //             ? Container(
              //                 height: 12,
              //                 width: 12,
              //                 decoration: const BoxDecoration(
              //                   color: Colors.green,
              //                   shape: BoxShape.circle,
              //                 ),
              //               )
              //             : const SizedBox()
              //       ],
              //     );
              //   },
              // ),
            );
          },
          // orderBy is compulsory to enable pagination
          query: FirebaseFirestore.instance
              .collection('questions')
              .orderBy('date', descending: true),
          //Change types accordingly
          itemBuilderType: PaginateBuilderType.listView,

          // to fetch real-time data
          isLive: true,
        ),
      ),
    );
  }
}