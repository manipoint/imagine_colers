import 'dart:core';

import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/model/ic_model.dart';

import 'ic_images.dart';
import 'ic_constent.dart';

List<ICBestSpecialModel> getSpecialList() {
  List<ICBestSpecialModel> list = <ICBestSpecialModel>[];
  list.add(ICBestSpecialModel(title: 'Arfan Latif', subTitle: 'Font Designer', img: ICArfanDp));
  list.add(ICBestSpecialModel(title: 'Rashid Aslam', subTitle: 'Home Decorator', img: ICRashidDp));
  list.add(ICBestSpecialModel(title: 'Rehman Ashraf', subTitle: 'Photographer', img: ICRehmanDp));
  list.add(ICBestSpecialModel(title: 'Imran Latif', subTitle: 'Wall Panelist', img: ICImranDp));
  list.add(ICBestSpecialModel(title: 'Arfan Latif', subTitle: 'Cushion Designer', img: ICArfanDp));
  list.add(ICBestSpecialModel(title: 'Imran Latif', subTitle: 'Font Designer', img: ICImranDp));
  list.add(ICBestSpecialModel(title: 'Arfan Latif', subTitle: 'Photographer', img: ICArfanDp ));
  list.add(ICBestSpecialModel(title: 'Rashid Aslam', subTitle: 'Board Artist', img: ICRashidDp));

  return list;
}

List<ICBestSpecialModel> getSpecialNewList() {
  List<ICBestSpecialModel> list = <ICBestSpecialModel>[];
  list.add(ICBestSpecialModel(title: 'Arfan Latif', subTitle: 'Font Artist', img: ICArfanDp));
  list.add(ICBestSpecialModel(title: 'Imran Latif', subTitle: 'Photographer', img: ICImranDp ));
  list.add(ICBestSpecialModel(title: 'Rehman Ashraf', subTitle: 'Wall Artist', img: ICRehmanDp));
  list.add(ICBestSpecialModel(title: 'Rashid Aslam', subTitle: 'Makeup Artist', img: ICRashidDp));

  return list;
}


List<ICSpecialOfferModel> getSpecialOfferList() {
  List<ICSpecialOfferModel> specialOfferList = <ICSpecialOfferModel>[];
  specialOfferList.add(ICSpecialOfferModel(img: ICWall1, title: 'Imran Latif', subtitle: 'Cool Summer Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICWall3, title: 'Woow Walls ', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICMug, title: 'Chey Shay', subtitle: 'PSL Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICCushion, title: 'Ufff Sardi ', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICPhotoghaphy , title: 'Memories..', subtitle: 'Wedding Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICMug, title: 'Gift  ', subtitle: 'Happy Birthday Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICMug, title: 'Pakistan Day ', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICWall1, title: 'Independance', subtitle: 'Cool Summer Event'));
  return specialOfferList;
}

List<ICSpecialOfferModel> getSpecialOfferNewList() {
  List<ICSpecialOfferModel> specialOfferList = <ICSpecialOfferModel>[];
  specialOfferList.add(ICSpecialOfferModel(img: ICWall1, title: 'Al-Madina color lab', subtitle: 'Cool Summer Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICWall3, title: 'Imagine Colors', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICMug, title: 'Al-Madina color lab', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICSign2, title: 'Imagine Colors', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICPhotoghaphy , title: 'Al-Madina color lab', subtitle: 'Cool Winter Event'));
  return specialOfferList;
}

List<MessageModel> getMessageList() {
  List<MessageModel> messageList = <MessageModel>[];
  messageList.add(MessageModel(img: ICWall3, name: 'Imagine Colors', message: 'Hi Arfan..', lastSeen: 'Now'));
  messageList.add(MessageModel(img: ICWall2, name: 'Naveed', message: 'Thank you.', lastSeen: '8:30 AM'));
  messageList.add(MessageModel(img: ICMug, name: 'Waheed', message: 'Hello', lastSeen: 'Yesterday'));
  return messageList;
}

List<ICCallModel> getCallList() {
  List<ICCallModel> callList = <ICCallModel>[];
  callList.add(
    ICCallModel(
      img: ICWall3,
      name: 'Sherman Barber Shop',
      callImg: Icons.call,
      callStatus: 'You call them',
      videoCallIcon: ICVideoCallIcon,
      audioCallIcon: ICCallIcon,
    ),
  );
  callList.add(
    ICCallModel(
      img: ICWall4,
      name: 'Dale Horward',
      callImg: Icons.call,
      callStatus: 'You miss call',
      videoCallIcon: ICVideoCallIcon,
      audioCallIcon: ICCallIcon,
    ),
  );
  callList.add(
    ICCallModel(
      img: ICPhotoghaphy ,
      name: 'Dale Horward',
      callImg: Icons.call,
      callStatus: 'You miss call',
      videoCallIcon: ICVideoCallIcon,
      audioCallIcon: ICCallIcon,
    ),
  );
  callList.add(
    ICCallModel(
      img: ICMug,
      name: 'Dale Horward',
      callImg: Icons.call,
      callStatus: 'You miss call',
      videoCallIcon: ICVideoCallIcon,
      audioCallIcon: ICCallIcon,
    ),
  );
  return callList;
}

List<ICGalleryModel> getGalleryList() {
  List<ICGalleryModel> galleryList = <ICGalleryModel>[];
  galleryList.add(ICGalleryModel(img: ICPhotoghaphy ));
  galleryList.add(ICGalleryModel(img: ICWall2));
  galleryList.add(ICGalleryModel(img: ICWall3));
  galleryList.add(ICGalleryModel(img: ICMug));
  galleryList.add(ICGalleryModel(img: ICWall2));
  galleryList.add(ICGalleryModel(img: ICMug));
  galleryList.add(ICGalleryModel(img: ICWall2));
  galleryList.add(ICGalleryModel(img: ICWall3));
  galleryList.add(ICGalleryModel(img: ICMug));
  galleryList.add(ICGalleryModel(img: ICPhotoghaphy ));
  galleryList.add(ICGalleryModel(img: ICWall3));
  galleryList.add(ICGalleryModel(img: ICPhotoghaphy ));
  return galleryList;
}

List<ICCategoryModel> getCategory() {
  List<ICCategoryModel> categoryList = <ICCategoryModel>[];
  categoryList.add(ICCategoryModel(img: IC3DBoards, categoryName: 'All'));
  categoryList.add(ICCategoryModel(img: ICWall2, categoryName: 'Home Desig'));
  categoryList.add(ICCategoryModel(img: ICMug, categoryName: 'Mug Prainting'));
  categoryList.add(ICCategoryModel(img: ICMobileCare, categoryName: 'Mobile Care'));
  categoryList.add(ICCategoryModel(img: IC3DBoards, categoryName: '3D Boards'));
  categoryList.add(ICCategoryModel(img: ICCushion, categoryName: 'Cushion Prainting'));

  return categoryList;
}

List<ICOfferModel> getOfferList() {
  List<ICOfferModel> offerList = <ICOfferModel>[];
  offerList.add(
    ICOfferModel(img: ICPhotoghaphy , offerName: 'Photoghaphy Event', offerDate: 'June 10 - June 26', offerOldPrice: 20000, offerNewPrice: 10000),
  );
  offerList.add(
    ICOfferModel(img: ICMug1, offerName: 'Mug Display', offerDate: 'May 10 - May 17', offerOldPrice: 799, offerNewPrice: 499),
  );
  offerList.add(
    ICOfferModel(img: ICWall4, offerName: '3d Wall Panels ', offerDate: 'Sep 12 - Sep 14', offerOldPrice: 120, offerNewPrice: 99),
  );
  offerList.add(
    ICOfferModel(img: ICCushion, offerName: 'Cushion Design', offerDate: 'Nov 05 - Nov 13', offerOldPrice: 999, offerNewPrice: 799),
  );
  return offerList;
}

List<ICServicesModel> getServicesList() {
  List<ICServicesModel> servicesList = <ICServicesModel>[];
  servicesList.add(ICServicesModel(img: ICSign, serviceName: 'Font Panels', time: '72 Hrs', price: 350, radioVal: 1));
  servicesList.add(ICServicesModel(img: ICMobileCare , serviceName: 'Mobile 9D Covers', time: '10 Min', price: 100, radioVal: 2));
  servicesList.add(ICServicesModel(img: ICMug, serviceName: 'Mug Prainting', time: '50 Min', price: 799, radioVal: 3));
  servicesList.add(ICServicesModel(img: ICCushion, serviceName: 'Cushion desining', time: '50 Min', price: 999, radioVal: 4));
  servicesList.add(ICServicesModel(img: ICWall4, serviceName: '3d Wall Panels', time: '50 Min', price: 120, radioVal: 4));
  
  return servicesList;
}

List<ICIncludeServiceModel> getIncludeServicesList() {
  List<ICIncludeServiceModel> servicesList = <ICIncludeServiceModel>[];
  servicesList.add(ICIncludeServiceModel(serviceImg: ICSign2, serviceName: 'Board Creation', time: '72 Hrs', price: 350));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICWall1, serviceName: '3d Wall Panels', time: '30 Min', price: 150));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICCellCase, serviceName: 'Mobile Case', time: '10 Min', price: 950));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICMobileCare , serviceName: 'Mobile 9D Covers', time: '10 Min', price: 100));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICCushion, serviceName: 'Cushion desining', time: '50 Min', price: 999));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICMug , serviceName: 'Mug Prainting', time: '50 Min', price: 799));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICPlate, serviceName: 'Plates Printing', time: '50 Min', price: 999));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICPhotoghaphy, serviceName: 'Digital Photogrphy', time: '2 hrs', price: 13000));
  return servicesList;
}

List<ICReviewModel> getReviewList() {
  List<ICReviewModel> reviewList = <ICReviewModel>[];
  reviewList.add(ICReviewModel(img: ICPhotoghaphy , name: 'Carlos Day', rating: 4.5, day: '4 Day ago', review: ICReview));
  reviewList.add(ICReviewModel(img: ICMug, name: 'Ehsan', rating: 4.5, day: '10 Day ago', review: ICReview));
  reviewList.add(ICReviewModel(img: ICMug, name: 'Amber', rating: 4, day: '1 Day ago', review: ICReview));
  reviewList.add(ICReviewModel(img: ICMug, name: 'Naveed', rating: 2.5, day: '3 Day ago', review: ICReview));
  return reviewList;
}

List<ICStyleModel> getStyleList() {
  List<ICStyleModel> styleList = <ICStyleModel>[];
  styleList.add(ICStyleModel(img: ICWall4, name: 'Arfan Latif'));
  styleList.add(ICStyleModel(img: ICWall2, name: 'Rehman'));
  styleList.add(ICStyleModel(img: ICMug, name: 'M Zahid'));
  styleList.add(ICStyleModel(img: ICPhotoghaphy , name: 'Ch Imran'));
  return styleList;
}

List<ICBoardStyleModel> getBoardStyleList() {
  List<ICBoardStyleModel> boardStyleList = <ICBoardStyleModel>[];
  boardStyleList.add(ICBoardStyleModel(img: ICWall3, name: 'Arfan Latif'));
  boardStyleList.add(ICBoardStyleModel(img: ICWall4, name: 'Rehman '));
  boardStyleList.add(ICBoardStyleModel(img: ICWall1, name: 'M Zahid'));
  boardStyleList.add(ICBoardStyleModel(img: ICPhotoghaphy , name: 'Ch Imran'));
  return boardStyleList;
}

List<ICNotificationModel> getNotificationList() {
  List<ICNotificationModel> notificationList = <ICNotificationModel>[];
  notificationList.add(ICNotificationModel(img: ICMug, name: 'Adnan Shreef', msg: 'Hi Dear..', status: 'Just Now', callInfo: ICCallIcon));
  notificationList.add(ICNotificationModel(img: ICWall2, name: 'Dale Horward', msg: 'Thank you.', status: '8:30 AM', callInfo: ICMessage));
  notificationList.add(ICNotificationModel(img: ICWall3, name: 'Al-Madina color leb', msg: 'Hello', status: 'Yesterday', callInfo: ICCallIcon));
  notificationList.add(ICNotificationModel(img: ICWall4, name: 'Faiz Khan', msg: 'Sent you a message', status: 'Tomorrow', callInfo: ICMessage));
  return notificationList;
}

List<ICNotifyModel> getNotifyList() {
  List<ICNotifyModel> notifyList = <ICNotifyModel>[];
  notifyList.add(
    ICNotifyModel(img: ICWall4, name: 'Al-Madian color and Fonts', address: 'Buldia road Chishtian.', rating: 4.5, distance: 7.5),
  );
  notifyList.add(
    ICNotifyModel(img: ICPhotoghaphy , name: 'Awasome Decorators', address: 'Ch Latif Road Bahwalpur.', rating: 3.5, distance: 14.2),
  );
  notifyList.add(
    ICNotifyModel(img: ICWall3, name: 'Zahid Fonts', address: 'Sixth Road RawalPindi.', rating: 2.0, distance: 10.0),
  );
  notifyList.add(
    ICNotifyModel(img: ICWall1, name: 'Imagine Colors Font ', address: 'Hall Road Lahore.', rating: 5.0, distance: 17.5),
  );
  notifyList.add(
    ICNotifyModel(img: ICMug, name: 'Horward Desinors', address: 'Main korangi road karachi.', rating: 3.5, distance: 11.0),
  );
  return notifyList;
}

List<ICMessageModel> getChatMsgData() {
  List<ICMessageModel> list = [];

  ICMessageModel c1 = ICMessageModel();
  c1.senderId = ICSender_id;
  c1.receiverId = ICReceiver_id;
  c1.msg = 'Helloo';
  c1.time = '1:43 AM';
  list.add(c1);

  ICMessageModel c2 = ICMessageModel();
  c2.senderId = ICSender_id;
  c2.receiverId = ICReceiver_id;
  c2.msg = 'How are you? What are you doing?';
  c2.time = '1:45 AM';
  list.add(c2);

  ICMessageModel c3 = ICMessageModel();
  c3.senderId = ICReceiver_id;
  c3.receiverId = ICSender_id;
  c3.msg = 'Helloo...';
  c3.time = '1:45 AM';
  list.add(c3);

  ICMessageModel c4 = ICMessageModel();
  c4.senderId = ICSender_id;
  c4.receiverId = ICReceiver_id;
  c4.msg = 'I am good. Can you do something for me? I need your help.';
  c4.time = '1:45 AM';
  list.add(c4);

  ICMessageModel c5 = ICMessageModel();
  c5.senderId = ICSender_id;
  c5.receiverId = ICReceiver_id;
  c5.msg = 'I am good. Can you do something for me? I need your help.';
  c5.time = '1:45 AM';
  list.add(c5);

  ICMessageModel c6 = ICMessageModel();
  c6.senderId = ICReceiver_id;
  c6.receiverId = ICSender_id;
  c6.msg = 'I am good. Can you do something for me? I need your help.';
  c6.time = '1:45 AM';
  list.add(c6);

  ICMessageModel c7 = ICMessageModel();
  c7.senderId = ICSender_id;
  c7.receiverId = ICReceiver_id;
  c7.msg = 'I am good. Can you do something for me? I need your help.';
  c7.time = '1:45 AM';
  list.add(c7);

  ICMessageModel c8 = ICMessageModel();
  c8.senderId = ICReceiver_id;
  c8.receiverId = ICSender_id;
  c8.msg = 'I am good. Can you do something for me? I need your help.';
  c8.time = '1:45 AM';
  list.add(c8);

  ICMessageModel c9 = ICMessageModel();
  c9.senderId = ICSender_id;
  c9.receiverId = ICReceiver_id;
  c9.msg = 'I am good. Can you do something for me? I need your help.';
  c9.time = '1:45 AM';
  list.add(c9);

  ICMessageModel c10 = ICMessageModel();
  c10.senderId = ICReceiver_id;
  c10.receiverId = ICSender_id;
  c10.msg = 'I am good. Can you do something for me? I need your help.';
  c10.time = '1:45 AM';
  list.add(c10);

  ICMessageModel c11 = ICMessageModel();
  c11.senderId = ICReceiver_id;
  c11.receiverId = ICSender_id;
  c11.msg = 'I am good. Can you do something for me? I need your help.';
  c11.time = '1:45 AM';
  list.add(c11);

  ICMessageModel c12 = ICMessageModel();
  c12.senderId = ICSender_id;
  c12.receiverId = ICReceiver_id;
  c12.msg = 'I am good. Can you do something for me? I need your help.';
  c12.time = '1:45 AM';
  list.add(c12);

  ICMessageModel c13 = ICMessageModel();
  c13.senderId = ICSender_id;
  c13.receiverId = ICReceiver_id;
  c13.msg = 'I am good. Can you do something for me? I need your help.';
  c13.time = '1:45 AM';
  list.add(c13);

  ICMessageModel c14 = ICMessageModel();
  c14.senderId = ICReceiver_id;
  c14.receiverId = ICSender_id;
  c14.msg = 'I am good. Can you do something for me? I need your help.';
  c14.time = '1:45 AM';
  list.add(c14);

  ICMessageModel c15 = ICMessageModel();
  c15.senderId = ICSender_id;
  c15.receiverId = ICReceiver_id;
  c15.msg = 'I am good. Can you do something for me? I need your help.';
  c15.time = '1:45 AM';
  list.add(c15);

  ICMessageModel c16 = ICMessageModel();
  c16.senderId = ICReceiver_id;
  c16.receiverId = ICSender_id;
  c16.msg = 'I am good. Can you do something for me? I need your help.';
  c16.time = '1:45 AM';
  list.add(c16);

  ICMessageModel c17 = ICMessageModel();
  c17.senderId = ICSender_id;
  c17.receiverId = ICReceiver_id;
  c17.msg = 'I am good. Can you do something for me? I need your help.';
  c17.time = '1:45 AM';
  list.add(c17);

  ICMessageModel c18 = ICMessageModel();
  c18.senderId = ICReceiver_id;
  c18.receiverId = ICSender_id;
  c18.msg = 'I am good. Can you do something for me? I need your help.';
  c18.time = '1:45 AM';
  list.add(c18);

  return list;
}