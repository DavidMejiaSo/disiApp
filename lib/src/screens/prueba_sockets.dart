import 'package:disi_app/design_tools/tool_widgets/app_colors.dart';
import 'package:disi_app/design_tools/tool_widgets/tool_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class WebSocketDemo extends ConsumerStatefulWidget {
  const WebSocketDemo({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WebSocketDemoState();
}

class _WebSocketDemoState extends ConsumerState<WebSocketDemo> {
  final channel = WebSocketChannel.connect(
      Uri.parse('wss://socketsbay.com/wss/v2/1/demo/'));

  @override
  void initState() {
    super.initState();
    streamListener();
  }

  streamListener() {
    channel.stream.listen((event) {
      setState(() {
        ref.watch(MessagesList).add(event);
        print("Respuesta del Socket ${event}");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final messages = ref.watch(MessagesList);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            color: AppColors.background,
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return AppWidgets.mainText(context, messages[index], 6,
                    color: AppColors.pink);
              },
            ),
          ),
        ),
      ),
    );
  }
}

final MessagesList = StateProvider<List<String>>(
  (ref) {
    return []; //---SUBTOTAL
  },
);
