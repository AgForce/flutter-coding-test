class Order {
  final String uuid;
  final String employeeName;
  final String orderTitle;
  final DateTime orderStart;
  final DateTime orderEnd;

  Order(this.uuid, this.employeeName, this.orderTitle, this.orderStart, this.orderEnd);
}