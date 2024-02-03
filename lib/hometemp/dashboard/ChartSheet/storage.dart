import 'dart:async';
import 'dart:convert';

import 'package:dashboard/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncubeDashboardItem extends DashboardItem {
  IncubeDashboardItem({
    this.color,
    required int width,
    required int height,
    required String identifier,
    this.data,
    this.xAxisData,
    this.yAxisData,
    int minWidth = 1,
    int minHeight = 1,
    int? maxHeight,
    int? maxWidth,
    int? startX,
    int? startY,
  }) : super(
            startX: startX,
            startY: startY,
            width: width,
            height: height,
            identifier: identifier,
            maxHeight: maxHeight,
            maxWidth: maxWidth,
            minWidth: minWidth,
            minHeight: minHeight);

  IncubeDashboardItem.fromMap(Map<String, dynamic> map)
      : color = map["color"] != null ? Color(map["color"]) : null,
        data = map["data"],
        xAxisData = map["xAxisData"],
        yAxisData = map["yAxisData"],
        super.withLayout(map["item_id"], ItemLayout.fromMap(map["layout"]));

  Color? color;
  String? data;
  List<dynamic>? xAxisData;
  List<dynamic>? yAxisData;

  @override
  Map<String, dynamic> toMap() {
    var sup = super.toMap();
    if (color != null) {
      sup["color"] = color?.value;
    }
    if (data != null) {
      sup["data"] = data;
    }
    return sup;
  }
}

class MyItemStorage extends DashboardItemStorageDelegate<IncubeDashboardItem> {
  late SharedPreferences _preferences;

  final List<int> _slotCounts = [4, 6, 8];

  Map<int, Map<String, IncubeDashboardItem>>? _localItems;

  @override
  FutureOr<List<IncubeDashboardItem>> getAllItems(int slotCount) {
    try {
      if (_localItems != null) {
        return _localItems![slotCount]!.values.toList();
      }

      return Future.microtask(() async {
        _preferences = await SharedPreferences.getInstance();

        var layoutData = _preferences.getString("layout_data_$slotCount");

        if (layoutData == null) {
          // If "layout_data_$slotCount" does not exist in SharedPreferences, return a list containing a single custom item
          return [
            IncubeDashboardItem(
              color: Colors.blue,
              width: 1,
              height: 1,
              identifier: "custom",
              data: "custom",
            ),
          ];
        }

        var js = json.decode(layoutData);

        return js.values
            .map<IncubeDashboardItem>(
                (value) => IncubeDashboardItem.fromMap(value))
            .toList();
      });
    } on Exception {
      rethrow;
    }
  }

  @override
  FutureOr<void> onItemsUpdated(
      List<IncubeDashboardItem> items, int slotCount) async {
    _setLocal();

    for (var item in items) {
      _localItems?[slotCount]?[item.identifier] = item;
    }

    var js = json.encode(_localItems![slotCount]!
        .map((key, value) => MapEntry(key, value.toMap())));

    await _preferences.setString("layout_data_$slotCount", js);
  }

  @override
  FutureOr<void> onItemsAdded(
      List<IncubeDashboardItem> items, int slotCount) async {
    _setLocal();
    for (var s in _slotCounts) {
      for (var i in items) {
        _localItems![s]?[i.identifier] = i;
      }

      await _preferences.setString(
          "layout_data_$s",
          json.encode(_localItems![s]!
              .map((key, value) => MapEntry(key, value.toMap()))));
    }
  }

  @override
  FutureOr<void> onItemsDeleted(
      List<IncubeDashboardItem> items, int slotCount) async {
    _setLocal();
    for (var s in _slotCounts) {
      for (var i in items) {
        _localItems![s]?.remove(i.identifier);
      }

      await _preferences.setString(
          "layout_data_$s",
          json.encode(_localItems![s]!
              .map((key, value) => MapEntry(key, value.toMap()))));
    }
  }

  Future<void> clear() async {
    for (var s in _slotCounts) {
      _localItems?[s]?.clear();
      await _preferences.remove("layout_data_$s");
    }
    _localItems = null;
    await _preferences.setBool("init", false);
  }

  _setLocal() {
    _localItems ??= {for (var s in _slotCounts) s: {}};
  }

  @override
  bool get layoutsBySlotCount => true;

  @override
  bool get cacheItems => true;
}
