class PromotionModel {
  String? id;
  String? title;
  String? content;
  String? excerpt;
  String? thumbnail;
  String? condition;
  String? startDate;
  String? endDate;
  int? type;
  Null? externalUrl;
  Null? externalTitle;
  Null? extUrl;
  Null? extTitle;
  int? clmIsCashVoucher;
  String? clmGiftCode;
  int? clmGiftCost;
  String? eVoucherCampaign;
  String? publishDate;
  String? status;
  int? endDateInTimeStamp;
  String? expireDate;
  int? isLimited;
  int? limitedAmount;
  int? pickedAmount;
  int? clmGiftDiscountCost;
  String? brandLogo;
  Null? limitedStartTime;
  Null? limitedStartTimeInTimeStamp;
  Null? limitedEndTime;
  Null? limitedEndTimeInTimeStamp;
  int? limitedAmountPerCustomer;
  int? limitedAmountPerCustomerPerDay;
  int? isHot;
  String? urlSlugs;
  bool? showOnWebsiteBrand;
  bool? showOnWebsiteBrandHomePage;
  String? number;

  PromotionModel(
      {this.id,
      this.title,
      this.content,
      this.excerpt,
      this.thumbnail,
      this.condition,
      this.endDate,
      this.type,
      this.externalUrl,
      this.externalTitle,
      this.extUrl,
      this.extTitle,
      this.clmIsCashVoucher,
      this.clmGiftCode,
      this.clmGiftCost,
      this.eVoucherCampaign,
      this.publishDate,
      this.status,
      this.endDateInTimeStamp,
      this.expireDate,
      this.isLimited,
      this.limitedAmount,
      this.pickedAmount,
      this.clmGiftDiscountCost,
      this.brandLogo,
      this.limitedStartTime,
      this.limitedStartTimeInTimeStamp,
      this.limitedEndTime,
      this.limitedEndTimeInTimeStamp,
      this.limitedAmountPerCustomer,
      this.limitedAmountPerCustomerPerDay,
      this.isHot,
      this.urlSlugs,
      this.showOnWebsiteBrand,
      this.showOnWebsiteBrandHomePage,
      this.number});

  PromotionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    excerpt = json['excerpt'];
    thumbnail = json['thumbnail'];
    condition = json['condition'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    type = json['type'];
    externalUrl = json['externalUrl'];
    externalTitle = json['externalTitle'];
    extUrl = json['extUrl'];
    extTitle = json['extTitle'];
    clmIsCashVoucher = json['clmIsCashVoucher'];
    clmGiftCode = json['clmGiftCode'];
    clmGiftCost = json['clmGiftCost'];
    eVoucherCampaign = json['eVoucherCampaign'];
    publishDate = json['publishDate'];
    status = json['status'];
    endDateInTimeStamp = json['endDateInTimeStamp'];
    expireDate = json['expireDate'];
    isLimited = json['isLimited'];
    limitedAmount = json['limitedAmount'];
    pickedAmount = json['pickedAmount'];
    clmGiftDiscountCost = json['clmGiftDiscountCost'];
    brandLogo = json['brandLogo'];
    limitedStartTime = json['limitedStartTime'];
    limitedStartTimeInTimeStamp = json['limitedStartTimeInTimeStamp'];
    limitedEndTime = json['limitedEndTime'];
    limitedEndTimeInTimeStamp = json['limitedEndTimeInTimeStamp'];
    limitedAmountPerCustomer = json['limitedAmountPerCustomer'];
    limitedAmountPerCustomerPerDay = json['limitedAmountPerCustomerPerDay'];
    isHot = json['isHot'];
    urlSlugs = json['urlSlugs'];
    showOnWebsiteBrand = json['showOnWebsiteBrand'];
    showOnWebsiteBrandHomePage = json['showOnWebsiteBrandHomePage'];
    number = json['number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['content'] = this.content;
    data['excerpt'] = this.excerpt;
    data['thumbnail'] = this.thumbnail;
    data['condition'] = this.condition;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['type'] = this.type;
    data['externalUrl'] = this.externalUrl;
    data['externalTitle'] = this.externalTitle;
    data['extUrl'] = this.extUrl;
    data['extTitle'] = this.extTitle;
    data['clmIsCashVoucher'] = this.clmIsCashVoucher;
    data['clmGiftCode'] = this.clmGiftCode;
    data['clmGiftCost'] = this.clmGiftCost;
    data['eVoucherCampaign'] = this.eVoucherCampaign;
    data['publishDate'] = this.publishDate;
    data['status'] = this.status;
    data['endDateInTimeStamp'] = this.endDateInTimeStamp;
    data['expireDate'] = this.expireDate;
    data['isLimited'] = this.isLimited;
    data['limitedAmount'] = this.limitedAmount;
    data['pickedAmount'] = this.pickedAmount;
    data['clmGiftDiscountCost'] = this.clmGiftDiscountCost;
    data['brandLogo'] = this.brandLogo;
    data['limitedStartTime'] = this.limitedStartTime;
    data['limitedStartTimeInTimeStamp'] = this.limitedStartTimeInTimeStamp;
    data['limitedEndTime'] = this.limitedEndTime;
    data['limitedEndTimeInTimeStamp'] = this.limitedEndTimeInTimeStamp;
    data['limitedAmountPerCustomer'] = this.limitedAmountPerCustomer;
    data['limitedAmountPerCustomerPerDay'] =
        this.limitedAmountPerCustomerPerDay;
    data['isHot'] = this.isHot;
    data['urlSlugs'] = this.urlSlugs;
    data['showOnWebsiteBrand'] = this.showOnWebsiteBrand;
    data['showOnWebsiteBrandHomePage'] = this.showOnWebsiteBrandHomePage;
    data['number'] = this.number;
    return data;
  }
}

