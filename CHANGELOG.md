# Changelog

## 1.0.0 (2024-02-07)


### Features

* add build.yml ([#2](https://github.com/ublue-os/framework/issues/2)) ([83535b3](https://github.com/ublue-os/framework/commit/83535b3f2bb820b38fad0658a9a28635619ad9d4))
* add containerfile ([a4d3f96](https://github.com/ublue-os/framework/commit/a4d3f96a0edefc95ffb6a6479de9050e7b5a7e1f))
* add custom.just ([12f6a12](https://github.com/ublue-os/framework/commit/12f6a12dc68ed4ad05731a76cf0b1f72d244d49c))
* Add dark/light Framework wallpaper for GNOME, KDE, and others. ([#50](https://github.com/ublue-os/framework/issues/50)) ([1477aea](https://github.com/ublue-os/framework/commit/1477aeabade6e525b1b456e22d95aebbbb0bc30b))
* add framework-packages.json ([#4](https://github.com/ublue-os/framework/issues/4)) ([0ee9d18](https://github.com/ublue-os/framework/commit/0ee9d18eb8e00f8e27f891a145b34d2426453532))
* add just syntax checker ([#57](https://github.com/ublue-os/framework/issues/57)) ([1a5f204](https://github.com/ublue-os/framework/commit/1a5f20451dbba458f95d42b7dad51977a28a9639))
* add powertop ([ebab063](https://github.com/ublue-os/framework/commit/ebab063d90e14ef42cab770c4680665aae8db3e4))
* **ci:** Build Nvidia images ([3fe12e1](https://github.com/ublue-os/framework/commit/3fe12e1102f6dacb0815d5f4a53510a410e06eb6))
* **ci:** Enable Bazzite (GNOME) ([2a11534](https://github.com/ublue-os/framework/commit/2a115341258ec8f852bd50321b05554e74f68445))
* **ci:** Enable Bluefin (DX) ([5ad4bca](https://github.com/ublue-os/framework/commit/5ad4bca7e55c921f4c6cde10cdca36050724230c))
* **ci:** Verify base image with cosign before building ([#63](https://github.com/ublue-os/framework/issues/63)) ([90d9d04](https://github.com/ublue-os/framework/commit/90d9d04319d194c73a3095c93bda4bf3fbc0a8c2))
* Enable ublue-os/staging repo for upgraded TLP package ([d333b9f](https://github.com/ublue-os/framework/commit/d333b9f29eb868b58ba3372dadf31350e313b3a3))
* Implement Bazzite Framegame ([43703cf](https://github.com/ublue-os/framework/commit/43703cfdcad4f08f604b525e0bc24f64dc168a84))
* Introduce support for gts tag (tracks Fedora - 1) ([#42](https://github.com/ublue-os/framework/issues/42)) ([65e2506](https://github.com/ublue-os/framework/commit/65e250610b8df3d5ae5bdf930d83417cd32b7175))
* **just:** set kargs based on cpu generation ([#45](https://github.com/ublue-os/framework/issues/45)) ([cf3c3fc](https://github.com/ublue-os/framework/commit/cf3c3fc63a9eeb06da7003cbcda3cf2c530ed758))
* Mark Fedora 39 images as stable and roll out gts ([5f685bf](https://github.com/ublue-os/framework/commit/5f685bff965df3c22ad0401ec9b4d53c26990e44))
* turn on F39 for Vauxite ([32d364a](https://github.com/ublue-os/framework/commit/32d364a54a5d874a52bd01fe1c734bd6808df10a))


### Bug Fixes

* add dconf-update.service ([3738d98](https://github.com/ublue-os/framework/commit/3738d9854d43ecf6a7253c750a5fc57c36cda741))
* add experimental scaling option ([2ef196b](https://github.com/ublue-os/framework/commit/2ef196b4654d12690428e3fb8b5d5849cb7789d6))
* add gnome specific settings ([da472bb](https://github.com/ublue-os/framework/commit/da472bba4b38e36eb2b26c22ce8fa59204b10a91))
* add onyx ([5417ff2](https://github.com/ublue-os/framework/commit/5417ff25f75ab0372d38f7c8235394061dd70601))
* add settings to bazzite-gnome ([e936d2d](https://github.com/ublue-os/framework/commit/e936d2dc8ee0570f6aa8175073bbc7562fa13ba6))
* also ship backgrounds to bluefin ([583a004](https://github.com/ublue-os/framework/commit/583a004061a609ba2aa514ad20c10cb1224486e5))
* append just commands to 60-custom.just ([fb32ced](https://github.com/ublue-os/framework/commit/fb32ced9dad65fc521018d1f58d13cfbc2f5dce2))
* **ci:** Correctly apply image flavor to source image ([7aba44d](https://github.com/ublue-os/framework/commit/7aba44deb2a3b5e8ad317085212c0b6c7a5ce4e7))
* **ci:** Fix image names ([f712b13](https://github.com/ublue-os/framework/commit/f712b13cbbf37ab37fed6879acdb5f3bc8f92c15))
* **ci:** remove builds ([c55d223](https://github.com/ublue-os/framework/commit/c55d2238fb701495fb687fa9058e237f91f53192))
* **ci:** Support cases where 'main' isn't in image name ([da8f038](https://github.com/ublue-os/framework/commit/da8f038f3c80013af39dea7833f6edd1c85d9c36))
* dont pollute other images ([eb0e1b3](https://github.com/ublue-os/framework/commit/eb0e1b3a528770513b76cbecfc95bb4b0aed95eb))
* enable all builds ([#3](https://github.com/ublue-os/framework/issues/3)) ([fdc3f5d](https://github.com/ublue-os/framework/commit/fdc3f5d39dab05b8dfa7d41b61db3749740ec253))
* enable dconf-update ([bfe4105](https://github.com/ublue-os/framework/commit/bfe41051d36580dd654146397081bd3daa787cfe))
* exclude F39 ([cd0df4a](https://github.com/ublue-os/framework/commit/cd0df4a9fe9e3b167aee3a2a4fc0a76ca266c555))
* exclude onyx 37 and 38 ([da0c7dd](https://github.com/ublue-os/framework/commit/da0c7ddc3adefef1ffbda11e35eb6d6ed9c161d5))
* exclude vauxite ([6440b4a](https://github.com/ublue-os/framework/commit/6440b4aef63ce00bf650d32be8563cd8a1bac700))
* **just:** update kernel args for 13th gen ([#48](https://github.com/ublue-os/framework/issues/48)) ([e3a7d12](https://github.com/ublue-os/framework/commit/e3a7d128e17a5de37dbf32a77e4f8be9e277677d))
* move fprintd.service ([#8](https://github.com/ublue-os/framework/issues/8)) ([d0bda95](https://github.com/ublue-os/framework/commit/d0bda954d9846f5d831f113cc50f8029d0f36826))
* remove comment ([c989777](https://github.com/ublue-os/framework/commit/c989777ea8f7683422173005c81367c704835504))
* remove custom fprintd.service ([#2](https://github.com/ublue-os/framework/issues/2)) ([be16674](https://github.com/ublue-os/framework/commit/be16674fcc28e6734495a131184f723533c823e6))
* remove extra - in version variable which leads to invalid name with -- ([#53](https://github.com/ublue-os/framework/issues/53)) ([c103ac1](https://github.com/ublue-os/framework/commit/c103ac1edca4c42947a6cf446a8d598aed640194))
* remove lxqt 39 as lazurite replaced it ([#71](https://github.com/ublue-os/framework/issues/71)) ([5f0462f](https://github.com/ublue-os/framework/commit/5f0462fd89d9589c829444885f542770bbc363f8))
* **signing:** Update public key ([#61](https://github.com/ublue-os/framework/issues/61)) ([176783e](https://github.com/ublue-os/framework/commit/176783e234e02b9a3d41008cade649b945d0590f))
* turn off F37 builds ([#1](https://github.com/ublue-os/framework/issues/1)) ([5e5053d](https://github.com/ublue-os/framework/commit/5e5053d819a8f9f05e37bad6cbe32e319e85596c))
* typo ([869880d](https://github.com/ublue-os/framework/commit/869880d49442a5e47599df855d58a873d4199d96))
