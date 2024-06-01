import 'package:disi_app/datasource/entities/concert.dart';
import 'package:disi_app/src/providers/concerts_provider.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../class/navigator_bar.dart';
import '../../design_tools/tool_widgets/appButtons.dart';
import '../../design_tools/tool_widgets/app_colors.dart';
import '../../design_tools/tool_widgets/tool_widgets.dart';
import '../../enviroments/enviroments.dart';

class ConcertsPage extends ConsumerStatefulWidget {
  const ConcertsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ConcertsPageState();
}

class _ConcertsPageState extends ConsumerState<ConcertsPage> {
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
                  final concertData = ref.watch(concertList);
                  //final concertData = productsState.products;
                  // final productsState = ref.watch(productsProvider);
                  // final concertData = productsState.products;

                  return switch (concertData) {
                    AsyncData(:final value) => Container(
                        height: MediaQuery.of(context).size.height * 0.85,
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: value.length,
                          itemBuilder: (context, index) {
                            final concert = value[index];

                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              child: concertCard(concert: concert),
                            );
                          },
                        ),
                      ),
                    AsyncError(:final error) => Text('error: $error'),
                    _ => const Text('loading'),
                  };
                },
              )
            ],
          ),
        )))));
  }

  Widget concertCard({required Concert concert}) {
    String url = Enviroment.Url;
    return AppWidgets.customCard(
        topLeftRadius: 40,
        topRightRadius: 40,
        bottomLeftRadius: 40,
        bottomRightRadius: 40,
        containerHeight: MediaQuery.of(context).size.height * 0.3,
        containerWidth: MediaQuery.of(context).size.width * 0.9,
        cardColor: AppColors.white.withOpacity(0.4),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    // width: MediaQuery.of(context).size.width * 0.2,

                    decoration: BoxDecoration(
                        image: DecorationImage(
                  image: NetworkImage(
                      url + concert.flyerUrl), // Ruta de la imagen asset
                  fit: BoxFit
                      .contain, // Ajuste de la imagen dentro del contenedor
                ))),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(
                      14.0), // Agregamos un padding alrededor del contenedor
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment
                        .start, // Alineamos los elementos a la izquierda
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 5.0), // Añadimos espacio entre los textos
                        child: AppWidgets.mainText(
                            context, concert.eventoName.toUpperCase(), 4),
                      ),
                      AppWidgets.smallText(context, concert.city, 3,
                          color: AppColors.black),
                      AppWidgets.smallText(
                          context, '${concert.city}/${concert.city}', 3,
                          color: AppColors.black),
                      AppWidgets.smallText(context, concert.hour, 3,
                          color: AppColors.black),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

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
              // GoRouter.of(context).go;
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
            child: AppWidgets.mainText(context, "Eventos", 6,
                color: AppColors.white),
          ),
        ),
        Spacer(flex: 3), // Espacio flexible para espaciado uniforme
      ],
    );
  }
}
