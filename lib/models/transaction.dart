part of 'models.dart';

enum TransactionStatus { delivered, on_delivery, pending, cancelled }

class Transaction extends Equatable {
  final int id;
  final Food food;
  final int quantity;
  final int total;
  final DateTime dateTime;
  final TransactionStatus status;
  final User user;

  Transaction(
      {this.id,
      this.food,
      this.quantity,
      this.total,
      this.dateTime,
      this.status,
      this.user});

  Transaction copyWith(
      {int id,
      Food food,
      int quantity,
      int total,
      DateTime dateTime,
      TransactionStatus status,
      User user}) {
    return Transaction(
      id: id ?? this.id,
      food: food ?? this.food,
      quantity: quantity ?? this.quantity,
      total: total ?? this.total,
      dateTime: dateTime ?? this.dateTime,
      status: status ?? this.status,
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [id, food, quantity, total, dateTime, status, user];
}

List<Transaction> mockTransaction = [
  Transaction(
    id: 0,
    food: mockfoods[0],
    quantity: 10,
    total: (mockfoods[0].price * 10 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.on_delivery,
    user: mockUser,
  ),
  Transaction(
    id: 1,
    food: mockfoods[1],
    quantity: 11,
    total: (mockfoods[1].price * 11 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.pending,
    user: mockUser,
  ),
  Transaction(
    id: 2,
    food: mockfoods[2],
    quantity: 12,
    total: (mockfoods[2].price * 12 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.cancelled,
    user: mockUser,
  ),
  Transaction(
    id: 3,
    food: mockfoods[3],
    quantity: 13,
    total: (mockfoods[3].price * 13 * 1.1).round() + 50000,
    dateTime: DateTime.now(),
    status: TransactionStatus.delivered,
    user: mockUser,
  ),
];
