# HTML报告模板规范 · Report Template Spec

## 整体结构

报告是一个单文件HTML，包含所有CSS和JS。无任何外部依赖。

```html
<!DOCTYPE html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>产品灵感洞察报告 · [主题名]</title>
  <style>/* 全部样式内联 */</style>
</head>
<body>
  <!-- 七个模块依次排列 -->
  <script>/* 交互逻辑 */</script>
</body>
</html>
```

---

## 设计规范

### 配色（暗色主题）

```css
:root {
  --bg-primary: #0f1117;
  --bg-secondary: #1a1d27;
  --bg-card: #222633;
  --bg-hover: #2a2f3e;
  --text-primary: #e8eaed;
  --text-secondary: #9aa0b2;
  --text-muted: #6b7280;
  --accent-red: #ef4444;      /* 高优先级 */
  --accent-yellow: #f59e0b;   /* 中优先级 */
  --accent-green: #22c55e;    /* 低优先级 */
  --accent-blue: #3b82f6;     /* 链接、强调 */
  --accent-purple: #8b5cf6;   /* Reddit标记 */
  --accent-cyan: #06b6d4;     /* X标记 */
  --accent-pink: #ec4899;     /* 小红书标记 */
  --border: #2e3345;
  --border-light: #3a4055;
}
```

### 字体

```css
body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "PingFang SC",
    "Hiragino Sans GB", "Microsoft YaHei", sans-serif;
  font-size: 15px;
  line-height: 1.7;
  color: var(--text-primary);
  background: var(--bg-primary);
}
```

### 平台标记徽章

每条素材旁显示来源平台徽章：

```css
.badge-reddit { background: var(--accent-purple); }
.badge-x { background: var(--accent-cyan); }
.badge-xiaohongshu { background: var(--accent-pink); }
```

### 响应式断点

```css
/* 移动端 */
@media (max-width: 768px) {
  .matrix-container { overflow-x: auto; }
  .card-grid { grid-template-columns: 1fr; }
}
```

---

## 七个模块的具体实现

### 模块1：报告头部

```html
<header class="report-header">
  <h1>产品灵感洞察报告</h1>
  <p class="subtitle">[挖掘主题]</p>
  <div class="meta">
    <span>📅 [日期]</span>
    <span>📊 共[N]条素材</span>
  </div>
  <div class="platform-stats">
    <!-- 三个平台的素材数量条形图，用CSS flex实现 -->
    <div class="stat-bar">
      <span class="bar reddit" style="width: [X]%"></span>
      <span class="label">Reddit [N]条</span>
    </div>
    <!-- 类似的X和小红书 -->
  </div>
</header>
```

### 模块2：执行摘要

简洁的3句话概括，用大字体突出显示。

```html
<section class="executive-summary">
  <h2>💡 核心发现</h2>
  <div class="summary-text">
    <p>[第一句：最重要的发现]</p>
    <p>[第二句：最大的产品机会]</p>
    <p>[第三句：最值得注意的风险或趋势]</p>
  </div>
</section>
```

### 模块3：需求优先级矩阵（散点图）

用CSS定位实现一个频率(X轴)×强度(Y轴)的散点图。每个痛点簇是一个圆点，大小代表涉及素材数量，颜色代表优先级等级。

```html
<section class="priority-matrix">
  <h2>📊 需求优先级矩阵</h2>
  <p class="section-desc">频率(横轴) × 强度(纵轴) = 优先级</p>
  <div class="matrix-chart">
    <!-- 网格背景 -->
    <div class="grid-bg">
      <div class="axis-label x-axis">频率 →</div>
      <div class="axis-label y-axis">强度 →</div>
      <!-- 四象限标签 -->
      <span class="quadrant-label top-right">🔴 立即行动</span>
      <span class="quadrant-label top-left">🟡 深度验证</span>
      <span class="quadrant-label bottom-right">🟡 持续观察</span>
      <span class="quadrant-label bottom-left">🟢 暂时搁置</span>
    </div>
    <!-- 数据点 -->
    <div class="dot priority-high"
         style="left: [X]%; bottom: [Y]%"
         data-tooltip="[簇名称] | 频率:[N] 强度:[N] | 素材:[N]条">
    </div>
    <!-- 更多数据点... -->
  </div>
</section>
```

散点图CSS实现要点：
- 整个chart用 `position: relative`，固定宽高比
- 每个dot用 `position: absolute`，left/bottom百分比定位
- dot大小用 `width/height` 或 `transform: scale()`，按素材数量缩放
- 悬停显示tooltip用CSS `:hover` + `::after` 伪元素

### 模块4：痛点簇详情

每个痛点簇一张卡片，卡片式网格布局。

```html
<section class="pain-clusters">
  <h2>🔍 痛点簇详情</h2>
  <div class="card-grid">
    <div class="cluster-card priority-high">
      <div class="card-header">
        <span class="priority-badge">🔴 高优先级</span>
        <span class="score">得分: 20</span>
      </div>
      <h3>[簇名称]</h3>
      <div class="card-meta">
        <span>📄 [N]条素材</span>
        <span class="platform-badges">
          <span class="badge-reddit">Reddit</span>
          <span class="badge-x">X</span>
          <!-- 跨平台验证标记 -->
        </span>
      </div>
      <p class="cluster-desc">[簇描述]</p>
      <blockquote class="user-quote">
        "[用户原话引用]"
        <cite>— 来源平台，[互动量]</cite>
      </blockquote>
    </div>
    <!-- 更多卡片... -->
  </div>
</section>
```

### 模块5：竞品盲区地图

一个矩阵表，行是竞品，列是痛点簇，单元格标记该竞品是否解决了该痛点。

```html
<section class="competitor-map">
  <h2>🗺️ 竞品盲区地图</h2>
  <p class="section-desc">✅ 已解决 | ⚠️ 部分解决 | ❌ 未解决（空白=无数据）</p>
  <div class="table-wrapper">
    <table>
      <thead>
        <tr>
          <th>竞品</th>
          <th>[痛点簇1]</th>
          <th>[痛点簇2]</th>
          <!-- ... -->
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>[竞品名]</td>
          <td>❌</td>
          <td>⚠️</td>
          <!-- ... -->
        </tr>
      </tbody>
    </table>
  </div>
</section>
```

### 模块6：TOP 3产品机会

三张突出显示的机会卡片。

```html
<section class="opportunities">
  <h2>🚀 TOP 3 产品机会</h2>
  <div class="opportunity-cards">
    <div class="opp-card">
      <div class="opp-rank">#1</div>
      <h3>[机会名称]</h3>
      <div class="opp-body">
        <div class="opp-section">
          <h4>💡 为什么值得做</h4>
          <p>[机会描述]</p>
        </div>
        <div class="opp-section">
          <h4>👤 目标用户</h4>
          <p>[用户画像]</p>
        </div>
        <div class="opp-section">
          <h4>🔓 竞品盲区</h4>
          <p>[现有方案为什么没做好]</p>
        </div>
        <div class="opp-section risk">
          <h4>⚠️ 风险提示</h4>
          <p>[可能的坑]</p>
        </div>
      </div>
    </div>
    <!-- 机会#2, #3 -->
  </div>
</section>
```

### 模块7：原始素材摘录

可折叠列表，按平台分组或按痛点簇分组。

```html
<section class="raw-materials">
  <h2>📋 原始素材摘录</h2>
  <p class="section-desc">共[N]条素材 · 点击展开查看详情</p>

  <div class="material-group">
    <button class="group-toggle" onclick="toggleGroup(this)">
      <span class="badge-reddit">Reddit</span> [N]条素材
      <span class="arrow">▶</span>
    </button>
    <div class="group-content collapsed">
      <div class="material-item">
        <div class="material-header">
          <span class="material-id">M001</span>
          <span class="material-tag tag-pain">痛点</span>
          <span class="material-emotion emotion-high">🔴 高</span>
        </div>
        <p class="material-summary">[内容摘要]</p>
        <blockquote class="material-quote">"[关键引用]"</blockquote>
        <div class="material-meta">
          <a href="[URL]" target="_blank">查看原帖 ↗</a>
          <span>[互动量]</span>
          <span>[发布时间]</span>
        </div>
      </div>
      <!-- 更多素材... -->
    </div>
  </div>
  <!-- X平台、小红书分组类似 -->
</section>
```

### 交互JS（最小化）

```javascript
function toggleGroup(btn) {
  const content = btn.nextElementSibling;
  const arrow = btn.querySelector('.arrow');
  content.classList.toggle('collapsed');
  arrow.textContent = content.classList.contains('collapsed') ? '▶' : '▼';
}

// 散点图tooltip（如果用CSS :hover实现不够，可用此JS增强）
document.querySelectorAll('.dot').forEach(dot => {
  dot.addEventListener('mouseenter', function(e) {
    // 显示tooltip
  });
});
```

---

## 实施提醒

生成报告时的关键原则：

1. **数据先行**：先把Phase 4的分析结果整理成JSON结构，再填入HTML模板
2. **不要偷懒省模块**：七个模块全部生成，即使某个模块数据较少
3. **散点图坐标计算**：频率和强度都是1-5分，映射到百分比时用 `(分数-0.5)/5 * 100` 保证点不贴边
4. **引用保留原文**：中文引用保留中文，英文引用保留英文，不做翻译
5. **链接可点击**：所有原始链接用 `target="_blank"` 打开
6. **文件命名**：`product-insight-report-[主题英文缩写]-[YYYYMMDD].html`
