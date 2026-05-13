import 'package:flutter/material.dart';
import 'package:flutter_application_1/config/config.dart';

class BandsScreen extends StatelessWidget {
  const BandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bandas'),
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context,i){
          return _bandTile(bands[i]);
        }
        )
    );
  }

  ListTile _bandTile(Band band){
    return ListTile(
          leading: CircleAvatar(
            child: Text(band.nomen.substring(0,2).toUpperCase()),
          ),
          title: Text(band.nomen),
          trailing: Text('${band.numerusVotum}',style: TextStyle(fontSize: 20),),
          onTap: (){
            // ignore: avoid_print
            print(band.nomen);
          },
        );
  }
}