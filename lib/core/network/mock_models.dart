class MockModels {

  ///Endpoint : user/register
  static const String userRegisterRequest = '''{
  "full_name":"Name",
  "user_name":"user_name",
  "nic_number":"952746737V",
  "mobile_number":"+947237462"
 }''';

  static const String userRegisterResponse = '''{
  "success": true,
  "message": "Registration Success",
  "output": {
    "token": "aoskdjhaidsfhaisdjkcaisdfa"
  }
 }''';

  ///Endpoint : user/verify
  static const String userVerificationRequest = '''{
  "mobile_number": "+94713746274"
 }''';

  static const String userVerificationResponse = '''{
  "success":true,
  "message":"Verification Success",
  "output":{
    "token":"aoskdjhaidsfhaisdjkcaisdfa"
  }
 }''';




  ///Endpoint : otp/generate
  static const String otpGenerateRequest = '''{
  "mobile_number": "+94716362938",
  "should_generate": 1
 }''';

  static const String otpGenerateResponse = '''{
  "success": true,
  "message": "OTP Generate Success",
  "output": {
    "reference_code": "sihsdhiwq32"
  }
 }''';

  ///Endpoint : otp/submit
  static const String otpSubmitRequest = '''{
  "mobile_number": "+94716362938",
  "reference_code": "sihsdhiwq32",
  "otp": "123456"
 }''';

  static const String otpSubmitResponse = '''{
  "success":true,
  "message":"OTP Submit Success"
 }''';

  ///Endpoint : user/data
  static const String authUserResponse = '''{
  "success": true,
  "message": "User Data Fetched Success",
  "output": {
    "full_name": "Name",
    "user_name": "name",
    "nic": "94253627v",
    "mobile_number": "+94713647283",
    "rank" : 233,
    "coins" : 100,
    "gems" : 20
  }
}''';

  ///rank/top
  static const String topRankResponse = '''{
  "success": true,
  "message": "Top Ranks Success",
  "output": [
    {
      "user_id": 1,
      "full_name": "Name",
      "rank": 1,
      "profile_image": "https://img.freepik.com/free-vector/young-prince-vector-illustration_1308-174367.jpg?ga=GA1.1.1308396569.1740521377&semt=ais_hybrid"
    },
     {
      "user_id": 2,
      "full_name": "Nuwan ",
      "rank": 2,
      "profile_image": "https://img.freepik.com/free-vector/young-prince-vector-illustration_1308-174367.jpg?ga=GA1.1.1308396569.1740521377&semt=ais_hybrid"
    }, {
      "user_id": 3,
      "full_name": "Kasun ",
      "rank": 3,
      "profile_image": "https://img.freepik.com/premium-photo/memoji-happy-man-white-background-emoji_826801-6834.jpg?ga=GA1.1.1308396569.1740521377&semt=ais_hybrid"
    },
     {
      "user_id": 4,
      "full_name": "Name",
      "rank": 4,
      "profile_image": "https://img.freepik.com/free-vector/smiling-young-man-illustration_1308-174669.jpg?ga=GA1.1.1308396569.1740521377&semt=ais_hybrid"
    },
    {
      "user_id": 5,
      "full_name": "Saman",
      "rank": 5,
      "profile_image": "https://img.freepik.com/free-vector/smiling-boy-hoodie_1308-178004.jpg?ga=GA1.1.1308396569.1740521377&semt=ais_hybrid"
    }
  ]
 }''';

  ///Endpoint : master/get
  static const String masterDataResponse = '''{
  "success": true,
  "message": "Master Data Success",
  "output": {
    "free_coins": 500
  }
 }''';

}
