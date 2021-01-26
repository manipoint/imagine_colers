import 'package:flutter/material.dart';

class AppTheme {
  List<ProTheme> themes;
  List<ProTheme> screenList;
  ProTheme dashboard;
  ProTheme fullApp;
  ProTheme widgets;
  ProTheme defaultTheme;
  ProTheme integrations;
  ProTheme webApps;

  AppTheme({this.themes, this.screenList, this.dashboard, this.fullApp, this.widgets, this.defaultTheme, this.integrations, this.webApps});

  factory AppTheme.fromJson(Map<String, dynamic> json) {
    return AppTheme(
      themes: json['themes'] != null ? (json['themes'] as List).map((i) => ProTheme.fromJson(i)).toList() : null,
      screenList: json['screen_list'] != null ? (json['screen_list'] as List).map((i) => ProTheme.fromJson(i)).toList() : null,
      dashboard: json['dashboard'] != null ? ProTheme.fromJson(json['dashboard']) : null,
      fullApp: json['fullapp'] != null ? ProTheme.fromJson(json['fullapp']) : null,
      widgets: json['widgets'] != null ? ProTheme.fromJson(json['widgets']) : null,
      defaultTheme: json['defaultTheme'] != null ? ProTheme.fromJson(json['defaultTheme']) : null,
      integrations: json['integrations'] != null ? ProTheme.fromJson(json['integrations']) : null,
      webApps: json['webApps'] != null ? ProTheme.fromJson(json['webApps']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.themes != null) {
      data['themes'] = this.themes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProTheme {
  String name;
  // ignore: non_constant_identifier_names
  bool showCover;
  // ignore: non_constant_identifier_names
  List<ProTheme> subKit;
  // ignore: non_constant_identifier_names
  String titleName;
  String type;
  String icon;
  // ignore: non_constant_identifier_names
  bool isTheme;
  String tag;
  bool darkThemeSupported;
  Widget widget;

  ProTheme({this.name, this.icon, this.isTheme, this.tag, this.type, this.showCover, this.subKit, this.titleName, this.darkThemeSupported, this.widget});

  factory ProTheme.fromJson(Map<String, dynamic> json) {
    return ProTheme(
      name: json['name'],
      icon: json['icon'],
      isTheme: json['is_theme'],
      tag: json['tag'],
      type: json['type'],
      showCover: json['show_cover'],
      subKit: json['subKit'] != null ? (json['subKit'] as List).map((i) => ProTheme.fromJson(i)).toList() : null,
      titleName: json['titleName'],
      darkThemeSupported: json['darkThemeSupported'],
      widget: json['widget'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['show_cover'] = this.showCover;
    data['titleName'] = this.titleName;
    data['type'] = this.type;
    data['tag'] = this.tag;
    data['darkThemeSupported'] = this.darkThemeSupported;
    data['icon'] = this.icon;
    data['widget'] = this.widget;
    data['is_theme'] = this.isTheme;
    if (this.subKit != null) {
      data['subKit'] = this.subKit.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
