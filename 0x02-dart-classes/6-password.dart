class Password {
  String value;
  bool hidden;

  Password({required this.value, this.hidden = false});

  bool isValid() {
    return value.length >= 6 && value.contains(RegExp(r'[0-9]'));
  }

  @override
  String toString() {
    return 'Password: ${hidden ? "hidden" : value}';
  }
}
