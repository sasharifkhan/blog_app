class Apidetails {
  static const String baseurl = "https://api.zhndev.site/wp-json/blog-app/v1";
  static const String register = "/auth/register";
  static const String login = "/auth/login";
  static const String refreshtoken = "/auth/refresh-token";
  static const String logout = "/auth/logout";
  static const String profile = "/user/profile";
  static const String changepassword = "/user/change-password";
  static const String posts = "/posts";
  static const headerdefault = {
    "Content-Type": "application/json",
    "Accept": "application/json",
  };
}
