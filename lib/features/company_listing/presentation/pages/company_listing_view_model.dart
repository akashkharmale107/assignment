import 'package:assignment/di/di_container.dart';
import 'package:assignment/features/company_listing/domain/enitities/company_listing_entities.dart';
import 'package:assignment/features/company_listing/domain/usercase/company_listing_usecase.dart';
import 'package:get/get.dart';

class CompanyListingViewModel extends GetxController{
  final CompanyListingUseCase getProfileDataUseCase;
  CompanyListingViewModel(this.getProfileDataUseCase);
  var data=CompanyListingResponseEntity(companyList: []).obs;
  var companyList = [].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    data=Rx<CompanyListingResponseEntity>(await getProfileDataUseCase.call(params: NoParams()));
    companyList.value = data.value.companyList;
    //companyList = RxList(data.value.companyList);
    print('company list:${companyList.value.runtimeType}');
  }
}