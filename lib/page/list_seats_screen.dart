import 'package:dio/dio.dart';
import 'package:example_hack2hire/model/response_entity_model.dart';
import 'package:example_hack2hire/model/seats_model.dart';
import 'package:example_hack2hire/networking/network_config.dart';
import 'package:example_hack2hire/networking/rest_client.dart';
import 'package:example_hack2hire/page/selected_seats.dart';
import 'package:example_hack2hire/res/colors.dart';
import 'package:example_hack2hire/res/gaps.dart';
import 'package:example_hack2hire/res/size.dart';
import 'package:example_hack2hire/widget/my_button.dart';
import 'package:example_hack2hire/widget/my_text_field.dart';
import 'package:example_hack2hire/widget/show_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:jiffy/jiffy.dart';

class ListSeatsScreen extends StatefulWidget {
  const ListSeatsScreen({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<ListSeatsScreen> createState() => _ListSeatsScreenState();
}

class _ListSeatsScreenState extends State<ListSeatsScreen> {
  List<SeatList> _listSeats = [];
  List _seatsSelected = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  Future _getSeats() async {
    final baseURL = NetworkConfig.instance.baseURL;
    final dio = Dio();
    final client = baseURL.isNotEmpty
        ? RestClient(dio, baseUrl: baseURL)
        : RestClient(dio);
    final ResponseEntity response = await client.getSeats(widget.id);
    if (response.meta?.code == 200) {
      setState(() {
        _listSeats = response.data!.seatList!;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _getSeats();
  }

  @override
  Widget build(BuildContext context) {
    var lengthColumn1 = (_listSeats.length / 2).ceil();
    var lengthColumn2 = _listSeats.length - lengthColumn1;
    return Container(
      color: const Color(0xff1f203e),
      child: Scaffold(
          backgroundColor: const Color(0xff1f203e),
          appBar: AppBar(
            actions: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return const SelectedSeats();
                  }));
                },
                child: Container(
                  padding: const EdgeInsets.only(right: 12),
                  child: const Icon(
                    FeatherIcons.save,
                    size: 18,
                  ),
                ),
              )
            ],
            elevation: 0,
            backgroundColor: const Color(0xff2e3350),
            title: const Text(
              "LIST SEATS",
              style: (TextStyle(fontSize: 18, height: 1.4)),
            ),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(16),
              ),
            ),
          ),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.white),
                          ),
                          AppGaps.hGap2,
                          const Text(
                            "reserved",
                            style: TextStyle(
                                fontSize: AppSize.fontSp16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.primary),
                          ),
                          AppGaps.hGap2,
                          const Text(
                            "selected",
                            style: TextStyle(
                                fontSize: AppSize.fontSp16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(8),
                            width: 25,
                            height: 25,
                            decoration: BoxDecoration(
                                border: Border.all(color: AppColors.gray6),
                                borderRadius: BorderRadius.circular(4),
                                color: Colors.transparent),
                          ),
                          AppGaps.hGap2,
                          const Text(
                            "available",
                            style: TextStyle(
                                fontSize: AppSize.fontSp16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: _listSeats.isNotEmpty
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 12),
                          child: Row(
                            children: [
                              Expanded(
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    ),
                                    itemCount: lengthColumn1,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      var indexSelected =
                                          _seatsSelected.indexWhere((element) =>
                                              element ==
                                              _listSeats[index].seatCode);
                                      bool isSelected = false;
                                      if (indexSelected != -1) {
                                        isSelected = true;
                                      }
                                      return InkWell(
                                        onTap: _listSeats[index].status ==
                                                "BOOKED"
                                            ? null
                                            : () {
                                                var indexSelected =
                                                    _seatsSelected.indexWhere(
                                                        (element) =>
                                                            element ==
                                                            _listSeats[index]
                                                                .seatCode);
                                                if (indexSelected != -1) {
                                                  setState(() {
                                                    _seatsSelected.removeAt(
                                                        indexSelected);
                                                  });
                                                } else {
                                                  setState(() {
                                                    _seatsSelected.add(
                                                        _listSeats[index]
                                                            .seatCode);
                                                  });
                                                }
                                              },
                                        child: Container(
                                          margin: const EdgeInsets.all(8),
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: _listSeats[index]
                                                              .status ==
                                                          "BOOKED"
                                                      ? Colors.transparent
                                                      : AppColors.gray6),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: _listSeats[index].status ==
                                                      "BOOKED"
                                                  ? Colors.white
                                                  : isSelected
                                                      ? AppColors.primary
                                                      : Colors.transparent),
                                        ),
                                      );
                                    }),
                              ),
                              AppGaps.hGap16,
                              Expanded(
                                child: GridView.builder(
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3,
                                    ),
                                    itemCount: lengthColumn2,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      int indexColumn2 = index + lengthColumn1;
                                      return InkWell(
                                        child: Container(
                                          margin: const EdgeInsets.all(8),
                                          width: 10,
                                          height: 10,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      _listSeats[indexColumn2]
                                                                  .status ==
                                                              "BOOKED"
                                                          ? Colors.transparent
                                                          : AppColors.gray6),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              color: _listSeats[indexColumn2]
                                                          .status ==
                                                      "BOOKED"
                                                  ? Colors.white
                                                  : Colors.transparent),
                                        ),
                                      );
                                    }),
                              ),
                            ],
                          ),
                        )
                      : const SizedBox(),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: MyButton(
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (_) {
                            return Container(
                              height: 300,
                              child: Scaffold(
                                backgroundColor: const Color(0xff1f203e),
                                body: SafeArea(
                                  child: Container(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 20, horizontal: 16),
                                    child: Column(
                                      children: [
                                        const Text(
                                          "Confirm",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: AppSize.fontSp16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        AppGaps.vGap16,
                                        MyTextField(
                                          controller: _nameController,
                                          hintText: "Your name",
                                          border: true,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          containerPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 12),
                                        ),
                                        AppGaps.vGap12,
                                        MyTextField(
                                          hintText: "Your Phone Number",
                                          controller: _phoneController,
                                          border: true,
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          containerPadding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 10, horizontal: 12),
                                        ),
                                        AppGaps.vGap12,
                                        MyButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          text: "Book",
                                          radius: 6,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    text: "Choose Your Seats",
                  ),
                )
              ],
            ),
          )),
    );
  }
}
