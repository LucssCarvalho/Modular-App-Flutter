import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_app/app/modules/home/repositories/poke_repository.dart';
import 'package:modular_app/app/shared/utils/constants.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get<PokeRepository>())),
        Bind((i) => PokeRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE)))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
      ];
}
