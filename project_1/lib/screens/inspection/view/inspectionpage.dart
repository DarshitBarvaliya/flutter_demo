import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/constants/colors.dart';
import 'package:project_1/screens/inspection/controller/inspectionController.dart';
import 'package:project_1/screens/inspection/details/controller/inspectiondetailcontroller.dart';

class InspectionPage extends StatefulWidget {
  const InspectionPage({super.key});

  @override
  State<InspectionPage> createState() => _InspectionPageState();
}

class _InspectionPageState extends State<InspectionPage> {
  var controller = Get.put(InspectionlistController());
  var detailcontroller = Get.put(InspectionDetailController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: bluecolor,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              )),
          title: const Text(
            "Saved Inspections",
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Obx(
                  () => controller.isLoading.value == true
                      ? const Expanded(
                          child: Center(child: CircularProgressIndicator()))
                      : ListView.builder(
                          itemCount: controller.datalist.value.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              detailcontroller.getByIdInspection(controller
                                  .datalist.value[index].id
                                  .toString());
                            },
                            child: Card(
                              elevation: 5,
                              child: Container(
                                height: 140,
                                width: Get.width,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.person,
                                            color: bluecolor,
                                            size: 20,
                                          ),
                                          Text(
                                            controller.datalist.value[index]
                                                    .name ??
                                                'Not Found',
                                            style:
                                                const TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.description,
                                            color: bluecolor,
                                            size: 20,
                                          ),
                                          Text(
                                            controller.datalist.value[index]
                                                    .discription ??
                                                'Not Found',
                                            style:
                                                const TextStyle(fontSize: 16),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.date_range,
                                            color: bluecolor,
                                            size: 20,
                                          ),
                                          Text(
                                            controller.datalist.value[index]
                                                        .date ==
                                                    null
                                                ? "Not Found"
                                                : controller
                                                    .datalist.value[index].date
                                                    .toString(),
                                            style:
                                                const TextStyle(fontSize: 16),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
            )
          ],
        ));
  }
}
