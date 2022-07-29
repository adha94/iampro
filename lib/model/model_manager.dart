// MADE WITH ❤️ BY ADHA94 FOR HEZMEDIA
class Manager {
  final String? id;
  final String? userName;
  final String? displayName;
  final String? position;
  final String? contact;
  final int? totalClients;
  final int? casesSolved;
  final int? casesUnsolved;
  final String? userType;
  final bool? status;
  final String? photoURL;

  Manager({
    this.id,
    this.userName,
    this.displayName,
    this.position,
    this.contact,
    this.totalClients,
    this.casesSolved,
    this.casesUnsolved,
    this.userType,
    this.status,
    this.photoURL,
  });

  factory Manager.fromMap(map) {
    return Manager(
      id: map['id'],
      userName: map['user_name'],
      displayName: map['display_name'],
      position: map['position'],
      contact: map['contact'],
      totalClients: map['total_clients'],
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
      'total_clients': totalClients,
      'cases_solved': casesSolved,
      'cases_unsolved': casesUnsolved,
      'user_type': userType,
      'status': status,
      'photo_url': photoURL,
    };
  }
}
