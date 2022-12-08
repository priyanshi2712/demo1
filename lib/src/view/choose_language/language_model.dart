class Language {
  final String languageName;
  final String languageNameInEng;
  bool? isChecked = false;
  dynamic selectedIndex = "selectedIndex";
  // bool? isChecked = false;
  Language({
    required this.languageName,
    required this.languageNameInEng,
    this.isChecked,
    this.selectedIndex,
    // this.isChecked,
  });
}
