class Customer {
  final String name;
  final String beginDate;
  final String servicePlanType;
  final String accountStatus;
  final bool modileKeysSubscriber;
  final bool saasSubscriber;
  final int ofLocks;
  final int ofReaders;
  final int ofLockers;

  Customer({
    required this.name,
    required this.beginDate,
    required this.servicePlanType,
    required this.accountStatus,
    required this.modileKeysSubscriber,
    required this.saasSubscriber,
    required this.ofLocks,
    required this.ofReaders,
    required this.ofLockers,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      name: json['name'],
      beginDate: json['beginDate'],
      servicePlanType: json['servicePlanType'],
      accountStatus: json['accountStatu'],
      modileKeysSubscriber: json['modileKeysSubscriber'],
      saasSubscriber: json['saasSubscriber'],
      ofLocks: json['deviceNumberOfLocks'],
      ofReaders: json['deviceNumberOfReaders'],
      ofLockers: json['deviceNumberOfLockers'],
    );
  }
}
