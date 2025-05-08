# Changelog

## [2.4.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v2.3.0...v2.4.0) (2025-05-08)


### Features

* add missing properties ([#60](https://github.com/CloudNationHQ/terraform-azure-evh/issues/60)) ([df0330f](https://github.com/CloudNationHQ/terraform-azure-evh/commit/df0330f95e0c0a2a5b86f5788f71224fc9b12486))
* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#57](https://github.com/CloudNationHQ/terraform-azure-evh/issues/57)) ([b721759](https://github.com/CloudNationHQ/terraform-azure-evh/commit/b721759bde80bb7f284644e8ededdd1c9926bbd0))
* **deps:** bump golang.org/x/crypto from 0.31.0 to 0.35.0 in /tests ([#59](https://github.com/CloudNationHQ/terraform-azure-evh/issues/59)) ([f7f719a](https://github.com/CloudNationHQ/terraform-azure-evh/commit/f7f719ab198fa48de42c0f90c1e8f7baab3c4cd7))
* **deps:** bump golang.org/x/net from 0.33.0 to 0.38.0 in /tests ([#61](https://github.com/CloudNationHQ/terraform-azure-evh/issues/61)) ([a1bb84a](https://github.com/CloudNationHQ/terraform-azure-evh/commit/a1bb84a22a34fc1b758795c959d6b6dc6d6e74b1))

## [2.3.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v2.2.0...v2.3.0) (2025-01-20)


### Features

* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#51](https://github.com/CloudNationHQ/terraform-azure-evh/issues/51)) ([8e882c6](https://github.com/CloudNationHQ/terraform-azure-evh/commit/8e882c692e5197ae9244d2267ce2468dba346f38))
* **deps:** bump golang.org/x/crypto from 0.29.0 to 0.31.0 in /tests ([#54](https://github.com/CloudNationHQ/terraform-azure-evh/issues/54)) ([701c7be](https://github.com/CloudNationHQ/terraform-azure-evh/commit/701c7bed205cd8e218eb1fd2fad6a3d7737cc0e2))
* **deps:** bump golang.org/x/net from 0.31.0 to 0.33.0 in /tests ([#55](https://github.com/CloudNationHQ/terraform-azure-evh/issues/55)) ([7acbbbf](https://github.com/CloudNationHQ/terraform-azure-evh/commit/7acbbbf66065541b69d2f696793b5ea5a249e9a0))
* remove temporary files when deployment tests fails ([#52](https://github.com/CloudNationHQ/terraform-azure-evh/issues/52)) ([fa53193](https://github.com/CloudNationHQ/terraform-azure-evh/commit/fa5319371e9278b7c98ba31dbe28dec8fd10b1e0))

## [2.2.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v2.1.0...v2.2.0) (2024-11-11)


### Features

* enhance testing with sequential, parallel modes and flags for exceptions and skip-destroy ([#48](https://github.com/CloudNationHQ/terraform-azure-evh/issues/48)) ([2f4e24c](https://github.com/CloudNationHQ/terraform-azure-evh/commit/2f4e24c7e8754ceb14285f0805ebd7833199fda4))

## [2.1.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v2.0.0...v2.1.0) (2024-10-11)


### Features

* auto generated docs and refine makefile ([#46](https://github.com/CloudNationHQ/terraform-azure-evh/issues/46)) ([935b425](https://github.com/CloudNationHQ/terraform-azure-evh/commit/935b425dcbd7349ea8c056bb36a8d829ae4c4766))
* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#45](https://github.com/CloudNationHQ/terraform-azure-evh/issues/45)) ([ac71105](https://github.com/CloudNationHQ/terraform-azure-evh/commit/ac7110554130c8c968a0dc7f531aa1f478bc1232))

## [2.0.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v1.2.0...v2.0.0) (2024-09-25)


### ⚠ BREAKING CHANGES

* Version 4 of the azurerm provider includes breaking changes.

### Features

* upgrade azurerm provider to v4 ([#43](https://github.com/CloudNationHQ/terraform-azure-evh/issues/43)) ([baafa02](https://github.com/CloudNationHQ/terraform-azure-evh/commit/baafa0215d0fffed9257682bbb1563321acd1f3c))

### Upgrade from v1.2.0 to v2.0.0:

- Update module reference to: `version = "~> 2.0"`
- Changed properties in namespace object:
  - namespace.zone_redundant -> deprecated

## [1.2.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v1.1.1...v1.2.0) (2024-09-04)


### Features

* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#38](https://github.com/CloudNationHQ/terraform-azure-evh/issues/38)) ([e89daaf](https://github.com/CloudNationHQ/terraform-azure-evh/commit/e89daaff00706707e5b93fca788f0386771a1dbd))

## [1.1.1](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v1.1.0...v1.1.1) (2024-09-04)


### Bug Fixes

* added zone_redundant  property for event hub namespace ([#40](https://github.com/CloudNationHQ/terraform-azure-evh/issues/40)) ([7f57ca9](https://github.com/CloudNationHQ/terraform-azure-evh/commit/7f57ca956e6517cfe211f8af1cf4149d38a1858b))

## [1.1.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v1.0.0...v1.1.0) (2024-09-02)


### Features

* consolidated tests and upgrade to go v1.23 ([#33](https://github.com/CloudNationHQ/terraform-azure-evh/issues/33)) ([4985115](https://github.com/CloudNationHQ/terraform-azure-evh/commit/4985115ff1ae94799504d35b950961ecd5c1b0eb))
* support authorization rules for individual eventhubs ([#37](https://github.com/CloudNationHQ/terraform-azure-evh/issues/37)) ([1c2ded7](https://github.com/CloudNationHQ/terraform-azure-evh/commit/1c2ded779ec1d884c2f6c5191577e2d7c82dd3e0))

## [1.0.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v0.6.0...v1.0.0) (2024-08-29)


### ⚠ BREAKING CHANGES

* data structure has changed due to renaming of properties.

### Features

* aligned several properties ([#31](https://github.com/CloudNationHQ/terraform-azure-evh/issues/31)) ([11815ee](https://github.com/CloudNationHQ/terraform-azure-evh/commit/11815ee793932708295f78dc5335f9bd27caa25f))

### Upgrade from v0.6.0 to v1.0.0:

- Update module reference to: `version = "~> 1.0"`
- Change properties in namespace object:
  - resourcegroup -> resource_group
  - zone_redundant -> deprecated

## [0.6.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v0.5.0...v0.6.0) (2024-08-29)


### Features

* update documentation ([#28](https://github.com/CloudNationHQ/terraform-azure-evh/issues/28)) ([6cb9551](https://github.com/CloudNationHQ/terraform-azure-evh/commit/6cb9551cb94df34d7fa74963cc8a88e13ec2966b))

## [0.5.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v0.4.0...v0.5.0) (2024-07-31)


### Features

* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#26](https://github.com/CloudNationHQ/terraform-azure-evh/issues/26)) ([56a679d](https://github.com/CloudNationHQ/terraform-azure-evh/commit/56a679d6bc56e7a531b6f7b5ac11b42bd0bca6ea))
* update contribution docs ([#24](https://github.com/CloudNationHQ/terraform-azure-evh/issues/24)) ([14345ea](https://github.com/CloudNationHQ/terraform-azure-evh/commit/14345ead57dc237168ab502f7fef9ba0b399485c))
* update documentation ([#27](https://github.com/CloudNationHQ/terraform-azure-evh/issues/27)) ([36a01f8](https://github.com/CloudNationHQ/terraform-azure-evh/commit/36a01f8a4fb7d50c45a59d5e48feeb4e1635f8f4))

## [0.4.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v0.3.1...v0.4.0) (2024-07-02)


### Features

* add issue template ([#21](https://github.com/CloudNationHQ/terraform-azure-evh/issues/21)) ([b6202e4](https://github.com/CloudNationHQ/terraform-azure-evh/commit/b6202e452d83ae700b50fc20134bb009454c306e))
* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#22](https://github.com/CloudNationHQ/terraform-azure-evh/issues/22)) ([1c0e6c1](https://github.com/CloudNationHQ/terraform-azure-evh/commit/1c0e6c180403f92864c374dd676b0be3c523c91b))
* **deps:** bump github.com/hashicorp/go-getter in /tests ([#20](https://github.com/CloudNationHQ/terraform-azure-evh/issues/20)) ([1f6b35e](https://github.com/CloudNationHQ/terraform-azure-evh/commit/1f6b35ea6df91d6180b21444b0a2cdd0e9a608c4))

## [0.3.1](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v0.3.0...v0.3.1) (2024-06-14)


### Bug Fixes

* add event hub authorization rule abbreviation in complete usage ([#18](https://github.com/CloudNationHQ/terraform-azure-evh/issues/18)) ([610f48b](https://github.com/CloudNationHQ/terraform-azure-evh/commit/610f48bd9469d457fca3e363206f1c28e83c2b23))

## [0.3.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v0.2.0...v0.3.0) (2024-06-14)


### Features

* updated usage documenation and added type definitions ([#14](https://github.com/CloudNationHQ/terraform-azure-evh/issues/14)) ([e5e88ec](https://github.com/CloudNationHQ/terraform-azure-evh/commit/e5e88ec948a9b876b83a80ab30adf1404f0ca936))

## [0.2.0](https://github.com/CloudNationHQ/terraform-azure-evh/compare/v0.1.0...v0.2.0) (2024-06-07)


### Features

* add pull request template ([#13](https://github.com/CloudNationHQ/terraform-azure-evh/issues/13)) ([0428d1a](https://github.com/CloudNationHQ/terraform-azure-evh/commit/0428d1a67a4b687b6d9d55637dc6897db0d623f7))
* **deps:** bump github.com/gruntwork-io/terratest in /tests ([#12](https://github.com/CloudNationHQ/terraform-azure-evh/issues/12)) ([0a6d8bb](https://github.com/CloudNationHQ/terraform-azure-evh/commit/0a6d8bbc297b30f548eafb4509a60c341c2f2c51))
* **deps:** bump github.com/hashicorp/go-getter in /tests ([#10](https://github.com/CloudNationHQ/terraform-azure-evh/issues/10)) ([0de189c](https://github.com/CloudNationHQ/terraform-azure-evh/commit/0de189c75b62caef6b61398ee01d0167b985187c))
* **deps:** bump golang.org/x/net from 0.17.0 to 0.23.0 in /tests ([#9](https://github.com/CloudNationHQ/terraform-azure-evh/issues/9)) ([fd5624d](https://github.com/CloudNationHQ/terraform-azure-evh/commit/fd5624d3ef48587030f5d527729a89d0307aec6a))
* **deps:** bump google.golang.org/protobuf in /tests ([#6](https://github.com/CloudNationHQ/terraform-azure-evh/issues/6)) ([2a4c3bc](https://github.com/CloudNationHQ/terraform-azure-evh/commit/2a4c3bc08ffcdc00f094eb620880390cf371dc6a))
* update documentation ([#4](https://github.com/CloudNationHQ/terraform-azure-evh/issues/4)) ([b6048aa](https://github.com/CloudNationHQ/terraform-azure-evh/commit/b6048aa8918eb286ad9f46b1fccdc83f0bc5e7a3))

## 0.1.0 (2024-02-23)


### Features

* add initial resources ([#1](https://github.com/CloudNationHQ/terraform-azure-evh/issues/1)) ([a434d79](https://github.com/CloudNationHQ/terraform-azure-evh/commit/a434d79f4a65e5412f0c1c082c6cdb0237c561cb))
* **deps:** bump golang.org/x/crypto from 0.14.0 to 0.17.0 in /tests ([#3](https://github.com/CloudNationHQ/terraform-azure-evh/issues/3)) ([27d9631](https://github.com/CloudNationHQ/terraform-azure-evh/commit/27d963130d155144c96fede1609e1a87dcbe5ed4))
