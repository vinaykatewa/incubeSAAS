import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

import 'package:dashboard/dashboard.dart';
import './ChartSheet/chartProvider.dart';
import './ChartSheet/charts/lineChartSrtup.dart';
import './ChartSheet/sheets/portFolioStartups.dart';
import './ChartSheet/storage.dart';
import './ChartSheet/add_dialog.dart';
import './ChartSheet/data_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

class DashboardWidget extends StatefulWidget {
  const DashboardWidget({Key? key}) : super(key: key);
  @override
  State<DashboardWidget> createState() => _DashboardWidgetState();
}

class _DashboardWidgetState extends State<DashboardWidget> {
  final ScrollController scrollController = ScrollController();
  late var _itemController =
      DashboardItemController<IncubeDashboardItem>.withDelegate(
          itemStorageDelegate: storage);

  bool refreshing = false;

  var storage = MyItemStorage();

  DashboardItemController<IncubeDashboardItem> get itemController =>
      _itemController;

  int? slot;

  setSlot() {
    var w = MediaQuery.of(context).size.width;
    setState(() {
      slot = w > 600
          ? w > 900
              ? 8
              : 6
          : 4;
    });
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    slot = w > 600
        ? w > 900
            ? 8
            : 6
        : 4;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF4285F4),
      //   automaticallyImplyLeading: false,
      //   actions: [
      //     IconButton(
      //         onPressed: () async {
      //           await storage.clear();
      //           setState(() {
      //             refreshing = true;
      //           });
      //           storage = MyItemStorage();
      //           _itemController = DashboardItemController.withDelegate(
      //               itemStorageDelegate: storage);
      //           Future.delayed(const Duration(milliseconds: 150)).then((value) {
      //             setState(() {
      //               refreshing = false;
      //             });
      //           });
      //         },
      //         icon: const Icon(Icons.refresh)),
      //     IconButton(
      //         onPressed: () {
      //           itemController.clear();
      //         },
      //         icon: const Icon(Icons.delete)),
      // IconButton(
      //     onPressed: () {
      // itemController.isEditing = !itemController.isEditing;
      // setState(() {});
      //     },
      //     icon: const Icon(Icons.edit)),
      //   ],
      // ),
      body: SafeArea(
        child: refreshing
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Dashboard<IncubeDashboardItem>(
                shrinkToPlace: false,
                slideToTop: true,
                absorbPointer: false,
                slotBackgroundBuilder: SlotBackgroundBuilder.withFunction(
                    (context, item, x, y, editing) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                }),
                padding: const EdgeInsets.all(8),
                horizontalSpace: 8,
                verticalSpace: 8,
                slotAspectRatio: 1,
                animateEverytime: true,
                dashboardItemController: itemController,
                slotCount: slot!,
                errorPlaceholder: (e, s) {
                  return Text("$e , $s");
                },
                emptyPlaceholder: const Center(child: Text("Empty")),
                itemStyle: ItemStyle(
                    color: Colors.transparent,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15))),
                physics: const RangeMaintainingScrollPhysics(),
                editModeSettings: EditModeSettings(
                    draggableOutside: false,
                    paintBackgroundLines: false,
                    autoScroll: true,
                    resizeCursorSide: 15,
                    curve: Curves.easeOut,
                    duration: const Duration(milliseconds: 300),
                    backgroundStyle: const EditModeBackgroundStyle(
                        lineColor: Colors.black38,
                        lineWidth: 0.5,
                        dualLineHorizontal: false,
                        dualLineVertical: false)),
                itemBuilder: (IncubeDashboardItem item) {
                  var layout = item.layoutData;

                  if (item.data != null) {
                    return DataWidget(
                      item: item,
                    );
                  } else {
                    return Container();
                  }
                },
              ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.edit),
            onPressed: () {
              itemController.isEditing = !itemController.isEditing;
              setState(() {});
            },
          ),
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              add(context);
            },
          ),
        ],
      ),
    );
  }

  Future<void> add(BuildContext context) async {
    var res = await showDialog(
        context: context,
        builder: (c) {
          return const AddDialog();
        });

    if (res != null) {
      itemController.add(
          IncubeDashboardItem(
              color: res[6],
              width: res[0],
              height: res[1],
              startX: 0,
              startY: 0,
              identifier: (Random().nextInt(100000) + 4).toString(),
              minWidth: res[2],
              minHeight: res[3],
              maxWidth: res[4] == 0 ? null : res[4],
              maxHeight: res[5] == 0 ? null : res[5],
              data: "line-chart"),
          mountToTop: false);
    }
  }
}
