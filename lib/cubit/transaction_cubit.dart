import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:foodmarket/models/models.dart';
import 'package:foodmarket/services/services.dart';

part 'transaction_state.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> getTransactions() async {
    ApiReturnValue result = await TransactionServices.getTransactions();

    if (result != null) {
      emit(TransactionLoaded(transactions: result.value));
    } else {
      emit(TransactionLoadFailed(message: result.message));
    }
  }

  // cek kembalian setelah melakukan submit transaction
  Future<bool> submitTransaction({Transaction transaction}) async {
    ApiReturnValue result = await TransactionServices.submitTransaction(
      transaction: transaction,
    );

    if (result.value != null) {
      emit(TransactionLoaded(
          transactions:
              (state as TransactionLoaded).transactions + [result.value]));

      return true;
    } else {
      return false;
    }
  }
}
