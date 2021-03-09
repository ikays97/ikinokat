final List<LanguageModel> languages = [
  LanguageModel("English", "en"),
  LanguageModel("Turkmen", "tm"),
  LanguageModel("Russian", "ru"),
];

class LanguageModel {
  LanguageModel(
    this.language,
    this.symbol,
  );

  String language;
  String symbol;
}
