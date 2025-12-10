class Account {
  String name;
  double balance;
  bool isAuthenticated;

  Account({
    required this.name,
    required this.balance,
    this.isAuthenticated = false,
  });

  editBalance({required value}) {
    balance = balance + value;
  }
}
