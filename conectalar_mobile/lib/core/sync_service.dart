
import 'package:connectivity_plus/connectivity_plus.dart';
import 'local_db.dart';
import 'api_client.dart';

class SyncService {
  final ApiClient api = ApiClient();

  Future<void> sincronizarAgendamentos() async {
    var conn = await Connectivity().checkConnectivity();
    if (conn == ConnectivityResult.none) return;
    final database = await LocalDB.db;
    final pendentes = await database.query('agendamentos', where: 'sincronizado = 0');
    for (var a in pendentes) {
      try {
        await api.dio.post('/agendamentos', data: {
          'servicoId': a['servicoId'],
          'dataHora': a['dataHora'],
          'endereco': a['endereco']
        });
        await database.update('agendamentos', {'sincronizado': 1},
            where: 'id = ?', whereArgs: [a['id']]);
      } catch (e) { print('Erro sync: $e'); }
    }
  }
}
