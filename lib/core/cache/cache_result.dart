class CacheResult<T> {
  final T? data;
  final String message;
  final bool isSuccess;

  const CacheResult.success(this.data, {this.message = 'Success'})
    : isSuccess = true;

  const CacheResult.error({this.data, required this.message})
    : isSuccess = false;
}
