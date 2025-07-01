class Customer {
  Customer({
    required this.name,
    required this.address,
    required this.email,
    this.phone,
  });
  final String name;
  final String address;
  final String email;
  final String? phone;
}
