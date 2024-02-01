import 'package:assignment/features/company_listing/data/data_source/company_listing_data_source.dart';
import 'package:assignment/features/company_listing/data/repository_implementation/company_listing_repo_implementation.dart';
import 'package:assignment/features/company_listing/domain/repository/company_listing_repository.dart';
import 'package:assignment/features/company_listing/domain/usercase/company_listing_usecase.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';
import '../features/company_listing/presentation/pages/company_listing_view_model.dart';
import '../utils/network/base_network_request.dart';
import '../utils/network/connection.dart';

class InitialBinding extends Bindings{
  @override
  void dependencies() {
    /* 
::::::::::::::::::::::::::::::::::::::::::::::::::::::
     :::::::::::::::: USECASES :::::::::::::::::::::::::::::
::::::::::::::::::::::::::::::::::::::::::::::::::::::
 */


    Get.lazyPut(() => Connectivity());

    Get.lazyPut<CompanyListingUseCase>(
          () => CompanyListingUseCase(companyListingRepository: Get.find<CompanyListingRepository>()),
    );

    Get.lazyPut(() => CompanyListingViewModel(Get.find<CompanyListingUseCase>()));

/* 
:::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::  REPOSITORIES ::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::
 */

    Get.lazyPut<CompanyListingRepository>(
            () => CompanyListingRepositoryImplementation());


/* 
:::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::  DATA SOURCE ::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::
*/

    Get.lazyPut<CompanyListingDS>(
          () => CompanyListingDS(),
    );



/* 
:::::::::::::::::::::::::::::::::::::::::::::::::::::
    :::::::::::::::  NETWORK UTILS ::::::::::::::::::::::::
:::::::::::::::::::::::::::::::::::::::::::::::::::::
*/

   Get.lazyPut<NetworkInfoImpl>(() => NetworkInfoImpl(
      connectivity: Get.find<Connectivity>(),
    ));

   Get.lazyPut<NetworkRequest>(() => NetworkRequest(
      networkInfo:Get.find<NetworkInfo>(),
    ));

  }
  
}
