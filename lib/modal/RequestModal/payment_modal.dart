class VerifyPaymentModal {
  String? razorpayOrderId;
  String? razorpayPaymentId;
  String? razorpaySignature;

  VerifyPaymentModal(
      {this.razorpayOrderId, this.razorpayPaymentId, this.razorpaySignature});

  VerifyPaymentModal.fromJson(Map<String, dynamic> json) {
    razorpayOrderId = json['razorpay_order_id'];
    razorpayPaymentId = json['razorpay_payment_id'];
    razorpaySignature = json['razorpay_signature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['razorpay_order_id'] = this.razorpayOrderId;
    data['razorpay_payment_id'] = this.razorpayPaymentId;
    data['razorpay_signature'] = this.razorpaySignature;
    return data;
  }
}
