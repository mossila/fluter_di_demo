# di_demo

Create Android/iOS dependency 
```
flutter create .
```

Intall dependency 
```
flutter pub get
```

Start code generator 
```
flutter pub run  build_runner watch  --delete-conflicting-outputs
```

Clean the generated code 
```
flutter pub run  build_runner clean  --delete-conflicting-outputs
```

Install socket server dependency
```
cd server && yarn
```
or
```
cd server && npm i
```

Run socket server `make sure your path is in /server directory`
```
nodemon
```
if nodemon not exist install via `yarn global add nodemon` or `npm i -g nodemon`

Get your ip address for allow socket CORS blocked
if using mac
```
if=`netstat -nr | awk '{ if ($1 ~/default/) { print $6} }'`
ifconfig ${if} | awk '{ if ($1 ~/inet/) { print $2} }'
```
see also `192.168.*.**`
and edit within `/lib/scene/counter_page/repository/dev_constant_repository.dart`

When run flutter success
Get your client IP:Port to add in `server/src/app.js` in `io.origins([...here])`

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
