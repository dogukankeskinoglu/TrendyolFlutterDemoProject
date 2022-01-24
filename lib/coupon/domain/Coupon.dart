class Coupon {
  final int id;
  final String title;
  final String lowerLimit;
  final String discount;
  final String? expireDate;
  final bool isApplied;

  Coupon(this.id, this.title, this.lowerLimit, this.discount, this.expireDate, this.isApplied);
}
