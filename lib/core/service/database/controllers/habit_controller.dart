import 'package:drift/drift.dart';
import 'package:habitica/core/service/database/database.dart';

class HabitController {
  final AppDb db;

  const HabitController(this.db);

  Future<HabitData> create(Insertable<HabitData> entity) async {
    final insertedEntity = await db.into(db.habit).insertReturning(entity);
    return insertedEntity;
  }

  Future<List<HabitData>> getAll() async {
    return await db.select(db.habit).get();
  }

  Future<HabitData?> getById(int id) async {
    return await (db.select(db.habit)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
  }
}
