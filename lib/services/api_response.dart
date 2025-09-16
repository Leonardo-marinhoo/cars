sealed class ApiResponse<T> {
  const ApiResponse();
}

class Succes<T> extends ApiResponse<T> {
  final T data;
  const Succes(this.data);
}

class Failure<T> extends ApiResponse<T> {
  final String message;
  const Failure(this.message);
}