
# ConectaLar - Mobile (Fase 4 - PIM VII)

App Flutter para o projeto ConectaLar.

## Estrutura
- lib/core/api_client.dart -> integração REST com JWT
- lib/core/local_db.dart -> SQLite local
- lib/core/sync_service.dart -> sincronização offline-first
- lib/features/auth/login_page.dart -> autenticação
- lib/features/home/home_page.dart -> catálogo com cache

## Como rodar
flutter pub get
flutter run

Configure a baseUrl em api_client.dart para a URL da API BackendPIM.


## Documentação Visual (para Word)
- Figura 1 - Arquitetura de Sincronização Offline-First: docs/image_20261012_094004.png
- Figura 2 - Login: docs/image_20261012_093406.png
- Figura 3 - Home: docs/image_20261012_093410.png
- Figura 4 - Agendamento: docs/image_20261012_093420.png
- Figura 5 - Acompanhamento: docs/image_20261012_093422.png
