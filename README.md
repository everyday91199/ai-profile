# 万老师的个人 AI 档案

> 一份放在 GitHub 上的「我自己」，让任何 AI、在任何电脑上，一上来就知道我是谁、我在做什么、该怎么跟我说话、我脑子是怎么转的。
>
> 仓库名：**`ai-profile`**（本人 2026-10-26 确认，不带中文）
> 最后更新：2026-10-26 · 建立者：小树 🌿
>
> ✅ 2026-10-26 本人已确认 8 项建档决策，细节见 `profile/decisions.md` 顶部。

---

## 一、这是什么

不是笔记 App，是**给 AI 装一个可迁移的长期记忆 + 一致的人格**。解决四件事：

1. **跨 AI** —— 同一份档案，Codex / Kimi / 豆包 / DeepSeek 都能读
2. **跨电脑** —— 唯一真相源在 GitHub，每台电脑只负责「拉一份 + 告诉 AI 去读」
3. **跨会话不丢** —— 把对话结论压缩成短条目，不用每次重讲
4. **人格一致** —— 靠一份显式的「人格说明书」，不靠某个平台的记忆功能

**核心**：真正有用的不是「把聊天记录存起来」，而是「**把聊天记录压缩成 AI 读得动的记忆条目**」。

---

## 二、怎么用：四种 AI，四种加载方式（可直接复制）

### 四路速查（复制即用）

- **Codex / Claude Code / Cursor**：先读 `AGENTS.md`，再读 `profile/` 全部 + `memory/` 最近一期，然后开始。
- **Kimi / 豆包 / DeepSeek**：让他读 `https://raw.githubusercontent.com/<你的用户名>/ai-profile/main/START-HERE.md`
- **复制粘贴保底（任何 AI 都行，最稳）**：打开 `START-HERE.md` → Ctrl+A 全选 → 复制 → 粘进对话框，说「这是我的档案，读完我们开始」。
- **手机端**：手机浏览器打开同一个链接，长按全选复制，粘进 AI App。
- **零依赖小白路径**：双击 `scripts\new-ai.cmd`，选 1。

### ① Codex / Claude Code / Cursor（能读本地文件）

```
读一下 profile/ 全部 + memory/ 最近一期，然后我们开始。
```

克隆后会自动读 `AGENTS.md`。想更省事，双击 `scripts\new-ai.cmd`。

### ② Kimi / 豆包 / DeepSeek 网页版或 APP（能联网、不能读本地）

**优选** —— 让 AI 直接读这个 URL（仓库须设为**公开**才能免登录读）：

```
https://raw.githubusercontent.com/<你的用户名>/ai-profile/main/START-HERE.md
```

然后说：`读完这个文件，我们开始。`

**保底** —— 国产 AI 联网能力参差不齐，常常要手动点确认。所以务必有这一步：
打开本地 `START-HERE.md` → 全选复制 → 粘贴进对话框 → 说 `这是我的档案，读完我们开始。`

### ③ 手机端

手机浏览器打开上面的 GitHub 链接，或 GitHub Pages 地址。复制粘贴同样有效。

### ④ 完全零依赖的小白路径

不装 git、不装任何软件：
在 github.com 网页上 New repository → 把本仓库的文件逐个上传（网页支持拖拽）→ 用上面的 raw 链接读。

---

## 三、仓库结构

| 路径 | 作用 |
|---|---|
| `README.md` | 本文件：给人看的门面 |
| `AGENTS.md` | 给 Codex / Claude Code / Cursor 等 coding agent 自动读 |
| **`START-HERE.md`** | ★ **跨 AI 通用入口**：单文件聚合版，粘贴给任何 AI 即可 |
| `profile/identity.md` | 我是谁：身份、处境、长期目标、关注方向 |
| `profile/persona.md` | 我希望 AI 用什么姿态跟我说话（老K + 小树 + 语感样本） |
| **`profile/thinking.md`** | ★★ **我怎么思考**：6 特征 / 七步回路 / 语言指纹 / 盲区 |
| `profile/growth.md` | ★ 个人成长线（**纵向、非项目**，L1 私有） |
| `profile/preferences.md` | 沟通偏好、输出格式、禁忌 |
| `profile/projects.md` | 事业项目：状态/卡点/下一步 |
| `profile/people.md` | 重要的人与关系（只记协作偏好，L1 私有） |
| `profile/decisions.md` | 已定的事（防止 AI 反复推翻） |
| `profile/sources.md` | 素材从哪来：九来源 + 18 主题簇 + 未挖清单 |
| `memory/` | 按月记忆日志 + 专题记忆（写入规范见 `memory/README.md`） |
| `skills/writing/` | 写作风格包 |
| `skills/operations/` | 4 个可跨 AI 复用的运营 SKILL.md + 卡片 schema + provenance 规范 |
| `sources/` | ★ 观点摘录（71 条带引用） |
| `scripts/` | `build-start-here.ps1` / `new-ai.cmd` |
| `transcripts/` | 原始聊天记录（**默认不入库**） |
| `assets/` | 图片等 |

---

## 四、怎么更新

1. 改完 `profile/` 或 `memory/` → **跑一次 `scripts\build-start-here.ps1`** 重新生成 `START-HERE.md`
2. 提交，commit message 按前缀约定（见 `memory/README.md` 第八节）：
   - `决策: <一句话>` · `档案: 更新身份` · `档案: 更新成长线` · `记忆: YYYY-MM` · `素材: <来源>` · `工具: <说明>`
3. 换电脑：在新电脑上克隆同一仓库即可
4. 换 AI：换加载方式，档案不用改
5. 删掉：GitHub 仓库 Settings → Delete this repository（**注意：提交历史里的东西删不掉，见下**）

### ⚠ git 历史即资产 —— 请务必遵守

这个仓库的价值**一半在文件、一半在提交历史**。提交历史就是「认知变迁史」。

- ✅ `decisions.md` 每次决策落地就单独提交
- ✅ `identity.md` / `growth.md` 每次更新单独提交，这样「他什么时候变成这样的」可回溯
- ❌ **不要 squash，不要 rebase 改写历史。** 历史一旦被改写，资产就没了
- ❌ 不要用大文件覆盖式提交

---

## 五、隐私分层（务必读完再往上传）

| 层 | 内容 | 放哪 |
|---|---|---|
| **L0 公开层** | ✅ **本人 2026-10-26 确认，仅以下四项**：① 在场感理论 ② 课程公开简介 ③ 写作风格 ④ 通用方法论。另加身份概述、persona、thinking 的方法论部分、项目公开简介 | ✅ 可放公开仓库 |
| **L1 私有层** | 详细日记、他人信息、**孩子相关**、财务/投资人材料、真实数据、**成长线细节**（`growth.md`、`people.md`、`topics/个人成长.md`） | ⚠ 私有仓库或**只留本地** |
| **绝不进仓库** | API Key、密码、身份证号、账号信息、`D:\行至少年AI\` 的营销/投资人/家长版原文、`.dsh\.credentials.yaml`、`D:\备份\deepseek-harness\` | ❌ 从第一天起就不能进 |

### 四句话（背下来）

1. **公开仓库的内容会被搜索引擎收录，且任何人都能看**——放之前自己过一遍。
2. `transcripts/` 原始聊天记录里有别人的话，默认**不要**公开。
3. **API Key 永远不进 GitHub**；程序要读就放本地环境变量或 `.env`，并把 `.env` 写进 `.gitignore`。
4. **提交历史删不掉东西**——一旦提交过就等于公开过，**包括 commit message**。

---

## 六、分层铁律（改文件时先看）

> **`projects.md` 里不许出现「反懒惰助手」「减肥」「戒抖音」「婚姻修复」。**
> 它们只能出现在 `growth.md`。
> 个人成长线不是待交付的产品——不许给它排优先级、不许给它编 KPI、不许把它塞进项目计划表。

---

## 七、实测状态

见交付说明中的「已实测 / 未实测」清单。**未实测的部分不要假定它能用。**
