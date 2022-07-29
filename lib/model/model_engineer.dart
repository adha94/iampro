// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
class Engineer {
  final String? id;
  final String? userName;
  final String? displayName;
  final String? position;
  final String? contact;
  final String? address;
  final bool? isCCTV;
  final bool? isCAS;
  final bool? isPMS;
  final bool? isSmartTV;
  final bool? isPABX;
  final bool? isBAS;
  final bool? isSmartHome;
  final bool? isAlarm;
  final int? casesSolved;
  final int? casesUnsolved;
  final String? userType;
  final bool? status;
  final String? photoURL;

  Engineer({
    this.id,
    this.userName,
    this.displayName,
    this.position,
    this.contact,
    this.address,
    this.isCCTV,
    this.isCAS,
    this.isPMS,
    this.isSmartTV,
    this.isPABX,
    this.isBAS,
    this.isSmartHome,
    this.isAlarm,
    this.casesSolved,
    this.casesUnsolved,
    this.userType,
    this.status,
    this.photoURL,
  });

  factory Engineer.fromMap(map) {
    return Engineer(
      id: map['id'],
      userName: map['user_name'],
      displayName: map['display_name'],
      position: map['position'],
      contact: map['contact'],
      address: map['address'],
      isCCTV: map['isCCTV'],
      isCAS: map['isCAS'],
      isPMS: map['isPMS'],
      isSmartTV: map['isSMATV'],
      isPABX: map['isPABX'],
      isBAS: map['isBAS'],
      isSmartHome: map['isSmartHome'],
      isAlarm: map['isAlarm'],
      casesSolved: map['cases_solved'],
      casesUnsolved: map['cases_unsolved'],
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
      'position': position,
      'contact': contact,
      'address': address,
      'isCCTV': isCCTV,
      'isCAS': isCAS,
      'isPMS': isPMS,
      'isSMATV': isSmartTV,
      'isPABX': isPABX,
      'isBAS': isBAS,
      'isSmartHome': isSmartHome,
      'isAlarm': isAlarm,
      'cases_solved': casesSolved,
      'cases_unsolved': casesUnsolved,
      'user_type': userType,
      'status': status,
      'photo_url': photoURL,
    };
  }
}
