# 全局上下文 Schema 模板

## 说明

全局上下文是产品的"项目PRD"，确保所有Agent共享标准数据。不是提示词，而是被提示词引用的共享数据结构。

**推导方法**：从每个Agent的输入提取读取变量 → 从输出提取写入变量 → 找交集（多Agent引用）→ 分类整理

**管理机制（CRUD）**：增（初始化空Schema）、查（Agent按需读取）、改（任务完成后更新）、删（版本回退时清除）

## Schema 结构

```yaml
# 1. 项目元数据
project_meta:
  project_id: "{唯一识别码}"
  version: "{v1.0, v1.1}"
  status: "{draft / in_progress / completed}"
  technical_spec:
    # {如aspect_ratio, target_duration, fps, language}

# 2. 核心业务字段
core_fields:
  # {如script_summary, emotional_tone, visual_style_tags, scene_count}

# 3. 资产字典
assets:
  characters: []  # char_id, name, description, main_image_uri, concept_sheet_uri
  scenes: []      # scene_id, description, asset_uri, prompt_text

# 4. 流程资产流水线
pipeline:
  steps: []  # step_id, description, asset_uri, duration, status, related_assets

# 5. 审批日志
approval_log: []  # step_id, action, user_feedback, timestamp
```

## 字段引用关系图

| 字段 | Agent A (读/写) | Agent B (读/写) | Agent C (读/写) |
|------|----------------|----------------|----------------|
| project_meta | 写 | 读 | 读 |
| core_fields | - | 写 | 读 |
| assets | - | 写(描述) | 写(URI) |

## 注意事项
1. **变量的作用**：全局统一管理，避免同一信息在不同Agent中不一致
2. **URI而非实体**：存储资产的链接/路径，而非资产本身
3. **版本控制**：用户修改后版本号递增，支持回滚
4. **与RAG的区别**：这是结构化数据，存数据库用键值对读写；RAG适合非结构化数据（文档/PDF），用语义检索
