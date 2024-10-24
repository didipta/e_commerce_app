class Urls {
  static const String _baseUrl = 'https://ecommerce-api.codesilicon.com/api';

  static const String dummyUrl = '$_baseUrl/login';
  static const String sliderListUrl = '$_baseUrl/ListProductSlider';
  static const String categoryListUrl = '$_baseUrl/CategoryList';
  static const String readProfile = '$_baseUrl/ReadProfile';
  static const String addToCart = '$_baseUrl/CreateCartList';
  static const String CreateProfile = '$_baseUrl/CreateProfile';
  static const String CartList = '$_baseUrl/CartList';
  static  String deleteCart(int id) => '$_baseUrl/DeleteCartList/$id';
  static String CreateWishList (int id) => '$_baseUrl/CreateWishList/$id';
  static String WishList = '$_baseUrl/ProductWishList';
  static String deleteWishList(int id) => '$_baseUrl/RemoveWishList/$id';

  static String productListByRemark(String remark) =>
      '$_baseUrl/ListProductByRemark/$remark';

  static String productListByCategory(int categoryId) =>
      '$_baseUrl/ListProductByCategory/$categoryId';

  static String productDetailsByID(int productId) =>
      '$_baseUrl/ProductDetailsById/$productId';

  static String verifyEmail(String email) =>
      '$_baseUrl/UserLogin/$email';

  static String verifyOtp(String email, String otp) =>
      '$_baseUrl/VerifyLogin/$email/$otp';
}
