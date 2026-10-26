---
name: svwb-account-diagnosis
description: 诊断短视频账号。读 workbench/data 里的账号快照、趋势与作品表现，产出 1 条优先问题和 3 条带证据的信号，写回 account.json 的 diagnosis 与 dashboard.json 的 KPI。用户说「分析账号」「诊断一下」「为什么数据掉了」时使用。
whenToUse: 用户要求分析/诊断账号，或复盘某段时间表现时。
---

# 账号诊断

## 何时用

- 「分析一下我的账号」「这周为什么掉了」「诊断一下」「复盘上周」
- 用户刚补完作品数据，想看看有没有新结论

## 先读什么（缺一不可）

工作区根目录下的：

| 文件 | 只取这些字段 |
| --- | --- |
| `workbench/data/profile.json` | track / audience / forbidden —— 判断「哪些结论不能下」 |
| `workbench/data/account.json` | metrics、trend（7 / 30）、structure、peers |
| `workbench/data/dashboard.json` | 现有 kpis 与 todos（要在此基础上改，不是重写） |

如果 `account.json` 的 trend 少于 5 个数据点，或某段时间缺数据：**先下「数据不足」的结论，不要硬推**。

## 怎么做

1. **对齐口径**：先确认每个指标的时间范围和定义（单条作品当日中位数 / 区间均值），写进输出的 `updatedAt` 同一条里。
2. **找异常**：把最近的数与账号自身基线比（不是跟别人比）。至少看三个维度：开场留存、完播、转粉。
3. **找断点**：如果某天之后连续 N 条指标下滑，去内容里找共同点（开场方式、时长、选题），而不是归因到"平台限流"。
4. **给一个优先问题**：只给一个。同时给三个信号是列表，给一个结论才是判断。
5. **写回**：
   - `account.json` → `diagnosis.verdict {title, text}` 与 `diagnosis.signals[]`（3 条）
   - `dashboard.json` → `kpis[]`（4 个）与 `todos[]`（1–3 条，今天能做完的）
   - 两个文件的 `updatedAt` 都更新为当前时间

## 输出 schema

```json
"diagnosis": {
  "verdict": { "title": "优先解决：……", "text": "一句话说明 + 建议动作" },
  "signals": [
    {
      "title": "钩子退步",
      "level": "高",            // 高 | 机会 | 影响结论
      "tone": "svwb-r",         // svwb-r 红 | svwb-g 绿 | svwb-a 橙
      "text": "陈述 + 数值对比",
      "evidence": "v-1016 / v-1018 等 5 条"
    }
  ]
}
```

`todos[]` 每条：

```json
{ "title": "今天做什么", "why": "为什么（引用哪条信号）", "tag": "来源：选题 T-118", "tone": "svwb-g", "cost": "预计 90 分钟" }
```

## 禁止

- **不许编造作品数据或留存数字**。没有就写「缺数据」，并把补数据列进 todos。
- 不许把「涨了/跌了」当成结论，必须给到可执行动作。
- 不许改动 `profile.json`（定位是事实层，只能由用户改）。
- 不许一次给五条以上信号——那是没判断。
- 结论里不出现「算法」「限流」这类无法验证的归因。

## 完成后告诉用户

一段话：最重要的一个信号、今天最值得做的一件事、还缺什么数据。不要复述整张表。
