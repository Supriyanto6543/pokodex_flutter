import 'package:dio/dio.dart';
import 'package:pokemon/features/data/model/home_model.dart';
import 'package:pokemon/utils/constant.dart';

import '../model/detail_model.dart';

abstract class RemoteDataRepository {
  Future<List<HomeModel>> getHomePage(int offset);
  Future<DetailModel?> getDetail(int id);
  String get baseUrl;
}

class RemoteDataRepositoryImpl implements RemoteDataRepository {
  late final Dio dio;

  RemoteDataRepositoryImpl(this.dio);

  @override
  // TODO: implement baseUrl
  String get baseUrl => Constant.baseUrl;

  @override
  Future<DetailModel?> getDetail(int id) async {
    // TODO: implement getDetail
    final request = await dio.get(baseUrl + Constant.detail + id.toString());
    if (request.statusCode == 200) {
      var data = request.data;
      return DetailModel.fromJson(data);
    } else {
      return null;
    }
  }

  @override
  Future<List<HomeModel>> getHomePage(int offset) async {
    // TODO: implement getHomePage
    final request = await dio.get(baseUrl + Constant.home + offset.toString());
    if (request.statusCode == 200) {
      List result = request.data['results'];
      return result.map((e) => HomeModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }
}
