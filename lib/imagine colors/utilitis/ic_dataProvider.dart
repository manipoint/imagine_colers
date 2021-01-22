import 'dart:core';

import 'package:flutter/material.dart';
import 'package:imagine_colers/imagine%20colors/model/ic_model.dart';

import 'ic_images.dart';
import 'ic_constent.dart';

List<ICBestSpecialModel> getSpecialList() {
  List<ICBestSpecialModel> list = <ICBestSpecialModel>[];
  list.add(ICBestSpecialModel(title: 'Joseph Drake', subTitle: 'Board Artist', img: ICdDashedBoardImage5));
  list.add(ICBestSpecialModel(title: 'Dale Horward', subTitle: 'Home Decorator', img: ICDashedBoardImage1));
  list.add(ICBestSpecialModel(title: 'willies carpen', subTitle: 'Photographer', img: ICDashedBoardImage6));
  list.add(ICBestSpecialModel(title: 'Dale Horward', subTitle: 'Board Artist', img: ICDashedBoardImage3));
  list.add(ICBestSpecialModel(title: 'Joseph Drake', subTitle: 'Board Artist', img: ICDashedBoardImage3));
  list.add(ICBestSpecialModel(title: 'Dale Horward', subTitle: 'Home Decorator', img: ICdDashedBoardImage5));
  list.add(ICBestSpecialModel(title: 'willies carpen', subTitle: 'Photographer', img: ICDashedBoardImage1));
  list.add(ICBestSpecialModel(title: 'Dale Horward', subTitle: 'Board Artist', img: ICDashedBoardImage6));

  return list;
}

List<ICBestSpecialModel> getSpecialNewList() {
  List<ICBestSpecialModel> list = <ICBestSpecialModel>[];
  list.add(ICBestSpecialModel(title: 'Joseph Drake', subTitle: 'Makeup Artist', img: ICdDashedBoardImage5));
  list.add(ICBestSpecialModel(title: 'Dale Horward', subTitle: 'Hire Stylist', img: ICDashedBoardImage1));
  list.add(ICBestSpecialModel(title: 'willies carpen', subTitle: 'Barber', img: ICDashedBoardImage6));
  list.add(ICBestSpecialModel(title: 'Dale Horward', subTitle: 'Makeup Artist', img: ICDashedBoardImage3));
  list.add(ICBestSpecialModel(title: 'Dale Horward', subTitle: 'Hire Stylist', img: ICDashedBoardImage2));
  list.add(ICBestSpecialModel(title: 'willies carpen', subTitle: 'Barber', img: ICDashedBoardImage6));
  return list;
}


List<ICSpecialOfferModel> getSpecialOfferList() {
  List<ICSpecialOfferModel> specialOfferList = List<ICSpecialOfferModel>();
  specialOfferList.add(ICSpecialOfferModel(img: ICdDashedBoardImage5, title: 'Joseph Salon', subtitle: 'Cool Summer Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICDashedBoardImage3, title: 'Sherman Hair ', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICDashedBoardImage6, title: 'Drake Hair Salon', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICDashedBoardImage7, title: 'Barber Hair ', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICDashedBoardImage1, title: 'Joseph Drake', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICDashedBoardImage6, title: 'Joseph Hair ', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICDashedBoardImage6, title: 'Drake Hair ', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICdDashedBoardImage5, title: 'Joseph Hair', subtitle: 'Cool Summer Event'));
  return specialOfferList;
}

List<ICSpecialOfferModel> getSpecialOfferNewList() {
  List<ICSpecialOfferModel> specialOfferList = List<ICSpecialOfferModel>();
  specialOfferList.add(ICSpecialOfferModel(img: ICdDashedBoardImage5, title: 'Joseph Drake Hair Salon', subtitle: 'Cool Summer Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICDashedBoardImage3, title: 'Sherman Barber Hair Salon', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICDashedBoardImage6, title: 'Joseph Drake Hair Salon', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICDashedBoardImage7, title: 'Sherman Barber Hair Salon', subtitle: 'Cool Winter Event'));
  specialOfferList.add(ICSpecialOfferModel(img: ICDashedBoardImage1, title: 'Joseph Drake Hair Salon', subtitle: 'Cool Winter Event'));
  return specialOfferList;
}

List<MessageModel> getMessageList() {
  List<MessageModel> messageList = List<MessageModel>();
  messageList.add(MessageModel(img: ICDashedBoardImage3, name: 'Sherman Barber Shop', message: 'Hi Jackson..', lastSeen: 'Now'));
  messageList.add(MessageModel(img: ICDashedBoardImage2, name: 'Dale Horward', message: 'Thank you.', lastSeen: '8:30 AM'));
  messageList.add(MessageModel(img: ICDashedBoardImage6, name: 'Norah Beauty Salon', message: 'Hello', lastSeen: 'Yesterday'));
  return messageList;
}

List<ICCallModel> getCallList() {
  List<ICCallModel> callList = List<ICCallModel>();
  callList.add(
    ICCallModel(
      img: ICDashedBoardImage3,
      name: 'Sherman Barber Shop',
      callImg: Icons.call,
      callStatus: 'You call them',
      videoCallIcon: ICVideoCallIcon,
      audioCallIcon: ICCallIcon,
    ),
  );
  callList.add(
    ICCallModel(
      img: ICDashedBoardImage4,
      name: 'Dale Horward',
      callImg: Icons.call,
      callStatus: 'You miss call',
      videoCallIcon: ICVideoCallIcon,
      audioCallIcon: ICCallIcon,
    ),
  );
  callList.add(
    ICCallModel(
      img: ICDashedBoardImage1,
      name: 'Dale Horward',
      callImg: Icons.call,
      callStatus: 'You miss call',
      videoCallIcon: ICVideoCallIcon,
      audioCallIcon: ICCallIcon,
    ),
  );
  callList.add(
    ICCallModel(
      img: ICDashedBoardImage6,
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
  galleryList.add(ICGalleryModel(img: ICDashedBoardImage1));
  galleryList.add(ICGalleryModel(img: ICDashedBoardImage2));
  galleryList.add(ICGalleryModel(img: ICDashedBoardImage3));
  galleryList.add(ICGalleryModel(img: ICDashedBoardImage6));
  galleryList.add(ICGalleryModel(img: ICDashedBoardImage2));
  galleryList.add(ICGalleryModel(img: ICDashedBoardImage6));
  galleryList.add(ICGalleryModel(img: ICDashedBoardImage2));
  galleryList.add(ICGalleryModel(img: ICDashedBoardImage3));
  galleryList.add(ICGalleryModel(img: ICDashedBoardImage6));
  galleryList.add(ICGalleryModel(img: ICDashedBoardImage1));
  galleryList.add(ICGalleryModel(img: ICDashedBoardImage3));
  galleryList.add(ICGalleryModel(img: ICDashedBoardImage1));
  return galleryList;
}

List<ICCategoryModel> getCategory() {
  List<ICCategoryModel> categoryList = <ICCategoryModel>[];
  categoryList.add(ICCategoryModel(img: IC3DBoards, categoryName: 'All'));
  categoryList.add(ICCategoryModel(img: IC3DBoards, categoryName: '3D Boards'));
  categoryList.add(ICCategoryModel(img: ICHomeCare, categoryName: 'Home Desig'));
  categoryList.add(ICCategoryModel(img: ICMug, categoryName: 'Mug Prainting'));
  categoryList.add(ICCategoryModel(img: ICMobileCare, categoryName: 'Mobile Care'));
  categoryList.add(ICCategoryModel(img: ICKeyChain, categoryName: 'Key'));

  return categoryList;
}

List<ICOfferModel> getOfferList() {
  List<ICOfferModel> offerList = <ICOfferModel>[];
  offerList.add(
    ICOfferModel(img: ICDashedBoardImage1, offerName: 'Personality Girl Event', offerDate: 'June 10 - June 26', offerOldPrice: 100, offerNewPrice: 89),
  );
  offerList.add(
    ICOfferModel(img: ICDashedBoardImage2, offerName: '3d bil board design', offerDate: 'May 10 - May 17', offerOldPrice: 80, offerNewPrice: 70),
  );
  offerList.add(
    ICOfferModel(img: ICDashedBoardImage3, offerName: 'Personality Girl Event', offerDate: 'Sep 12 - Sep 14', offerOldPrice: 120, offerNewPrice: 109),
  );
  offerList.add(
    ICOfferModel(img: ICDashedBoardImage4, offerName: 'Personality Girl Event', offerDate: 'Nov 05 - Nov 13', offerOldPrice: 150, offerNewPrice: 130),
  );
  return offerList;
}

List<ICServicesModel> getServicesList() {
  List<ICServicesModel> servicesList = <ICServicesModel>[];
  servicesList.add(ICServicesModel(img: ICDashedBoardImage4, serviceName: 'Board Creation', time: '72 Hrs', price: 350000, radioVal: 1));
  servicesList.add(ICServicesModel(img: ICDashedBoardImage1, serviceName: 'Mobile 9D Covers', time: '10 Min', price: 100, radioVal: 2));
  servicesList.add(ICServicesModel(img: ICDashedBoardImage3, serviceName: 'Mug Prainting', time: '50 Min', price: 600, radioVal: 3));
  servicesList.add(ICServicesModel(img: ICdDashedBoardImage5, serviceName: 'Cushion desining', time: '50 Min', price: 700, radioVal: 4));
  return servicesList;
}

List<ICIncludeServiceModel> getIncludeServicesList() {
  List<ICIncludeServiceModel> servicesList = <ICIncludeServiceModel>[];
  servicesList.add(ICIncludeServiceModel(serviceImg: ICDashedBoardImage3, serviceName: 'Board Creation', time: '72 Hrs', price: 350000));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICdDashedBoardImage5, serviceName: 'Key Chain', time: '30 Min', price: 150));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICDashedBoardImage4, serviceName: 'Mobile Case', time: '10 Min', price: 150));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICDashedBoardImage1, serviceName: 'Mobile 9D Covers', time: '10 Min', price: 100));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICDashedBoardImage4, serviceName: 'Cushion desining', time: '50 Min', price: 700));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICDashedBoardImage1, serviceName: 'Mug Prainting', time: '50 Min', price: 600));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICDashedBoardImage6, serviceName: 'Plates Printing', time: '50 Min', price: 1000));
  servicesList.add(ICIncludeServiceModel(serviceImg: ICDashedBoardImage7, serviceName: 'Home Decorations', time: '2 hrs', price: 13000));
  return servicesList;
}

List<ICReviewModel> getReviewList() {
  List<ICReviewModel> reviewList = <ICReviewModel>[];
  reviewList.add(ICReviewModel(img: ICDashedBoardImage1, name: 'Carlos Day', rating: 4.5, day: '4 Day ago', review: ICReview));
  reviewList.add(ICReviewModel(img: ICUserImg, name: 'Sherman', rating: 2.5, day: '10 Day ago', review: ICReview));
  reviewList.add(ICReviewModel(img: ICUserImg, name: 'Dale Horward', rating: 4, day: '1 Day ago', review: ICReview));
  reviewList.add(ICReviewModel(img: ICUserImg, name: 'Carlos Day', rating: 3.5, day: '3 Day ago', review: ICReview));
  return reviewList;
}

List<ICStyleModel> getStyleList() {
  List<ICStyleModel> styleList = <ICStyleModel>[];
  styleList.add(ICStyleModel(img: ICDashedBoardImage4, name: 'Arfan Latif'));
  styleList.add(ICStyleModel(img: ICDashedBoardImage2, name: 'Rehman'));
  styleList.add(ICStyleModel(img: ICDashedBoardImage6, name: 'M Zahid'));
  styleList.add(ICStyleModel(img: ICDashedBoardImage1, name: 'Ch Imran'));
  return styleList;
}

List<ICBoardStyleModel> getBoardStyleList() {
  List<ICBoardStyleModel> boardStyleList = <ICBoardStyleModel>[];
  boardStyleList.add(ICBoardStyleModel(img: ICDashedBoardImage3, name: 'Arfan Latif'));
  boardStyleList.add(ICBoardStyleModel(img: ICDashedBoardImage4, name: 'Rehman '));
  boardStyleList.add(ICBoardStyleModel(img: ICdDashedBoardImage5, name: 'M Zahid'));
  boardStyleList.add(ICBoardStyleModel(img: ICDashedBoardImage1, name: 'Ch Imran'));
  return boardStyleList;
}

List<ICNotificationModel> getNotificationList() {
  List<ICNotificationModel> notificationList = <ICNotificationModel>[];
  notificationList.add(ICNotificationModel(img: ICDashedBoardImage6, name: 'Sherman Shop', msg: 'Hi Jackson..', status: 'Just Now', callInfo: ICCallIcon));
  notificationList.add(ICNotificationModel(img: ICDashedBoardImage2, name: 'Dale Horward', msg: 'Thank you.', status: '8:30 AM', callInfo: ICMessage));
  notificationList.add(ICNotificationModel(img: ICDashedBoardImage3, name: 'Norah  Salon', msg: 'Hello', status: 'Yesterday', callInfo: ICCallIcon));
  notificationList.add(ICNotificationModel(img: ICDashedBoardImage4, name: 'Norah Beauty', msg: 'Sent you a message', status: 'Tomorrow', callInfo: ICMessage));
  return notificationList;
}

List<ICNotifyModel> getNotifyList() {
  List<ICNotifyModel> notifyList = <ICNotifyModel>[];
  notifyList.add(
    ICNotifyModel(img: ICDashedBoardImage4, name: 'Al-Madian color and Fonts', address: 'Buldia road Chishtian.', rating: 4.5, distance: 7.5),
  );
  notifyList.add(
    ICNotifyModel(img: ICDashedBoardImage1, name: 'Awasome Decorators', address: 'Ch Latif Road Bahwalpur.', rating: 3.5, distance: 14.2),
  );
  notifyList.add(
    ICNotifyModel(img: ICDashedBoardImage3, name: 'Zahid Fonts', address: 'Sixth Road RawalPindi.', rating: 2.0, distance: 10.0),
  );
  notifyList.add(
    ICNotifyModel(img: ICdDashedBoardImage5, name: 'Imagine Colors Font ', address: 'Hall Road Lahore.', rating: 5.0, distance: 17.5),
  );
  notifyList.add(
    ICNotifyModel(img: ICDashedBoardImage6, name: 'Horward Desinors', address: 'Main korangi road karachi.', rating: 3.5, distance: 11.0),
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