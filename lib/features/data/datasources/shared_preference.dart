import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/request/user_verification_request.dart';
import '../models/responses/auth_user_response.dart';


const String _APP_TOKEN = 'app_token';
const String _EMAIL_KEY = 'email_key';
const String _PW_KEY = 'password_key';
const String _PUSH_TOKEN = 'push_token';
const String _REMEMBER_KEY = 'remember_key';
const String _APP_USER = 'app_user';
const String _PHONE_NUMBER = 'phone_number';
const String _APP_CREDENTIAL = 'app_credential';

class AppSharedData {
  late SharedPreferences secureStorage;

  AppSharedData(SharedPreferences preferences) {
    secureStorage = preferences;
  }

  ///APP TOKEN
  bool hasAppToken() {
    return secureStorage.containsKey(_APP_TOKEN);
  }

  setAppToken(String token) {
    secureStorage.setString(_APP_TOKEN, token);
  }

  String? getAppToken() {
    if (secureStorage.containsKey(_APP_TOKEN)) {
      return secureStorage.getString(_APP_TOKEN);
    } else {
      return "";
    }
  }

  clearAppToken() {
    secureStorage.remove(_APP_TOKEN);
  }

  ///SET EMAIL
  bool hasEmail() {
    return secureStorage.containsKey(_EMAIL_KEY);
  }

  setEmail(String token) {
    secureStorage.setString(_EMAIL_KEY, token);
  }

  String? getEmail() {
    if (secureStorage.containsKey(_EMAIL_KEY)) {
      return secureStorage.getString(_EMAIL_KEY);
    } else {
      return "";
    }
  }

  clearEmail() {
    secureStorage.remove(_EMAIL_KEY);
  }

  ///SET PW
  bool hasPassword() {
    return secureStorage.containsKey(_PW_KEY);
  }

  setPassword(String token) {
    secureStorage.setString(_PW_KEY, token);
  }

  String? getPassword() {
    if (secureStorage.containsKey(_PW_KEY)) {
      return secureStorage.getString(_PW_KEY);
    } else {
      return "";
    }
  }

  clearPW() {
    secureStorage.remove(_PW_KEY);
  }

  ///REMEMBER ME
  setRememberMe(bool remember) {
    secureStorage.setBool(_REMEMBER_KEY, remember);
  }

  bool getRememberMe() {
    if (secureStorage.containsKey(_REMEMBER_KEY)) {
      return secureStorage.getBool(_REMEMBER_KEY)!;
    } else {
      return false;
    }
  }

  bool hasRememberMe() {
    return secureStorage.containsKey(_REMEMBER_KEY);
  }


  ///PUSH TOKEN
  setPushToken(String token) {
    secureStorage.setString(_PUSH_TOKEN, token);
  }

  bool hasPushToken() {
    return secureStorage.containsKey(_PUSH_TOKEN);
  }

  String? getPushToken() {
    if (secureStorage.containsKey(_PUSH_TOKEN)) {
      return secureStorage.getString(_PUSH_TOKEN);
    } else {
      return "";
    }
  }

  clearPushToken() {
    secureStorage.remove(_PUSH_TOKEN);
  }


  clearAppUser() {
    secureStorage.remove(_APP_USER);
  }

  ///Auth User
  setAppUser(AuthUser authUser) {
    secureStorage.setString(_APP_USER, jsonEncode(authUser.toJson()));
  }

  bool hasAppUser() {
    return secureStorage.containsKey(_APP_USER);
  }

  AuthUser getAppUser() {
    return AuthUser.fromJson(jsonDecode(secureStorage.getString(_APP_USER)!));
  }

  removeAppUser() {
    secureStorage.remove(_APP_USER);
  }


  ///Phone Number
  setPhoneNumber(String number) {
    secureStorage.setString(_PHONE_NUMBER, number);
  }

  bool hasPhoneNumber() {
    return secureStorage.containsKey(_PHONE_NUMBER);
  }

  String getPhoneNumber() {
    return secureStorage.getString(_PHONE_NUMBER)!;
  }

  removePhoneNumber() {
    secureStorage.remove(_PHONE_NUMBER);
  }

  ///APP CREDENTIAL

  UserVerificationRequest getAppCredential() {
    return UserVerificationRequest.fromJson(
        jsonDecode(secureStorage.getString(_APP_CREDENTIAL)!));
  }


  setAppCredential(UserVerificationRequest userVerificationRequest) {
    secureStorage.setString(_APP_CREDENTIAL,jsonEncode(userVerificationRequest.toJson()));
  }

  bool hasAppCredential() {
    return secureStorage.containsKey(_APP_CREDENTIAL);
  }

  clearAppCredential(){
    secureStorage.remove(_APP_CREDENTIAL);
  }

}
