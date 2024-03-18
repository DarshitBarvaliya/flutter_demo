import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_1/constants/colors.dart';
import 'package:project_1/constants/string.dart';
import 'package:project_1/screens/inspection/details/controller/inspectiondetailcontroller.dart';
import 'package:project_1/widgets/commonContainer.dart';

class InspectionDetail extends StatefulWidget {
  const InspectionDetail({super.key});

  @override
  State<InspectionDetail> createState() => _InspectionDetailState();
}

class _InspectionDetailState extends State<InspectionDetail> {
  var controller = Get.put(InspectionDetailController());
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
          "Inspections Details",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Inspections Note",
              style: TextStyle(fontSize: 20, color: bluecolor),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              controller.datalist['note'],
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Inspections type",
              style: TextStyle(fontSize: 20, color: bluecolor),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Quick Inspections",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Inspections Photo",
              style: TextStyle(fontSize: 20, color: bluecolor),
            ),
            SizedBox(
              height: 70,
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    CommonContainer(
                      inspectimage: controller.datalist['image1'],
                    ),
                    const SizedBox(width: 10),
                    CommonContainer(
                      inspectimage: controller.datalist['image2'],
                    ),
                    const SizedBox(width: 10),
                    CommonContainer(
                      inspectimage: controller.datalist['image3'],
                    ),
                    const SizedBox(width: 10),
                    CommonContainer(
                      inspectimage: controller.datalist['image4'],
                    ),
                    const SizedBox(width: 10),
                    CommonContainer(
                      inspectimage: controller.datalist['image5'],
                    ),
                    const SizedBox(width: 10),
                    CommonContainer(
                      inspectimage: controller.datalist['image6'],
                    ),
                    const SizedBox(width: 10),
                    CommonContainer(
                      inspectimage: controller.datalist['image7'],
                    ),
                    const SizedBox(width: 10),
                    CommonContainer(
                      inspectimage: controller.datalist['image8'],
                    ),
                    const SizedBox(width: 10),
                    CommonContainer(
                      inspectimage: controller.datalist['image9'],
                    ),
                    const SizedBox(width: 10),
                    CommonContainer(
                      inspectimage: controller.datalist['image10'],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Date",
              style: TextStyle(fontSize: 20, color: bluecolor),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              controller.datalist['date'],
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Add Name",
              style: TextStyle(fontSize: 20, color: bluecolor),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              controller.datalist['name'],
              style: const TextStyle(fontSize: 20, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Signature",
              style: TextStyle(fontSize: 20, color: bluecolor),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: Get.height/6,
              width: Get.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      image: NetworkImage(
                          "$imageUrl${controller.datalist['signature']}"),fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}
