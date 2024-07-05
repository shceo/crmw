final class Address {
  final String address;

  Address({required this.address});
}

abstract final class AddressMock {
  static final List<Address> addresses = [
    Address(address: 'Томск , Кирова 19'),
    Address(address: 'Москва , Ленина 47'),
    Address(address: 'Оренбург , Чайковский Б-3'),
  ];
}
