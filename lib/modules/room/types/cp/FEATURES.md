# CP 房功能清单（对照 joyride `plugins/room_cp`）

状态：`[ ]` 未做 / `[x]` 已完成

## 1. 接入与基础设施

- [x] **1.1** `RoomType.CP` 命中 `CpRoomPlay`（模板房）
- [x] **1.2** `RoomService.isCpRoom` + 麦位数量（主持 + 嘉宾，对齐 8 麦）
- [x] **1.3** `loadExt()` 拉取 / 应用 `JoinChannelExtendRsp.cpInfo`
- [x] **1.4** `CpApi`：`/room-cp/op` start/next、`/room-cp/manual-finish`、`/room-cp/relation-config`、`/room-cp/heart-rank`
- [x] **1.5** `CpMsgHandler`：`CP_ROOM_STATE` / `CP_ROOM_HANDS_HEART_VALUE` / `CP_ROOM_PAIR_EFFECT`
- [x] **1.6** 切图进 `assets/images/room/cp/` + `AppAssets` + pubspec

## 2. 舞台与阶段 UI

- [x] **2.1** `CpMicArea` 主舞台容器（星空底 / 阶段切换）
- [x] **2.2** `CpStageHeader`：主持麦(0) + 嘉宾位(7) + 阶段条 introduce/choose/hand
- [x] **2.3** 自我介绍阶段 `CpMicIntroduce`：6 嘉宾环形麦 + 热度心形
- [x] **2.4** 互选阶段 `CpMicChoose`：三组配对麦位 + Points
- [x] **2.5** 牵手阶段 `CpMicHands`：双人位 + 祝福送礼入口 + 进度条/文案
- [x] **2.6** 麦位组件：编号色、描边、闭麦角标、昵称、空麦

## 3. 管理员能力（主持麦 uid == 自己）

- [x] **3.1** 未开局：**Start Game**
- [x] **3.2** 介绍/互选中：**Next Step**
- [x] **3.3** 牵手阶段：**Bestow Relation**（选关系后 next→hand 带 relationId）
- [x] **3.4** 开局后任意阶段：**Close Game**（确认弹窗 + manual-finish）
- [x] **3.5** 非管理员不可见上述操作按钮

## 4. 普通用户能力

- [x] **4.1** **Play Rules** 入口（H5 / 占位说明）
- [x] **4.2** 未上麦且未开局：**Join Now**（自动上麦）
- [x] **4.3** 牵手阶段 **Bless them**（打开礼物面板）

## 5. 榜单与关系

- [x] **5.1** 顶栏 **Heart List** 入口
- [x] **5.2** 心动榜弹层（Top1 大卡 + 列表）
- [x] **5.3** 授关系弹层（配置列表 + Confirm）

## 6. 动效 / 浮层

- [x] **6.1** 阶段切换动效（pag 或静态兜底）
- [x] **6.2** 互选配对变更浮层 `CpPairChange`
- [x] **6.3** 牵手进度步进动效
- [x] **6.4** 结局 `CPStage.end` 全屏动效（双人头像 + 文案）

## 7. 其它

- [x] **7.1** 房间停留倒计时条（有 timing 时）
- [x] **7.2** 资料卡「管理员设置」在 CP 房仍可用（已有 RoomUserMore 能力复用）
