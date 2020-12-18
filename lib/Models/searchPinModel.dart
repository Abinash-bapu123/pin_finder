class AllOffices {
  final List<PostOfficeDetails> officeList;
  AllOffices({
    this.officeList,
  });
  factory AllOffices.fromJson(List<dynamic> json) {
    List<PostOfficeDetails> list = List<PostOfficeDetails>();
    list = json.map((i) => PostOfficeDetails.fromJson(i)).toList();
    return AllOffices(
      officeList: list,
    );
  }
}

class PostOfficeDetails {
  final String name;
  final String description;
  final String branchtype;
  final String deliverystatus;
  final String circle;
  final String district;
  final String division;
  final String region;
  final String block;
  final String state;
  final String country;
  final String pincode;

  PostOfficeDetails({
    this.name,
    this.description,
    this.branchtype,
    this.deliverystatus,
    this.circle,
    this.district,
    this.division,
    this.region,
    this.block,
    this.state,
    this.country,
    this.pincode,
  });

  factory PostOfficeDetails.fromJson(Map<String, dynamic> json) {
    return PostOfficeDetails(
      name: json['Name'],
      description: json['Description'],
      branchtype: json['BranchType'],
      deliverystatus: json['DeliveryStatus'],
      circle: json['Circle'],
      district: json['District'],
      division: json['Division'],
      region: json['Region'],
      block: json['Block'],
      state: json['State'],
      country: json['Country'],
      pincode: json['Pincode'],
    );
  }
}
