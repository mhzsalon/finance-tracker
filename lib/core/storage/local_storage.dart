abstract class LocalStorage<T> {
  Future<List<T>> getAll();
  Future<void> saveAll(List<T> items);
  Future<void> add(Map<String, dynamic> item);
  Future<void> clear();
  Stream<List<T>> getStreamData();
}
