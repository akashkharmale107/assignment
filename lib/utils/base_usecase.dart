abstract class BaseUsecase<Type, Params> {
  Future<String> callLogin(
      {required String password, required String userName});
}

abstract class UseCase<Type, P> {
  Future<Type> call({required P params});
}
