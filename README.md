# Puppet extlib module

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with the extlib module](#setup)
4. [Reference - Types reference and additional functionalities](#reference)
6. [Contact](#contact)

<a name="overview"/>
## Overview
Provides an extension library of resources to Puppet modules.

<a name="module-description"/>
## Module Description
This module provides an extension library of resources (functions, facts etc.) for the development of Puppet modules.

<a name="setup"/>
## Setup
Installing the extlib module adds the functions, facts, and resources to Puppet.

<a name="reference"/>
## Reference

### Classes

#### Public Classes
The extlib class has no parameters.

### Resource Types

#### generate_toml
Generate a TOML document from a Ruby hash.

Example:
```
$content = generate_toml({'foo' => 'bar'})
```

#### generate_json
Generate a JSON document from a Ruby hash.

Example:
```
$content = generate_json({'a' => 'hello'})
```

The second parameter, if provided, are the options.
```
generate_json({'a' => 'hello'}, {'indent' => "\t"})
```

### Functions

#### format_java_properties
Generate a Java config properties file from a Hash.

Parameters:
* properties: the properties hash
* separator (Optional): separator (default: '.')
* classpath_attribute (Optional): a reserved key which will be used to specify the class. For instance, log4j configuration typically have a class attribute to specify things like appender class.
* prefix (Optional): string to prefix all the properties with

```
$content = extlib::format_java_properties({'rootLogger" => ['INFO', 'STDOUT'], 'appender" => {'class' => 'org.apache.log4j.ConsoleAppender', 'layout' => {'class' => 'org.apache.log4j.PatternLayout', 'ConversionPattern' => '[%p] %d %t %c - %m%n'}}}, '.', 'class', 'log4j')
```

<a name="contact"/>
## Contact
Matteo Cerutti - matteo.cerutti@hotmail.co.uk
