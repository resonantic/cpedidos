import 'package:cpedidos_pmp/core/errors/error_handler.dart';
import 'package:cpedidos_pmp/features/orders/domain/entities/order.dart';
import 'package:cpedidos_pmp/features/orders/domain/errors/failures.dart';
import 'package:cpedidos_pmp/features/orders/infra/datasources/order_datasource.dart';
import 'package:cpedidos_pmp/features/orders/infra/repositories/order_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

import '../../../../mocks.dart';

void main() {
  late IErrorHandler mockErrorHandler;
  late IOrderDatasource mockOrderDatasource;
  late OrderRepositoryImpl repository;

  setUp(() {
    mockErrorHandler = MockErrorHandler();
    mockOrderDatasource = MockOrderDatasource();
    repository = OrderRepositoryImpl(mockErrorHandler, mockOrderDatasource);
  });

  final tOrdersFailure = MockOrdersFailure();
  const tType = 'type';
  const tNumber = 'number';
  const tSendDate = 'sendDate';
  const tArrivalDate = 'arrivalDate';
  const tOrder = Order(
    number: tNumber,
    type: tType,
    arrivalDate: 'arrivalDate',
    secretary: 'secretary',
    project: 'project',
    description: 'description',
  );
  const tOrderList = [tOrder];

  group('getOrderByTypeAndNumber', () {
    test(
      'should return an Order when order exists.',
      () async {
        // arrange
        when(() => mockOrderDatasource.getOrderByTypeAndNumber(tType, tNumber))
            .thenAnswer((_) async => tOrder);
        // act
        final result = await repository.getOrderByTypeAndNumber(tType, tNumber);
        // assert
        expect(result.getOrNull(), equals(tOrder));
      },
    );

    test(
      'should return a known failure when datasource throws a known failure.',
      () async {
        // arrange
        when(() => mockOrderDatasource.getOrderByTypeAndNumber(tType, tNumber))
            .thenThrow(tOrdersFailure);
        // act
        final result = await repository.getOrderByTypeAndNumber(tType, tNumber);
        // assert
        expect(result.exceptionOrNull(), equals(tOrdersFailure));
      },
    );

    test(
      'should report exception and return a failure on unknown exception.',
      () async {
        // arrange
        final tException = Exception('unknown');
        when(() => mockOrderDatasource.getOrderByTypeAndNumber(tType, tNumber))
            .thenThrow(tException);
        when(() => mockErrorHandler.reportException(tException, any()))
            .thenAnswer((_) async {});
        // act
        final result = await repository.getOrderByTypeAndNumber(tType, tNumber);
        // assert
        verify(() => mockErrorHandler.reportException(tException, any()))
            .called(1);
        expect(result.exceptionOrNull(), isA<UnknownError>());
      },
    );
  });

  group('getAllOrdersBySendDate', () {
    test(
      'should return an order list on success.',
      () async {
        // arrange
        when(() => mockOrderDatasource.getAllOrdersBySendDate(tSendDate))
            .thenAnswer((_) async => tOrderList);
        // act
        final result = await repository.getAllOrdersBySendDate(tSendDate);
        // assert
        expect(result.getOrNull(), equals(tOrderList));
      },
    );

    test(
      'should return a known failure when datasource throws a known failure.',
      () async {
        // arrange
        when(() => mockOrderDatasource.getAllOrdersBySendDate(tSendDate))
            .thenThrow(tOrdersFailure);
        // act
        final result = await repository.getAllOrdersBySendDate(tSendDate);
        // assert
        expect(result.exceptionOrNull(), equals(tOrdersFailure));
      },
    );

    test(
      'should report exception and return a failure on unknown exception.',
      () async {
        // arrange
        final tException = Exception('unknown');
        when(() => mockOrderDatasource.getAllOrdersBySendDate(tSendDate))
            .thenThrow(tException);
        when(() => mockErrorHandler.reportException(tException, any()))
            .thenAnswer((_) async {});
        // act
        final result = await repository.getAllOrdersBySendDate(tSendDate);
        // assert
        verify(() => mockErrorHandler.reportException(tException, any()))
            .called(1);
        expect(result.exceptionOrNull(), isA<UnknownError>());
      },
    );
  });

  group('getAllOrdersByArrivalDate', () {
    test(
      'should return an order list on success.',
      () async {
        // arrange
        when(() => mockOrderDatasource.getAllOrdersByArrivalDate(tArrivalDate))
            .thenAnswer((_) async => tOrderList);
        // act
        final result = await repository.getAllOrdersByArrivalDate(tArrivalDate);
        // assert
        expect(result.getOrNull(), equals(tOrderList));
      },
    );

    test(
      'should return a known failure when datasource throws a known failure.',
      () async {
        // arrange
        when(() => mockOrderDatasource.getAllOrdersByArrivalDate(tArrivalDate))
            .thenThrow(tOrdersFailure);
        // act
        final result = await repository.getAllOrdersByArrivalDate(tArrivalDate);
        // assert
        expect(result.exceptionOrNull(), equals(tOrdersFailure));
      },
    );

    test(
      'should report exception and return a failure on unknown exception.',
      () async {
        // arrange
        final tException = Exception('unknown');
        when(() => mockOrderDatasource.getAllOrdersByArrivalDate(tArrivalDate))
            .thenThrow(tException);
        when(() => mockErrorHandler.reportException(tException, any()))
            .thenAnswer((_) async {});
        // act
        final result = await repository.getAllOrdersByArrivalDate(tArrivalDate);
        // assert
        verify(() => mockErrorHandler.reportException(tException, any()))
            .called(1);
        expect(result.exceptionOrNull(), isA<UnknownError>());
      },
    );
  });

  group('saveOrder', () {
    test(
      'should return an order when save with success.',
      () async {
        // arrange
        when(() => mockOrderDatasource.saveOrder(tOrder))
            .thenAnswer((_) async => tOrder);
        // act
        final result = await repository.saveOrder(tOrder);
        // assert
        expect(result.getOrNull(), equals(tOrder));
      },
    );

    test(
      'should return a known failure when datasource throws a known failure.',
      () async {
        // arrange
        when(() => mockOrderDatasource.saveOrder(tOrder))
            .thenThrow(tOrdersFailure);
        // act
        final result = await repository.saveOrder(tOrder);
        // assert
        expect(result.exceptionOrNull(), equals(tOrdersFailure));
      },
    );

    test(
      'should report exception and return a failure on unknown exception.',
      () async {
        // arrange
        final tException = Exception('unknown');
        when(() => mockOrderDatasource.saveOrder(tOrder)).thenThrow(tException);
        when(() => mockErrorHandler.reportException(tException, any()))
            .thenAnswer((_) async {});
        // act
        final result = await repository.saveOrder(tOrder);
        // assert
        verify(() => mockErrorHandler.reportException(tException, any()))
            .called(1);
        expect(result.exceptionOrNull(), isA<UnknownError>());
      },
    );
  });

  group('deleteOrder', () {
    test(
      'should return an unit when delete with success.',
      () async {
        // arrange
        when(() => mockOrderDatasource.deleteOrder(tOrder))
            .thenAnswer((_) async => true);
        // act
        final result = await repository.deleteOrder(tOrder);
        // assert
        expect(result.getOrNull(), equals(unit));
      },
    );

    test(
      'should return a known failure when datasource throws a known failure.',
      () async {
        // arrange
        when(() => mockOrderDatasource.deleteOrder(tOrder))
            .thenThrow(tOrdersFailure);
        // act
        final result = await repository.deleteOrder(tOrder);
        // assert
        expect(result.exceptionOrNull(), equals(tOrdersFailure));
      },
    );

    test(
      'should report exception and return a failure on unknown exception.',
      () async {
        // arrange
        final tException = Exception('unknown');
        when(() => mockOrderDatasource.deleteOrder(tOrder))
            .thenThrow(tException);
        when(() => mockErrorHandler.reportException(tException, any()))
            .thenAnswer((_) async {});
        // act
        final result = await repository.deleteOrder(tOrder);
        // assert
        verify(() => mockErrorHandler.reportException(tException, any()))
            .called(1);
        expect(result.exceptionOrNull(), isA<UnknownError>());
      },
    );
  });
}
