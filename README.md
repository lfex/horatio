# horatio [![Build Status][travis-badge]][travis]

*The rational and most trusted friend of the tragic hero, Floating Point*

[![Horatio logo][logo]][logo]

## Table of Contents

* [Introduction](#introduction-)
* [Installation](#installation-)
* [Usage](#usage-)
  * [Creating Fractions](#creating-fractions-)
  * [Convenience Functions](#convenience-functions-)
    * [Printing](#printing-fractions-)
    * [Converting](#converting-)
  * [Math](#math-)
    * [Arithmatic](#arithmatic-)
    * [Operations](#operations-)
    * [Powers](#powers-)
* [API](#api-)

## Introduction [&#x219F;](#table-of-contents)

Add content to me here!

## Installation [&#x219F;](#table-of-contents)

Just add it to your ``rebar.config`` deps:

```erlang
  {deps, [
    ...
    {horatio, ".*",
      {git, "git@github.com:lfex/horatio.git", "master"}}
      ]}.
```

And then do the usual:

```bash
    $ rebar get-deps
    $ rebar compile
```

## Usage [&#x219F;](#table-of-contents)

### Creating Fractions [&#x219F;](#table-of-contents)

You may create frations using any one of the following:

```lfe
> (ratio:new 2 3)
#(ratio 2 3)
> (ratio:new "2/3")
#(ratio 2 3)
> (ratio:new '2/3)
#(ratio 2 3)
> (ratio:new #(2 3))
#(ratio 2 3)
```

### Convenience Functions [&#x219F;](#table-of-contents)

#### Printing Fractions [&#x219F;](#table-of-contents)

```lfe
> (set r (ratio:new 2 3))
#(ratio 2 3)
> (ratio:print r)
2/3
ok
```

You can also use the alias ``pp`` (for "pretty print"):

```lfe
> (ratio:pp r)
2/3
ok
```

#### Converting [&#x219F;](#table-of-contents)

To strings, atoms, and floats:

```lfe
> (ratio:->str r)
"2/3"
> (ratio:->atom r)
2/3
> (ratio:->float r)
0.6666666666666666
```

Floats to rational numbers:

```lfe
> (ratio:float->ratio 0.5)
#(ratio 1 2)
> (ratio:float->ratio 1.5)
#(ratio 3 2)
> (ratio:float->ratio 3.1415)
#(ratio 6283 2000)
```

### Math [&#x219F;](#table-of-contents)

For the following examples we'll use these rational numbers:

```lfe
> (set r1 (ratio:new '1/3))
#(ratio 1 3)
> (set r2 (ratio:new '1/4))
#(ratio 1 4)
```

#### Arithmatic [&#x219F;](#table-of-contents)

Addition:

```lfe
> (ratio:print (ratio:add r1 r2))
7/12
ok
```

Subtraction:

```lfe
> (ratio:print (ratio:sub r1 r2))
1/12
ok
```

Multiplication:

```lfe
> (ratio:print (ratio:mult r1 r2))
1/12
ok
```

Division:

```lfe
> (ratio:print (ratio:div r1 r2))
4/3
ok
```

#### Operations [&#x219F;](#table-of-contents)

```lfe
> (ratio:eq r1 r2)
false
> (ratio:eq r2 r2)
true
```
#### Powers [&#x219F;](#table-of-contents)

```lfe
> (ratio:print (ratio:pow r1 4))
1/81
ok
> (ratio:print (ratio:pow r1 -4))
81/1
ok
> (ratio:print (ratio:pow r2 4))
1/256
ok
> (ratio:print (ratio:pow r2 -4))
256/1
ok
```

Large numbers:

```lfe
> (ratio:print (ratio:div (ratio:pow 3 200) (ratio:pow 2 430)))
8960496791105607/93536104789177786765035829293842113257979682750464
ok
```

## API [&#x219F;](#table-of-contents)

The list of functions currently supported by the ratio library are as
follows:

```lfe
ratio:->atom/1
ratio:->float/1
ratio:->str/1
ratio:add/2
ratio:denom/1
ratio:div/2
ratio:eq/2
ratio:float->ratio/1
ratio:gcd/2
ratio:mult/2
ratio:new/1
ratio:new/2
ratio:normalize/1
ratio:normalize/2
ratio:numer/1
ratio:pow/2
ratio:print/1
ratio:ratio/1
ratio:ratio/2
ratio:sub/2
```
<!-- Named page links below: /-->

[travis]: https://travis-ci.org/lfex/horatio
[travis-badge]: https://travis-ci.org/lfex/horatio.png?branch=master
[logo]: resources/images/horatio.jpg
