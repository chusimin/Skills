# 搜索策略参考 · Search Strategy Reference

## 关键词矩阵

对于任何挖掘主题 `[TOPIC]`，按以下矩阵展开搜索关键词。将 `[TOPIC]` 替换为用户给的具体方向（如"AI writing tool"、"AI代码助手"等）。

### 角度一：痛点抱怨类

| 平台 | 搜索关键词模板 |
|------|--------------|
| Reddit | `site:reddit.com [TOPIC] frustrated OR hate OR terrible OR useless` |
| Reddit | `site:reddit.com [TOPIC] doesn't work OR broken OR waste of time` |
| X | `site:x.com [TOPIC] sucks OR disappointed OR regret` |
| X | `site:twitter.com [TOPIC] worst OR annoying OR can't believe` |
| 小红书 | `[中文TOPIC] 难用 吐槽 踩坑` |
| 小红书 | `[中文TOPIC] 不推荐 失望 白花钱` |

### 角度二：方案请求类

| 平台 | 搜索关键词模板 |
|------|--------------|
| Reddit | `site:reddit.com [TOPIC] looking for OR any recommendations OR best tool for` |
| Reddit | `site:reddit.com [TOPIC] how do you handle OR what do you use for` |
| X | `site:x.com looking for [TOPIC] alternative OR recommendation` |
| 小红书 | `[中文TOPIC] 求推荐 有没有好用的 哪个好` |

### 角度三：竞品吐槽类

| 平台 | 搜索关键词模板 |
|------|--------------|
| Reddit | `site:reddit.com [COMPETITOR] vs OR alternative to [COMPETITOR]` |
| Reddit | `site:reddit.com switching from [COMPETITOR] OR left [COMPETITOR]` |
| X | `site:x.com [COMPETITOR] complaint OR switching from [COMPETITOR]` |
| 小红书 | `[中文竞品名] 缺点 不如 对比` |

### 角度四：付费意愿/需求强度类

| 平台 | 搜索关键词模板 |
|------|--------------|
| Reddit | `site:reddit.com [TOPIC] would pay for OR shut up and take my money OR worth paying` |
| Reddit | `site:reddit.com [TOPIC] someone please build OR why doesn't exist` |
| X | `site:x.com [TOPIC] need this OR someone build OR would pay` |
| 小红书 | `[中文TOPIC] 愿意花钱 值得付费 刚需` |

---

## 高价值Subreddit目录

根据挖掘主题，优先搜索以下相关subreddit：

### AI产品/工具类
- r/artificial, r/MachineLearning, r/ChatGPT, r/ClaudeAI
- r/SaaS, r/startups, r/Entrepreneur
- r/ProductManagement, r/userexperience
- r/webdev, r/programming（技术用户视角）
- r/NoCode, r/SideProject（独立开发者视角）

### 写作/内容类
- r/writing, r/copywriting, r/ContentCreation
- r/marketing, r/digital_marketing

### 生产力工具类
- r/productivity, r/Notion, r/ObsidianMD
- r/selfhosted, r/degoogle

根据具体话题灵活增减。

---

## 搜索执行清单

执行搜索时按此清单推进：

### 第一轮：广撒网（6-9次web_search）
- [ ] Reddit 痛点搜索 × 2次（不同关键词组合）
- [ ] Reddit 方案请求搜索 × 1次
- [ ] X 痛点搜索 × 1-2次
- [ ] X 方案请求搜索 × 1次
- [ ] 小红书 痛点搜索 × 1-2次

完成后做一次中间盘点：
> 第一轮发现的竞品：[列出]
> 第一轮高频词：[列出]
> 需要深挖的subreddit：[列出]

### 第二轮：聚焦（3-6次web_search）
- [ ] 针对第一轮发现的竞品名定向搜索
- [ ] 针对高频subreddit定向搜索
- [ ] 补充付费意愿类搜索

### 第三轮：深挖（2-4次web_fetch）
- [ ] 对高互动Reddit帖子抓取完整评论区
- [ ] 对关键X长推文/线程抓取完整内容

---

## 小红书搜索的特殊处理

小红书内容在web search中的可获取性不稳定。如果搜索结果质量差：

1. 尝试换一种搜索方式：`小红书 [关键词]` 而非 `site:xiaohongshu.com [关键词]`
2. 如果仍然效果差，直接告知用户并建议手动投喂：
   > "小红书的自动搜索效果有限，建议你在小红书里搜'[推荐关键词]'，把看到的相关帖子内容粘贴过来，我来帮你结构化分析。"
3. 给出推荐搜索关键词，帮助用户在小红书App内高效搜索
