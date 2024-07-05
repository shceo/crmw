class ReserveOrder {
  final String confirmationNumber;
  final String clientNumber;
  final String supportEmail;

  const ReserveOrder({
    required this.confirmationNumber,
    required this.clientNumber,
    required this.supportEmail,
  });
}

abstract final class ReserveOrderMock {
  static const data = ReserveOrder(
    confirmationNumber: '+7 (961) 888-82-02',
    clientNumber: '****-31-31',
    supportEmail: 'support@mail.ru',
  );
}
