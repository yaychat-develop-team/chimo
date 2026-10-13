// ignore_for_file: avoid_print
import 'dart:io';
import 'package:path/path.dart' as p;

void main(List<String> args) async {
  final Directory project = Directory.current;
  print('Project path: ${project.path}');

  final Directory sourceProtoDir = Directory(p.join(project.path, 'proto'));
  final Directory outputDir = Directory(p.join(project.path, 'lib', "common", "models"));

  // 根据proto生成pb
  genProtos(sourceProtoDir, outputDir);
  // 删除 .pbjson.dart 和 .pbserver.dart
  await deleteUnusedPb(outputDir);

  print('✅ Build proto finished.');
}

void genProtos(Directory inputDir, Directory outputDir) {
  print('Generate protos in: ${inputDir.path}');
  Iterable<String> protos = inputDir
      .listSync(recursive: true)
      .whereType<File>()
      .where((file) => p.extension(file.path) == '.proto')
      .map((file) => p.relative(file.path, from: inputDir.path));
  // print(protos);
  final result = Process.runSync('protoc', [
    '--proto_path=${inputDir.path}',
    '--dart_out=${outputDir.path}',
    ...protos,
  ], workingDirectory: Directory.current.path);
  if (result.exitCode != 0) {
    print('protoc failed[${result.exitCode}]: ${result.stderr}');
    exit(1);
  }
}

Future<void> deleteUnusedPb(Directory dir) async {
  final futures = <Future<void>>[];
  dir.listSync(recursive: true).whereType<File>().forEach((file) {
    String extension = p.extension(file.path, 2);
    if (extension == '.pbjson.dart' || extension == '.pbserver.dart') {
      futures.add(file.delete());
    } else if (extension == '.pbenum.dart') {
      List<String> lines = file.readAsLinesSync();
      bool hasContent = lines.any(
        (line) => line.trim().isNotEmpty && !line.trim().startsWith('//'),
      );
      if (!hasContent) {
        futures.add(file.delete());
      }
    }
  });
  await Future.wait(futures);

  // // 清理空目录
  // dir
  //     .listSync(recursive: true)
  //     .whereType<Directory>()
  //     .where((d) => d.listSync().isEmpty)
  //     .forEach((d) => d.deleteSync());
}
