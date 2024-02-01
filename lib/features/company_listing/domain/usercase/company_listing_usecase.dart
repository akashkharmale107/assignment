import 'package:assignment/features/company_listing/domain/enitities/company_listing_entities.dart';
import 'package:assignment/features/company_listing/domain/repository/company_listing_repository.dart';
import 'package:assignment/utils/base_usecase.dart';

class CompanyListingUseCase
    extends UseCase<CompanyListingResponseEntity, NoParams> {
  final CompanyListingRepository companyListingRepository;

  CompanyListingUseCase({required this.companyListingRepository});

  @override
  Future<CompanyListingResponseEntity> call({required NoParams params}) async {
    return await companyListingRepository.getCompanyList();
  }
}

class NoParams {}
