Resin SDK
---------

[![npm version](https://badge.fury.io/js/resin-sdk.svg)](http://badge.fury.io/js/resin-sdk)
[![dependencies](https://david-dm.org/resin-io/resin-sdk.png)](https://david-dm.org/resin-io/resin.sdk.png)
[![Build Status](https://travis-ci.org/resin-io/resin-sdk.svg?branch=master)](https://travis-ci.org/resin-io/resin-sdk)
[![Build status](https://ci.appveyor.com/api/projects/status/qbsivehgnq0vyrrb?svg=true)](https://ci.appveyor.com/project/jviotti/resin-sdk)

The official JavaScript [Resin.io](https://resin.io/) SDK.

Role
----

The intention of this module is to provide developers a nice API to integrate their JavaScript applications with Resin.io.

Installation
------------

Install the Resin SDK by running:

```sh
$ npm install --save resin-sdk
```

Platforms
---------

We currently only support NodeJS, but there are plans to make the SDK available in the browser as well.

Documentation
-------------

We generate JSDoc markdown documentation in [DOCUMENTATION.md](https://github.com/resin-io/resin-sdk/blob/master/DOCUMENTATION.md).

Support
-------

If you're having any problem, please [raise an issue](https://github.com/resin-io/resin-sdk/issues/new) on GitHub and the Resin.io team will be happy to help.

Tests
-----

Run the test suite by doing:

```sh
$ gulp test
```

Contribute
----------

- Issue Tracker: [github.com/resin-io/resin-sdk/issues](https://github.com/resin-io/resin-sdk/issues)
- Source Code: [github.com/resin-io/resin-sdk](https://github.com/resin-io/resin-sdk)

Before submitting a PR, please make sure that you include tests, and that [coffeelint](http://www.coffeelint.org/) runs without any warning:

```sh
$ gulp lint
```

License
-------

The project is licensed under the MIT license.
