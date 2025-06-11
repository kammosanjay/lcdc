class CreateOrder {
  String? enteranceNo;
  String? mobileNo;
  int? amountPaid;
  String? orderId;
  String? paymentStatus;
  String? registeredAt;
  String? razorKey;
  String? merchantName;
  String? image;
  String? name;
  String? email;
  String? themeColor;

  CreateOrder({
    this.enteranceNo,
    this.mobileNo,
    this.amountPaid,
    this.orderId,
    this.paymentStatus,
    this.registeredAt,
    this.razorKey,
    this.merchantName,
    this.image,
    this.name,
    this.email,
    this.themeColor,
  });

  CreateOrder.fromJson(Map<String, dynamic> json) {
    enteranceNo = json['enterance_no'];
    mobileNo = json['mobile_no'];
    amountPaid = int.tryParse(
      json['amount_paid'].toString(),
    ); // ✅ convert to int
    orderId = json['order_id'];
    paymentStatus = json['payment_status'];
    registeredAt = json['registered_at'];
    razorKey = json['razor_key'];
    merchantName = json['merchant_name'];
    image = json['image'];
    name = json['name'];
    email = json['email'];
    themeColor = json['theme_color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['enterance_no'] = this.enteranceNo;
    data['mobile_no'] = this.mobileNo;
    data['amount_paid'] = this.amountPaid;
    data['order_id'] = this.orderId;
    data['payment_status'] = this.paymentStatus;
    data['registered_at'] = this.registeredAt;
    data['razor_key'] = this.razorKey;
    data['merchant_name'] = this.merchantName;
    data['image'] = this.image;
    data['name'] = this.name;
    data['email'] = this.email;
    data['theme_color'] = this.themeColor;
    return data;
  }
}
