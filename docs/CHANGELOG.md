# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Changed

* Use dynamic issuer for JWK discovery and token intropsection

## [1.3.3] - 2024-07-01

### Fixed

* Correct URLs for JWK discovery and token introspection. PR [#43](https://github.com/powerhome/omniauth-nitro-id/pull/43)

## [1.3.2] - 2024-06-30

### Fixed

* Correct default issuer value for nitro-id and tempo-id strategies. PR [#41](https://github.com/powerhome/omniauth-nitro-id/pull/41)

## [1.3.1] - 2023-09-21

* Display better error message for missing credentials. PR [#27](https://github.com/powerhome/omniauth-nitro-id/pull/27)

## [1.3.0] - 2023-08-22

### Added

* Add `introspect_token` method. PR [#22](https://github.com/powerhome/omniauth-nitro-id/pull/22)

## [1.2.1] - 2023-07-25

### Added

* Removed Faraday and JWT dependencies. PR [#14](https://github.com/powerhome/omniauth-nitro-id/pull/4)

## [1.2.0] - 2023-07-24

### Added

* Add `decode_logout_token` method. PR [#13](https://github.com/powerhome/omniauth-nitro-id/pull/13)

## [1.1.1] - 2023-03-06

### Added

* Add `omniauth-rails_csrf_protection` dependency. PR [#12](https://github.com/powerhome/omniauth-nitro-id/pull/12)

## [1.1.0] - 2022-12-14

### Added

* Add support for `id_token_hint`. PR [#8](https://github.com/powerhome/omniauth-nitro-id/pull/8)

## [1.0.0] - 2022-12-05

### Added

* Initial release

[Unreleased]: https://github.com/powerhome/omniauth-nitro-id/compare/v1.3.1...HEAD
[1.3.1]: https://github.com/powerhome/omniauth-nitro-id/releases/tag/v1.3.1
[1.3.0]: https://github.com/powerhome/omniauth-nitro-id/releases/tag/v1.3.0
[1.2.1]: https://github.com/powerhome/omniauth-nitro-id/releases/tag/v1.2.1
[1.2.0]: https://github.com/powerhome/omniauth-nitro-id/releases/tag/v1.2.0
[1.1.1]: https://github.com/powerhome/omniauth-nitro-id/releases/tag/v1.1.1
[1.1.0]: https://github.com/powerhome/omniauth-nitro-id/releases/tag/v1.1.0
[1.0.0]: https://github.com/powerhome/omniauth-nitro-id/releases/tag/v1.0.0
