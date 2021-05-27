import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_app/app/app_controller.dart';
import 'package:modular_app/app/app_widget.dart';
import 'package:modular_app/app/other/other_page.dart';
import 'package:modular_app/app/pages/home/home_controller.dart';

import 'pages/home/home_page.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController()),
        Bind((i) => HomeController()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => HomePage()),
        ModularRouter('/other', child: (_, args) => OtherPage()),
      ];

  @override
  Widget get bootstrap => AppWidget();
}
