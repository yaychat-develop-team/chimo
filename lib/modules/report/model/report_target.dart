/// 举报目标：用户、群聊或房间（对齐 forya ReportType）。
///
/// 路由参数。房间、群资料和跳转都用它，所以留在 report 模块，不放进页面文件。
enum ReportTargetKind { user, group, room }
