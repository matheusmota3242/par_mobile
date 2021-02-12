class ApiResponse<T> {
  T data;
  bool isError;
  String errorMessage;

  ApiResponse({this.data, this.errorMessage, this.isError=false});
}