# Executive Decision Brief: Wazuh vs Elastic Security SIEM

**Date:** December 2, 2025
**Subject:** Strategic Security Platform Decision
**Decision Required:** Keep Wazuh or Replace with Elastic Security?

---

## TL;DR - Quick Decision Guide

**Question:** Should we replace Wazuh with Elastic Security SIEM?

**The Choice:**
- **Path A (Wazuh)**: $0 cost, 3-4 weeks, purpose-built security
- **Path B (Elastic Security)**: Unknown license cost (MUST get quote), 6+ months, unified platform with EDR/XDR

**Simple Decision Framework:**

| If... | Then choose... |
|-------|----------------|
| Need free solution OR tight budget | **Path A: Wazuh + Elastic** |
| Have budget for licensing AND need EDR/XDR/cloud security | **Path B: Elastic Security** (get quote first!) |
| Uncertain OR want to minimize risk | **Hybrid: Pilot both** |

**Key Point:** Path A is **free**. Path B costs whatever Elastic Security licensing costs. That's the **only** cost difference.

---

## The Decision

### Path A: Keep Wazuh + Integrate with Elastic Stack

**Cost:** $0 (free, open-source)
**Timeline:** 3-4 weeks (15-20 person-days)
**Risk:** Low-Medium

**What you get:**
- ✅ Purpose-built security monitoring (FIM, vulnerability detection, compliance)
- ✅ Zero licensing costs forever
- ✅ Leverages existing Elasticsearch infrastructure
- ✅ Fast deployment, low risk
- ⚠️ Two platforms to maintain
- ⚠️ No advanced EDR/malware prevention
- ⚠️ Limited cloud-native security features

**Best for:** Budget-conscious, on-prem heavy, need fast solution

---

### Path B: Replace with Elastic Security SIEM

**Cost:** **Unknown** - Elastic Security license cost only (MUST GET QUOTE)
**Timeline:** 6+ months (50-80 person-days)
**Risk:** Very High

**What you get:**
- ✅ Unified security + observability platform
- ✅ Advanced EDR (malware/ransomware prevention)
- ✅ XDR capabilities (cross-platform threat correlation)
- ✅ Cloud-native security (CSPM for AWS/Azure/GCP)
- ✅ Better ML/AI-powered detection
- ⚠️ **Expensive** licensing ($50k-$500k+/year - **NEED QUOTE**)
- ⚠️ **Long migration** (6+ months, high complexity)
- ⚠️ **Loses some Wazuh features** (native FIM, vuln scanning, SCA)

**Best for:** Cloud-heavy, need EDR/XDR, budget approved, strategic platform consolidation

---

## Cost Comparison (3-Year TCO)

**Methodology:** Only external/hard costs counted (licensing, vendor services). Internal labor and infrastructure excluded (already budgeted).

| Component | Path A (Wazuh) | Path B (Elastic Security) |
|-----------|----------------|---------------------------|
| **Licensing** | **$0** (free forever) | **$??,???-$???,???/year** ⚠️ **MUST GET QUOTE** |
| **Infrastructure** | **$0** (use existing vSphere VMs & Elasticsearch) | **$0** (use existing Elasticsearch cluster) |
| **External Consulting** | **$0** (internal team does work) | **$0** (unless Elastic professional services needed) |
| **TOTAL (Year 1)** | **$0** | **= Elastic Security license cost** |
| **TOTAL (3-Year)** | **$0** | **= Elastic Security license × 3 years** |

### The ONLY Real Cost: Elastic Security Licensing

**What affects the price:**
- Number of endpoints/agents
- Data volume ingested per day
- Feature tier required (you need **LDAP support** → likely **Platinum or Enterprise**)
- Deployment model (self-managed vs Elastic Cloud)

**Industry Benchmark Estimates (unverified, GET OFFICIAL QUOTE):**
- **Small** (< 100 endpoints): ~$10k-$30k/year
- **Medium** (100-500 endpoints): ~$30k-$100k/year
- **Large** (500-1000 endpoints): ~$100k-$200k/year
- **Enterprise** (1000+ endpoints): ~$200k-$500k+/year

**With LDAP integration:** Requires **Platinum tier minimum** (Gold doesn't include LDAP/AD integration)

**Bottom Line:** Path B costs whatever Elastic quotes. Path A is free. That's the entire cost difference.

---

## Feature Comparison

| Capability | Wazuh + Elastic | Elastic Security |
|------------|-----------------|------------------|
| **File Integrity Monitoring** | ✅ Native | ⚠️ Requires setup |
| **Vulnerability Scanning** | ✅ Built-in | ⚠️ Cloud only + 3rd-party |
| **Compliance (PCI-DSS, HIPAA)** | ✅ Out-of-box | ⚠️ Manual |
| **EDR/Malware Prevention** | ❌ Detection only | ✅ Full EDR |
| **XDR (Cross-platform)** | ❌ No | ✅ Yes |
| **ML/AI Detection** | ⚠️ Limited | ✅ Advanced |
| **Cloud Security (CSPM)** | ❌ No | ✅ Yes |
| **Platform Unification** | ⚠️ Separate tools | ✅ Single pane |

---

## Decision Criteria Scorecard

**Complete this scorecard** to guide your decision:

### Questions to Answer

1. **Budget:** Can we afford $50k-$500k/year in licensing costs?
   - YES → Path B is viable
   - NO → Path A only option

2. **Timeline:** Do we need a solution in 1 month or can we wait 6+ months?
   - 1 month → Path A
   - 6+ months → Path B or Hybrid

3. **Infrastructure:** Are we primarily on-prem or cloud-heavy?
   - On-prem/traditional → Path A
   - Cloud-heavy (AWS/Azure/GCP) → Path B

4. **Security Needs:** Do we NEED advanced EDR with malware prevention?
   - Detection is enough → Path A
   - Need prevention → Path B

5. **Compliance:** Do we need turnkey PCI-DSS/HIPAA reports?
   - Yes, turnkey → Path A
   - Can build custom → Path B

6. **Risk Tolerance:** Can we handle a 6-month complex migration?
   - Low risk tolerance → Path A
   - High risk tolerance → Path B

**Scoring:**
- If **4+ answers** favor Path A → Choose Path A
- If **4+ answers** favor Path B → Choose Path B (get pricing first!)
- If **split** → Consider Hybrid Pilot

---

## Recommendations

### Option 1: Path A (Wazuh + Elastic) - **Recommended for Most**

**Choose if:**
- Budget < $50k/year
- Need solution deployed quickly (3-4 weeks)
- Primarily on-prem or traditional infrastructure
- Want to avoid vendor lock-in
- Current Wazuh capabilities meet needs

**Next steps:**
1. Approve project (15-20 person-days)
2. Fork Wazuh module, integrate with existing Elasticsearch
3. Deploy in 3-4 weeks
4. Start saving immediately vs licensing costs

---

### Option 2: Path B (Elastic Security) - **For Strategic Platform Investment**

**Choose if:**
- Budget approved for $50k-$500k+/year
- Heavy cloud workloads (AWS, Azure, GCP)
- NEED advanced EDR/malware prevention
- NEED XDR capabilities
- Strategic decision to consolidate platforms
- Can commit 6+ months to migration

**Next steps:**
1. **GET PRICING QUOTE from Elastic** (critical!)
2. Request POC/trial license
3. Assess feature parity for FIM/vuln scanning/compliance
4. Plan 6-month migration project

---

### Option 3: Hybrid Pilot - **Lowest Risk**

**Best approach if uncertain:**

1. **Month 1:** Deploy Path A (Wazuh + Elastic) for immediate needs
2. **Month 1:** Request Elastic Security trial license
3. **Month 2-6:** Run both in parallel, collect real data
4. **Month 6:** Make final decision based on:
   - Actual costs
   - Feature comparison
   - Team satisfaction
   - Operational complexity

**Benefits:**
- ✅ Minimize risk (have working solution while evaluating)
- ✅ Real-world data for decision
- ✅ Can pivot based on experience
- ⚠️ Additional effort to pilot both

---

## Critical Next Actions

### This Week (Required Before Decision)

- [ ] **Contact Elastic Sales** - Get formal pricing quote
  - Specify: # endpoints, data volume/day, Platinum vs Enterprise tier
  - Ask: POC license, multi-year discounts, professional services

- [ ] **Complete Scorecard** - Answer the 6 questions above

- [ ] **Review Current Wazuh** - What features are actively used?
  - FIM, vulnerability detection, SCA, compliance reports
  - Identify gaps: What doesn't Wazuh provide that we need?

- [ ] **Assess Team** - Can team absorb 6-month migration project?

- [ ] **Validate Compliance** - Do auditors accept Elastic Security?

### After Pricing Received

- [ ] **If cost < $50k/year** → Consider Path B or Hybrid
- [ ] **If cost > $100k/year** → Likely Path A unless strategic value clear
- [ ] **If uncertain** → Do Hybrid Pilot (3-6 months)

---

## Our Professional Recommendation

**Bottom line:** Get Elastic Security pricing, complete the scorecard, then decide.

**Most likely outcome:** Path A (Wazuh + Elastic) makes more sense because:
- 10-30x cheaper over 3 years
- Much faster (weeks vs months)
- Much lower risk
- Provides 90% of needed capabilities
- You already have Elastic Stack infrastructure

**However**, Path B is right if:
- You have heavy cloud workloads
- Budget is approved and strategic alignment exists
- You specifically need EDR/XDR capabilities
- Long-term platform consolidation is a priority

**Safest approach:** Hybrid Pilot - deploy Wazuh now, evaluate Elastic Security in parallel for 3-6 months, make informed decision with real data.

---

**Document Version:** 1.0
**Prepared By:** Vasko Mihaylov
**Review Date:** December 2, 2025
