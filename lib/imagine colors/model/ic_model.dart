import 'package:flutter/material.dart';

class ICBestSpecialModel {
  String title;
  String subTitle;
  String img;

  ICBestSpecialModel({this.title, this.subTitle, this.img});
}

class ICCallModel {
  String img;
  String name;
  IconData callImg;
  String callStatus;
  String videoCallIcon;
  String audioCallIcon;

  ICCallModel({this.img, this.name, this.callImg, this.callStatus, this.videoCallIcon, this.audioCallIcon});
}

class ICCategoryModel {
  String img;
  String categoryName;

  ICCategoryModel({this.img, this.categoryName});
}

class ICGalleryModel {
  String img;

  ICGalleryModel({this.img});
}

class ICBoardStyleModel {
  String img;
  String name;

  ICBoardStyleModel({this.img, this.name});
}

class ICIncludeServiceModel {
  String serviceImg;
  String serviceName;
  String time;
  int price;

  ICIncludeServiceModel({this.serviceImg, this.serviceName, this.time, this.price});
}

class ICStyleModel {
  String img;
  String name;

  ICStyleModel({this.img, this.name});
}

class MessageModel {
  String img;
  String name;
  String message;
  String lastSeen;

  MessageModel({this.img, this.name, this.message, this.lastSeen});
}

class ICNotificationModel {
  String img;
  String name;
  String msg;
  String status;
  String callInfo;

  ICNotificationModel({this.img, this.name, this.msg, this.status, this.callInfo});
}
class ICNotifyModel {
  String img;
  String name;
  String address;
  double rating;
  double distance;

  ICNotifyModel({this.img, this.name, this.address, this.rating, this.distance});
}

class ICOfferModel{

  String img;
  String offerName;
  String offerDate;
  int offerOldPrice;
  int offerNewPrice;

  ICOfferModel({this.img, this.offerName, this.offerDate, this.offerOldPrice,
    this.offerNewPrice});
}


class ICReviewModel{

  String img;
  String name;
  double rating ;
  String day;
  String review;

  ICReviewModel({this.img, this.name, this.rating, this.day, this.review});
}

class ICServicesModel{

  String img;
  String serviceName;
  String time;
  int price;
  int radioVal;

  ICServicesModel({this.img, this.serviceName, this.time, this.price,this.radioVal});
}

class ICSpecialOfferModel{
  String img;
  String title;
  String subtitle;

  ICSpecialOfferModel({this.img, this.title, this.subtitle});
}

class ICMessageModel {
  int senderId;
  int receiverId;
  String msg;
  String time;

  ICMessageModel({this.senderId, this.receiverId, this.msg, this.time});
}