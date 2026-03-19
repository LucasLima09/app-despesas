# despesas

Aplicativo Flutter para controle de despesas pessoais.

## Visão geral

O app permite cadastrar transações (título, valor e data), listar os lançamentos e visualizar um resumo em gráfico para os últimos 7 dias.

Os dados ficam apenas em memória durante a execução do app (ao reiniciar, as transações não são preservadas).

## Funcionalidades

- Cadastro de transações
- Listagem de transações
- Remoção de transações
- Gráfico/resumo dos gastos por dia (últimos 7 dias)

## Como rodar

Pré-requisitos: Flutter SDK instalado e um device/emulador configurado (Android/iOS/Web/Desktop).

```bash
flutter pub get
flutter run
```

## Estrutura do projeto

- `lib/main.dart`: tela principal (`MyHomePage`), estado das transações e abertura do modal de cadastro
- `lib/models/transaction.dart`: modelo `Transaction`
- `lib/components/transaction_form.dart`: formulário de nova transação (título/valor/data)
- `lib/components/transaction_list.dart`: lista das transações cadastradas e ação de remover
- `lib/components/chart.dart`: agrega valores por dia e monta o gráfico
- `assets/`: imagens e fontes usadas no app

## Assets e fontes

- Imagem: `assets/images/waiting.png` (exibida quando não há transações)
- Fontes: OpenSans e Quicksand em `assets/fonts/`

Se você adicionar/remover assets, atualize o `pubspec.yaml` para manter os caminhos corretos.

## Build (exemplos)

```bash
flutter build apk
flutter build web
```

