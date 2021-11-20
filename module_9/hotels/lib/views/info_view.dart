import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:http/http.dart' as http;

class HotelInformationView extends StatefulWidget {
  static const routeName = '/hotelInfo';
  const HotelInformationView({Key? key, required this.uuid, required this.name}) : super(key: key);
  final String uuid;
  final String name;

  @override
  _HotelInformationViewState createState() => _HotelInformationViewState();
}

class _HotelInformationViewState extends State<HotelInformationView> {
  bool isLoading = false;
  bool hasError = false;
  late HotelDescription hotel;

  getData() async {
    setState(() {
      isLoading = true;
    });
  try{
    final response = await http.get(Uri.parse('https://run.mocky.io/v3/${widget.uuid}'));

    hotel = HotelDescription.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } catch(e) {
    setState(() {
      hasError = true;
    });
  }


    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.name),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : hasError ? const Center(child: Text('Контент временно не доступен'))
          : ListView(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 3.5,
                child: ImageSlider(photos: hotel.photos),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Страна: ',
                        children: [
                          TextSpan(
                              text: hotel.address.country,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text.rich(
                      TextSpan(
                        text: 'Город: ',
                        children: [
                          TextSpan(
                              text: hotel.address.city,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text.rich(
                      TextSpan(
                        text: 'Улица: ',
                        children: [
                          TextSpan(
                              text: hotel.address.street,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              )
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8,),
                    Text.rich(
                      TextSpan(
                        text: 'Рейтинг: ',
                        children: [
                          TextSpan(
                              text: hotel.rating.toString(),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20,),
                    const Text(
                      'Сервисы',
                      style: TextStyle(fontSize: 24),
                    ),

                    const SizedBox(height: 14,),
                    Row(
                      children:  const [
                        Text(
                            'Платные',
                          style: TextStyle(fontSize: 18),
                        ),
                        SizedBox(width: 100,),
                        Text(
                          'Бесплатно',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 300,
                            width: MediaQuery.of(context).size.width / 3,
                            child: ListView.builder(

                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: hotel.services.paid.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: const EdgeInsets.only(bottom: 4),
                                    child: Text(hotel.services.paid[index]),
                                );
                              },
                            ),
                          ),
                        ),
                        const SizedBox(width: 16,),
                        Expanded(
                          child: SizedBox(
                            height: 300,
                            width: MediaQuery.of(context).size.width / 3,
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: hotel.services.free.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Container(
                                  padding: const EdgeInsets.only(bottom: 4),
                                    child: Text(hotel.services.free[index]),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
    );
  }
}

class ImageSlider extends StatelessWidget {
  const ImageSlider({Key? key, required this.photos}) : super(key: key);
  final List<String> photos;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.fromLTRB(6, 10, 6, 10),
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
                image: AssetImage('assets/images/${photos[index]}'),
                fit: BoxFit.fill,
            ),
          ),
        );
      }
    );
  }
}
