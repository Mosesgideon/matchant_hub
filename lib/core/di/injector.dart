import 'package:logger/logger.dart';
import 'package:marchant_hub/core/di/bloc_module.dart' as blocModule;
import 'package:marchant_hub/core/di/network.dart' as networkModule;
import 'package:marchant_hub/core/di/repository.dart' as repositoryModule;
import 'package:get_it/get_it.dart';

GetIt injector = GetIt.instance;
final logger = Logger(level: Level.debug);
// final logger = Logger();
Future<void> init() async{
  injector.allowReassignment = true;
  networkModule.setup(injector);
  repositoryModule.setup(injector);
  blocModule.setup(injector);
}


