# Heart Link（三人房 / 心动连线）功能清单与复刻进度

> 对照：Joyride `packages_local/m_chatroom/plugins/heart_link/` + `lib_baseview` 全局邀请弹窗 + `lib_im` Cmd Push；产品脑图 `docs/三人房.xmind` / `docs/三人房.png`。  
> 目标：**一次性完整功能复刻**（房内玩法 + **App 级全局邀请浮层**）。  
> 状态：`[ ]` 未做 / `[~]` 部分完成 / `[x]` 已完成  
> 进度汇总：**约 82%**（含 Reveal Card 编辑页入口 + Preview/Upload；邀请抑制 / HT 切房限制 / 礼物文案变体等未完）

---

## 0. 范围与原则

### 0.1 必须复刻（客户端）

1. Heart Link **模板房**三麦 UI、Host Control、牵手送礼、真心话、神秘卡房内链路、小房间。
2. **全局顶部邀请弹窗**（用户不在房间、在任意界面也要弹出）——见 §2，**不可漏**。
3. IM 聊天邀请卡片、Heartie 上线浮条、Hearties 关系展示（公屏标签 / 资料卡入口）。
4. 神秘资料卡编辑 / 预览 / 解锁（与房内联动）。

### 0.2 服务端负责（客户端只消费结果，不复刻分配算法）

- 用户分配进房优先级、强制拉取、白名单、嘉宾池随机分配规则等。
- 客户端只实现：收 Push/IM → 弹窗/进房；Host 点邀请 → 调 API。

### 0.3 工程约定

- 房内能力落在 `lib/modules/room/types/heart_link/`，挂 `RoomPlay`。
- **全局弹窗不挂在 RoomPage 上**，必须挂在 App 根 Overlay / 等价 `GlobalNotice`，由 IM Cmd Push 驱动。
- 不新建独立 package；按 AGENTS.md：GetX + 现有网络封装；不引入新依赖除非已有缺口。

---

## 1. 接入与基础设施

- [x] **1.1** Proto 已有：`heart_link.pb.dart` / `RoomHeartLinkInfo` / `EaseCmdPushType.HEART_LINK_*`
- [x] **1.2** `RoomType.HEART_LINK` 命中真正的 `HeartLinkRoomPlay`
- [~] **1.3** `RoomService.isHtRoom` + 固定 **3 麦**；禁止左右滑切房 / 关闭通用抱麦入口待补
- [~] **1.4** `joinSource` / `showHeartfeltWords` / `openMic` 已接；`micCountDown` 待补齐 UI 开关联动
- [x] **1.5** `loadExt()` 应用 `JoinChannelExtendRsp.heartLinkInfo`
- [x] **1.6** `HeartLinkApi`：对齐 Joyride 主路径 `/heart_link/*`
- [x] **1.7** `HeartLinkMsgHandler`：成功/解锁/抱麦/看卡/新用户/小房间
- [x] **1.8** 公屏：`INVITE_VIEW_HEART_LINK_CARD` → `RoomBarrageHeartBody`（点击打开神秘卡）
- [x] **1.9** 公屏：`HONEST_OPINION` → `_common` + `ChatStyle.QA` 真心话气泡
- [ ] **1.10** 切图 / PAG：`assets/images/room/heart_link/` + 牵手成功 `link_success.pag`（或项目等价动效）
- [x] **1.11** Hearties 列表缓存：`GET /heart_link/getHeartiesIdList`

---

## 2. 全局邀请弹窗（App 级，最高优先级，不可漏）

> Joyride：`message_notifier` 收 `EaseCmdPush` → `GlobalNotice.showNotice`（任意页面顶部浮层）。  
> Chimo 现状：**无 GlobalNotice 等价层**；`ImCustomEvents` **未**注册 `heart_link_invite*`；Cmd Push 分支 **未**处理 `HEART_LINK_INVITE` / `HEART_LINK_INVITE_GS` / `HEARTIES_LOGIN`。

### 2.1 基础设施

- [x] **2.1.1** App 根级浮层 `AppGlobalNotice`
- [x] **2.1.2** IM Cmd Push：`ImCmdPushHandler` + `onCmdMessagesReceived`
- [x] **2.1.3** 过期：`HeartLinkInfo.expired_time` 校验
- [ ] **2.1.4** 已在目标 Heart Link 房 / 已有 Heartie 等抑制策略（待联调）

### 2.2 用户侧邀请弹窗（增长 / 匹配强制邀请）

- [x] **2.2.1** 任意界面顶部弹出
- [x] **2.2.2** 标题：`We found your perfect match`
- [x] **2.2.3** 嘉宾头像/神秘人占位
- [x] **2.2.4** 文案：`Start a chat now and meet your match`
- [x] **2.2.5** `Chat now` → `joinSource = HEART_LINK_INVITE`
- [x] **2.2.6** 倒计时约 3s 自动进
- [~] **2.2.7** 进房自动上麦依赖服务端 `position/autoMic`；闭麦提示气泡待补
- [ ] **2.2.8** 埋点

### 2.3 嘉宾侧邀请弹窗（Host 邀 GS）

- [x] **2.3.1–2.3.6** 顶部弹窗 + Join/Decline + invite/result
- [ ] **2.3.7** 嘉宾已在三人房不弹窗（抑制策略）

### 2.4 Heartie 上线浮条

- [x] **2.4.1–2.4.2** 浮条 + Start Chat
- [ ] **2.4.3** 客户端频率节流

### 2.5 IM 聊天邀请卡片

- [x] **2.5.1–2.5.4** event + 气泡 + 过期 + GS 同意/拒绝
- [ ] **2.5.5** 弹窗抑制与卡片展示分离细化

---

## 3. 房间主界面（模板 UI）

- [x] **3.1** 顶栏复用通用房
- [x] **3.2** 三麦布局：Host 左外 + GS/Boss 心形台（对齐设计图 / joyride `HtRoomMain`）
- [x] **3.3** GS 粉描边 / Boss 蓝描边；Boss 麦上倒计时
- [x] **3.4** 神秘卡 Banner 扫光解锁（`banner_*` 素材 + Host 邀请查看 / Boss 打开卡）
- [x] **3.5** 「HeartLink」牵手按钮（心尖位置）
- [x] **3.6** Boss 引导 tips（`click_tips.webp` + `needShowTips`）
- [x] **3.7** 真心话「# Today's topic」卡片（刷新 / 折叠 / 双选项）
- [x] **3.8** 观众条：头像横滑 + Host Control / N viewers + 红点
- [x] **3.9** Host：「Heartie room」侧边入口 → 私房选人
- [~] **3.10** 底栏复用通用；HT 精简待调
- [x] **3.11** 牵手成功全屏层：`link_success.pag` + 双头像兜底
- [x] **3.12** 查看神秘卡顶部通知条（滑入 + 自动消失）

---

## 4. Host Control / 房间管理

### 4.1 Outlookers（进房气泡）

- [x] **4.1.1** Host 可见入口；进房用户气泡 + 序号
- [x] **4.1.2** 点开 → 个人主页浮层，气泡消失

### 4.2 Host Control 面板

- [x] **4.2.1–4.2.2 / 4.2.5–4.2.7** queryRoomUser + Guests/Audience + inviteGsJoin + 空麦入口（设计图暗色弹层）
- [x] **4.2.3–4.2.4** Dismiss / Turn off mic / Bring to Mic + Mic Reminder 确认；Invited 态；Time in room；Current On Mic 空态

### 4.3 嘉宾池

- [x] **4.3.1** Expand my guest pool：嵌在 Host Control 内（返回 / 搜索 / 勾选 / Save）
- [x] **4.3.2** 引导文案与底部绿色 Save

### 4.4 分享邀请用户进房

- [ ] **4.4.1** Host 分享界面：已在 HT 房则 Invite 置灰 + toast
- [ ] **4.4.2** 不在房：发 IM 邀请（一次一条）；弹窗抑制规则见 §2.1.4

---

## 5. 麦位与 RTC 行为

- [x] **5.1** Host 抱麦 / 下麦 / 踢人
- [x] **5.2** Boss 上麦后 `openMic==1` → 自动开麦
- [~] **5.3** Boss 麦上倒计时角标已接；开关 / 完整样式待补
- [x] **5.4** `GRANT_UP_TO_MIC` 开麦提示弹窗（对齐 oumi `showMicOnDialog`）
- [x] **5.5** `NEW_USER_JOIN_ROOM` 进房弹窗（对齐 oumi `showNewUserDialog`）
- [ ] **5.6** 邀请进房退房确认特殊处理

---

## 6. Heartie 牵手（送礼绑定）

- [x] **6.1–6.3** 指定礼物确认弹窗 + sendGift + SUCCESS 全屏层 + 刷新 Hearties
- [x] **6.4** 公屏 Heartie 标签（`RoomSenderTags.heartie` + Hearties 列表）
- [ ] **6.5** 礼物面板 Heartie 文案变体

---

## 7. 神秘资料卡（房内 + 独立页）

### 7.1 房内

- [x] **7.1.1** Host：`inviteViewCard` + Banner「Invite to view Reveal Card」
- [x] **7.1.2–7.1.3** Boss Banner「Spark or Skip」+ 解锁弹层（余额不足跳充值）
- [x] **7.1.4** Reveal Card 编辑页：Video/Photo/Voice/Info + Preview/Upload

### 7.2 / 7.3

- [x] More Features「Reveal Card」入口 + 预览页；主页 Hearties 已接

---

## 8. 真心话 Heartfelt Words

- [x] **8.1–8.2** 拉题 / 选题
- [x] **8.3** 公屏 QA 样式（`RoomBarrageQaBody`）

---

## 9. Heartie 小房间

- [x] **9.1–9.3** 选 2 人 + createPrivateRoom + JOIN_PRIVATE_ROOM 跳转
- [~] **9.4** 引导文案已有基础版

---

## 10. Message / 关系展示（房外）

- [x] **10.1** Message：My Heartie 横滑（点头像进聊 + 未读气泡）
- [x] **10.2** 私聊页：Heartie 标签（顶栏）
- [x] **10.3** 个人主页：My Hearties 横滑 / 对方页 Heartie 双头像

---

## 11. 验收清单（完整复刻 Definition of Done）

- [ ] **A1** 不在房间（例如在首页 / 私聊）收到 `HEART_LINK_INVITE` → **顶部弹窗**出现，倒计时可自动进房
- [ ] **A2** 不在房间收到 `HEART_LINK_INVITE_GS` → 顶部弹窗，同意上报并进房，拒绝上报
- [ ] **A3** IM 会话内可见邀请卡片，过期不可进
- [ ] **A4** Host 进 HT 房可见三麦 + Host Control，可邀 GS / 抱麦 / 踢
- [ ] **A5** Boss 送礼牵手成功有全屏动画 + Hearties 标签
- [ ] **A6** 真心话可选、公屏可见
- [ ] **A7** Spark or Skip / 公屏神秘卡 / 解锁链路打通
- [ ] **A8** Heartie room 可选人跳转
- [ ] **A9** Heartie 上线浮条可去私聊
- [ ] **A10** HT 房不可滑切房；通用抱麦关闭

---

## 附录 A. HeartLinkApi 路径

| API | 用途 |
|-----|------|
| `GET /heart_link/getHeartiesIdList` | Hearties ID |
| `POST /heart_link/invite/result` | GS 邀进房结果 |
| `GET /heart_link/queryRoomUser` | Host 管理 |
| `GET /heart_link/listGsPool` / `POST /heart_link/saveGsPool` | 嘉宾池 |
| `GET /user/search?type=GS` | 搜 GS |
| `POST /heart_link/inviteGsJoin` | 邀 GS |
| `POST /heart_link/createPrivateRoom` | 小房间 |
| `POST /heart_link/inviteViewCard` | 公屏神秘卡 |
| `GET /heart_link/view/heartLinkCard` | Boss 点 Banner 上报 |
| `GET /heart_link/query/heartfeltWords` / `POST /heart_link/heartfelt/choose` | 真心话 |
| `POST /heart_link/unlock` | 解锁卡 |
| `GET /heart_link/getHearties` | 个人页关系 |
| 资料卡 `/submit` `/queryInfo` `/queryApply` `/hasUnlock` `/hasCardInfo` | Secret Card |
| 牵手送礼 | 现有 `giveGift` + `itemId` |

---

## 附录 B. 消息对照

| 通道 | 类型 | 客户端动作 |
|------|------|------------|
| Cmd Push | `HEART_LINK_INVITE` | **全局**用户邀请弹窗 |
| Cmd Push | `HEART_LINK_INVITE_GS` | **全局**嘉宾邀请弹窗 |
| Cmd Push | `HEARTIES_LOGIN` | **全局**上线浮条 → 私聊 |
| IM Custom | `heart_link_invite` / `heart_link_invite_gs` | 聊天气泡进房 |
| Room Cmd | `HEART_LINK_SUCCESS` 等 | 见 §1.7 |
| Room Chat | `INVITE_VIEW_HEART_LINK_CARD` / `HONEST_OPINION` | 公屏 |

---

## 附录 C. 当前已有代码（Chimo）

| 路径 | 状态 |
|------|------|
| `AppGlobalNotice` + `HeartLinkInviteNotice` | 全局顶部邀请/上线 |
| `ImCmdPushHandler` + IM `heart_link_invite*` | Cmd Push + 聊天气泡 |
| `HeartLinkApi` / `ChimoApis.heartLink` | HTTP |
| `HeartLinkRoomPlay` + Logic + MsgHandler + MicArea | 三麦模板 |
| Host Control / Send Gift / Overlay | 主路径可用 |
| 礼物文案变体 / 分享邀请抑制 / HT 切房限制 | **未完** |

---

## 附录 D. 建议落地顺序（仍属「一次完整复刻」内的实现序）

1. **§2 全局浮层 + Cmd Push + IM 卡片**（先保证「不在房也能收到邀请」）
2. §1 进房命中 + 三麦模板壳
3. §4 Host Control + 邀 GS 闭环（验证 §2.3）
4. §6 牵手 + §5 Boss 自动开麦/计时
5. §7 神秘卡 + §8 真心话 + §9 小房间
6. §10 Message / 主页 Heartie
7. §11 验收全打勾

---

**维护说明**：实现某项后把 `[ ]` 改为 `[x]`（或 `[~]`）；全局邀请相关未完成前，**不得**将本房型标为完成。
