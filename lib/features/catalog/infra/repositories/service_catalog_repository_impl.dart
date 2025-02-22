import 'package:result_dart/result_dart.dart';

import '../../../../core/errors/error_handler.dart';
import '../../domain/entities/service.dart';
import '../../domain/errors/failures.dart';
import '../../domain/repositories/service_catalog_repository.dart';
import '../datasources/service_catalog_datasource.dart';

class ServiceCatalogRepositoryImpl implements IServiceCatalogRepository {
  final IErrorHandler _errorHandler;
  final IServiceCatalogDatasource _serviceCatalogDatasource;

  ServiceCatalogRepositoryImpl(
    this._errorHandler,
    this._serviceCatalogDatasource,
  );

  @override
  AsyncResult<Service, CatalogFailure> getServiceByCode(String code) async {
    try {
      final service = await _serviceCatalogDatasource.getServiceByCode(code);

      return Success(service);
    } on CatalogFailure catch (failure) {
      return Failure(failure);
    } catch (exception, stackTrace) {
      await _errorHandler.reportException(exception, stackTrace);
      return const Failure(UnknownError());
    }
  }

  @override
  AsyncResult<List<Service>, CatalogFailure> getServicesByDescription(
    String query,
  ) async {
    try {
      final service =
          await _serviceCatalogDatasource.getServicesByDescription(query);

      return Success(service);
    } on CatalogFailure catch (failure) {
      return Failure(failure);
    } catch (exception, stackTrace) {
      await _errorHandler.reportException(exception, stackTrace);
      return const Failure(UnknownError());
    }
  }

  @override
  AsyncResult<List<Service>, CatalogFailure> getServicesByGroupDescription(
    String query,
  ) async {
    try {
      final service =
          await _serviceCatalogDatasource.getServicesByGroupDescription(query);

      return Success(service);
    } on CatalogFailure catch (failure) {
      return Failure(failure);
    } catch (exception, stackTrace) {
      await _errorHandler.reportException(exception, stackTrace);
      return const Failure(UnknownError());
    }
  }
}
