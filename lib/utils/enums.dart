enum AlertType { SUCCESS, FAIL }
enum ButtonType { ENABLED, DISABLED }
enum DeviceOS { ANDROID, HUAWEI }
enum AppPlatform {MOBILE, WEB}
enum Flavor {DEV, PRODUCTION}
enum QuestionComponentType {DATA, EMPTY, BUTTON}
enum ThemeType { LIGHT, DARK }

enum EditType{NAME,AGE,Gender}

enum FilterType {
  TYPE1, // Allow only, digits, dots, and commas.
  TYPE2, // Allow only, a to z, A to Z or a whitespace.
  TYPE3, // Allow only, a to z, A to Z or a whitespace and digits.
  TYPE4, // Only allow digits
  TYPE5, // Allow only integer or double
  TYPE6, // Allow anything except numbers.
}
