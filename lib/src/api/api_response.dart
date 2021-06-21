

import 'package:movies_now/src/api/app_exceptions.dart';

enum Status { LOADING, COMPLETED, ERROR }

class ApiResponse<T> {
  Status status;
  T data;
  String message;
  AppException appException;

  ApiResponse.loading(this.message) : status = Status.LOADING;
  ApiResponse.completed(this.data) : status = Status.COMPLETED;
  ApiResponse.error(this.appException) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

