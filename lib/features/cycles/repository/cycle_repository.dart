import 'package:either_dart/either.dart';
import 'package:zuricycle/features/cycles/models/services/cycle_service.dart';

import '../models/models.dart';

class CycleRepository {
  final CycleService _cycleService ;

  CycleRepository(this._cycleService);

  Future<Either<String, Cycle>> postCycles(Cycle cycle) async {
    return await _cycleService.postCycles(cycle);
  }

  Future<Either<String, Cycle>> getCycle(int id) async {
    return await _cycleService.getCycle(id);
  }

  Future<Either<String, List<Cycle>>> getAllCycles() async {
    return await _cycleService.getAllCycles();
  }

  Future<Either<String, Cycle>> editCycle(Cycle cycle) async {
    return await _cycleService.editCycle(cycle);
  }

  Future<Either<String, String>> deleteCycle(int? id) async {
    return await _cycleService.deleteCycle(id);
  }

}