class ConfigModel {
  final String searchUrl;

  ConfigModel({this.searchUrl}); //用大括号，表示可选

  factory ConfigModel.formJson(Map<String, dynamic> json) {
    return ConfigModel(searchUrl: json['searchUrl']);
  }
}
