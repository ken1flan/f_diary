# F Diary
Flutterを使って作られた、簡単な日記アプリケーションです。

## 開発
### セットアップ
#### Flutter
[Flutter](https://flutter.dev/)を参照してください。
#### Isarのインストール
手元の環境でテストを動かすためにはIsarのコアライブラリをダウンロードする必要があります。

##### MacOS
[テストのセットアップスクリプト](https://github.com/isar/isar/blob/main/packages/isar_test/tool/setup_tests.sh)を参考に、プロジェクトルートにライブラリのバイナリをコピーしてきます。

```console
core_version=`cat .isar_version`
github="https://github.com/isar/isar-core/releases/download/${core_version}"
curl "${github}/libisar_macos.dylib" -o ./libisar.dylib --create-dirs -L
```

### Dartパッケージのバージョンアップ
Isarのみ、バージョンを固定しています。
ほかは通常の手順で更新できます。
#### Isar

- pubspec.ymlのisar、isar_flutter_libs、isar_generatorのバージョンを更新
- .isar_versionを更新
- models/*.g.dartの再作成
