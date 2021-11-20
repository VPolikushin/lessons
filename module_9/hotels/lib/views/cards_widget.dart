import 'package:flutter/material.dart';


class CardGridView extends StatefulWidget {
  const CardGridView({Key? key, required this.name, required this.poster, required this.uuid}) : super(key: key);
  final String name;
  final String poster;
  final String uuid;

  @override
  _CardGridViewState createState() => _CardGridViewState();
}

class _CardGridViewState extends State<CardGridView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.5,
      child: Card(
        elevation: 6,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'assets/images/${widget.poster}',
                fit: BoxFit.fill,
                width: double.infinity,
                //height: double.infinity,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              height: MediaQuery.of(context).size.height / 18,
              child: Text(
                widget.name,
                textAlign: TextAlign.center,
              ),
            ),
            Material(
              color: Colors.blue,
              child: SizedBox(
                width: MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height / 24,
                child: InkWell(
                  onTap: (){
                    Navigator.of(context).pushNamed('/hotelInfo', arguments: [widget.uuid, widget.name]);
                  },
                  child: const Center(
                    child: Text(
                      'Подробнее',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class CardListView extends StatefulWidget {
  const CardListView({Key? key, required this.name, required this.poster, required this.uuid}) : super(key: key);
  final String name;
  final String poster;
  final String uuid;

  @override
  _CardListViewState createState() => _CardListViewState();
}

class _CardListViewState extends State<CardListView> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3.5,
      child: Padding(
        padding: const EdgeInsets.only(top: 4),
        child: Card(
          elevation: 6,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/${widget.poster}',
                  fit: BoxFit.fitWidth,
                  width: double.infinity,
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 14,
                padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 2,
                      child: Text(widget.name),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 24,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                        ),
                        onPressed: (){
                          Navigator.of(context).pushNamed('/hotelInfo', arguments: [widget.uuid, widget.name]);
                        },
                        child: const Text('Подробнее'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
