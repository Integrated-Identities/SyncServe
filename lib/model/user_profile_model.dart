/// UserProfile represents the complete user profile data
class UserProfile {
  const UserProfile({
    required this.name,
    required this.email,
    required this.address,
    this.phone,
    this.profileImageUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      name: json['name'] as String,
      email: json['email'] as String,
      address: json['address'] as String,
      phone: json['phone'] as String?,
      profileImageUrl: json['profileImageUrl'] as String?,
    );
  }

  final String name;
  final String email;
  final String address;
  final String? phone;
  final String? profileImageUrl;

  UserProfile copyWith({
    String? name,
    String? email,
    String? address,
    String? phone,
    String? profileImageUrl,
  }) {
    return UserProfile(
      name: name ?? this.name,
      email: email ?? this.email,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
    };
  }
}
