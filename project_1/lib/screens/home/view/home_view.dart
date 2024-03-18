import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/constants/colors.dart';
import 'package:project_1/screens/home/controller/homecontroller.dart';
import 'package:project_1/screens/inspection/view/inspectionpage.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 80,
          leadingWidth: 70,
          leading: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: SizedBox(
              height: 25,
              width: 70,
              child: Text(
                "App Name",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          backgroundColor: bluecolor,
          actions: [
            GestureDetector(
              onTap: () {
                Get.to(const InspectionPage());
              },
              child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Saved Inspections",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
            ),
          ],
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
                          itemBuilder: (context, index) => Card(
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
                                          controller.datalist.value[index].name
                                              .toString(),
                                          style: const TextStyle(fontSize: 16),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.location_on,
                                          color: bluecolor,
                                          size: 20,
                                        ),
                                        Text(
                                          controller
                                              .datalist.value[index].address
                                              .toString(),
                                          style: const TextStyle(fontSize: 16),
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
                                          controller
                                              .datalist.value[index].startdate
                                              .toString(),
                                          style: const TextStyle(fontSize: 16),
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
            )
          ],
        ));
  }
}
