import 'package:flutter/material.dart';
import 'package:latutsapp/pages/moedas_detalhes_page.dart';
import 'package:latutsapp/repositories/repositories.dart';
import 'package:intl/intl.dart';

import '../models/moeda.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({Key? key}) : super(key: key);

  @override
  _MoedasPageState createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRepository.tabela;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', name: 'R\$');
  List<Moeda> selecionadas = [];


  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: const Text('Cripto Moedas'),
      );
    } else {
      return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
            },
        ),
        title: Text('${selecionadas.length} selecionadas'),
        backgroundColor: Colors.teal[50],
        elevation: 1,
        iconTheme: const IconThemeData(color: Colors.black87),
        toolbarTextStyle: const TextTheme(
          headline6: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).bodyText2,
        titleTextStyle: const TextTheme(
          headline6: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ).headline6,
      );
    }
  }

  mostrarDetalhes (Moeda moeda){
    Navigator.push(context, MaterialPageRoute(
        builder: (_) => MoedasDetalhesPage(moeda: moeda),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int moeda){
            return ListTile(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              leading: (selecionadas.contains(tabela[moeda]))
                  ? const CircleAvatar(child: Icon(Icons.check))
                  : SizedBox(
                    width: 40,
                    child: Image.asset(tabela[moeda].icone),
              ),
              title: Text(tabela[moeda].nome, style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),),
              trailing: Text(
                  real.format(tabela[moeda].preco)
              ),
              selected: selecionadas.contains(tabela[moeda]),
              selectedTileColor: Colors.indigo[50],
              onLongPress: () {
                setState(() {
                  (selecionadas.contains(tabela[moeda]))
                      ? selecionadas.remove(tabela[moeda])
                      : selecionadas.add(tabela[moeda]);
                });

              },
              onTap: () => mostrarDetalhes(tabela[moeda]),
            );
          },
          padding: const EdgeInsets.all(16),
          separatorBuilder: (_, __) => Divider(),
          itemCount: tabela.length
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: selecionadas.isNotEmpty ?
      FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.star),
        label: const Text(
          'Favoritar',
          style: TextStyle(
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
      : null,
    );
  }

}
