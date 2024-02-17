import 'package:disi_app/design_tools/tool_widgets/appButtons.dart';
import 'package:disi_app/design_tools/tool_widgets/app_colors.dart';
import 'package:disi_app/design_tools/tool_widgets/tool_widgets.dart';
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
  Widget build(BuildContext context) {
    final eventos = ref.watch(events_list);
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
                    profilePhoto(),
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

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: AppWidgets.smallText(
                          context,
                          'Ha colaborado con importantes bandas de metal de la región y participado en trabajos discográficos de diversosgéneros como reggae, indierock y pop. Cofundador de Disillumination y parte fundamental en la creaciónde los trabajos musicales.',
                          4,
                          color: Colors.white),
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

  Widget profilePhoto() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: const DecorationImage(
              image: NetworkImage(
                  'https://scontent.fclo1-3.fna.fbcdn.net/v/t39.30808-6/369263287_6869034213135486_6644669060429074549_n.jpg?_nc_cat=109&ccb=1-7&_nc_sid=efb6e6&_nc_eui2=AeGBaNHKqDnH2FxrtX7qaF9nJXoWGSndd7glehYZKd13uKl9tfkp6wTmYsA932r1bZJ6zmAeP5r7iedhO-H3naj3&_nc_ohc=60T1_G0mWYkAX93RDfG&_nc_ht=scontent.fclo1-3.fna&cb_e2o_trans=t&oh=00_AfAo6QjMJZeRsHgHSZa-upjHqRyWyaqnr6l6syVE5NTSFQ&oe=65D19645'),
              fit: BoxFit.cover),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withOpacity(0.5),
              Colors.black.withOpacity(0.8),
              Colors.black.withOpacity(0.1),
            ],
          )),
      height: MediaQuery.of(context).size.height * 0.7,
      //width: MediaQuery.of(context).size.width * 0.9,

      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: 18.0), //margen entre container padre y columna

        child: Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      )),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                //width: MediaQuery.of(context).size.width * 0.9,
                child: Column(
                  children: [
                    const Expanded(
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Icon(Icons.message, color: Colors.white)),
                    ),
                    const Expanded(
                      child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Icon(
                            Icons.heart_broken,
                            color: Colors.white,
                          )),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Row(
                            children: [
                              AppWidgets.mainText(context, "David Mejía", 10,
                                  color: Colors.white),
                              const Icon(Icons.facebook)
                            ],
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.person_add,
                            color: Colors.white,
                            size: 40,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
