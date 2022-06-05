abstract class UseCase<Type, Params> {
  Future<Type> callAsync(Params params);

  Type call(Params params);
}

class NoParams {}
