import 'package:assignment/features/company_listing/domain/usercase/company_listing_usecase.dart';
import 'package:assignment/features/company_listing/presentation/pages/company_listing_view_model.dart';
import 'package:assignment/features/company_listing/presentation/widget/bottom_sheet.dart';
import 'package:assignment/features/company_listing/presentation/widget/drawer_widget.dart';
import 'package:assignment/utils/helper/shared_prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../data/models/company_listing_model.dart';

class CompanyListingPage extends GetView<CompanyListingViewModel> {
  const CompanyListingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      drawer: const Drawer(
        child:DrawerWidget()),
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.grey.shade100,
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.grey.shade100,
        elevation: 0,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ))
            ],
          )
        ],
      ),
      body: ColoredBox(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Find your Dream Job today",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Obx(
                  () {
                    debugPrint(
                        "COMPANY LIST::: ${controller.companyList.length}");
                    return ListView.separated(
                      itemCount: controller.companyList.length,
                      itemBuilder: (context, index) {
                        debugPrint("COMPANY LIST::: ${controller.companyList}");
                        CompanyList item = controller.companyList[index];
                        List<String> words = item.title.split(' ');
                        return InkWell(
                          onTap: () {
                            showModalBottomSheet<void>(
                                context: context,
                                backgroundColor: Colors.transparent,
                                builder: (BuildContext context) {
                                  return const CompanyDetailBottomSheet();
                                });
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CircleAvatar(
                                        backgroundImage:
                                            NetworkImage(item.thumbnailUrl),
                                        maxRadius: 30),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${words[0]} ${words[1]}",
                                              style: const TextStyle(
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            const SizedBox(height: 8),
                                            Text(
                                              item.title,
                                              maxLines: 1,
                                              softWrap: true,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey.shade500,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const CircleAvatar(
                                      maxRadius: 15,
                                      backgroundColor:
                                          Color.fromRGBO(100, 94, 254, 1),
                                      child: Icon(Icons.chevron_right_sharp),
                                    )
                                  ]),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 14);
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
