import 'package:disi_app/datasource/entities/crew.dart';
import 'package:disi_app/design_tools/tool_widgets/app_colors.dart';
import 'package:disi_app/design_tools/tool_widgets/tool_widgets.dart';
import 'package:disi_app/src/providers/crew_memebers.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../class/navigator_bar.dart';
import '../../design_tools/tool_widgets/appButtons.dart';

class CrewPage extends ConsumerStatefulWidget {
  const CrewPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CrewPageState();
}

class _CrewPageState extends ConsumerState<CrewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        drawer: MyDrawer.buildDrawer(context),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Center(
                    child: Container(
          child: Column(
            children: [
              _buttonsBackandTittle(),
              Consumer(
                builder: (context, ref, child) {
                  final memeberData = ref.watch(UsersList);
                  //final memeberData = productsState.products;
                  // final productsState = ref.watch(productsProvider);
                  // final memeberData = productsState.products;

                  if (memeberData.isEmpty) {
                    return FutureBuilder(
                      future: Future.delayed(Duration(milliseconds: 500)),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          // Muestra el CircularProgressIndicator mientras esperas
                          return Container(
                              height: MediaQuery.of(context).size.height * 0.85,
                              child:
                                  Center(child: CircularProgressIndicator()));
                        } else {
                          // Después de 0.5 segundos, muestra el mensaje "No tienes favoritos aún"
                          return Container(
                            height: MediaQuery.of(context).size.height * 0.85,
                            child: Column(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.1,
                                ),
                                AppWidgets.mainText(
                                    context, 'No tienes favoritos aún', 5),
                              ],
                            ),
                          );
                        }
                      },
                    );
                  }

                  return Container(
                    height: MediaQuery.of(context).size.height * 0.85,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: memeberData.length,
                      itemBuilder: (context, index) {
                        final memeber = memeberData[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6.0),
                          child: crewCardInfo(member: memeber),
                        );
                      },
                    ),
                  );
                },
              )
            ],
          ),
        )))));
  }

  Widget crewCardInfo({required User member}) {
    return AppWidgets.customCard(
        topLeftRadius: 40,
        topRightRadius: 40,
        bottomLeftRadius: 40,
        bottomRightRadius: 40,
        cardColor: AppColors.white.withOpacity(0.2),
        containerHeight: MediaQuery.of(context).size.height * 0.2,
        containerWidth: MediaQuery.of(context).size.width * 0.9,
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CircleAvatar(
                          radius: 80,
                          backgroundColor: AppColors.black.withOpacity(0.2),
                          child: Icon(
                            Icons.person,
                            size: 60, // Tamaño del icono
                            color: Colors.white, // Color del icono
                          ),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 6,
                              backgroundColor: AppColors.green,
                            ),
                            AppWidgets.mainText(context, '  Disponible', 3)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppWidgets.mainText(context, member.name, 5),
                    AppWidgets.smallText(context, member.rol, 4,
                        color: AppColors.white)
                  ],
                ),
              ),
            )
          ],
        ));
  }

  //----------
  Widget _buttonsBackandTittle() {
    //---------------------Botones de notificaciones y menu-----------------
    return Row(
      mainAxisAlignment:
          MainAxisAlignment.center, // Centra los elementos horizontalmente
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 14),
          child: AppButtons().greyButton(
            primaryColor: AppColors.background,
            iconColor: AppColors.white,
            context: context,
            icon: Icons.arrow_back,
            onPressed: () {
              Navigator.pop(context);
            },
            fontSize: 8,
            horizontalPadding: 3,
            verticalPadding: 1,
          ),
        ),
        Spacer(flex: 1), // Espacio flexible para centrar el MainText
        Expanded(
          flex: 5,
          child: Center(
            // Centra el MainText en el eje horizontal
            child:
                AppWidgets.mainText(context, "Crew", 6, color: AppColors.white),
          ),
        ),
        Spacer(flex: 3), // Espacio flexible para espaciado uniforme
      ],
    );
  }
}
