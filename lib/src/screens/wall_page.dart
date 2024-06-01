import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../class/navigator_bar.dart';
import '../../design_tools/tool_widgets/app_colors.dart';

class WallPage extends ConsumerStatefulWidget {
  const WallPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WallPageState();
}

class _WallPageState extends ConsumerState<WallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        drawer: MyDrawer.buildDrawer(context),
        body: Center(
          child: SizedBox(

              //height: MediaQuery.of(context).size.height * 0.9,
              width: MediaQuery.of(context).size.width * 0.9,
              child: wallInfoCard()),
        ));
  }

  Widget wallInfoCard() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
      width: MediaQuery.of(context).size.width * 0.8,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.red[200],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.0,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              SizedBox(width: 10.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nombre de usuario',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '@nombredeusuario',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            'Contenido del tweet...',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          // Aquí puedes agregar imágenes, vídeos, etc., del tweet
        ],
      ),
    );
  }
}
