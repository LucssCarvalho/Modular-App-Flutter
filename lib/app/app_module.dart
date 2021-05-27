import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_app/app/app_controller.dart';
import 'package:modular_app/app/app_widget.dart';
import 'package:modular_app/app/pages/home/home_controller.dart';
import 'package:modular_app/app/shared/repositories/poke_repository.dart';
import 'package:modular_app/app/shared/utils/constants.dart';

import 'pages/home/home_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController(i.get<PokeRepository>())),
        Bind((i) => PokeRepository(i.get<Dio>())),
        Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE)))
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
