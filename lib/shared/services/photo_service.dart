import 'dart:convert';

import 'package:davodeneme/shared/models/photo_model.dart';
import 'package:davodeneme/shared/services/service_interceptor.dart';
import 'package:dio/dio.dart';

class PhotoService {
  final DioClient _dioClient = DioClient();

  Future<List<ICrmPersonsResponse>> getPhoto() async {
    Response response = await _dioClient.dio.get('/photos');
    return iCrmPersonsResponseFromJson(response.data);
  }
}
