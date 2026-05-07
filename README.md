# SQL Server 資料庫開發實務（Database Development Practice）

本專案為 SQL Server 從基礎到進階的完整練習，
內容涵蓋資料庫設計、查詢語法與金融資料分析。

透過本專案，我練習了從資料建模到進階分析的完整流程。

---

# 🧠 Overall Design Concept（整體架構）

本專案依 4 個 SQL 檔案分層設計：

- 📁 01_database_practice.sql → 基礎資料庫建置（DDL / DML）
- 📁 02_sql_query_analysis.sql → 查詢與資料分析
- 📁 03_sql_advanced_cte_window.sql → 進階分析（CTE / Window Function）
- 📁 04_finance_database_analysis.sql → 金融資料庫分析

---

# 📌 範例內容包含：

1. 資料表建立與資料插入（DDL / DML）
2. 基礎查詢語法（SELECT / WHERE / ORDER BY）
3. 聚合函數與群組查詢（COUNT / AVG / SUM）
4. 多表關聯查詢（JOIN）
5. 子查詢（Subquery）
6. 視圖（VIEW）建立與更新
7. CTE（Common Table Expression）
8. Window Function（排名 / 累積 / 移動平均）
9. 遞迴 CTE（階層結構分析）

---

# 📁 01_database_practice.sql（基礎資料庫建置）

## 📊 Tables

- 部門
- 員工
- 產品
- 銷售

## 📌 功能

- CREATE DATABASE / CREATE TABLE
- PRIMARY KEY / FOREIGN KEY
- INSERT 資料
- 基礎 SELECT / WHERE 查詢

---

# 📁 02_sql_query_analysis.sql（查詢與分析）

## 📊 Tables

- 部門
- 員工
- 產品
- 銷售

## 📌 功能

- SELECT / WHERE / ORDER BY
- LIKE / IN / BETWEEN
- COUNT / AVG / SUM
- GROUP BY / HAVING
- JOIN（INNER / LEFT / RIGHT / FULL）
- 子查詢（Subquery）
- VIEW（視圖）

---

# 📁 03_sql_advanced_cte_window.sql（進階分析）

## 📊 Tables

- employees（員工階層資料）

## 📌 功能

- CTE（WITH）
- Recursive CTE（組織階層）
- ROW_NUMBER（排名）
- SUM OVER（累積分析）
- AVG OVER（移動平均）
- Window Function 分析

---

# 📁 04_finance_database_analysis.sql（金融資料庫分析）

## 🗄️ Database Design（金融模型）

### 📊 Tables

#### stock_info（股票基本資料）
- stock_id（PK）
- stock_name

#### stock_price（股票價格）
- id（PK）
- stock_id（FK）
- price

#### market_data（市場資料）
- day（交易日）
- price（市場價格）
- return（報酬率）

---

## 🔗 Relationships

- stock_info (1) ─── (N) stock_price  
- stock_price.stock_id → stock_info.stock_id  

---

## 📌 功能

- 金融資料庫建置（CREATE DATABASE / TABLE）
- JOIN 股票與價格資料
- AVG / SUM / STDEV 統計分析
- VIEW 報表設計
- CTE 分析
- Window Function（Moving Average / Running Total）

---

# 📁 資料夾說明（截圖）

| 資料夾名稱 | 說明 |
|------------|------|
| `01_database_practice_screenshots` | 基礎建置與查詢結果 |
| `02_sql_query_analysis_screenshots` | JOIN / GROUP BY / VIEW 結果 |
| `03_sql_advanced_cte_window_screenshots` | CTE / Window Function 結果 |
| `04_finance_database_analysis_screenshots` | 金融分析與統計結果 |

---

# 📌 備註

本專案所有資料皆為模擬資料，  
用於 SQL Server 學習與資料分析能力展示，  
不涉及任何真實商業資料。