class OrderDetailsModel{
  String orderNumber;
  String invoiceNumber;


  OrderDetailsModel();

  @override
  String toString() {
    return 'OrderDetailsModel{orderNumber: $orderNumber, invoiceNumber: $invoiceNumber}';
  }
}