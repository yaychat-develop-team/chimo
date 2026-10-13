// import 'dart:io';
// import 'package:file/local.dart';
// import 'package:glob/glob.dart';
// import 'package:archive/archive.dart';
// import 'package:archive/archive_io.dart';

// void main() async {

//   await execShell('aws', ['s3','cp','assets/images/fleet/','s3://yaychat-static-resource/static/app_0_res/assets/images/fleet'
//     ,'--recursive','--include', '*']);

//   await execShell('aws', ['cloudfront','create-invalidation','--distribution-id','E23RBOEEUQ19Q9','--paths', '/static/app_0_res/assets/images/fleet/*']);

//   var splitCfg = ['assets/images/fleet/guide_*'];

//   var fileSys = LocalFileSystem();

// // 创建一个 Glob 模式（匹配 .dart 文件）
//   final glob = Glob('assets/images/fleet/*');

//   final allFiles = glob.listFileSystemSync(fileSys);
//   allFiles.shuffle();

//   // print((allFiles[0] as File).statSync());

//   // 按规则分组文件
//   List<List<FileSystemEntity>> fileGroups = [];
//   while(allFiles.length > 40) {
//     List<FileSystemEntity> subFiles = [];
//     if(splitCfg.isNotEmpty){
//       var cfg = splitCfg.removeAt(0);
//       final subGlob = Glob(cfg);
//       subFiles = subGlob.listFileSystemSync(fileSys);
//     }else{
//       subFiles = allFiles.sublist(0,40);
//     }

//     fileGroups.add(subFiles);
//     allFiles.removeWhere((element) => subFiles.contains(element));
//   }

//   if(allFiles.isNotEmpty){
//     fileGroups.add(allFiles);
//   }

//   // 创建输出目录
//   final outputDirectory = Directory('./scripts/remote_res/zip');
//   if (!outputDirectory.existsSync()) {
//     outputDirectory.createSync(recursive: true);
//   }

//   // 为每组文件生成小 ZIP 文件
//   for (int index = 0; index < fileGroups.length; index++) {
//     final archivePart = Archive();
//     for (var file in fileGroups[index]) {
//       var rawFile = (file as File);
//       final fileBytes = rawFile.readAsBytesSync();
//       archivePart.addFile(ArchiveFile('assets/images/fleet/' + file.uri.pathSegments.last, fileBytes.length, fileBytes));
//     }

//     final zipData = ZipEncoder().encode(archivePart)!;
//     final partFilePath = '${outputDirectory.path}/fleet-1.5-part-${index + 1}.zip';
//     File(partFilePath).writeAsBytesSync(zipData);

//     print('Created $partFilePath with ${fileGroups[index].length} files.');
//   }

//   await execShell('aws', ['s3','cp','scripts/remote_res/zip/','s3://yaychat-static-resource/static/app_0_res','--recursive','--include','*']);

//   // await execShell('aws', ['cloudfront','create-invalidation','--distribution-id','E23RBOEEUQ19Q9','--paths', '/static/app_0_res/fleet-*.zip']);
// }

// Future execShell(String command,List<String> arguments) async{

//   Process process = await Process.start(command, arguments);

//   // 监听标准输出
//   process.stdout.transform(SystemEncoding().decoder).listen((data) {
//     print('\n输出: $data');
//   });

//   // 监听错误输出
//   process.stderr.transform(SystemEncoding().decoder).listen((data) {
//     print('\n错误: $data');
//   });

//   // 等待进程结束
//   int exitCode = await process.exitCode;
//   print('完成: $exitCode');
// }
