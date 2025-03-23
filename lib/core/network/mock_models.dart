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


  ///Endpoint : user/friend/all
  static const String friendsAllRequest = '''{
  "user_id": 1
 }''';

  static const String friendsAllResponse = '''{
  "success": true,
  "message": "Friend List Success",
  "output": [
    {
      "id" : 1,
      "full_name": "Name",
      "user_name": "name",
      "nic": "94253627v",
      "mobile_number": "+94713647283",
      "rank": 1,
      "coins": 100,
      "gems": 20
    },
    {
      "id" : 2,
      "full_name": "Gihan",
      "user_name": "Gihan",
      "nic": "94253347v",
      "mobile_number": "+94713647343",
      "rank": 2,
      "coins": 200,
      "gems": 40
    }
  ]
 }''';

  ///Endpoint : user/all
  static const String userAllRequest = '''{
  "search_query": "Name"
 }''';

  static const String userAllResponse = '''{
  "success": true,
  "message": "User List Success",
  "output": [
    {
      "id" : 1,
      "full_name": "Name",
      "user_name": "name",
      "nic": "94253627v",
      "mobile_number": "+94713647283",
      "rank": 1,
      "coins": 100,
      "gems": 20
    },
    {
      "id" : 2,
      "full_name": "Gihan",
      "user_name": "Gihan",
      "nic": "94253645v",
      "mobile_number": "+94713647256",
      "rank": 2,
      "coins": 100,
      "gems": 20
    },
    {
      "id" : 3,
      "full_name": "Nuwan",
      "user_name": "Nuwan",
      "nic": "94253623v",
      "mobile_number": "+94713647258",
      "rank": 3,
      "coins": 100,
      "gems": 20
    }
  ]
 }''';

  ///Endpoint : trader/all
  ///
  static const String traderAllResponse = '''{
  "success": true,
  "message": "Trader List Success",
  "output": [
    {
      "id": 1,
      "full_name": "Name",
      "trader_number": "223432",
      "is_verified": 1,
      "available_coins": 5000,
      "min_coin_limit": 1000,
      "max_coin_limit": 5000,
      "coin_value": 1.5,
      "account": {
        "account_number": "12312312312312",
        "holder_name": "Name",
        "bank": "Peoples",
        "branch": "Hali Ela"
      }
    },
     {
      "id": 1,
      "full_name": "Gihan",
      "trader_number": "2234442",
      "is_verified": 1,
      "available_coins": 6000,
      "min_coin_limit": 5000,
      "max_coin_limit": 6000,
      "coin_value": 1.7,
      "account": {
        "account_number": "12312312347123",
        "holder_name": "Gihan",
        "bank": "BOC",
        "branch": "Ratnapura"
      }
    }
  ]
 }''';


  ///Endpoint : coin/buy
  static const String coinsBuyRequest = '''{
  "user_id": 1,
  "trader_id": 1,
  "amount": 2000,
  "slip_url": "https://firebase.com/1,png",
  "payment_type": 1
 }''';

  static const String commonResponse = '''{
  "success": true,
  "message": "Coin Buy Success",
 }''';

}
