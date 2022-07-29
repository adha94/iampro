// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA

class Client {
  final String? id;
  final String? userName;
  final String? displayName;
  final String? company;
  final String? companyLogo;
  final String? address;
  final String? position;
  final String? contact;
  final bool? isCCTV;
  final bool? isCAS;
  final bool? isPMS;
  final bool? isSmartTV;
  final bool? isPABX;
  final bool? isBAS;
  final bool? isSmartHome;
  final bool? isAlarm;
  final String? managerInCharge;
  final int? totalReports;
  final String? userType;
  final bool? status;
  final String? photoURL;

  Client({
    this.id,
    this.userName,
    this.displayName,
    this.company,
    this.companyLogo,
    this.address,
    this.position,
    this.contact,
    this.isCCTV,
    this.isCAS,
    this.isPMS,
    this.isSmartTV,
    this.isPABX,
    this.isBAS,
    this.isSmartHome,
    this.isAlarm,
    this.managerInCharge,
    this.totalReports,
    this.userType,
    this.status,
    this.photoURL,
  });

  factory Client.fromMap(map) {
    return Client(
      id: map['id'],
      userName: map['user_name'],
      displayName: map['display_name'],
      company: map['company'],
      companyLogo: map['company_logo'],
      address: map['address'],
      position: map['position'],
      contact: map['contact'],
      isCCTV: map['isCCTV'],
      isCAS: map['isCAS'],
      isPMS: map['isPMS'],
      isSmartTV: map['isSMATV'],
      isPABX: map['isPABX'],
      isBAS: map['isBAS'],
      isSmartHome: map['isSmartHome'],
      isAlarm: map['isAlarm'],
      managerInCharge: map['manager_in_charge'],
      totalReports: map['total_reports'],
      userType: map['user_type'],
      status: map['status'],
      photoURL: map['photo_url'],
    );
  }

  Map toMap() {
    return {
      'id': id,
      'user_name': userName,
      'display_name': displayName,
      'company': company,
      'company_logo': companyLogo,
      'address': address,
      'position': position,
      'contact': contact,
      'isCCTV': isCCTV,
      'isCAS': isCAS,
      'isPMS': isPMS,
      'isSMATV': isSmartTV,
      'isPABX': isPABX,
      'isBAS': isBAS,
      'isSmartHome': isSmartHome,
      'isAlarm': isAlarm,
      'managerInCharge': managerInCharge,
      'total_reports': totalReports,
      'user_type': userType,
      'status': status,
      'photo_url': photoURL,
    };
  }
}
