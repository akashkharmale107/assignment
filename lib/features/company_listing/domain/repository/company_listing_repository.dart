import 'package:assignment/features/company_listing/domain/enitities/company_listing_entities.dart';
import 'package:flutter/foundation.dart' show immutable;


@immutable
abstract class CompanyListingRepository {
  Future<CompanyListingResponseEntity> getCompanyList();
}
