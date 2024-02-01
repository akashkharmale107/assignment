// To parse this JSON data, do
//
//     final companyListingResponseModel = companyListingResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:assignment/features/company_listing/domain/enitities/company_listing_entities.dart';

CompanyListingResponseModel companyListingResponseModelFromJson(String str) => CompanyListingResponseModel.fromJson(json.decode(str));

String companyListingResponseModelToJson(CompanyListingResponseModel data) => json.encode(data.toJson());

class CompanyListingResponseModel extends CompanyListingResponseEntity {
  final List<CompanyList> companyList;

  CompanyListingResponseModel({
    required this.companyList,
  }) : super(companyList: companyList);

  factory CompanyListingResponseModel.fromJson(Map<String, dynamic> json) => CompanyListingResponseModel(
    companyList: List<CompanyList>.from(json["CompanyList"].map((x) => CompanyList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "CompanyList": List<dynamic>.from(companyList.map((x) => x.toJson())),
  };
}

class CompanyList extends CompanyListEntity {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  CompanyList({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  }) : super(albumId: albumId, id: id, title: title, url: url, thumbnailUrl: thumbnailUrl);

  factory CompanyList.fromJson(Map<String, dynamic> json) => CompanyList(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
