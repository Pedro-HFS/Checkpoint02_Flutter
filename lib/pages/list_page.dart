import 'package:flutter/material.dart';
import 'package:pedro_sir/pages/components/pedro_card.dart';
import 'package:pedro_sir/pages/components/pedro_form.dart';

import 'components/pedro_page.dart';
import 'model/music_band_model.dart';

class ListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListPageState();
  }
}

class _ListPageState extends State<ListPage> {
  TextEditingController musicNameController = TextEditingController();
  TextEditingController bandNameController = TextEditingController();
  FocusNode musicNameFocus = FocusNode();
  FocusNode bandNameFocus = FocusNode();

  List<MusicAndBandModel> musicAndBandList = [];

  addNewMusicAndBand({required String music, required String band}) {
    setState(() {
      musicAndBandList.insert(
        0,
        MusicAndBandModel(music: music, band: band),
      );
    });
  }

  Future<void> _showDialog({String? music, String? band}) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Playlist'),
          content: SingleChildScrollView(
            child: Container(
              child: Text(
                  'A música $music da banda $band foi adicionada a sua playlist!'),
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Voltar'))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PedroPage(
      title: 'Playlist',
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PedroForm(
                label: 'Digite o nome da música',
                focusNode: musicNameFocus,
                userInputController: musicNameController,
                onEditingComplete: () {
                  musicNameFocus.nextFocus();
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PedroForm(
                label: 'Digite o nome da banda',
                focusNode: bandNameFocus,
                userInputController: bandNameController,
              ),
            ),
            Container(
              width: double.infinity,
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    height: 15,
                  );
                },
                shrinkWrap: true,
                itemCount: musicAndBandList.length,
                itemBuilder: (context, index) {
                  var listItem = musicAndBandList[index];
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        _showDialog(music: listItem.music, band: listItem.band);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 15, top: 15),
                        child: PedroCard(
                          musicText: listItem.music!,
                          bandText: listItem.band!,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      fab: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            addNewMusicAndBand(
                music: musicNameController.text, band: bandNameController.text);
          }),
    );
  }
}
