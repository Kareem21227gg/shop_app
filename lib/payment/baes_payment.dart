class BasePayment {
  
  String paymentId;
  double amount;
  DateTime paymentDate;
  String paymentMethod;
  BasePayment(
    this.paymentId,
    this.amount,
    this.paymentDate,
    this.paymentMethod,
  );

  BasePayment.fromJson(Map<String,dynamic> jsonObject){
    this.paymentId = jsonObject['payment_id'];
    this.amount = jsonObject['amount'];
    this.paymentDate = DateTime.parse(jsonObject['paymentDate']);
    this.paymentMethod = jsonObject['payment_method'];
  }
  
}
