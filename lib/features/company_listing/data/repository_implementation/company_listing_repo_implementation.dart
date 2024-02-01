import 'package:assignment/features/company_listing/data/data_source/company_listing_data_source.dart';
import 'package:assignment/features/company_listing/domain/enitities/company_listing_entities.dart';
import 'package:assignment/features/company_listing/domain/repository/company_listing_repository.dart';

class CompanyListingRepositoryImplementation extends CompanyListingRepository {
  final CompanyListingDS companyListingDS = CompanyListingDS();

  @override
  Future<CompanyListingResponseEntity> getCompanyList() async {
    return companyListingDS.getCompanyListDS();
  }
}
