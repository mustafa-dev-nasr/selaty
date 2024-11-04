import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'api_error_model.dart';

enum DataSource {
  NO_CONTENT,
  BAD_REQUEST,
  FORBIDDEN,
  UNAUTHORISED,
  NOT_FOUND,
  INTERNAL_SERVER_ERROR,
  CONNECT_TIMEOUT,
  CANCEL,
  RECEIVE_TIMEOUT, // Fixed typo
  SEND_TIMEOUT,
  CACHE_ERROR,
  NO_INTERNET_CONNECTION,
  DEFAULT
}

class ResponseCode {
  static const int SUCCESS = 201;
  static const int NO_CONTENT = 202;
  static const int BAD_REQUEST = 400;
  static const int UNAUTHORISED = 401;
  static const int FORBIDDEN = 403;
  static const int INTERNAL_SERVER_ERROR = 500;
  static const int NOT_FOUND = 404;
  static const int API_LOGIC_ERROR = 422;

  static const int CONNECT_TIMEOUT = -1;
  static const int CANCEL = -2;
  static const int RECEIVE_TIMEOUT = -3; // Fixed typo
  static const int SEND_TIMEOUT = -4;
  static const int CACHE_ERROR = -5;
  static const int NO_INTERNET_CONNECTION = -6;
  static const int DEFAULT = -7;
}

class ResponseMessage {
  static const String NO_CONTENT = ApiErrors.noContent;
  static const String BAD_REQUEST = ApiErrors.badRequestError;
  static const String UNAUTHORISED = ApiErrors.unauthorizedError;
  static const String FORBIDDEN = ApiErrors.forbiddenError;
  static const String INTERNAL_SERVER_ERROR = ApiErrors.internalServerError;
  static const String NOT_FOUND = ApiErrors.notFoundError;

  static String CONNECT_TIMEOUT = ApiErrors.timeoutError;
  static String CANCEL = ApiErrors.defaultError;
  static String RECEIVE_TIMEOUT = ApiErrors.timeoutError; // Fixed typo
  static String SEND_TIMEOUT = ApiErrors.timeoutError;
  static String CACHE_ERROR = ApiErrors.cacheError;
  static String NO_INTERNET_CONNECTION = ApiErrors.noInternetError;
  static String DEFAULT = ApiErrors.defaultError;
}

extension DataSourceExtension on DataSource {
  ApiErrorModel getFailure() {
    switch (this) {
      case DataSource.NO_CONTENT:
        return ApiErrorModel(error: ResponseMessage.NO_CONTENT);
      case DataSource.BAD_REQUEST:
        return ApiErrorModel(error: ResponseMessage.BAD_REQUEST);
      case DataSource.FORBIDDEN:
        return ApiErrorModel(error: ResponseMessage.FORBIDDEN);
      case DataSource.UNAUTHORISED:
        return ApiErrorModel(error: ResponseMessage.UNAUTHORISED);
      case DataSource.NOT_FOUND:
        return ApiErrorModel(error: ResponseMessage.NOT_FOUND);
      case DataSource.INTERNAL_SERVER_ERROR:
        return ApiErrorModel(error: ResponseMessage.INTERNAL_SERVER_ERROR);
      case DataSource.CONNECT_TIMEOUT:
        return ApiErrorModel(error: ResponseMessage.CONNECT_TIMEOUT);
      case DataSource.CANCEL:
        return ApiErrorModel(error: ResponseMessage.CANCEL);
      case DataSource.RECEIVE_TIMEOUT:
        return ApiErrorModel(error: ResponseMessage.RECEIVE_TIMEOUT);
      case DataSource.SEND_TIMEOUT:
        return ApiErrorModel(error: ResponseMessage.SEND_TIMEOUT);
      case DataSource.CACHE_ERROR:
        return ApiErrorModel(error: ResponseMessage.CACHE_ERROR);
      case DataSource.NO_INTERNET_CONNECTION:
        return ApiErrorModel(error: ResponseMessage.NO_INTERNET_CONNECTION);
      case DataSource.DEFAULT:
        return ApiErrorModel(error: ResponseMessage.DEFAULT);
    }
  }
}

class ErrorHandler implements Exception {
  late ApiErrorModel apiErrorModel;

  ErrorHandler.handle(dynamic error) {
    if (error is DioException) {
      apiErrorModel = _handleError(error);
    } else {
      apiErrorModel = DataSource.DEFAULT.getFailure();
    }
  }
}

ApiErrorModel _handleError(DioException error) {
  switch (error.type) {
    case DioExceptionType.connectionTimeout:
      return DataSource.CONNECT_TIMEOUT.getFailure();
    case DioExceptionType.sendTimeout:
      return DataSource.SEND_TIMEOUT.getFailure();
    case DioExceptionType.receiveTimeout:
      return DataSource.RECEIVE_TIMEOUT.getFailure();
    case DioExceptionType.badResponse:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        // Check if response data is a Map before parsing
        if (error.response?.data is Map<String, dynamic>) {
          return ApiErrorModel.fromJson(error.response!.data);
        } else {
          return DataSource.DEFAULT
              .getFailure(); // Handle non-JSON responses gracefully
        }
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.unknown:
      if (error.response != null &&
          error.response?.statusCode != null &&
          error.response?.statusMessage != null) {
        // Check if response data is a Map before parsing
        if (error.response?.data is Map<String, dynamic>) {
          return ApiErrorModel.fromJson(error.response!.data);
        } else {
          return DataSource.DEFAULT
              .getFailure(); // Handle non-JSON responses gracefully
        }
      } else {
        return DataSource.DEFAULT.getFailure();
      }
    case DioExceptionType.cancel:
      return DataSource.CANCEL.getFailure();
    case DioExceptionType.connectionError:
      return DataSource.DEFAULT.getFailure();
    case DioExceptionType.badCertificate:
      return DataSource.DEFAULT.getFailure();
  }
}

class ApiInternalStatus {
  static const int SUCCESS = 0;
  static const int FAILURE = 1;
}
