# Romance（21日亲密之旅）功能清单与复刻进度

> 对照：Joyride `m_chatroom/plugins/romance` + `m_main/lib/src/romance` + `RomanceApi` + IM Cmd。  
> 状态：`[ ]` 未做 / `[~]` 部分完成 / `[x]` 已完成 / `[-]` 本期忽略

**当前范围：只走私聊触发模式。新人房派单 / 进房弹窗 / autoStrike 暂不启用。**

---

## 0. 原则

- 私聊进度：挂在 `DmChatLogic` / 聊天页（主路径）
- 全局弹窗：解锁成功 / 翻牌 CMD（可选）
- 新人房玩法代码保留在 `lib/modules/room/types/romance/`，但未注册进 `RoomPlays`
- 不复刻服务端派单算法与 H5 任务日历

---

## 1. 基建

- [x] **1.1** Proto：`couple.pb` / `mass.InviteInfo` / CMD 枚举
- [x] **1.2** `RomanceApi` + `ChimoApis.romance`
- [x] **1.3** 缓存 key：`romanceActivityHasShowKey` / `romanceActivitySuccessHasShowKey`
- [x] **1.4** H5：`RomanceApi.intimacyMissionUrl`
- [-] **1.5** `isRomanceRoom` Setting 裁剪（房间侧遗留，本期不依赖）
- [-] **1.6** 房内新人进房弹窗（已关闭触发）

---

## 2. 全局 CMD 表现

- [-] **2.1** `MESS_ROOM_INVITE_GS` → 忽略
- [-] **2.2** `MESS_ROOM_INVITE_USER` → 忽略
- [x] **2.3** `PICK_GS_CARD` → CardFlip（可选获客进私聊）
- [x] **2.4** `UNLOCK_COUPLE_ACTIVITY` → RomanceSuccessDialog
- [x] **2.5** 切图 / PAG / invite_tips.MP3 资源已拷贝（进房音效本期不用）

---

## 3. Romance 房（本期忽略）

- [-] **3.1–3.6** `RomanceRoomPlay` 未注册；`NEWBIE` 暂走普通语音房

---

## 4. 私聊主路径（本期唯一触发）

- [x] **4.1** 拉 `activityBaseInfo` + 顶栏进度卡
- [x] **4.2** 第 5 回合 `checkActivity` → 送礼解锁弹窗
- [x] **4.3** 成功弹窗 + 置顶会话 + 进 H5
- [x] **4.4** `claimItem` 领奖
- [x] **4.5** 会话列表 `RomanceLevelTag`
- [-] **4.6** 回主 Tab `autoStrike(0)`（已去掉）

---

## 5. 联调

- [ ] 真机：与 GS 私聊满 5 回合 → 送礼解锁 → 进度 / 领奖 / 成功弹窗
- [x] H5 域名：`AppLinks.h5Host`
- [-] 新人进房音效（随新人房忽略）
