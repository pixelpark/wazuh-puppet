# Change Log
All notable changes to this project will be documented in this file.

## Generated with

```
cd $(mktemp -d)
bundle config set --local path vendor/bundle
bundle init
echo "group :changelog do
  gem 'async', '~> 1.29'
  gem 'faraday', '~> 1.0', require: false
  gem 'github_changelog_generator'
end" >> Gemfile
bundle install
bundle exec github_changelog_generator --output '' --user wazuh --project wazuh-puppet --token $TOKEN --since-tag 'v4.3.0' --include-tags-regex '^(v4.2.5|v4\.3\..*)$'
```

## [Unreleased](https://github.com/wazuh/wazuh-puppet/tree/HEAD)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.3.7...HEAD)

**Closed issues:**

- Wazuh Filebeat module not extracted when archive is present in tmp [\#544](https://github.com/wazuh/wazuh-puppet/issues/544)
- Missing template for Wazuh indexer configuration [\#527](https://github.com/wazuh/wazuh-puppet/issues/527)
- Update the `api.yaml` configuration file with the new `upload_configuration` section and `limits` option [\#520](https://github.com/wazuh/wazuh-puppet/issues/520)

## [v4.3.7](https://github.com/wazuh/wazuh-puppet/tree/v4.3.7) (2022-08-17)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.3.6...v4.3.7)

**Closed issues:**

- Filebeat parameter to enable archives [\#548](https://github.com/wazuh/wazuh-puppet/issues/548)
- JVM memory option doesn't modify the JVM options [\#546](https://github.com/wazuh/wazuh-puppet/issues/546)
- Change permission for filebeat.yml [\#540](https://github.com/wazuh/wazuh-puppet/issues/540)
- Wazuh keeps trying to install new certificates [\#535](https://github.com/wazuh/wazuh-puppet/issues/535)
- Wazuh manager parameters for logall and logall\_json options [\#532](https://github.com/wazuh/wazuh-puppet/issues/532)
- Wazuh repo management missing in Wazuh dashboard [\#528](https://github.com/wazuh/wazuh-puppet/issues/528)
- Review and fix for the exec resource declarations in wazuh::indexer, wazuh::dashboard and wazuh::filebeat\_oss [\#512](https://github.com/wazuh/wazuh-puppet/issues/512)

## [v4.3.6](https://github.com/wazuh/wazuh-puppet/tree/v4.3.6) (2022-07-19)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.3.5...v4.3.6)

**Merged pull requests:**

- Bump 4.3 to 4.3.6 [\#524](https://github.com/wazuh/wazuh-puppet/pull/524) ([vcerenu](https://github.com/vcerenu))
- Add fix to avoid GLIBC crash [\#521](https://github.com/wazuh/wazuh-puppet/pull/521) ([fcaffieri](https://github.com/fcaffieri))
- Disable filebeat metrics [\#517](https://github.com/wazuh/wazuh-puppet/pull/517) ([fcaffieri](https://github.com/fcaffieri))

## [v4.3.5](https://github.com/wazuh/wazuh-puppet/tree/v4.3.5) (2022-06-24)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.3.4...v4.3.5)

**Merged pull requests:**

- Bump 4.3 to 4.3.5 [\#514](https://github.com/wazuh/wazuh-puppet/pull/514) ([vcerenu](https://github.com/vcerenu))
- Support rhel8 \(agent only\) [\#509](https://github.com/wazuh/wazuh-puppet/pull/509) ([kibahop](https://github.com/kibahop))
- Use provided value for wazuh\_enrollment\_auth\_pass [\#494](https://github.com/wazuh/wazuh-puppet/pull/494) ([genebean](https://github.com/genebean))

## [v4.3.4](https://github.com/wazuh/wazuh-puppet/tree/v4.3.4) (2022-06-08)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.3.3...v4.3.4)

## [v4.3.3](https://github.com/wazuh/wazuh-puppet/tree/v4.3.3) (2022-06-02)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.3.2...v4.3.3)

**Merged pull requests:**

- Bump 4.3.3 into 4.3 [\#504](https://github.com/wazuh/wazuh-puppet/pull/504) ([vcerenu](https://github.com/vcerenu))
- Bump 4.3.3 to 4.3 Branch [\#503](https://github.com/wazuh/wazuh-puppet/pull/503) ([vcerenu](https://github.com/vcerenu))

## [v4.3.2](https://github.com/wazuh/wazuh-puppet/tree/v4.3.2) (2022-05-30)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.3.1...v4.3.2)

**Merged pull requests:**

- Bump 4.3.2 to 4.3 Branch [\#500](https://github.com/wazuh/wazuh-puppet/pull/500) ([vcerenu](https://github.com/vcerenu))
- Update filebeat module version [\#499](https://github.com/wazuh/wazuh-puppet/pull/499) ([DFolchA](https://github.com/DFolchA))
- Use HTTPS for Windows Download [\#498](https://github.com/wazuh/wazuh-puppet/pull/498) ([pheleven](https://github.com/pheleven))

## [v4.3.1](https://github.com/wazuh/wazuh-puppet/tree/v4.3.1) (2022-05-16)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.3.0...v4.3.1)

**Closed issues:**

- Release v4.3.0 Puppet [\#434](https://github.com/wazuh/wazuh-puppet/issues/434)
- Pre-Release v4.3.0 Puppet [\#433](https://github.com/wazuh/wazuh-puppet/issues/433)

**Merged pull requests:**

- Wazuh Puppet 4.3.1 [\#492](https://github.com/wazuh/wazuh-puppet/pull/492) ([vcerenu](https://github.com/vcerenu))

## [v4.3.0](https://github.com/wazuh/wazuh-puppet/tree/v4.3.0) (2022-05-06)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.2.6...v4.3.0)

**Closed issues:**

- `config.yml` must be adapted to the new format [\#475](https://github.com/wazuh/wazuh-puppet/issues/475)
- Windows variable redefinition error [\#473](https://github.com/wazuh/wazuh-puppet/issues/473)
- After deploying the Wazuh agent for Windows it is not automatically started [\#470](https://github.com/wazuh/wazuh-puppet/issues/470)
- Some variables in the `params_agent.pp` cause errors when deploying a Wazuh agent for Windows [\#469](https://github.com/wazuh/wazuh-puppet/issues/469)
- The `ossec_service_provider` variable specified in the documentation are not working for the Wazuh manager and agent deployment [\#468](https://github.com/wazuh/wazuh-puppet/issues/468)
- Misc variables have no effect, have errors, and don't work as expected \(rootcheck, api, cis\_cat, osquery, syslog\) [\#467](https://github.com/wazuh/wazuh-puppet/issues/467)
- SCA variables have no effects and errors.  [\#466](https://github.com/wazuh/wazuh-puppet/issues/466)
- Vulnerability detector variables have no effects, have errors, and don't work as expected,  [\#465](https://github.com/wazuh/wazuh-puppet/issues/465)
- Syscheck variables with no effect, errors and dependencies not found for installation. [\#464](https://github.com/wazuh/wazuh-puppet/issues/464)
- The Wazuh puppet agent module can't be used on Ubuntu 20.10 distribution [\#460](https://github.com/wazuh/wazuh-puppet/issues/460)
- Some settings aren't working for Wazuh manager/agent class \(localfile, remote, email and enrollment sections\) [\#459](https://github.com/wazuh/wazuh-puppet/issues/459)
- The indexer/dashboard certs folder should have 500 permissions and certificates 400 [\#458](https://github.com/wazuh/wazuh-puppet/issues/458)
- Clean wazuh-puppet repository [\#457](https://github.com/wazuh/wazuh-puppet/issues/457)
- Release v4.2.6 Puppet [\#455](https://github.com/wazuh/wazuh-puppet/issues/455)
- Pre-Release v4.2.6 Puppet [\#454](https://github.com/wazuh/wazuh-puppet/issues/454)
- Update the `api.yaml` configuration file with the new `format` API configuration parameter [\#451](https://github.com/wazuh/wazuh-puppet/issues/451)
- AlmaLinux is not yet supported [\#442](https://github.com/wazuh/wazuh-puppet/issues/442)

**Merged pull requests:**

- Split package version for OS family [\#490](https://github.com/wazuh/wazuh-puppet/pull/490) ([vcerenu](https://github.com/vcerenu))
- VD providers added [\#487](https://github.com/wazuh/wazuh-puppet/pull/487) ([teddytpc1](https://github.com/teddytpc1))
- SCA policies tag fixed [\#486](https://github.com/wazuh/wazuh-puppet/pull/486) ([teddytpc1](https://github.com/teddytpc1))
- VD Redhat OS logic updated [\#485](https://github.com/wazuh/wazuh-puppet/pull/485) ([teddytpc1](https://github.com/teddytpc1))
- VD min\_full\_scan\_interval variable added [\#484](https://github.com/wazuh/wazuh-puppet/pull/484) ([teddytpc1](https://github.com/teddytpc1))
- Add support to Ubuntu Groovy Gorilla \(20.10\) [\#483](https://github.com/wazuh/wazuh-puppet/pull/483) ([teddytpc1](https://github.com/teddytpc1))
- Syscheck variables included in \_syscheck.erb [\#482](https://github.com/wazuh/wazuh-puppet/pull/482) ([teddytpc1](https://github.com/teddytpc1))
- Audit package name logic updated [\#481](https://github.com/wazuh/wazuh-puppet/pull/481) ([teddytpc1](https://github.com/teddytpc1))
- Added Alma Linux deploy support [\#480](https://github.com/wazuh/wazuh-puppet/pull/480) ([okynos](https://github.com/okynos))
- Queue\_size logic update [\#478](https://github.com/wazuh/wazuh-puppet/pull/478) ([teddytpc1](https://github.com/teddytpc1))
- sca\_amazon variables renamed [\#477](https://github.com/wazuh/wazuh-puppet/pull/477) ([teddytpc1](https://github.com/teddytpc1))
- Updated config.yml template [\#476](https://github.com/wazuh/wazuh-puppet/pull/476) ([c-bordon](https://github.com/c-bordon))
- Parameter correction [\#474](https://github.com/wazuh/wazuh-puppet/pull/474) ([vcerenu](https://github.com/vcerenu))
- SCA variables corrected. [\#471](https://github.com/wazuh/wazuh-puppet/pull/471) ([teddytpc1](https://github.com/teddytpc1))
- Remove Files From Elastic Stack and Opendistro Stack [\#462](https://github.com/wazuh/wazuh-puppet/pull/462) ([c-bordon](https://github.com/c-bordon))
- Changed name from indexerSecurityInitializer.sh to indexer-security-init.sh [\#453](https://github.com/wazuh/wazuh-puppet/pull/453) ([c-bordon](https://github.com/c-bordon))
- Adapt the Puppet deployment to use the new Wazuh indexer default ports [\#449](https://github.com/wazuh/wazuh-puppet/pull/449) ([vcerenu](https://github.com/vcerenu))
- Included manifests to deploy Indexer and Dashboard packages [\#444](https://github.com/wazuh/wazuh-puppet/pull/444) ([okynos](https://github.com/okynos))
- API changes applied [\#437](https://github.com/wazuh/wazuh-puppet/pull/437) ([teddytpc1](https://github.com/teddytpc1))
- Add log4j workaround [\#435](https://github.com/wazuh/wazuh-puppet/pull/435) ([vcerenu](https://github.com/vcerenu))
- Change ossecr user [\#432](https://github.com/wazuh/wazuh-puppet/pull/432) ([vcerenu](https://github.com/vcerenu))
- Change ossec group in manager and agent install [\#430](https://github.com/wazuh/wazuh-puppet/pull/430) ([vcerenu](https://github.com/vcerenu))
- Api configuratyion options update [\#428](https://github.com/wazuh/wazuh-puppet/pull/428) ([vcerenu](https://github.com/vcerenu))
- Update Auth Options [\#427](https://github.com/wazuh/wazuh-puppet/pull/427) ([vcerenu](https://github.com/vcerenu))
- Merge 4.2.5 into master  [\#426](https://github.com/wazuh/wazuh-puppet/pull/426) ([vcerenu](https://github.com/vcerenu))
- Removed user Administrator for windows deployments to Master [\#419](https://github.com/wazuh/wazuh-puppet/pull/419) ([c-bordon](https://github.com/c-bordon))
- Changed agent parameters definition [\#418](https://github.com/wazuh/wazuh-puppet/pull/418) ([okynos](https://github.com/okynos))
- Merge 4.2 into master [\#412](https://github.com/wazuh/wazuh-puppet/pull/412) ([vcerenu](https://github.com/vcerenu))
- Merge 4.2 in master [\#406](https://github.com/wazuh/wazuh-puppet/pull/406) ([vcerenu](https://github.com/vcerenu))
- Merge 4.2 in master [\#398](https://github.com/wazuh/wazuh-puppet/pull/398) ([vcerenu](https://github.com/vcerenu))
- Added Debian Bullseye support. [\#376](https://github.com/wazuh/wazuh-puppet/pull/376) ([cheasles](https://github.com/cheasles))
- Implemented the ability to specify an agent address when registering [\#375](https://github.com/wazuh/wazuh-puppet/pull/375) ([cheasles](https://github.com/cheasles))
- add option to disable client buffer [\#372](https://github.com/wazuh/wazuh-puppet/pull/372) ([rabidsloth](https://github.com/rabidsloth))
- 365 update readme and bump version up to 4.3.0 [\#368](https://github.com/wazuh/wazuh-puppet/pull/368) ([jcruzlp](https://github.com/jcruzlp))
- Bump powershell dependency requirement [\#364](https://github.com/wazuh/wazuh-puppet/pull/364) ([mike406](https://github.com/mike406))
- Add new line before and after email\_alerts block [\#358](https://github.com/wazuh/wazuh-puppet/pull/358) ([ajurjevi](https://github.com/ajurjevi))
- Beautify command template [\#357](https://github.com/wazuh/wazuh-puppet/pull/357) ([ajurjevi](https://github.com/ajurjevi))
- Beautify localfile template [\#356](https://github.com/wazuh/wazuh-puppet/pull/356) ([ajurjevi](https://github.com/ajurjevi))
- Beautify active response template [\#355](https://github.com/wazuh/wazuh-puppet/pull/355) ([ajurjevi](https://github.com/ajurjevi))
- Add correct target\_arg in activeresponse manifest [\#354](https://github.com/wazuh/wazuh-puppet/pull/354) ([ajurjevi](https://github.com/ajurjevi))
- Add docker-listener wodle section [\#344](https://github.com/wazuh/wazuh-puppet/pull/344) ([lemrouch](https://github.com/lemrouch))
- Add a parameter ossec\_rootcheck\_ignore\_sregex\_list [\#329](https://github.com/wazuh/wazuh-puppet/pull/329) ([Hexta](https://github.com/Hexta))

## [v4.2.7](https://github.com/wazuh/wazuh-puppet/tree/v4.2.7) (2022-05-30)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.2.6...v4.2.7)

**Closed issues:**

- `config.yml` must be adapted to the new format [\#475](https://github.com/wazuh/wazuh-puppet/issues/475)
- Windows variable redefinition error [\#473](https://github.com/wazuh/wazuh-puppet/issues/473)
- After deploying the Wazuh agent for Windows it is not automatically started [\#470](https://github.com/wazuh/wazuh-puppet/issues/470)
- Some variables in the `params_agent.pp` cause errors when deploying a Wazuh agent for Windows [\#469](https://github.com/wazuh/wazuh-puppet/issues/469)
- The `ossec_service_provider` variable specified in the documentation are not working for the Wazuh manager and agent deployment [\#468](https://github.com/wazuh/wazuh-puppet/issues/468)
- Misc variables have no effect, have errors, and don't work as expected \(rootcheck, api, cis\_cat, osquery, syslog\) [\#467](https://github.com/wazuh/wazuh-puppet/issues/467)
- SCA variables have no effects and errors.  [\#466](https://github.com/wazuh/wazuh-puppet/issues/466)
- Vulnerability detector variables have no effects, have errors, and don't work as expected,  [\#465](https://github.com/wazuh/wazuh-puppet/issues/465)
- Syscheck variables with no effect, errors and dependencies not found for installation. [\#464](https://github.com/wazuh/wazuh-puppet/issues/464)
- The Wazuh puppet agent module can't be used on Ubuntu 20.10 distribution [\#460](https://github.com/wazuh/wazuh-puppet/issues/460)
- Some settings aren't working for Wazuh manager/agent class \(localfile, remote, email and enrollment sections\) [\#459](https://github.com/wazuh/wazuh-puppet/issues/459)
- The indexer/dashboard certs folder should have 500 permissions and certificates 400 [\#458](https://github.com/wazuh/wazuh-puppet/issues/458)
- Clean wazuh-puppet repository [\#457](https://github.com/wazuh/wazuh-puppet/issues/457)
- Release v4.2.6 Puppet [\#455](https://github.com/wazuh/wazuh-puppet/issues/455)
- Pre-Release v4.2.6 Puppet [\#454](https://github.com/wazuh/wazuh-puppet/issues/454)
- Update the `api.yaml` configuration file with the new `format` API configuration parameter [\#451](https://github.com/wazuh/wazuh-puppet/issues/451)
- AlmaLinux is not yet supported [\#442](https://github.com/wazuh/wazuh-puppet/issues/442)
- Release v4.3.0 Puppet [\#434](https://github.com/wazuh/wazuh-puppet/issues/434)
- Pre-Release v4.3.0 Puppet [\#433](https://github.com/wazuh/wazuh-puppet/issues/433)

## [v4.2.6](https://github.com/wazuh/wazuh-puppet/tree/v4.2.6) (2022-03-28)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.2.5...v4.2.6)

**Closed issues:**

- indexerSecurityInitializer.sh tool name must be changed by indexer-security-init.sh [\#452](https://github.com/wazuh/wazuh-puppet/issues/452)
- Adapt the Puppet deployment to use the new Wazuh dashboard configuration file name. [\#448](https://github.com/wazuh/wazuh-puppet/issues/448)
- Adapt the Puppet deployment to use the new Wazuh indexer default ports. [\#447](https://github.com/wazuh/wazuh-puppet/issues/447)
- Pupppet agent auth pass [\#440](https://github.com/wazuh/wazuh-puppet/issues/440)
- Release Wazuh Indexer into puppet module [\#439](https://github.com/wazuh/wazuh-puppet/issues/439)
- Review API configuration parameters to match the new standard [\#436](https://github.com/wazuh/wazuh-puppet/issues/436)
- Error in Wazuh Manager and Agent 4.3.0 pre-release installation [\#429](https://github.com/wazuh/wazuh-puppet/issues/429)
- Release v4.2.5 Puppet [\#423](https://github.com/wazuh/wazuh-puppet/issues/423)
- Pre-Release v4.2.5 Puppet [\#422](https://github.com/wazuh/wazuh-puppet/issues/422)
- Wazuh agent \(tagged version 4.2.3\) forces Windows clients to run a corrective action on every Puppet run [\#421](https://github.com/wazuh/wazuh-puppet/issues/421)
- Manage repos for Elastic/Kibana/Filebeat [\#416](https://github.com/wazuh/wazuh-puppet/issues/416)
- Update references to deprecated authd options and consider the new ones. [\#386](https://github.com/wazuh/wazuh-puppet/issues/386)
- agent.pp floods puppetserver.log with warnings [\#371](https://github.com/wazuh/wazuh-puppet/issues/371)
- Windows computers with renamed "Administrator" account fail to install agent [\#362](https://github.com/wazuh/wazuh-puppet/issues/362)
- Rename wazuh-puppet users and groups according to the new Wazuh naming standard [\#352](https://github.com/wazuh/wazuh-puppet/issues/352)

**Merged pull requests:**

- Bump 4.2.6 to 4.2 branch [\#456](https://github.com/wazuh/wazuh-puppet/pull/456) ([c-bordon](https://github.com/c-bordon))
- Removed user Administrator for windows deployments to 4.2 [\#420](https://github.com/wazuh/wazuh-puppet/pull/420) ([c-bordon](https://github.com/c-bordon))

## [v4.2.5](https://github.com/wazuh/wazuh-puppet/tree/v4.2.5) (2021-11-15)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.2.4...v4.2.5)

**Closed issues:**

- Release v4.2.4 Puppet [\#408](https://github.com/wazuh/wazuh-puppet/issues/408)
- Pre-Release v4.2.4 [\#407](https://github.com/wazuh/wazuh-puppet/issues/407)
- apt::key definition causes issues w/ proxy [\#395](https://github.com/wazuh/wazuh-puppet/issues/395)
- filebeat class does not support authentication [\#378](https://github.com/wazuh/wazuh-puppet/issues/378)
- Module not upgrading agents on Windows [\#374](https://github.com/wazuh/wazuh-puppet/issues/374)
- Unable to register agent with multiple HA cluster nodes  [\#260](https://github.com/wazuh/wazuh-puppet/issues/260)

**Merged pull requests:**

- Release v4.2.5 [\#424](https://github.com/wazuh/wazuh-puppet/pull/424) ([vcerenu](https://github.com/vcerenu))

## [v4.2.4](https://github.com/wazuh/wazuh-puppet/tree/v4.2.4) (2021-10-20)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.2.3...v4.2.4)

**Closed issues:**

- Release v4.2.3 Puppet [\#403](https://github.com/wazuh/wazuh-puppet/issues/403)
- Pre-Release v4.2.3 [\#402](https://github.com/wazuh/wazuh-puppet/issues/402)

**Merged pull requests:**

- Release v4.2.4 [\#411](https://github.com/wazuh/wazuh-puppet/pull/411) ([vcerenu](https://github.com/vcerenu))
- Release v4.2.4 [\#409](https://github.com/wazuh/wazuh-puppet/pull/409) ([vcerenu](https://github.com/vcerenu))

## [v4.2.3](https://github.com/wazuh/wazuh-puppet/tree/v4.2.3) (2021-10-08)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.2.2...v4.2.3)

**Closed issues:**

- Add Debian 11 compatibilty [\#400](https://github.com/wazuh/wazuh-puppet/issues/400)
- 4.2.2 release requires an update to the wazuh\_api\_yml template. manifest/manager.pp logic [\#396](https://github.com/wazuh/wazuh-puppet/issues/396)
- Release v4.2.2 Puppet [\#392](https://github.com/wazuh/wazuh-puppet/issues/392)
- \[wazuh-puppet\] Update v4.1.5 with Opendistro 1.13.2 [\#370](https://github.com/wazuh/wazuh-puppet/issues/370)

**Merged pull requests:**

- Release v4.2.3 [\#404](https://github.com/wazuh/wazuh-puppet/pull/404) ([vcerenu](https://github.com/vcerenu))
- Adding support for Debian 11 \(Bullseye\) [\#401](https://github.com/wazuh/wazuh-puppet/pull/401) ([c-bordon](https://github.com/c-bordon))
- 4.2.2 release requires an update to the wazuh api yml template. manifest/manager.pp logic [\#397](https://github.com/wazuh/wazuh-puppet/pull/397) ([jakefeasey](https://github.com/jakefeasey))

## [v4.2.2](https://github.com/wazuh/wazuh-puppet/tree/v4.2.2) (2021-09-22)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.2.1...v4.2.2)

**Closed issues:**

- Pre-Release v4.2.2 [\#391](https://github.com/wazuh/wazuh-puppet/issues/391)
- Merge latest changes into 4.2 wazuh-puppet branch [\#389](https://github.com/wazuh/wazuh-puppet/issues/389)
- Release 4.2.1 puppet [\#388](https://github.com/wazuh/wazuh-puppet/issues/388)
- \[API\] Remove behind\_proxy\_server API option [\#379](https://github.com/wazuh/wazuh-puppet/issues/379)

**Merged pull requests:**

- 374 issue upgrade agent windows [\#394](https://github.com/wazuh/wazuh-puppet/pull/394) ([vcerenu](https://github.com/vcerenu))
- Prepare the 4.2.2 release [\#393](https://github.com/wazuh/wazuh-puppet/pull/393) ([vcerenu](https://github.com/vcerenu))

## [v4.2.1](https://github.com/wazuh/wazuh-puppet/tree/v4.2.1) (2021-09-09)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.2.0...v4.2.1)

**Closed issues:**

- Upload Wazuh Puppet module to forge [\#385](https://github.com/wazuh/wazuh-puppet/issues/385)
- Create v4.2.0 release into wazuh-puppet github release page [\#384](https://github.com/wazuh/wazuh-puppet/issues/384)
- Create v4.2.0 wazuh-puppet tag [\#383](https://github.com/wazuh/wazuh-puppet/issues/383)
- Test 4.2 puppet branch deployment [\#382](https://github.com/wazuh/wazuh-puppet/issues/382)
- Merge latest changes into 4.2 wazuh-puppet branch [\#381](https://github.com/wazuh/wazuh-puppet/issues/381)
- Release 4.2.0 puppet [\#380](https://github.com/wazuh/wazuh-puppet/issues/380)

**Merged pull requests:**

- Update 4.2 branch to 4.2.1 [\#390](https://github.com/wazuh/wazuh-puppet/pull/390) ([okynos](https://github.com/okynos))

## [v4.2.0](https://github.com/wazuh/wazuh-puppet/tree/v4.2.0) (2021-09-09)

[Full Changelog](https://github.com/wazuh/wazuh-puppet/compare/v4.1.5...v4.2.0)

**Closed issues:**

- No option to disable client buffer [\#373](https://github.com/wazuh/wazuh-puppet/issues/373)
- Wazuh v4.1.5 support [\#363](https://github.com/wazuh/wazuh-puppet/issues/363)

**Merged pull requests:**

- Update 4.2 branch with puppet last changes [\#387](https://github.com/wazuh/wazuh-puppet/pull/387) ([okynos](https://github.com/okynos))
- Bump to 4.2.0 [\#369](https://github.com/wazuh/wazuh-puppet/pull/369) ([jcruzlp](https://github.com/jcruzlp))
- update target name in concat for manager\_ossec.conf [\#341](https://github.com/wazuh/wazuh-puppet/pull/341) ([Zenidd](https://github.com/Zenidd))
- Release 4.0.4 [\#338](https://github.com/wazuh/wazuh-puppet/pull/338) ([neonmei](https://github.com/neonmei))
- Fix stdlib deprecation warnings  [\#334](https://github.com/wazuh/wazuh-puppet/pull/334) ([Zenidd](https://github.com/Zenidd))
- Fix stdlib deprecation warnings [\#333](https://github.com/wazuh/wazuh-puppet/pull/333) ([Hexta](https://github.com/Hexta))
- Fix active-response agent vars [\#332](https://github.com/wazuh/wazuh-puppet/pull/332) ([Zenidd](https://github.com/Zenidd))
- Hexta fix puppet warnings [\#331](https://github.com/wazuh/wazuh-puppet/pull/331) ([Zenidd](https://github.com/Zenidd))
- Fix reports settings [\#328](https://github.com/wazuh/wazuh-puppet/pull/328) ([Zenidd](https://github.com/Zenidd))
- Integrations: Use manager ossec conf as render target. [\#327](https://github.com/wazuh/wazuh-puppet/pull/327) ([Zenidd](https://github.com/Zenidd))
- add support for Ubuntu Focal Fossa \(20.04\)  [\#321](https://github.com/wazuh/wazuh-puppet/pull/321) ([neonmei](https://github.com/neonmei))
- Github Actions: enable PDK validation tests in workflow [\#320](https://github.com/wazuh/wazuh-puppet/pull/320) ([neonmei](https://github.com/neonmei))
- pdk validate improvements [\#319](https://github.com/wazuh/wazuh-puppet/pull/319) ([neonmei](https://github.com/neonmei))
- manifests/kibana: add support to point to elastic cluster [\#317](https://github.com/wazuh/wazuh-puppet/pull/317) ([neonmei](https://github.com/neonmei))
- Improve kibana manifest idempotency [\#315](https://github.com/wazuh/wazuh-puppet/pull/315) ([neonmei](https://github.com/neonmei))
- Clean up linting warnings [\#314](https://github.com/wazuh/wazuh-puppet/pull/314) ([Zenidd](https://github.com/Zenidd))
- Improve idempotency for elasticsearch [\#313](https://github.com/wazuh/wazuh-puppet/pull/313) ([neonmei](https://github.com/neonmei))
- Bump version to v4.0.3 [\#311](https://github.com/wazuh/wazuh-puppet/pull/311) ([Zenidd](https://github.com/Zenidd))
- templates: update jvm.options template with version information [\#310](https://github.com/wazuh/wazuh-puppet/pull/310) ([neonmei](https://github.com/neonmei))
- Add missing parameters to email\_alert class [\#308](https://github.com/wazuh/wazuh-puppet/pull/308) ([ajurjevi](https://github.com/ajurjevi))
- Fabian1976 fix authkey change [\#307](https://github.com/wazuh/wazuh-puppet/pull/307) ([Zenidd](https://github.com/Zenidd))
- syscheck 'report\_changes' option requires a blank line [\#306](https://github.com/wazuh/wazuh-puppet/pull/306) ([Zenidd](https://github.com/Zenidd))
- wazuh-puppet: bump versions to 4.0.2 [\#304](https://github.com/wazuh/wazuh-puppet/pull/304) ([Zenidd](https://github.com/Zenidd))
-  wazuh-puppet release 4.0.1 minor fixes [\#303](https://github.com/wazuh/wazuh-puppet/pull/303) ([Zenidd](https://github.com/Zenidd))
- Bump version to 4.0.1 [\#302](https://github.com/wazuh/wazuh-puppet/pull/302) ([Zenidd](https://github.com/Zenidd))
- Adapt modules to Wazuh v4.0 [\#300](https://github.com/wazuh/wazuh-puppet/pull/300) ([manuasir](https://github.com/manuasir))
- Adapt modules to Wazuh v4.0 [\#299](https://github.com/wazuh/wazuh-puppet/pull/299) ([manuasir](https://github.com/manuasir))
- Adding syslog\_output support on `wazuh-puppet` [\#276](https://github.com/wazuh/wazuh-puppet/pull/276) ([Zenidd](https://github.com/Zenidd))
- wazuh-puppet tests on GitHub Actions [\#274](https://github.com/wazuh/wazuh-puppet/pull/274) ([Zenidd](https://github.com/Zenidd))
- Bump version to 3.13.1\_7.8.0 [\#272](https://github.com/wazuh/wazuh-puppet/pull/272) ([Zenidd](https://github.com/Zenidd))
- Release Wazuh 3.13.0 7.7.1 [\#268](https://github.com/wazuh/wazuh-puppet/pull/268) ([jm404](https://github.com/jm404))
- Wazuh release 3.12.3 7.6.2 [\#253](https://github.com/wazuh/wazuh-puppet/pull/253) ([jm404](https://github.com/jm404))
- Fixes \#250, adds $ossec\_remote\_local\_ip parameter [\#251](https://github.com/wazuh/wazuh-puppet/pull/251) ([alanwevans](https://github.com/alanwevans))
- Fixes \#248 : Add option for report files changes in syscheck [\#249](https://github.com/wazuh/wazuh-puppet/pull/249) ([djmgit](https://github.com/djmgit))
- Wazuh Puppet release 3.12.2-7.6.2 [\#247](https://github.com/wazuh/wazuh-puppet/pull/247) ([Zenidd](https://github.com/Zenidd))
- Add strict order to audit module's tasks [\#242](https://github.com/wazuh/wazuh-puppet/pull/242) ([rshad](https://github.com/rshad))
- Add syscollector related config in Wazuh Agent manifest [\#241](https://github.com/wazuh/wazuh-puppet/pull/241) ([rshad](https://github.com/rshad))
- Fix typo in a variable name [\#237](https://github.com/wazuh/wazuh-puppet/pull/237) ([rshad](https://github.com/rshad))
- Release Wazuh 3.12.0\_7.6.1 [\#236](https://github.com/wazuh/wazuh-puppet/pull/236) ([rshad](https://github.com/rshad))
- Adapt active-response definition [\#234](https://github.com/wazuh/wazuh-puppet/pull/234) ([rshad](https://github.com/rshad))
- Upgrade to NodeJS v10 [\#230](https://github.com/wazuh/wazuh-puppet/pull/230) ([xr09](https://github.com/xr09))
- Always treat $ossec\_emailnotification as a boolean [\#229](https://github.com/wazuh/wazuh-puppet/pull/229) ([alanwevans](https://github.com/alanwevans))
- Fixes \#227 : Add system\_audit subsection in rootcheck [\#228](https://github.com/wazuh/wazuh-puppet/pull/228) ([djmgit](https://github.com/djmgit))
- Fixes \#225 : Option to configure audit rules from this module itself [\#226](https://github.com/wazuh/wazuh-puppet/pull/226) ([djmgit](https://github.com/djmgit))
- Release Wazuh 3.11.4 7.6.1 [\#224](https://github.com/wazuh/wazuh-puppet/pull/224) ([jm404](https://github.com/jm404))
- Fixes \#215: Fix audit package name for Debian [\#216](https://github.com/wazuh/wazuh-puppet/pull/216) ([djmgit](https://github.com/djmgit))
- Add a parameter wazuh\_api::manage\_nodejs\_package [\#213](https://github.com/wazuh/wazuh-puppet/pull/213) ([Hexta](https://github.com/Hexta))
- Add a parameter ossec\_rootcheck\_ignore\_list [\#212](https://github.com/wazuh/wazuh-puppet/pull/212) ([Hexta](https://github.com/Hexta))
- Release Wazuh 3.11.3\_7.5.2 [\#207](https://github.com/wazuh/wazuh-puppet/pull/207) ([rshad](https://github.com/rshad))
- Improved agent Windows config. and secondary fixes [\#205](https://github.com/wazuh/wazuh-puppet/pull/205) ([rshad](https://github.com/rshad))
- Release Wazuh 3.11.2\_7.5.1 [\#204](https://github.com/wazuh/wazuh-puppet/pull/204) ([rshad](https://github.com/rshad))
- Fix for Puppet installation on Amazon Linux OS [\#197](https://github.com/wazuh/wazuh-puppet/pull/197) ([rshad](https://github.com/rshad))
- Wazuh release 3.11.1\_7.5.1 [\#196](https://github.com/wazuh/wazuh-puppet/pull/196) ([jm404](https://github.com/jm404))
- Adapt to new Wazuh API configuration [\#195](https://github.com/wazuh/wazuh-puppet/pull/195) ([jm404](https://github.com/jm404))
- Wazuh release 3.11.0 7.5.1 [\#192](https://github.com/wazuh/wazuh-puppet/pull/192) ([jm404](https://github.com/jm404))
- Changes to make `ossec.conf` equivalent to the default version [\#190](https://github.com/wazuh/wazuh-puppet/pull/190) ([rshad](https://github.com/rshad))
- Parameterize templates [\#187](https://github.com/wazuh/wazuh-puppet/pull/187) ([rshad](https://github.com/rshad))
- Add explicit execution order for Puppet manifests tasks [\#183](https://github.com/wazuh/wazuh-puppet/pull/183) ([rshad](https://github.com/rshad))
- Replace static systemd commands [\#181](https://github.com/wazuh/wazuh-puppet/pull/181) ([rshad](https://github.com/rshad))
- missing config-profiles values. [\#179](https://github.com/wazuh/wazuh-puppet/pull/179) ([tnmt](https://github.com/tnmt))
- Modify Elasticsearch default IP [\#178](https://github.com/wazuh/wazuh-puppet/pull/178) ([rshad](https://github.com/rshad))
- agent labels support [\#177](https://github.com/wazuh/wazuh-puppet/pull/177) ([tnmt](https://github.com/tnmt))
- Parameterize `whodata` and `realtime` and add related dependencies [\#175](https://github.com/wazuh/wazuh-puppet/pull/175) ([rshad](https://github.com/rshad))
- Update Filebeat module [\#174](https://github.com/wazuh/wazuh-puppet/pull/174) ([rshad](https://github.com/rshad))
- Fix agent.conf path in wazuh-manager [\#172](https://github.com/wazuh/wazuh-puppet/pull/172) ([rshad](https://github.com/rshad))
- add debian buster support [\#167](https://github.com/wazuh/wazuh-puppet/pull/167) ([aderumier](https://github.com/aderumier))
- notify agent service when ossec.conf change [\#166](https://github.com/wazuh/wazuh-puppet/pull/166) ([aderumier](https://github.com/aderumier))
- Fix the Wazuh agent installation on Windows [\#163](https://github.com/wazuh/wazuh-puppet/pull/163) ([JPLachance](https://github.com/JPLachance))
- Wazuh Puppet v3.10.2\_7.3.2 [\#157](https://github.com/wazuh/wazuh-puppet/pull/157) ([manuasir](https://github.com/manuasir))
- new release 3.10.0 7.3.2 Bump Version [\#156](https://github.com/wazuh/wazuh-puppet/pull/156) ([rshad](https://github.com/rshad))
- add OracleLinux to manager and agent [\#153](https://github.com/wazuh/wazuh-puppet/pull/153) ([rwaffen](https://github.com/rwaffen))
- Fixes for Ossec email notifications' config [\#150](https://github.com/wazuh/wazuh-puppet/pull/150) ([rshad](https://github.com/rshad))
- Update outdated dependency versions [\#147](https://github.com/wazuh/wazuh-puppet/pull/147) ([cubiclelord](https://github.com/cubiclelord))
- Adding Filebeat module and adapted Elasticsearch IP  [\#144](https://github.com/wazuh/wazuh-puppet/pull/144) ([rshad](https://github.com/rshad))
- Move command and email\_alert templates to  templates/fragments [\#143](https://github.com/wazuh/wazuh-puppet/pull/143) ([rshad](https://github.com/rshad))
- Fix integration when group is not specified [\#142](https://github.com/wazuh/wazuh-puppet/pull/142) ([TheoPoc](https://github.com/TheoPoc))
- Added Ubuntu as a recognized operating system to Puppet manifests [\#141](https://github.com/wazuh/wazuh-puppet/pull/141) ([rshad](https://github.com/rshad))
- Kitchen testing for Wazuh deployment with Puppet [\#139](https://github.com/wazuh/wazuh-puppet/pull/139) ([rshad](https://github.com/rshad))
- Make Wazuh Agent able to register and report to different IPs [\#136](https://github.com/wazuh/wazuh-puppet/pull/136) ([jm404](https://github.com/jm404))
- 3.9.3\_7.2.0 Adapting components versions, CHANGELOG.md and README.md for the new release [\#134](https://github.com/wazuh/wazuh-puppet/pull/134) ([rshad](https://github.com/rshad))
- Release 3.9.2\_7.1.1 [\#129](https://github.com/wazuh/wazuh-puppet/pull/129) ([jm404](https://github.com/jm404))
- Wazuh Puppet 3.9.1\_7.1.0 [\#128](https://github.com/wazuh/wazuh-puppet/pull/128) ([jm404](https://github.com/jm404))
- Update to Wazuh 3.9.0 [\#118](https://github.com/wazuh/wazuh-puppet/pull/118) ([manuasir](https://github.com/manuasir))
- Allow certificates to be defined by file path [\#112](https://github.com/wazuh/wazuh-puppet/pull/112) ([LuisGi93](https://github.com/LuisGi93))
- Update to Wazuh version 3.8.2 [\#107](https://github.com/wazuh/wazuh-puppet/pull/107) ([SitoRBJ](https://github.com/SitoRBJ))
- Update to Wazuh version 3.8.1 [\#104](https://github.com/wazuh/wazuh-puppet/pull/104) ([SitoRBJ](https://github.com/SitoRBJ))
- create auth section in ossec.conf [\#103](https://github.com/wazuh/wazuh-puppet/pull/103) ([MrSecure](https://github.com/MrSecure))
- Upgrade version 3.8.0 [\#102](https://github.com/wazuh/wazuh-puppet/pull/102) ([LuisGi93](https://github.com/LuisGi93))
- install package even if repos are not managed by wazuh [\#99](https://github.com/wazuh/wazuh-puppet/pull/99) ([St4n](https://github.com/St4n))
- Feature/agent auth cert key [\#98](https://github.com/wazuh/wazuh-puppet/pull/98) ([LuisGi93](https://github.com/LuisGi93))
- Updating params.pp and \_common.erb so all the options of localfile can be used [\#97](https://github.com/wazuh/wazuh-puppet/pull/97) ([LuisGi93](https://github.com/LuisGi93))
- Update windows agent version [\#96](https://github.com/wazuh/wazuh-puppet/pull/96) ([SitoRBJ](https://github.com/SitoRBJ))
- Fixing process\_list.erb performance [\#94](https://github.com/wazuh/wazuh-puppet/pull/94) ([SitoRBJ](https://github.com/SitoRBJ))
- addlog command support [\#90](https://github.com/wazuh/wazuh-puppet/pull/90) ([SitoRBJ](https://github.com/SitoRBJ))
- add integration support [\#89](https://github.com/wazuh/wazuh-puppet/pull/89) ([SitoRBJ](https://github.com/SitoRBJ))
- Add support for Wazuh 3.x  [\#85](https://github.com/wazuh/wazuh-puppet/pull/85) ([cadoming](https://github.com/cadoming))
- Add support for who data [\#84](https://github.com/wazuh/wazuh-puppet/pull/84) ([jamebus](https://github.com/jamebus))
- Grouping agents [\#82](https://github.com/wazuh/wazuh-puppet/pull/82) ([hfm](https://github.com/hfm))
- Fix firewall module and support excluding decoders and rules [\#81](https://github.com/wazuh/wazuh-puppet/pull/81) ([jamebus](https://github.com/jamebus))
- install client package even when manage\_repo is false [\#79](https://github.com/wazuh/wazuh-puppet/pull/79) ([MrSecure](https://github.com/MrSecure))
- Add syslog port & level support level to manager configuration [\#78](https://github.com/wazuh/wazuh-puppet/pull/78) ([MrSecure](https://github.com/MrSecure))
- Fix username \(puppet to puppetlabs\) [\#74](https://github.com/wazuh/wazuh-puppet/pull/74) ([hfm](https://github.com/hfm))
- refac\(description\) remove undefined repotype variable [\#65](https://github.com/wazuh/wazuh-puppet/pull/65) ([minorOffense](https://github.com/minorOffense))
- fix default value for array [\#64](https://github.com/wazuh/wazuh-puppet/pull/64) ([minorOffense](https://github.com/minorOffense))
- Reserved words should be quoted [\#61](https://github.com/wazuh/wazuh-puppet/pull/61) ([jsnod](https://github.com/jsnod))
- Fix the $manage\_repos attribute. [\#55](https://github.com/wazuh/wazuh-puppet/pull/55) ([pillarsdotnet](https://github.com/pillarsdotnet))
- Fixes for Amazon Linux. [\#54](https://github.com/wazuh/wazuh-puppet/pull/54) ([pillarsdotnet](https://github.com/pillarsdotnet))
- Fixes [\#51](https://github.com/wazuh/wazuh-puppet/pull/51) ([ghost](https://github.com/ghost))
- Profile name for Centos 7 is not \_server, it's \_common like RHEL7 [\#38](https://github.com/wazuh/wazuh-puppet/pull/38) ([juliovalcarcel](https://github.com/juliovalcarcel))
- Enable HTTPS in wazuh-api [\#37](https://github.com/wazuh/wazuh-puppet/pull/37) ([rafaelfc-olx](https://github.com/rafaelfc-olx))
- Adding notify\_time and time-reconnect options to client config [\#36](https://github.com/wazuh/wazuh-puppet/pull/36) ([rafaelfc-olx](https://github.com/rafaelfc-olx))
- Configuring wazuh-api from puppet [\#35](https://github.com/wazuh/wazuh-puppet/pull/35) ([rafaelfc-olx](https://github.com/rafaelfc-olx))
- Adding support for changing the client protocol and validating the manager by CA [\#34](https://github.com/wazuh/wazuh-puppet/pull/34) ([rafaelfc-olx](https://github.com/rafaelfc-olx))
- Add the server option to the apt :: key section [\#33](https://github.com/wazuh/wazuh-puppet/pull/33) ([jnarvaezp](https://github.com/jnarvaezp))
- Preventing Duplicated declaration issues regarding apt-transport-https package [\#32](https://github.com/wazuh/wazuh-puppet/pull/32) ([rafaelfc-olx](https://github.com/rafaelfc-olx))
- Managing wazuh-api alongside with wazuh-manager [\#31](https://github.com/wazuh/wazuh-puppet/pull/31) ([rafaelfc-olx](https://github.com/rafaelfc-olx))
- Adding support for changing ossec\_server\_protocol [\#30](https://github.com/wazuh/wazuh-puppet/pull/30) ([rafaelfc-olx](https://github.com/rafaelfc-olx))
- Correct issue with selinux ossec logrotate [\#27](https://github.com/wazuh/wazuh-puppet/pull/27) ([mstathers](https://github.com/mstathers))
- Enforce apt-get update on Debian based system [\#23](https://github.com/wazuh/wazuh-puppet/pull/23) ([lemrouch](https://github.com/lemrouch))
- Allow basic email daily reports setup [\#20](https://github.com/wazuh/wazuh-puppet/pull/20) ([lemrouch](https://github.com/lemrouch))
- Ensure apt-transport-https is installed on Debian based OS [\#17](https://github.com/wazuh/wazuh-puppet/pull/17) ([lemrouch](https://github.com/lemrouch))
- Say which variable should be really set. [\#16](https://github.com/wazuh/wazuh-puppet/pull/16) ([lemrouch](https://github.com/lemrouch))
- Development [\#14](https://github.com/wazuh/wazuh-puppet/pull/14) ([jlruizmlg](https://github.com/jlruizmlg))
- add $wodle\_openscap\_content parameter to server.pp [\#13](https://github.com/wazuh/wazuh-puppet/pull/13) ([hex2a](https://github.com/hex2a))
- explicitly use the windows package provider [\#11](https://github.com/wazuh/wazuh-puppet/pull/11) ([damoxc](https://github.com/damoxc))
- Correct misspelling: "maintaing" --\> "maintaining" [\#10](https://github.com/wazuh/wazuh-puppet/pull/10) ([pillarsdotnet](https://github.com/pillarsdotnet))
- enable fedora 24 for testing [\#9](https://github.com/wazuh/wazuh-puppet/pull/9) ([ddholstad99](https://github.com/ddholstad99))
- Added legacy mcollective facts file to the list of the ignored directories [\#8](https://github.com/wazuh/wazuh-puppet/pull/8) ([elisiano](https://github.com/elisiano))
- add file resource for client.keys when using authd [\#2](https://github.com/wazuh/wazuh-puppet/pull/2) ([hex2a](https://github.com/hex2a))
- wazuh module [\#1](https://github.com/wazuh/wazuh-puppet/pull/1) ([hex2a](https://github.com/hex2a))

## Wazuh Puppet v4.1.5

### Added

- Support to 4.1.5 Wazuh release.


## Wazuh Puppet v4.0.4

### Added

- Update to Wazuh [v4.0.4](https://github.com/wazuh/wazuh-ansible/blob/v4.0.4/CHANGELOG.md)
- Add support for Elasticsearch cluster in Kibana manifests  ([@neonmei](https://github.com/neonmei)) [PR#317](https://github.com/wazuh/wazuh-puppet/pull/317)
- Add support for Ubuntu 20.04 (Focal Fossa)  ([@Zenidd](https://github.com/Zenidd), [@neonmei](https://github.com/neonmei)) [PR#321](https://github.com/wazuh/wazuh-puppet/pull/321)
### Fixed

- Idempotency improvements in Elasticsearch manifests  ([@neonmei](https://github.com/neonmei)) [PR#313](https://github.com/wazuh/wazuh-puppet/pull/313)
- Linting improvements work for Puppet Forge publishing  ([@Zenidd](https://github.com/Zenidd)) [PR#314](https://github.com/wazuh/wazuh-puppet/pull/314)
- Idempotency improvements in Kibana manifests  ([@neonmei](https://github.com/neonmei)) [PR#315](https://github.com/wazuh/wazuh-puppet/pull/315)
- PDK validate improvements  ([@neonmei](https://github.com/neonmei)) [PR#319](https://github.com/wazuh/wazuh-puppet/pull/319)
- Fix warnings due to undefined variables  ([@Hexta](https://github.com/Hexta)) [PR#331](https://github.com/wazuh/wazuh-puppet/pull/331)
-  Use `manager_ossec.conf` as render target for Integrations  ([@Zenidd](https://github.com/Zenidd)) [PR#327](https://github.com/wazuh/wazuh-puppet/pull/327)
-  Use `manager_ossec.conf` as render target for Reports  ([@Zenidd](https://github.com/Zenidd)) [PR#328](https://github.com/wazuh/wazuh-puppet/pull/328)
-  Remove manager-specific options for active response in agent manifest  ([@Zenidd](https://github.com/Zenidd)) [PR#332](https://github.com/wazuh/wazuh-puppet/pull/332)
-  Fix stdlib deprecation warnings related to `validate_*` functions ([@Hexta](https://github.com/Hexta)) [PR#334](https://github.com/wazuh/wazuh-puppet/pull/334)
-  Update target name in concat resources for `manager_ossec.conf`  ([@g3rhard](https://github.com/g3rhard )) [PR#341](https://github.com/wazuh/wazuh-puppet/pull/341)

## Wazuh Puppet v4.0.3

### Added

- Update to Wazuh version 4.0.3

### Fixed

- Templates: update jvm.options template with version information  ([@neonmei](https://github.com/neonmei)) [PR#310](https://github.com/wazuh/wazuh-puppet/pull/310)
- Restart manager service after modifying agent_auth_password  ([@Fabian1976](https://github.com/Fabian1976)) [PR#307](https://github.com/wazuh/wazuh-puppet/pull/307)


## Wazuh Puppet v4.0.2

### Added

- Update to Wazuh version 4.0.2

### Fixed

- Syscheck 'report_changes' option ([@oletos7j](https://github.com/oletos7j)) [PR#306](https://github.com/wazuh/wazuh-puppet/pull/306)


## Wazuh Puppet v4.0.1

### Added

- Update to Wazuh version 4.0.1
- Support for Wazuh v4 new features ([@Zenidd](https://github.com/Zenidd)) [PR#300](https://github.com/wazuh/wazuh-puppet/pull/300):
  - Agent autoenrollment
  - API RBAC


## Wazuh Puppet v3.13.2

### Added

- Update to Wazuh version 3.13.2

- wazuh-puppet tests on GitHub Actions ([@Zenidd](https://github.com/Zenidd)) [PR#274](https://github.com/wazuh/wazuh-puppet/pull/274)

- Support Open Distro for Elasticsearch deployments ([@Zenidd](https://github.com/Zenidd)) [PR#285](https://github.com/wazuh/wazuh-puppet/pull/285)

### Fixed

- ossec.conf concat resources rename ([@Zenidd](https://github.com/Zenidd)) [PR#293](https://github.com/wazuh/wazuh-puppet/pull/293)

- Adding syslog_output support on wazuh-puppet ([@Zenidd](https://github.com/Zenidd)) [PR#276](https://github.com/wazuh/wazuh-puppet/pull/276)


## Wazuh Puppet v3.13.1_7.8.0

### Added

- Update to Wazuh version 3.13.1_7.8.0


## Wazuh Puppet v3.13.0_7.7.1

### Added

- Update to Wazuh version 3.13.0_7.7.1
- Add syscollector related config in Wazuh Agent manifest ([@rshad](https://github.com/rshad)) [PR#241](https://github.com/wazuh/wazuh-puppet/pull/241)

## Wazuh Puppet v3.12.3_7.6.2

### Added

- Update to Wazuh version 3.12.3_7.6.2
- Add option for report files changes in syscheck ([@Hexta](https://github.com/Hexta)) [PR#212](https://github.com/wazuh/wazuh-puppet/pull/212)

## Wazuh Puppet v3.12.2_7.6.2

### Added

- Update to Wazuh version 3.12.2_7.6.2

## Wazuh Puppet v3.12.0_7.6.1

### Added

- Update to Wazuh version 3.12.0_7.6.1

- Add a parameter ossec_rootcheck_ignore_list ([@Hexta](https://github.com/Hexta)) [PR#212](https://github.com/wazuh/wazuh-puppet/pull/212)

- Add a parameter wazuh_api::manage_nodejs_package ([@Hexta](https://github.com/Hexta)) [PR#213](https://github.com/wazuh/wazuh-puppet/pull/213)

- Upgrade to NodeJS v10 ([@xr09](https://github.com/xr09)) [PR#230](https://github.com/wazuh/wazuh-puppet/pull/230)

- Always treat $ossec_emailnotification as a boolean ([@alanwevans](https://github.com/alanwevans)) [PR#229](https://github.com/wazuh/wazuh-puppet/pull/229)

- Adapt active-response definition ([@rshad](https://github.com/rshad)) [PR#234](https://github.com/wazuh/wazuh-puppet/pull/234)

### Fixed

- Fixes #215: Fix audit package name for Debian ([@djmgit](https://github.com/djmgit)) [PR#216](https://github.com/wazuh/wazuh-puppet/pull/216)

- Fixes #227 : Add system_audit subsection in rootcheck ([@djmgit](https://github.com/djmgit)) [PR#228](https://github.com/wazuh/wazuh-puppet/pull/228)

- Fixes #225 : Option to configure audit rules from this module itself ([@djmgit](https://github.com/djmgit)) [PR#226](https://github.com/wazuh/wazuh-puppet/pull/226)

- Fixes #221 : No kern.log, auth.log, mail.log in default localfile config for Debian family ([@rshad](https://github.com/rshad)) [Issue#221](https://github.com/wazuh/wazuh-puppet/issues/221)

## Wazuh Puppet v3.11.4_7.6.1

### Added

- Update to Wazuh version 3.11.4_7.6.1

## Wazuh Puppet v3.11.3_7.5.2

### Added

- Update to Wazuh version 3.11.3_7.5.2

- Improved agent Windows config. and secondary fixes ([@rshad](https://github.com/rshad)) [PR#205](https://github.com/wazuh/wazuh-puppet/pull/205)

## Wazuh Puppet v3.11.2_7.5.1

### Added

- Update to Wazuh version 3.11.2_7.5.1

### Fixed

- Fixed installation for Amazon Linux OS ([@rshad](https://github.com/rshad)) [PR#197](https://github.com/wazuh/wazuh-puppet/pull/197)

## Wazuh Puppet v3.11.1_7.5.1

### Added

- Update to Wazuh version 3.11.1_7.5.1

- Adapt to new Wazuh API configuration ([@jm404](https://github.com/jm404)) [PR#195](https://github.com/wazuh/wazuh-puppet/pull/195)

- Some templates have been parametrized ([@rshad](https://github.com/rshad)) [PR#187](https://github.com/wazuh/wazuh-puppet/pull/187)

### Changed

- Implemented Changes to make `ossec.conf` equivalent to the default version ([@rshad](https://github.com/rshad)) [PR#190](https://github.com/wazuh/wazuh-puppet/pull/190)

## Wazuh Puppet v3.11.0_7.5.1

### Added

- Update to Wazuh version 3.11.0_7.5.1

- Added Debian Buster support ([@aderumier](https://github.com/aderumier)) [PR#167](https://github.com/wazuh/wazuh-puppet/pull/167)

- Add OracleLinux to manager and agent ([@rwaffen](https://github.com/rwaffen)) [PR#153](https://github.com/wazuh/wazuh-puppet/pull/153)

### Fixed

- Fixed Windows Agent Installation ([@JPLachance](https://github.com/JPLachance)) [PR#163](https://github.com/wazuh/wazuh-puppet/pull/163)

## Wazuh Puppet v3.10.2_7.3.2

### Added

- Update to Wazuh version 3.10.2_7.3.2

## Wazuh Puppet v3.10.0_7.3.2

### Added

- Update to Wazuh version 3.10.0_7.3.2
- Change Wazuh Filebeat Module to production. ([@jm404](https://github.com/jm404)) [#1bc6b792af68ff26fc0dfc9125e5d33f7831b32e](https://github.com/wazuh/wazuh-puppet/commit/1bc6b792af68ff26fc0dfc9125e5d33f7831b32e)

## Fixed
- Fixes for Ossec email notifications' config ([rshad](https://github.com/rshad)) [PR#150](https://github.com/wazuh/wazuh-puppet/pull/150)

## Wazuh Puppet v3.9.5_7.2.1

### Added

- Update to Wazuh version 3.9.5_7.2.1

## Fixed

- Fixed linting problems ([@jm404](https://github.com/jm404)) [#ca923c7](https://github.com/wazuh/wazuh-puppet/commit/ca923c71a8f13c75d1f8a0a4807dda6f3ba114a6)



## Wazuh Puppet v3.9.4_7.2.0

### Added

- Update to Wazuh version 3.9.4_7.2.0

- Added Filebeat module and adapted Elasticsearch IP ([rshad](https://github.com/rshad)) [PR#144](https://github.com/wazuh/wazuh-puppet/pull/144)

- Added Kitchen testing for Wazuh deployment with Puppet. ([rshad](https://github.com/rshad)) [PR#139](https://github.com/wazuh/wazuh-puppet/pull/139)

- Added Ubuntu as a recognized operating system to Puppet manifests. ([rshad](https://github.com/rshad)) [PR#141](https://github.com/wazuh/wazuh-puppet/pull/141)

- Wazuh Agent is now able to register and report to different IPs. ([@jm404](https://github.com/jm404)) [PR#136](https://github.com/wazuh/wazuh-puppet/pull/136)

### Fixed

- Fixed integration when group is not specified. ([TheoPoc](https://github.com/TheoPoc)) [PR#142](https://github.com/wazuh/wazuh-puppet/pull/142)

### Changed

- Moved command and email_alert templates to templates/fragments. ([rshad](https://github.com/rshad)) [PR#143](https://github.com/wazuh/wazuh-puppet/pull/143)


## Wazuh Puppet v3.9.3_7.2.0

### Added

- Update to Wazuh version 3.9.3_7.2.0

## Wazuh Puppet v3.9.2_7.1.1

### Added

- Update to Wazuh version 3.9.2_7.1.1

## Wazuh Puppet v3.9.1_7.1.0

### Added

- Created required files for Filebeat installation. ([@jm404](https://github.com/jm404)) [#f36be695](https://github.com/wazuh/wazuh-puppet/commit/f36be69558f012a75717150bd6a48f9b9a45b3c8)

- Created required files for Elasticsearch installation. ([@jm404](https://github.com/jm404)) [#890fb88](https://github.com/wazuh/wazuh-puppet/commit/890fb88cdb4f18ea67caaf09943792145ac245bd)

- Created required files for Kibana installation. ([@jm404](https://github.com/jm404)) [#ac31a02](https://github.com/wazuh/wazuh-puppet/commit/ac31a02c5a6771e5e480db378934b23e2dc59b03)

- Added configuration variables to make `ossec.conf` more flexible. ([@jm404](https://github.com/jm404)) [#5631753](https://github.com/wazuh/wazuh-puppet/commit/5631753cf4c3967d7fc08fc53d2535d78d4e19b7)

- Now it's possible to install an agent without registering it. ([@jm404](https://github.com/jm404)) [#63e1a13](https://github.com/wazuh/wazuh-puppet/commit/63e1a1390edbaef4387c4397c16636514525eeaa)
- Added support for Amazon-Linux-2. ([@jm404](https://github.com/jm404)) [#823eeec](https://github.com/wazuh/wazuh-puppet/commit/823eeec502c4a100dc6946f25388b9d04833c105)

### Changed

- The `server.pp` manifest has been renamed to `manager.pp`. ([@jm404](https://github.com/jm404)) [#f859f87](https://github.com/wazuh/wazuh-puppet/commit/f859f879e5bd6e83b4adf54ebbe44adfc60c0f03)
- The `client.pp` manifest moved to `agent.pp`. ([@jm404](https://github.com/jm404)) [#69fe628](https://github.com/wazuh/wazuh-puppet/commit/69fe628bfbfec171fce3754b22f1d04b67d58d81)

## Removed

- Registration method `export` deleted due to security issues. ([@jm404](https://github.com/jm404)) [#f77fe49](https://github.com/wazuh/wazuh-puppet/commit/f77fe496b4e290b0b3a70272c66d26f8ee7d0012)
- Eliminated `inotify-tools `. ([@jm404](https://github.com/jm404)) [#628db1e](https://github.com/wazuh/wazuh-puppet/commit/628db1e4d5236b195ee1c50945fb6ff7553a5b23)
- Deleted `_common.erb` fragment in order to give flexibility to Agent and Manager. ([@jm404](https://github.com/jm404)) [#92114ea](https://github.com/wazuh/wazuh-puppet/commit/92114ea205be4fa6783115b01b1148a2a6dc7c2d)


## [v3.9.1]

### Added

- Update to Wazuh version 3.9.1_6.8.0

## [v3.9.0]

### Added

- Allow certificates to be defined by file path ([#112](https://github.com/wazuh/wazuh-puppet/pull/112))

### Changed

- Update to Wazuh version 3.9.0 ([#118](https://github.com/wazuh/wazuh-puppet/pull/118))

## [v3.8.2]

### Changed

- Update to Wazuh version 3.8.2. ([#107](https://github.com/wazuh/wazuh-puppet/pull/107))

## [v3.8.1]

### Changed
- Update to Wazuh version 3.8.1 ([#104](https://github.com/wazuh/wazuh-puppet/pull/104))

## [v3.8.0]

### Added
- Feature/agent auth cert key ([#98](https://github.com/wazuh/wazuh-puppet/pull/98))
- Install package even if repos are not managed by wazuh ([#99](https://github.com/wazuh/wazuh-puppet/pull/99))

### Added
- Updating params.pp and _common.erb so all the options of localfile can be used ([#97](https://github.com/wazuh/wazuh-puppet/pull/97))

## [v3.7.2]

### Added
- Updating params.pp and _common.erb so all the options of localfile can be used ([#97](https://github.com/wazuh/wazuh-puppet/pull/97))

### Fixed

- Fixing process_list.erb performance ([#94](https://github.com/wazuh/wazuh-puppet/pull/94))
- Update windows agent version ([#96](https://github.com/wazuh/wazuh-puppet/pull/96))

## [v3.7.1]

### Added

- Add integration support. ([#89](https://github.com/wazuh/wazuh-puppet/pull/89))
- Add support for who data. ([#84](https://github.com/wazuh/wazuh-puppet/pull/84))
- Grouping agents. ([#82](https://github.com/wazuh/wazuh-puppet/pull/82))

### Fixed

- Fix firewall module and support excluding decoders and rules. ([#81](https://github.com/wazuh/wazuh-puppet/pull/81))

### Changed

- Updated metadata.json.
- Changed addlog for command support. ([#90](https://github.com/wazuh/wazuh-puppet/pull/90))

## v3.7.0-3701

### Added

- New repository management and content.
- Add support for Wazuh 3.x. ([#85](https://github.com/wazuh/wazuh-puppet/pull/85))

### Fixed

- Fix username (puppet to puppetlabs). ([#74](https://github.com/wazuh/wazuh-puppet/pull/74))

## Change Log old version.


 ## 2017-xx-xx support@wazuh.com  - 2.0.23

  * Fixed issue #18 with the pull request #17. (thanks @lemrouch)
  * Fixed issue #29 puppetlabs/apt version 4 onwards breaks the installation of wazuh server (thanks @rafaelfc-olx)
  * Adding support for changing ossec_server_protocol with the pull request #30 (thanks @rafaelfc-olx)
  * Managing wazuh-api alongside with wazuh-manager with the pull request #31 (thanks @rafaelfc-olx)
  * Preventing Duplicated declaration issues regarding apt-transport-https package with the pull request #32 (thanks @rafaelfc-olx)
  * Adding support for changing the client protocol and validating the manager by CA with the pull request #34 (thanks @rafaelfc-olx)
  * Configuring wazuh-api from puppet with the pull request #35 (thanks @rafaelfc-olx)
  * Adding notify_time and time-reconnect options to client config with the pull request #36 (thanks @rafaelfc-olx)
  * New wazuh-winagent-v2.1.1-1.exe added.
  * Profile name for Centos 7 is not _server, it's _common like RHEL7 with the pull request #38 (thanks @juliovalcarcel)
  * Verifying if @wodle_openscap_content is defined, fixed #45 and #46
  * Set the same file permissions than the installed package, fixed #41
  * Adding the ability to set "type" attribute for "ignore" tag, fixed #19
  * Adding support to OracleLinux, Fixed #43
  * Add an option for the agent/manager class to manage the firewall automatically with puppetlabs/firewall

## 2017-05-27 support@wazuh.com  - 2.0.22


  * Fixed issue #3. (Thanks for reporting it @ddholstad99)
  * Fixed issue #4. (Thanks for reporting it @elisiano)
  * Explicitly use the windows package provider pull request #11 (Thanks @damoxc)
  * Enable fedora 23/24/25 for pull request #9 (Thanks @ddholstad99)
  * Fix for issue Fix for #6 validate_cmd pull request #12 (Thanks @dakine1111)
  * Add $wodle_openscap_content parameter to server.pp pull request #12 (Thanks hex2a)
  * Added some changes in order to do this module compatible. (pull request #5 thanks elisano)

## 2017-04-24 Jose Luis Ruiz  - 2.0.21

  * Fix apt deprecation warnings. (thanks @kdole)
  * Avoid warnings when storeconfigs are not available. (thanks @kdole)
  * Use default local_files setting. (thanks @kdole)
  * Making ossec server port configurable. (thanks @edge-records)
  * Allow custom agent configurations (thanks @ffleming)
  * Fixed issec #66 (thanks @thedawidbalut)
  * Adds options to control rootcheck feature. (thanks @netman2k)
  * Use puppet-selinux instead of jfryman-selinux (thanks @netman2k)
  * Allow custom ossec.conf in agent and server template (thanks @sam-wouters)
  * Fixed issue #71. (Thanks for reporting it @sc-chad)
  * Fixed issue #72. (Thanks for reporting it @sc-chad)
  * Clean code and added new OpenScap option (thanks @0x2A)
  * module refactored/adapted for wazuh 2.0 (thanks @0x2A)
  * New wazuh-agent-2.0.exe for Windows.

## 2016-12-08 Jose Luis Ruiz  - 2.0.20


  * Fixed typo in the windows package, this type made the deploy fails under windows.

## 2016-12-08 Jose Luis Ruiz  - 2.0.19

  * Compat with Older versions facter. (pull request #47 thanks @seefood)
  * Template paths as parameters. (pull request #48 thanks @seefood )
  * Client: allow configurable service_has_status, default to params. (pull request #51 thanks @josephholsten )
  * Added Yakketi to the supported distributions.
  * Modified activeresponse.erb to include <rules_id></rules_id> tags (pull request #56 thanks @MatthewRBruce)
  * Modified client.pp and server.pp to accept package versions as parameter. (pull request #57 thanks @MatthewRBruce)

## 2016-10-20 Jose Luis Ruiz  - 2.0.18


  * Fixed 10_ossec.conf.erb template, "local_decoder" added to rules configuration

## 2016-10-18 Jose Luis Ruiz  - 2.0.17

  * Fixed gpgkey path under CentOS and RHEL

## 2016-10-18 Jose Luis Ruiz  - 2.0.16

  * Add local_decoder.xml and local_rules.xml templates


## 2016-10-15 Jose Luis Ruiz  - 2.0.15

  * Add option to enable syslog output. (pull request #35 thanks @TravellingGUy )
  * Add Add Amazon Linux support. (pull request #37 thanks @seefood)
  * Hard-coded GPG key for RHEL-like systems. (pull request #37 thanks @tobowers)
  * Override package & service name for client installation. (pull request #43 thanks MrSecure)

## 2016-06-14 Jose Luis Ruiz  - 2.0.14

  * Add prefilter to agent config. (pull request #32 thanks @cmblong )
  * Add function addlog to the agent. (issue #30 thanks @paul-cs)
  * Add the apt::key can set a proxy and the key add process could be done. (issue #34 thanks @drequena)

## 2016-06-14 Jose Luis Ruiz  - 2.0.13

  * Adding xenial to the supported distributions.(pull request #31 thanks @stephen-kainos)

## 2016-05-04 Jose Luis Ruiz  - 2.0.12

Jose Luis Ruiz <jose@wazuh.com>:

  * Add MariaDB support ( (pull reques #3 thanks @ialokin)
  * Permit admin to disable auto_ignore for files which change more than three times. (pull request #24 thanks @cmblong)
  * Change fqdn_rand(3000) to a variable to allow us to increase the number of available clients. (pull request #25 thanks @cmblong)
  * Can now set a minimal activeresponse entry containing just repeated_offenders by defining $ar_repeated_offenders in the wazuh::client. (pull request #26 thanks @ialokin)
  * Add variable to enable prefilter command.  (pull request #27 thanks @cmblong)
  * Set service provider to redhat on Redhat systems. (pull request #28 thanks @cmblong))

## 2016-05-04 Jose Luis Ruiz  - 2.0.11

Jose Luis Ruiz <jose@wazuh.com>:

  * Fix windows installation error in params. (pull request #20 thanks @cmblong)
  * Added support for repeated_offenders in activeresponse (pull request #21 thanks @ialokin)

## 2016-04-26 Jose Luis Ruiz  - 2.0.10

Jose Luis Ruiz <jose@wazuh.com>:

  * Extra rules config to integrate Wazuh ruleset. (pull request #17 thanks @TravellingGUy)
  * Allow configuration of the email_maxperhour and email_idsname configuration items. (pull request #18 thanks @TravellingGUy)
  * Fix bug in client exported resources (pull request #19 thanks @scottcunningham)

## 2016-02-23 Jose Luis Ruiz  - 2.0.9

Jose Luis Ruiz <jose@wazuh.com>:

  * Allow the agent identity to be modified. (pull request #10 thanks @damoxc)
  * prevent the agent-auth command being used. (pull request #11 thanks @damoxc)
  * Change log directory to only be readable by user and group. (pull request #12 thanks @damoxc)
  * Add the ability to configure a MySQL database with OSSEC server. (pull request #14 thanks @coreone)

## 2016-02-05 Jose Luis Ruiz  - 2.0.8

Jose Luis Ruiz <jose@wazuh.com>:

  * Fix some typos with puppet-lint.

## 2016-02-05 Jose Luis Ruiz <jose@wazuh.com> - 2.0.7

Jose Luis Ruiz <jose@wazuh.com>:

  * Run agent-auth if client.keys doesn't exist an agent. (pull request #9 thanks @TravellingGuy)

## 2016-02-03 Jose Luis Ruiz <jose@wazuh.com> - 2.0.6

Jose Luis Ruiz <jose@wazuh.com>:

  * Add ability to manage epel repo to master/client configs (pull request #4 thanks @justicel)
  * The @path uses the puppet level path variable (pull request #5 thanks @justicel)
  * Allow whitelisting of IP addreses (thanks @chaordix)
  * Provides an option to tell the puppet module to not manage the client.keys file at all. (pull request #7 thanks @TravellingGuy)

## 2016-01-19 Jose Luis Ruiz <jose@wazuh.com> - 2.0.5

Jose Luis Ruiz <jose@wazuh.com>:

  * Add multiple email_to addresses
  * Adding support for server-hostname in agent config (pull request #3 thanks @alustenberg)
  * Adding ossec_scanpaths configuration thanks to @djjudas21 repository

## 2015-12-21 Jose Luis Ruiz <jose@wazuh.com> - 2.0.4

Jose Luis Ruiz <jose@wazuh.com>:

  * Add manage_repo option on client.pp (issue #2 reported by @cudgel)
  * Add new repo for RHEL5 and CentOS5 have different rpm signature.

## 2015-12-02 Jose Luis Ruiz <jose@wazuh.com> - 2.0.3

Jose Luis Ruiz <jose@wazuh.com>:

  * Fix server package name for Ubuntu (thanks to @HielkeJ for Pull request)
  * Add full fingerprint for Ubuntu and Debian (thanks to @HielkeJ for Pull request)

## 2015-10-13 Jose Luis Ruiz <jose@wazuh.com> - 2.0.2

Jose Luis Ruiz <jose@wazuh.com>:

  * Update Windows Agent to version 2.8.3
  * Update packaget to Ubuntu Vivid and Wily
  * Update packages to Debian Stretch and Sid

## 2015-10-13 Jose Luis Ruiz <jose@wazuh.com> - 2.0.1

Jose Luis Ruiz <jose@wazuh.com>:

  * Update Windows Agent to version 2.8.1
  * Fix a bug with the Windows Agent ID, now use for all systems **fqdn_rand** to generate the client.keys ID

## 2015-09-16 Jose Luis Ruiz <jose@wazuh.com> - 2.0.0

Jose Luis Ruiz <jose@wazuh.com>:

  * Update for all kind of Windows
  * Change repos to Wazuh, Inc.

## 2015-09-16 Michael Porter <michael.porter@lightningsource.com> - 2.0.0

Michael Porter <michael.porter@lightningsource.com>:
  * Allow skipping MySQL dependency, disabling active response,
    and executing rootcheck
  * Windows agent support
  * Use Puppet md5 support, instead of adding parser function
  * Utilize centralized agent configuration
  * Various clean-up and reorganization of Puppet module structure
  * Utilize 'hostname' instead of 'uniqueid' for agent ID, due to uniqueid
    not existing on Windows, and not necessarily being unique across the org
    on Linux

##  2015-08-21 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk> - 1.7.2

 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>:
  * SELinux permissions fix

## 2015-08-07 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk> - 1.7.0

 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>:
  * Use puppetlabs/mysql to manage MySQL client

## 2015-08-03 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk> - 1.6.2

 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>:
  * Fix log directory permissions

## 2015-07-20 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk> - 1.6.0

 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>:
  * Enable SELinux support

## 2015-07-06 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk> - 1.5.4

 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>:
  * Fix regression in log file permissions (thanks to @paulseward)

## 2015-06-30 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk> - 1.5.3

 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>:
  * Fix permissions on log files so logwatch on EL7 doesn't complain
  * Key concat::fragment for agentkeys on $agent_name to avoid duplicated resources

## 2015-06-11 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk> - 1.5.1

 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>:
  * Stop using andyshinn/atomic and configure Atomicorp's OSSEC repo locally

## 2015-06-10 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk> - 1.4.2

 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>:
  * Fix regression that breaks behaviour on CentOS 6 and lower

## 2015-05-28 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk> - 1.4.1

 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>:
  * Email notification is no longer hard-coded in ossec.conf (thanks to @earsdown)

## 2015-03-02 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk> - 1.4.0

 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>:
  * Fix dependency problem by providing EPEL on RHEL (thanks to @otteydw for reporting)

## 2015-01-16 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk> - 1.3.3

 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>:
  * Fix compatibility issue with PuppetServer (thanks to @d9705996)

## 2014-11-28 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk> - 1.3.0

 Jonathan Gazeley <jonathan.gazeley@bristol.ac.uk>:
  * Add support for Debian "Jessie" (thanks to @ivan7farre)

\* *This Changelog was automatically generated by [github_changelog_generator](https://github.com/github-changelog-generator/github-changelog-generator)*