# Azure Monitor Alerts (VM)

This file documents the exact alert rules configured in the Azure Portal for this project. Subscription: Azure for Students (no Action Group used).

---

## CPU High (Percentage CPU)

**Scope:** vm-app  
**Signal:** Percentage CPU  
**Logic:** Average > **85%**  
**Period:** 5 minutes  
**Evaluation frequency:** 1 minute  
**Severity:** 2 (Warning)  
**Actions:** None (portal notifications only)

**Portal Path:**  
VM → Monitoring → Alerts → + Create → Alert rule →  
Condition → *Percentage CPU* → Operator *Greater than* → Threshold *85* → Aggregation *Average* → Period *5 minutes* → Done →  
Details → Name: `CPU-High-Alert` → Severity *2* → Create.

**Why:** Indicates saturation. Use to trigger scale/right-size decisions and performance investigation.

---

## Disk I/O High (Read/Write Ops)

**Scope:** vm-app  
**Signal:** Disk Read Operations/Sec (or Disk Write Operations/Sec)  
**Logic:** Average > **300 ops/s**  
**Period:** 5 minutes  
**Evaluation frequency:** 1 minute  
**Severity:** 2 (Warning)  
**Actions:** None (portal notifications only)

**Portal Path:**  
VM → Monitoring → Alerts → + Create → Alert rule →  
Condition → *Disk Read Operations/Sec* (or *Disk Write Operations/Sec*) → Operator *Greater than* → Threshold *300* → Aggregation *Average* → Period *5 minutes* → Done →  
Details → Name: `Disk-IO-High-Alert` → Severity *2* → Create.

**Why:** Sustained high I/O suggests storage bottlenecks; consider Premium SSD v2, caching, or workload tuning.

---

## (Optional) Memory Low – VM Insights (KQL)

Requires AMA + VM Insights. Example logic: **Available memory < 20% for 10m**.

**KQL (reference only):**
```kql
InsightsMetrics
| where Namespace == "Memory" and Name == "AvailableMB"
| summarize avg(Val) by bin(TimeGenerated, 10m), Computer, _ResourceId
| join kind=inner (
  InsightsMetrics
  | where Namespace == "Memory" and Name == "TotalVisibleMemoryMB"
  | summarize avg(Val) by bin(TimeGenerated, 10m), Computer, _ResourceId
) on Computer, _ResourceId, TimeGenerated
| extend pctFree = todouble(avg_Val) / todouble(avg_Val1) * 100.0
| where pctFree < 20
```

**Portal Path:**  
Monitor → Alerts → + Create → Log (Saved Query) → paste KQL → Time window 10m → Frequency 5m → Details → Create.

**Why:** Low free memory precedes swap/kill events; early warning for right-sizing and leak detection.
