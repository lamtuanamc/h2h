class Tools {
  static String convertVN([String? str = "", withoutSpecChar = false]) {
    str = (str ?? "").toString().trim().toLowerCase();
    str = str.replaceAll(RegExp(r"/à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ/g"), "a");
    str = str.replaceAll(RegExp(r"/è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ/g"), "e");
    str = str.replaceAll(RegExp(r"/ì|í|ị|ỉ|ĩ/g,"), "i");
    str = str.replaceAll(RegExp(r"/ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ/g"), "o");
    str = str.replaceAll(RegExp(r"/ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ/g"), "u");
    str = str.replaceAll(RegExp(r"/ỳ|ý|ỵ|ỷ|ỹ/g"), "y");
    str = str.replaceAll(RegExp(r"/đ/g,"), "d");
    if (withoutSpecChar) {
      return str;
    } else {
      return str.replaceAll(RegExp(r"/[^a-zA-Z0-9/, ]/g"), "");
    }
  }

  static fuzzyMatch([String pattern = "", String string = ""]) {
    Map<String, dynamic> opts = {};
    pattern = convertVN(pattern);
    string = convertVN(string);
    var patternIdx = 0,
        result = [],
        len = string.length,
        totalScore = 0.0,
        currScore = 0,
        // prefix
        pre = opts["pre"] ?? "",
        // suffix
        post = opts["post"] ?? "",
        // String to compare against. This might be a lowercase version of the
        // raw string
        compareString = string.toLowerCase(),
        // ignore: prefer_typing_uninitialized_variables
        ch = "";

    pattern = pattern.toLowerCase();

    // For each character in the string, either add it to the result
    // or wrap in template if it"s the next string in the pattern

    for (var idx = 0; idx < len; idx++) {
      if (string.isNotEmpty) {
        ch = string[idx];
      }
      if (pattern.isNotEmpty &&
          compareString.isNotEmpty &&
          compareString.length > idx &&
          pattern.length > patternIdx) {
        if (compareString[idx] == pattern[patternIdx]) {
          ch = pre + ch + post;
          patternIdx += 1;

          // consecutive characters should increase the score more than linearly
          currScore += 1 + currScore;
        }
      } else {
        currScore = 0;
      }
      totalScore += currScore;
      result.insert(result.length, ch);
    }
    // return rendered string if we have a match for every char
    if (patternIdx == pattern.length) {
      // if the string is an exact match with pattern, totalScore should be maxed
      totalScore = compareString == pattern ? double.infinity : totalScore;
      return totalScore;
    }
    return 0;
  }
}
