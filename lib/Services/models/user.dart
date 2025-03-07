class User {
  String? id;
  String? username;
  String? type;
  String? companyType;
  String? companyName;
  String? name;
  String? phone;
  String? email;
  String? address;
  String? region;
  String? avatar;
  String? verifyStatus;
  bool? isOnboarding;

  User({
    this.id,
    this.username,
    this.type,
    this.companyType,
    this.companyName,
    this.name,
    this.phone,
    this.email,
    this.address,
    this.region,
    this.avatar,
    this.verifyStatus,
    this.isOnboarding,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? json['id'];
    username = json['username'] ?? json['username'];
    type = json['type'] ?? json['type'];
    companyType = json['company_type'] ?? json['company_type'];
    companyName = json['company_name'] ?? json['company_name'];
    name = json['name'] ?? json['name'];
    phone = json['phone'] ?? json['phone'];
    email = json['email'] ?? json['email'];
    address = json['address'] ?? json['address'];
    region = json['region'] ?? json['region'];
    avatar = json['avatar'] ?? json['avatar'];
    verifyStatus = json['verify_status'] ?? json['verify_status'];
    isOnboarding = json['is_onboarding'] ?? json['verify_status'];
  }
}
