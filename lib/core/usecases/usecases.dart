abstract class usecases<Type, Params> {
  Future<Type> call({Params params});
}