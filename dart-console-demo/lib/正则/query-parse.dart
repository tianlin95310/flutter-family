class QueryParseUtils {
  // 获取某个参数
  static String? getString(url, key) {
    String strs = url.split(RegExp(r'\?'));
    if (strs.length > 1) {
      String query = strs[1];
      if (query == null || query.isEmpty) {
        return null;
      }
      return getQueryVariable(query, key);
    } else {
      return null;
    }
  }

  // 获取全部参数
  static String getUrl(url) {
    List<String> strs = url.split(RegExp(r'\?'));
    return strs[0];
  }

  // 获取全部参数
  static Map getMap(url) {
    String strs = url.split(RegExp(r'\?'));
    print(url);
    print(strs.toString());
    if (strs.length > 1) {
      String query = strs[1];
      if (query == null || query.isEmpty) {
        return {};
      }
      return getQuery(query);
    } else {
      return {};
    }
  }
  static Map getQuery(query) {
    var vars = query.split("&");
    Map map = {};
    for (var i = 0; i < vars.length; i++) {
      var pair = vars[i].split("=");
      map[pair[0]] = pair[1];
    }
    return map;
  }

  static String? getQueryVariable(query, variable) {
    var vars = query.split("&");
    for (var i = 0; i < vars.length; i++) {
      var pair = vars[i].split("=");
      if (pair[0] == variable) {
        return pair[1];
      }
    }
  }
}