import 'package:dio/dio.dart';
import 'package:example_hack2hire/model/data_model.dart';
import 'package:example_hack2hire/model/response_entity_model.dart';
import 'package:example_hack2hire/model/show_model.dart';
import 'package:example_hack2hire/networking/network_config.dart';
import 'package:example_hack2hire/networking/rest_client.dart';
import 'package:example_hack2hire/page/list_seats_screen.dart';
import 'package:example_hack2hire/widget/show_cart.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';

class ShowsScreen extends StatefulWidget {
  const ShowsScreen({Key? key}) : super(key: key);

  @override
  State<ShowsScreen> createState() => _ShowsScreenState();
}

class _ShowsScreenState extends State<ShowsScreen> {
  List<Show> _shows = [];

  Future _getShows() async {
    final baseURL = NetworkConfig.instance.baseURL;
    final dio = Dio();
    final client = baseURL.isNotEmpty
        ? RestClient(dio, baseUrl: baseURL)
        : RestClient(dio);
    final ResponseEntity response = await client.getShows();
    if (response.meta?.code == 200) {
      setState(() {
        _shows = response.data!.shows!;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    _getShows();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff1f203e),
      child: Scaffold(
          backgroundColor: const Color(0xff1f203e),
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xff2e3350),
            title: const Text(
              "SHOWS",
              style: (TextStyle(fontSize: 18, height: 1.4)),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
          ),
          body: _shows.isNotEmpty
              ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  child: ListView.builder(
                      itemCount: _shows.length,
                      itemBuilder: (BuildContext context, int index) {
                        String startDate = Jiffy(
                                DateTime.fromMillisecondsSinceEpoch(
                                    _shows[index].startDate ?? 1662779287000))
                            .format("H:mm dd/MM/yyyy");

                        return ShowCard(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (_) {
                                return ListSeatsScreen(
                                  id: _shows[index].showId!,
                                );
                              }));
                            },
                            urlImage: _shows[index].imageUrl ?? "",
                            name: _shows[index].name ?? "",
                            startDate: startDate);
                      }),
                )
              : const SizedBox()),
    );
  }
}
