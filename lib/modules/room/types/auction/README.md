# 拍卖房 `auction`

对照 Joyride（oumi）：`packages_local/m_chatroom/plugins/auction/`。本地无独立 `oumi_dev` 工程。

## 命中

- `channel.roomTypeObj.type == RoomType.AUCTION`
- 进房后 `RoomService.loadExt()` → `GET /rtc/join-channel-ext` 拉 `auctionInfo`

## 流程（流程图）

| 阶段 | Stage | 出价 | 倒计时/加时 | 主持按钮 |
| --- | --- | --- | --- | --- |
| 准备 | `PREPARATION` | 否 | — | 艺人麦有人 + 自己在主持麦 → **Start** |
| 表演 | `PERFORMANCE` | 是（Place Bid，艺人自己除外） | `endTime`；`+` 受 `extendCount` | **Next** → 拍卖 |
| 拍卖 | `AUCTION` | 是 | 同上 | **Next** → 结算 |
| 结算 | `SIGNING` | 否 | `endTime`（约 10s） | **End** → 准备；艺人下麦由服务端驱动 |

Socket：`AUCTION_ROOM_CHANGE` 刷新阶段；`ARTIST_AUCTION_RESULT` → 成交/流拍弹窗。

## 布局

| position | 角色 | 权限 |
| --- | --- | --- |
| 0 | 主持麦 | 仅房主 / 接待 |
| 1 | 表演麦 | 任意；默认排麦 |
| 2–4 | 观众/Boss | 任意；默认排麦 |

- Agent：表演麦右侧 Manager（有经纪人则展示）
- Top3：中 1 / 左 2 / 右 3；第 1 名皇冠（底座暂不做）
- Place Bid：表演～拍卖阶段；表演麦本人不可见

## 背景 / 装饰

- 顶部 PAG：`auction_bg.pag`；`.pag` 房间背景全屏循环
- 切图：`assets/images/room/auction/*`
- 空麦位：普通房间 `seat_empty` / `seat_boss`

## API

- `ChimoApis.auction`：`start` / `addTime` / `nextStage` / `bidInfo` / `bid`
- `ChimoApis.room`：`queueMic` / `cancelQueueMic` / `grantUpMic` / `joinChannelExt`
