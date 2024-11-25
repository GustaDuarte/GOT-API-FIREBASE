# GOT-API (FLUTTER)

Este repositório contém o código-fonte do aplicativo GOT-App, que permite aos usuários explorar personagens, casas e informações do universo de Game of Thrones, utilizando a API de Game of Thrones e o Firebase.

O desenvolvimento é colaborativo, com 2 pessoas responsáveis [Gustavo Duarte](https://www.linkedin.com/in/gustavo-duarte-225007219/) e [Arthur Lopes](https://www.linkedin.com/in/arthur-lopes-58762021b/). Este repositório tem como objetivo registrar o progresso e versionamento do código, garantindo a organização e a continuidade do projeto.

## Getting Started

Para começar a contribuir ou modificar o código do aplicativo, siga os passos abaixo:

### 1. Configurar o ambiente Flutter

Antes de iniciar, é necessário ter o ambiente de desenvolvimento Flutter corretamente configurado em sua máquina. Caso ainda não tenha, siga as instruções detalhadas na documentação oficial do Flutter:

Flutter - [Guia de Instalação](https://flutter.dev/docs/get-started/install)

### 2. Configurar o Firebase

Este projeto utiliza o Firebase para autenticação e gerenciamento de dados. Siga os passos abaixo para configurar:

1. Crie um projeto no [Firebase Console](https://console.firebase.google.com/).
2. Adicione um aplicativo Android ao projeto no Firebase.
3. Baixe o arquivo `google-services.json` e coloque-o na pasta `android/app` do seu projeto Flutter.
4. Certifique-se de que as seguintes dependências estão configuradas no arquivo `pubspec.yaml`:
   ```yaml
   dependencies:
     firebase_core: ^2.0.0
     firebase_auth: ^4.0.0
     cloud_firestore: ^4.0.0
   ```

### 3. Clonar o Repositório

Após configurar o ambiente Flutter, clone este repositório em sua máquina local utilizando o comando:

```bash
git clone https://github.com/GustaDuarte/GOT-API-FIREBASE.git
```

### 4. Instale as dependências:

No diretório do projeto, execute:

```bash
flutter pub get
```

### Como Usar

Para rodar o projeto em um dispositivo ou emulador:

1. Certifique-se de que um dispositivo físico ou emulador esteja conectado e funcionando corretamente.
2. Execute o comando:

```bash
flutter run
```

### Download do APK

Se você prefere apenas utilizar o aplicativo sem modificar o código, siga estas etapas:

1. Acesse a seção Releases deste repositório.
2. Baixe a versão mais recente do APK disponibilizado.
3. Instale o APK no seu dispositivo Android.
4. Abra o aplicativo e explore o universo de Game of Thrones. m
