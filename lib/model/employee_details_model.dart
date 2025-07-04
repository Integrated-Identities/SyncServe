class EmployeeDetailsModel {
  EmployeeDetailsModel({
    required this.name,
    required this.email,
    required this.address,
    this.phone,
  });

  final String name;
  final String email;
  final String address;
  final String? phone;
}
