import 'package:dictionary/home/view_model/dictionary_view_model.dart';
import 'package:dictionary/utils/env_reader.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _controller = TextEditingController();
  DictionaryViewModel? dictionaryViewModel;

  @override
  void initState() {
    dictionaryViewModel =
        Provider.of<DictionaryViewModel>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dictionary App',textAlign: TextAlign.start,),
        // leading: Container(),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Row(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10,bottom: 10),
                    child: Container(
                decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25.0)),
                child: TextFormField(
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: 'Search for a word',
                        contentPadding: const EdgeInsets.only(left: 25, ),
                        border: InputBorder.none),
                ),
              ),
                  )),
              IconButton(
                  onPressed: () =>
                      dictionaryViewModel!.fetchDictionaries(_controller.text),
                  icon: Icon(
                    Icons.search,
                  ))
            ],
          ),
        ),
      ),
      body: Consumer<DictionaryViewModel>(
        builder: (context, model, child){
          return ListView.builder(
            itemCount: (model.getDictionaries == null) ? 0 : model.getDictionaries![0].meanings!.length,
            itemBuilder: (BuildContext context, int index){
              return ListTile(
                title: Text(model.getDictionaries![0].word!),
                subtitle: Text(model.getDictionaries![0].meanings![index].definitions![0].definition!),
              );
            },
          );
        },
      )
    );
  }
}
