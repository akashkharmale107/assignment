

import 'package:assignment/di/di_container.dart';
import 'package:assignment/features/company_listing/data/models/company_listing_model.dart';
import 'package:assignment/utils/network/base_network_request.dart';
import 'package:assignment/utils/network/connection.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CompanyListingDS {
  Future<CompanyListingResponseModel> getCompanyListDS() async {
    NetworkRequest requestObj =
        NetworkRequest(networkInfo: Get.find<NetworkInfoImpl>());
    final CompanyListingResponseModel resp = await requestObj.sendRequest(
      method: "GET",
      url: "https://jsonplaceholder.typicode.com/albums/1/photos",
      body:{},
      fromJson: (data) => CompanyListingResponseModel.fromJson(
        {'CompanyList': data},
      ),
      headers: {},
    );
    return resp;
  }
}
