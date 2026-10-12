
import 'package:flutter/material.dart';
import '../../core/api_client.dart';
import '../../core/local_db.dart';

class HomePage extends StatefulWidget { @override _HomePageState createState() => _HomePageState(); }
class _HomePageState extends State<HomePage> {
  final api = ApiClient();
  List servicos = [];
  @override
  void initState(){ super.initState(); carregar(); }
  Future<void> carregar() async {
    try {
      var res = await api.dio.get('/servicos');
      setState(()=> servicos = res.data);
      var db = await LocalDB.db;
      for(var s in servicos){ await db.insert('servicos', {'id': s['id'], 'nome': s['nome'], 'descricao': s['descricao'], 'preco': s['precoBase']}, conflictAlgorithm: ConflictAlgorithm.replace); }
    } catch(e){
      var db = await LocalDB.db;
      var local = await db.query('servicos');
      setState(()=> servicos = local);
    }
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(title: Text('ConectaLar - Serviços')), body: ListView.builder(itemCount: servicos.length, itemBuilder: (c,i)=> ListTile(title: Text(servicos[i]['nome']??''), subtitle: Text(servicos[i]['descricao']??''))));
  }
}
