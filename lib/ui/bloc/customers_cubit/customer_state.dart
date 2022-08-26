part of 'customer_cubit.dart';

class CustomerState extends Equatable {
  final DtStatus? status;
  final List<Customer>? customer;

  const CustomerState({
    this.status,
    this.customer,
  });

  @override
  List<Object?> get props => [
        status,
        customer,
      ];

  CustomerState copyWith({
    DtStatus? status,
    List<Customer>? customer,
  }) {
    return CustomerState(
      status: status ?? this.status,
      customer: customer ?? this.customer,
    );
  }
}
