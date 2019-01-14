# openfl-issue-rsl

issue with "Runtime Shared Library" items in swf files

## Setup overview

I have several resource libraries (swc) created with Adobe Animate (fla) that shares common elements defined in separated library.

- [res/a.swc](res/a.swc) - common resource library with element `A`
- [res/b.swc](res/b.swc) - resouce library with element `B` that includes symbol `A` using "runtime shared library" feature

That setup allow to separate resources by libraries while have common elements across all objects. That elements are not duplicated.

Using AIR SDK compiler I create my application with all required resources. Used common symbols from a.swc included once.

So symbol `B` in my application look like:

![B](doc/ab.swf.png)

It consits of two elements: common `A` with letter A and letter B

## The problem

openfl does not properly convert such swf files into swflite libraries, even if all resource libraries combined into single swf file before.

![openfl](doc/openfl.png)

## Investigation

So here is swfdump of combined swf library:

```
<swf>
  ...
  <DefineShape2 id="1"> ... </DefineShape2>
  <DefineSprite id="2">
    <PlaceObject3 className="A" depth="1" matrix="t0,0"/>
    <PlaceObject2 idref="1" depth="3" matrix="t0,0"/>
    <ShowFrame/>
  </DefineSprite>
  <DefineShape2 id="3"> ... </DefineShape2>
  <DefineSprite id="4"> ... </DefineSprite>
  <SymbolClass>
    <Symbol idref="4" className="A" />
    <Symbol idref="2" className="B" />
    <Symbol idref="0" className="Main" />
  </SymbolClass>
  ...
</swf>
```

As we can see symbol `B` (idref=2) uses `PlaceObject3` tag with only className property (no reference by id).
AFAIK openfl (8.8.0 at moment) does not handle that properly.
