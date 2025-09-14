sealed class ApiResult<T>{

  bool get hasData=>this is SuccessApiResult;
  bool get isLoading=>this is LoadingApiResult;
  bool get isError=>this is ErrorApiResult;
  AppErrors get error=>(this as ErrorApiResult).appErrors;
  T get getData=>(this as SuccessApiResult).data!;

}


class SuccessApiResult<T> extends ApiResult<T>{
  T ?data;
  SuccessApiResult(this.data);
}
class LoadingApiResult<T> extends ApiResult<T>{}
class ErrorApiResult<T> extends ApiResult<T>{
  AppErrors appErrors ;
  ErrorApiResult(this.appErrors);
}
class InitialApiResult<T> extends ApiResult<T>{}


class AppErrors{
  String error;
  AppErrors(this.error);
}
class NetWorkError extends AppErrors{
  NetWorkError(super.error);}

class ServerError extends AppErrors{
  ServerError(super.error);}

class IgnoredError extends AppErrors{
  IgnoredError(super.error);}
class UnknownError extends AppErrors{
  UnknownError(super.error);}