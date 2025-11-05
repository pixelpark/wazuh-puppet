# Strategic Migration Plan: Wazuh OpenSearch → Elastic Stack

**Document Version:** 1.0
**Date:** October 30, 2025
**Status:** Awaiting Decision

---

## Executive Summary

**Current Situation:**
- Wazuh Puppet module uses OpenSearch forks (Wazuh Indexer, Wazuh Dashboard)
- Filebeat 7.10.2 hardcoded in module (outdated but NOT EOL - confusion clarified below)
- Your infrastructure already manages Elastic Stack via Puppet
- Need unified data platform strategy

**Key Finding - Filebeat EOL Clarification:**
⚠️ **Filebeat is NOT going EOL in 2 months.** The endoflife.date shows:
- Version 8.19: Supported until **July 15, 2027** (2.5+ years)
- Version 9.x: Currently actively supported
- The concern should be about the **outdated 7.10.2 version** in the module, not Filebeat itself

**Recommended Strategy:** **Hybrid Fork Approach** (Option 3 below)

---

## Table of Contents

1. [Option Analysis Matrix](#option-analysis-matrix)
2. [Option 1: Use Upstream Module](#option-1-use-upstream-module-not-recommended)
3. [Option 2: Build Custom Module from Scratch](#option-2-build-custom-module-from-scratch-not-recommended)
4. [Option 3: Hybrid Fork Approach](#option-3-hybrid-fork-approach--recommended) ⭐
5. [Option 4: Wrapper/Profile Module](#option-4-wrapperprofile-module)
6. [Final Recommendation](#final-recommendation)
7. [Implementation Timeline](#implementation-timeline)
8. [Key Decision Points](#key-decision-points)
9. [Additional Resources](#additional-resources)

---

## Option Analysis Matrix

| Criteria | Option 1: Use Upstream | Option 2: Fork from Scratch | Option 3: Hybrid Fork | Option 4: Wrapper Module |
|----------|------------------------|------------------------------|----------------------|--------------------------|
| **Development Effort** | ⭐ Minimal | ⭐⭐⭐⭐⭐ Very High | ⭐⭐⭐ Medium | ⭐⭐ Low-Medium |
| **Maintenance Burden** | ⭐⭐⭐⭐⭐ High (conflicts) | ⭐⭐⭐ Medium | ⭐⭐⭐ Medium | ⭐⭐⭐⭐ Medium-High |
| **Upstream Compatibility** | ⭐⭐⭐⭐⭐ Full | ⭐ None | ⭐⭐⭐ Partial | ⭐⭐⭐⭐ Good |
| **Customization Flexibility** | ⭐ Limited | ⭐⭐⭐⭐⭐ Full | ⭐⭐⭐⭐ High | ⭐⭐⭐ Medium |
| **Time to Production** | ⭐⭐⭐⭐⭐ Fast (weeks) | ⭐ Slow (6+ months) | ⭐⭐⭐ Medium (2-3 months) | ⭐⭐⭐⭐ Fast (1-2 months) |
| **Risk Level** | ⭐⭐⭐⭐ High | ⭐⭐ Low | ⭐⭐⭐ Medium | ⭐⭐⭐ Medium |
| **Elastic Integration** | ⭐⭐ Requires Logstash | ⭐⭐⭐⭐⭐ Native | ⭐⭐⭐⭐ Native | ⭐⭐⭐⭐ Native |

---

## Option 1: Use Upstream Module (Not Recommended)

### Description
Continue using `wazuh/wazuh` module with Logstash integration to Elastic Stack.

### Architecture
```
┌─────────────┐      ┌──────────────┐      ┌───────────────┐      ┌──────────────┐
│ Wazuh Agent │─────▶│Wazuh Manager │─────▶│Wazuh Indexer  │─────▶│  Logstash    │
└─────────────┘      └──────────────┘      │ (OpenSearch)  │      │              │
                             │              └───────────────┘      └──────┬───────┘
                             │                                             │
                             │              ┌───────────────┐      ┌──────▼───────┐
                             │              │Wazuh Dashboard│      │Elasticsearch │
                             │              │ (OpenSearch)  │      │              │
                             │              └───────────────┘      └──────┬───────┘
                             │                                             │
                             │                                     ┌───────▼────────┐
                             └─────────────────────────────────────▶│    Kibana      │
                                           (Alternative via Logstash)└────────────────┘
```

### Implementation
```puppet
# Keep existing classes
class { 'wazuh::manager': }
class { 'wazuh::indexer': }
class { 'wazuh::dashboard': }
class { 'wazuh::agent': }

# Add Logstash integration (managed by YOUR Elastic module)
class { 'elastic::logstash':
  pipelines => {
    'wazuh-opensearch' => {
      'pipeline.id' => 'wazuh-opensearch',
      'path.config' => '/etc/logstash/conf.d/wazuh-opensearch.conf',
    }
  }
}
```

### Pros
✅ Minimal code changes
✅ Benefit from upstream updates
✅ Proven architecture (documented by Wazuh)
✅ Can leverage existing Wazuh community support

### Cons
❌ **Dual data storage** (OpenSearch + Elasticsearch) = wasted resources
❌ **Complexity** of maintaining two stacks
❌ **Latency** from Logstash intermediary layer
❌ **Doesn't solve the version problem** (still using Filebeat 7.10.2 → OpenSearch)
❌ **Operational overhead** of managing Logstash pipelines
❌ **Data duplication** across platforms

### Risk Assessment
🔴 **High Risk**: Architectural complexity, resource waste, version conflicts

---

## Option 2: Build Custom Module from Scratch (Not Recommended)

### Description
Create entirely new `yourorg-wazuh` module with native Elastic integration.

### Architecture
```
┌─────────────┐      ┌──────────────┐      ┌──────────────┐
│ Wazuh Agent │─────▶│Wazuh Manager │─────▶│  Filebeat    │
└─────────────┘      └──────────────┘      │  (Latest)    │
                                            └──────┬───────┘
                                                   │
                                           ┌───────▼────────┐
                                           │Elasticsearch   │
                                           │  (Your Stack)  │
                                           └───────┬────────┘
                                                   │
                                           ┌───────▼────────┐
                                           │    Kibana      │
                                           │  (Your Stack)  │
                                           └────────────────┘
```

### Implementation Scope
- **Re-implement 25+ manifests** from scratch
- **Create all templates** for Wazuh configurations
- **Build test infrastructure** (RSpec + Kitchen)
- **Handle all OS variations** (Debian, RedHat, Windows)
- **Certificate management** system
- **Agent registration** logic
- **API integration** for manager
- **All Wazuh features**: syscheck, rootcheck, SCA, wodles, active response, etc.

### Development Estimate
```
Component                        Time Estimate
────────────────────────────────────────────
Agent class & templates          2-3 weeks
Manager class & templates        3-4 weeks
Filebeat integration             1-2 weeks
Certificate management           1 week
Repository management            1 week
Testing infrastructure           2-3 weeks
Windows support                  2-3 weeks
Documentation                    1 week
────────────────────────────────────────────
TOTAL:                          13-20 weeks (3-5 months)
```

### Pros
✅ **Complete control** over all features
✅ **Native Elastic integration** from day one
✅ **No upstream conflicts** or version constraints
✅ **Optimized for your infrastructure**
✅ **Clean architecture** tailored to your needs

### Cons
❌ **Massive development effort** (3-5 months minimum)
❌ **Complete maintenance burden** on your team
❌ **No upstream updates** - must track Wazuh changes manually
❌ **Duplicate effort** - reinventing well-tested code
❌ **Missing features** initially (gradual parity)
❌ **Testing complexity** across all platforms
❌ **Team expertise required** in both Wazuh and Puppet

### Risk Assessment
🔴 **Very High Risk**: Timeline, resource commitment, opportunity cost

---

## Option 3: Hybrid Fork Approach ⭐ **RECOMMENDED**

### Description
Fork `wazuh/wazuh` module → Remove OpenSearch components → Add Elastic integration → Maintain selective upstream sync.

### Architecture
```
┌─────────────┐      ┌──────────────┐      ┌──────────────┐
│ Wazuh Agent │─────▶│Wazuh Manager │─────▶│  Filebeat    │
└─────────────┘      └──────────────┘      │  (Latest)    │
                                            └──────┬───────┘
                                                   │
                                           ┌───────▼────────┐
                                           │Elasticsearch   │
                                           │  (Unified)     │
                                           └───────┬────────┘
                                                   │
                                           ┌───────▼────────┐
                                           │    Kibana      │
                                           │  (Unified)     │
                                           └────────────────┘
```

### Implementation Plan

#### Phase 1: Fork & Cleanup (Week 1-2)
```bash
# Fork repository
git clone https://github.com/wazuh/wazuh-puppet yourorg-wazuh-elastic
cd yourorg-wazuh-elastic
git remote add upstream https://github.com/wazuh/wazuh-puppet

# Create feature branch
git checkout -b feature/elastic-integration
```

**Remove OpenSearch Components:**
```
manifests/indexer.pp          → DELETE
manifests/dashboard.pp        → DELETE
manifests/securityadmin.pp    → DELETE
templates/wazuh_indexer_yml.erb      → DELETE
templates/wazuh_dashboard_yml.erb    → DELETE
templates/opensearch_dashboards_yml.erb → DELETE
```

**Keep Core Components:**
```
manifests/agent.pp            → KEEP (works with any backend)
manifests/manager.pp          → KEEP (works with any backend)
manifests/repo.pp             → KEEP
manifests/params_*.pp         → KEEP
manifests/cert_manager.pp     → KEEP
templates/wazuh_manager.conf.erb → KEEP
templates/wazuh_agent.conf.erb   → KEEP
templates/fragments/*            → KEEP (all agent/manager configs)
```

#### Phase 2: Modernize Filebeat (Week 2-3)

**Replace `manifests/filebeat_oss.pp`:**
```puppet
# NEW: manifests/filebeat.pp
class wazuh::filebeat (
  $filebeat_version = '9.2.0',  # Latest supported version
  $elasticsearch_hosts = ['https://localhost:9200'],
  $elasticsearch_username = 'elastic',
  $elasticsearch_password = undef,  # Use secrets management
  $elasticsearch_ssl_ca = '/etc/filebeat/certs/ca.pem',
  $elasticsearch_ssl_cert = '/etc/filebeat/certs/client.pem',
  $elasticsearch_ssl_key = '/etc/filebeat/certs/client-key.pem',
  $wazuh_extensions_version = 'v4.13.1',
  $wazuh_filebeat_module = 'wazuh-filebeat-0.4.tar.gz',
  $archives_enabled = false,
) {

  # Use your existing Elastic Puppet module for package management
  # or install directly
  package { 'filebeat':
    ensure => $filebeat_version,
  }

  # Wazuh module installation
  archive { "/tmp/${wazuh_filebeat_module}":
    ensure       => present,
    source       => "https://packages.wazuh.com/4.x/filebeat/${wazuh_filebeat_module}",
    extract      => true,
    extract_path => '/usr/share/filebeat/module',
    creates      => '/usr/share/filebeat/module/wazuh',
    cleanup      => true,
    require      => Package['filebeat'],
  }

  # Configuration
  file { '/etc/filebeat/filebeat.yml':
    content => template('wazuh/filebeat_elastic.yml.erb'),
    owner   => 'root',
    group   => 'root',
    mode    => '0640',
    require => Package['filebeat'],
    notify  => Service['filebeat'],
  }

  # Download Wazuh template for Elasticsearch
  file { '/etc/filebeat/wazuh-template.json':
    ensure => present,
    source => "https://raw.githubusercontent.com/wazuh/wazuh/${wazuh_extensions_version}/extensions/elasticsearch/7.x/wazuh-template.json",
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }

  service { 'filebeat':
    ensure  => running,
    enable  => true,
    require => Package['filebeat'],
  }
}
```

**Create `templates/filebeat_elastic.yml.erb`:**
```yaml
# Wazuh - Filebeat configuration for Elasticsearch
filebeat.modules:
  - module: wazuh
    alerts:
      enabled: true
    archives:
      enabled: <%= @archives_enabled %>

# Template configuration
setup.template.json.enabled: true
setup.template.json.path: "/etc/filebeat/wazuh-template.json"
setup.template.json.name: "wazuh"
setup.template.overwrite: true
setup.ilm.enabled: false

# Elasticsearch output
output.elasticsearch:
  hosts: <%= @elasticsearch_hosts.to_json %>
  username: <%= @elasticsearch_username %>
  password: <%= @elasticsearch_password %>
  protocol: https
  ssl:
    certificate_authorities:
      - <%= @elasticsearch_ssl_ca %>
    certificate: <%= @elasticsearch_ssl_cert %>
    key: <%= @elasticsearch_ssl_key %>
    verification_mode: full

# Increase field limit for Wazuh (default 1000 → 10000)
setup.template.settings:
  index.mapping.total_fields.limit: 10000

logging:
  level: info
  to_files: true
  files:
    path: /var/log/filebeat
    name: filebeat
    keepfiles: 7
    permissions: 0644

processors:
  - add_host_metadata: ~
  - add_cloud_metadata: ~
```

#### Phase 3: Update Metadata & Dependencies (Week 3)

**Edit `metadata.json`:**
```json
{
  "name": "yourorg-wazuh",
  "version": "4.13.1-elastic1",
  "author": "YourOrg (based on Wazuh Inc.)",
  "summary": "Wazuh Puppet module with native Elasticsearch integration",
  "license": "Apache-2.0",
  "source": "https://github.com/yourorg/wazuh-puppet-elastic",
  "dependencies": [
    {"name": "puppetlabs/stdlib", "version_requirement": ">= 4.13.0 < 10.0.0"},
    {"name": "puppetlabs/concat", "version_requirement": ">= 1.0.0 < 10.0.0"},
    {"name": "puppetlabs/apt", "version_requirement": ">= 2.0.0 < 12.0.0"},
    {"name": "puppet/archive", "version_requirement": ">= 0.4.8 < 9.0.0"},
    {"name": "puppet/selinux", "version_requirement": ">= 0.8.0 < 6.0.0"},
    {"name": "puppetlabs/firewall", "version_requirement": ">= 1.7.0 < 9.0.0"}
  ],
  "requirements": [
    {"name": "puppet", "version_requirement": ">= 6.0.0 < 8.0.0"}
  ]
}
```

#### Phase 4: Testing (Week 4-5)

**Update Kitchen tests:**
```yaml
# kitchen/kitchen.yml
---
suites:
  - name: manager-elastic
    manifest: |
      class { 'wazuh::repo': }
      class { 'wazuh::manager': }
      class { 'wazuh::filebeat':
        elasticsearch_hosts => ['https://elasticsearch.local:9200'],
      }

  - name: agent
    manifest: |
      class { 'wazuh::repo': }
      class { 'wazuh::agent':
        wazuh_register_endpoint => 'manager.local',
      }
```

**Update RSpec tests:**
```ruby
# spec/classes/filebeat_spec.rb
require 'spec_helper'

describe 'wazuh::filebeat' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile.with_all_deps }
      it { is_expected.to contain_package('filebeat').with_ensure('9.2.0') }
      it { is_expected.to contain_service('filebeat').with_ensure('running') }

      context 'with custom elasticsearch hosts' do
        let(:params) do
          {
            elasticsearch_hosts: ['https://es01:9200', 'https://es02:9200']
          }
        end

        it { is_expected.to contain_file('/etc/filebeat/filebeat.yml')
          .with_content(/es01:9200/)
        }
      end
    end
  end
end
```

#### Phase 5: Documentation (Week 5-6)

**Update README.md:**
```markdown
# Wazuh Puppet Module - Elasticsearch Edition

This is a fork of the official Wazuh Puppet module, modified for native
Elasticsearch integration instead of OpenSearch/Wazuh Indexer.

## Differences from Upstream

- ❌ Removed: `wazuh::indexer`, `wazuh::dashboard`, `wazuh::securityadmin`
- ✅ Added: Modern `wazuh::filebeat` with Elasticsearch 8.x/9.x support
- ✅ Updated: Filebeat 7.10.2 → 9.2.0
- ✅ Improved: Native Elastic Stack integration

## Quick Start

### Manager with Filebeat to Elasticsearch

```puppet
class { 'wazuh::manager': }

class { 'wazuh::filebeat':
  filebeat_version       => '9.2.0',
  elasticsearch_hosts    => ['https://es-cluster.internal:9200'],
  elasticsearch_username => 'wazuh_user',
  elasticsearch_password => lookup('wazuh::elasticsearch_password'),
  elasticsearch_ssl_ca   => '/etc/pki/elastic/ca.pem',
}
```

### Agent Only

```puppet
class { 'wazuh::agent':
  wazuh_register_endpoint => 'wazuh-manager.internal',
  agent_name              => $facts['hostname'],
}
```

## Upstream Synchronization

This fork maintains compatibility with upstream for:
- Agent functionality
- Manager functionality
- Certificate management
- Repository management

We periodically merge upstream changes for these components.
```

#### Phase 6: Upstream Sync Strategy (Ongoing)

**Create sync script:**
```bash
#!/bin/bash
# tools/sync-upstream.sh

set -e

echo "Fetching upstream changes..."
git fetch upstream

echo "Current version: $(jq -r '.version' metadata.json)"
echo "Latest upstream tag: $(git describe --tags upstream/master)"

read -p "Merge upstream changes? (y/N): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    # Merge only specific paths
    git checkout feature/elastic-integration
    git merge upstream/master --no-commit \
        --allow-unrelated-histories \
        -- \
        manifests/agent.pp \
        manifests/manager.pp \
        manifests/params_*.pp \
        manifests/repo.pp \
        templates/wazuh_agent.conf.erb \
        templates/wazuh_manager.conf.erb \
        templates/fragments/

    echo "Review changes and commit if appropriate"
fi
```

### Maintenance Strategy

**Quarterly Sync Process:**
1. Monitor https://github.com/wazuh/wazuh-puppet/releases
2. Run `tools/sync-upstream.sh`
3. Review agent/manager changes
4. Test with your Elastic Stack
5. Merge if compatible

**Version Naming Convention:**
- Upstream: `4.13.1`
- Your fork: `4.13.1-elastic1`, `4.13.1-elastic2`, etc.
- Major Wazuh update: `4.14.0-elastic1`

### Pros
✅ **Reuse 80%** of tested upstream code
✅ **Clean Elastic integration** without dual storage
✅ **Moderate effort** (~6-8 weeks)
✅ **Selective upstream sync** for agent/manager improvements
✅ **Full control** over indexing backend
✅ **Modern Filebeat** (9.x) support
✅ **Reduced complexity** vs maintaining full fork

### Cons
⚠️ **Ongoing merge effort** (quarterly, ~1-2 days)
⚠️ **Manual tracking** of upstream changes
⚠️ **Testing burden** on your team
⚠️ **Potential conflicts** in shared components

### Risk Assessment
🟡 **Medium Risk**: Balanced approach with manageable maintenance

---

## Option 4: Wrapper/Profile Module

### Description
Keep upstream module intact, create `yourorg-wazuh` profile module that wraps it.

### Architecture
```
yourorg-wazuh (profile module)
    ├── Uses wazuh/wazuh for agent & manager
    ├── Uses yourorg-elastic for Filebeat
    └── Skips indexer/dashboard classes
```

### Implementation

**Create profile module:**
```puppet
# modules/yourorg_wazuh/manifests/manager.pp
class yourorg_wazuh::manager (
  $elasticsearch_hosts = lookup('wazuh::elasticsearch_hosts'),
  $elasticsearch_user = lookup('wazuh::elasticsearch_user'),
  $elasticsearch_password = lookup('wazuh::elasticsearch_password'),
  Hash $manager_config = {},
) {

  # Use upstream for manager
  class { 'wazuh::manager':
    * => $manager_config,
  }

  # Use your Elastic module for Filebeat
  class { 'yourorg_elastic::filebeat':
    ensure  => 'latest',
    version => '9.2.0',
    modules => {
      'wazuh' => {
        'alerts' => {
          'enabled' => true,
        },
        'archives' => {
          'enabled' => false,
        },
      },
    },
    outputs => {
      'elasticsearch' => {
        'hosts'    => $elasticsearch_hosts,
        'username' => $elasticsearch_user,
        'password' => $elasticsearch_password,
      },
    },
  }

  # Ensure wazuh module is installed
  exec { 'install-wazuh-filebeat-module':
    command => '/usr/bin/curl -L https://packages.wazuh.com/4.x/filebeat/wazuh-filebeat-0.4.tar.gz | tar -xz -C /usr/share/filebeat/module',
    creates => '/usr/share/filebeat/module/wazuh',
    require => Class['yourorg_elastic::filebeat'],
  }
}
```

**Usage:**
```puppet
# Instead of:
class { 'wazuh::manager': }
class { 'wazuh::filebeat_oss': }

# Use:
class { 'yourorg_wazuh::manager': }
```

### Pros
✅ **Minimal code duplication**
✅ **Full upstream compatibility** for agent/manager
✅ **Leverage existing Elastic module**
✅ **Fast implementation** (2-4 weeks)
✅ **Easy upstream updates**

### Cons
❌ **Dependency on upstream** module structure
❌ **Limited customization** of wrapped components
❌ **Complexity** of managing two modules
❌ **Potential class conflicts** between modules
❌ **Harder to troubleshoot** multi-layer abstractions

### Risk Assessment
🟡 **Medium Risk**: Depends on wrapper quality and module compatibility

---

## Final Recommendation

### **Adopt Option 3: Hybrid Fork Approach**

**Why:**

1. **Best Balance**: Reuses proven code while enabling full Elastic integration
2. **Reasonable Effort**: 6-8 weeks vs 6+ months (Option 2) or ongoing complexity (Option 1)
3. **Control**: You own the indexing backend completely
4. **Maintainability**: Selective upstream sync keeps agent/manager current
5. **Simplicity**: Single cohesive module vs wrapper complexity (Option 4)

**Success Criteria:**
- ✅ Eliminate OpenSearch dependencies
- ✅ Upgrade Filebeat to 9.x
- ✅ Integrate with your existing Elastic Stack
- ✅ Maintain agent/manager feature parity
- ✅ Establish sustainable maintenance process

---

## Implementation Timeline

### Month 1: Foundation
- **Week 1-2**: Fork, remove OpenSearch, initial testing
- **Week 3-4**: Implement new Filebeat class with Elastic integration

### Month 2: Testing & Hardening
- **Week 5-6**: Update tests, documentation, CI/CD
- **Week 7**: Internal testing on dev environment
- **Week 8**: Staging environment validation

### Month 3: Rollout
- **Week 9-10**: Production pilot (10% of fleet)
- **Week 11-12**: Full production rollout

### Ongoing: Quarterly maintenance (1-2 days/quarter)

---

## Key Decision Points

Before proceeding, validate:

1. **Does your Elastic module support Filebeat 9.x?**
2. **What's your certificate management strategy?** (Can reuse `wazuh::cert_manager`)
3. **Secrets management for Elasticsearch credentials?** (Hiera eyaml? Vault?)
4. **Who will maintain the fork?** (Assign 1-2 team members)
5. **Rollback strategy if issues arise?** (Keep upstream as fallback initially)

---

## Additional Resources

- **Wazuh Elastic Integration Docs**: https://documentation.wazuh.com/current/integrations-guide/elastic-stack/index.html
- **Filebeat Wazuh Module**: https://packages.wazuh.com/4.x/filebeat/
- **Elasticsearch Template Requirements**: https://github.com/wazuh/wazuh/tree/master/extensions/elasticsearch
- **Puppet Module Best Practices**: https://www.puppet.com/docs/puppet/latest/modules_fundamentals.html
- **Filebeat EOL Information**: https://endoflife.date/beats

---

## Notes

This document was created based on analysis of:
- Current Wazuh Puppet module v4.14.0
- Official Wazuh documentation for Elastic Stack integration
- Filebeat support lifecycle and compatibility
- Infrastructure requirements for unified Elastic Stack

**Next Actions:**
1. Review this document with DevOps team
2. Answer the 5 key decision points
3. Make final option selection
4. Assign team members for implementation
5. Create project timeline and milestones
