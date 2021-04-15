import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';


class Api {
  // 工厂模式
  factory Api() => _getInstance();
  static Api get instance => _getInstance();

  static Api _instance;

  Dio _dio;

  Api._internal() {
    // 初始化
    BaseOptions options = new BaseOptions(
      baseUrl: "http://127.0.0.1:8400",
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    _dio = new Dio(options);
  }
  static Api _getInstance() {
    if (_instance == null) {
      _instance = new Api._internal();
    }
    return _instance;
  }

  Future<Response> login(String account, String password) async {

    BotToast.showLoading();
    Response response = await _dio.get("/login", queryParameters: {
      "account": account,
      "password": password,
    });
    print("try login:$account--$password");
    print(response.toString());
    BotToast.closeAllLoading();


    return response;
  }

  Future<Response> register(String account, String password, String phone) async {
    Response response = await _dio.get("/register",
        queryParameters: {"account": account, "password": password, "phone": phone});
    print("try register");
    return response;
  }
  Future<Response> searchUser(String account) async {
    Response response = await _dio.get("/searchUser",
        queryParameters: {"account": account});

    print("try find");
    return response;
  }
  Future<Response> updateUser(String account,String updateStr,String updateType) async {
    Response response = await _dio.get("/updateUser",
        queryParameters: {"account": account,"updateStr": updateStr,"updateType": updateType});

    print("try update");
    return response;
  }
  Future<Response> getAllGood() async {
    Response response = await _dio.get(
      "/getGood",
    );
    //print("try getGood");
    return response;
  }

  Future<Response> searchGood(String keyWord) async {
    Response response = await _dio.get("/searchGood", queryParameters: {
      "goodName": keyWord,
    });
    //print("try search good");
    return response;
  }

  Future<Response> uploadGood(FormData data) async {
    Response response = await _dio.post("/uploadGood", data: data);
    //print("try post order");
    return response;
  }

  Future<Response> postOrder(Map order) async {
    Response response = await _dio.post("/setOrder", data: order);
    //print("try post order");
    return response;
  }

  Future<Response> getOrder(String phone) async {
    Response response =
        await _dio.get("/getOrder", queryParameters: {"phone": phone});
    print("try getOrder");
    return response;
  }
}
