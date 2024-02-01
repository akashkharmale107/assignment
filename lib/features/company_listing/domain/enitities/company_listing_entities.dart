import 'package:equatable/equatable.dart';



class CompanyListingResponseEntity extends Equatable {
  final List<CompanyListEntity> companyList;

  CompanyListingResponseEntity({
    required this.companyList,
  });
  @override
  List<Object?> get props => [companyList];

}

class CompanyListEntity extends Equatable {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  CompanyListEntity({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });
  @override
  List<Object?> get props => [albumId, id, title, url, thumbnailUrl];

}

