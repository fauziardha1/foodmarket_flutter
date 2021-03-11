part of 'services.dart';

class TransactionServices {
  static Future<ApiReturnValue<List<Transaction>>> getTransactions() async {
    await Future.delayed(Duration(seconds: 3));

    return ApiReturnValue(value: mockTransaction);
  }

  // sumbit transaksi
  static Future<ApiReturnValue<Transaction>> submitTransaction(
      {Transaction transaction}) async {
    await Future.delayed(Duration(seconds: 2));

    // return ApiReturnValue(message: "Failed");

    return ApiReturnValue(
      value: transaction.copyWith(
        status: TransactionStatus.pending,
      ),
    );
  }
}
