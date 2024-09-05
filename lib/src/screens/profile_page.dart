import 'package:disi_app/design_tools/tool_widgets/appButtons.dart';
import 'package:disi_app/design_tools/tool_widgets/app_colors.dart';
import 'package:disi_app/design_tools/tool_widgets/tool_widgets.dart';
import 'package:disi_app/enviroments/enviroments.dart';
import 'package:disi_app/src/providers/auth_provider.dart';
import 'package:disi_app/src/providers/events_provider.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import '../../class/alert.dart';
import '../../class/navigator_bar.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final eventos = ref.watch(events_list); //--Provider de la lista de horas
    final user = ref.watch(authProvider).user; //----Provider de usuario
    return Scaffold(
        drawer: MyDrawer.buildDrawer(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
                child: Container(
              //Container , aquí se arma imagen y row

              color: Colors.black,
              // height: MediaQuery.of(context).size.height * 1,
              //width: MediaQuery.of(context).size.width * 1,

              child: Center(
                //---AQUÍ VA CONSUMER de data USER
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    profilePhoto(user!.photoUrl, user.name),
                    //-----------Siguiente parte--------------//
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Row(
                        children: [
                          AppWidgets.mainText(context, 'Bajista', 5,
                              color: Colors.white),
                          const Spacer(),
                          const Icon(
                            Icons.music_note,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),

                    //---------------------------------------------------------------//
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: AppWidgets.mainText(
                            context, 'Redes Sociales ', 4,
                            color: Colors.white),
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.9,
                      // color: AppColors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment
                            .start, // Espacio uniformemente distribuido
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.facebook,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              // Acción cuando se presiona el ícono de Facebook
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.bluetooth,
                              color: AppColors.white,
                            ),
                            onPressed: () {
                              // Acción cuando se presiona el ícono de Instagram
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.message,
                              color: AppColors.white,
                            ),
                            onPressed: () {
                              // Acción cuando se presiona el ícono de mensajería
                            },
                          ),
                        ],
                      ),
                    )

                    //Container que contendrá el timer de las horas de cada integrante //

                    ,
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: double.infinity,
                      color: AppColors.white,
                      child: SfCalendar(
                        view: CalendarView.week,
                        dataSource: MeetingDataSource(eventos),
                      ),
                    ),
                    AppButtons().yellowButton(
                      horizontalPadding: 20,
                      verticalPadding: 1,
                      fontSize: 5,
                      context: context,
                      texto: "Franja",
                      onPressed: () {
                        setState(() {});
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AddEventState();
                          },
                        );
                      },
                    )
                  ],
                ),
              ),
            )),
          ),
        ));
  }

  Widget profilePhoto(String imageUrl, String name) {
    String url = Enviroment.Url; // URL dirección
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage('$url$imageUrl'),
          fit: BoxFit.cover,
        ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(0.5),
            Colors.black.withOpacity(0.8),
            Colors.black.withOpacity(0.1),
          ],
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.7,
      //width: MediaQuery.of(context).size.width * 0.9,

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.end, // Alinea la columna al final
            crossAxisAlignment:
                CrossAxisAlignment.start, // Alinea el Row al principio
            children: [
              GestureDetector(
                onTap: () {
                  // ref.watch(authProvider.notifier).logout();
                },
                child: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              Spacer(), // Espacio entre el icono y el Row
              Row(
                children: [
                  AppWidgets.mainText(context, name, 6, color: Colors.white),
                  Spacer(),
                  Icon(
                    Icons.queue_music,
                    color: Colors.white,
                    size: 40,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
