# 📦 The Box

It's hard to think outside the box, when you don't have the box. [Start with the box](https://github.com/codewithkyle/the-box/releases).

## Table of Contents

1. [Goals](#project-goals)
1. [License](#license)
1. [Preface](#preface)
1. [Specification](#specification)

## Project Goals

### User Focused

Create a system that handles the minor utilities needed for providing a better experience while being conscious of the projects overall data footprint.

### Unify

Provide a basic and simple structure for naming elements and writing scripts with a focus on limiting friction during collaborative projects.

### Inspire

Provide a flexible foundation that inspires developers to create, innovate, and share.

### Motion Provides Meaning

Motion focuses attention and maintains continuity, through subtle feedback and coherent transitions. As elements appear on screen, they transform and reorganize the environment, with interactions generating new transformations.

### Cross-Platform

Projects should be optimized for the best user experience across all platforms. The basic product should retain the design and feel of the target platform, however, the user interactions, content, and motion should change to work best for the active platform.

## License

The box is published under the [MIT](https://github.com/codewithkyle/the-box/blob/master/LICENSE) license. Enjoy.

## Preface

At a high level the box is a fairly simple project framework. It attempts to codify Brad Frost's [Atomic Design](http://bradfrost.com/blog/post/atomic-web-design/) by building an architecture and tooling to support [Stephen Hay's](https://twitter.com/stephenhay) idea that we're not designing pages, we're designing systems of components.

## Specification

### Terminology

This specification document will refer to the [Atomic design methodology](http://atomicdesign.bradfrost.com/table-of-contents/) and how it has been interpreted. Throughout the document the following terms will be referenced:

- HTML
- Script
- Style

When referring to **HTML** the intention is to refer simply to the final result that will be parsed by the DOM. This document will not make assumptions about any templating engines that may or may not be used.

When referring to **Script** the intention is to refer to JavaScript. Examples, documentation, and raw code will be provided/written in [TypeScript](http://www.typescriptlang.org/).

When referring to **Style** the intention is to refer to CSS. Examples, documentation, and raw code will be provided/written in [SASS](https://sass-lang.com/).

The goal of this document is to define a solid foundation for design systems and pattern libraries to be build upon. This document will refrain from presenting examples written with any specific templating engine. The end result will be a project architecture that can be converted into any CMS and templating engine such as [Craft CMS](https://craftcms.com/) and [Twig](https://twig.symfony.com/) or [Laravel](https://laravel.com/) and [Blade](https://laravel.com/docs/5.8/blade) or even a JavaScript templating engine such as [handlebars.js](https://handlebarsjs.com/).

#### Components

Components are similar to Atomic designs [Organisms](http://atomicdesign.bradfrost.com/chapter-2/#organisms).

A component can be a relatively complex structure ranging from a simple component, like a websites footer, all the way up to an incredibly complex component, such as a product display with advanced live filtering and sorting features.

Components are defined as a combination of following three files:

1. HTML
1. Script
1. Style

Components can be composed of Objects, Globals, other Components, or can exist as completely independent elements.

#### Objects

Objects are similar to Atomic designs [Molecules](http://atomicdesign.bradfrost.com/chapter-2/#molecules).

An object is a single or group of UI elements functioning together such as a search result card on a websites search results page.

Objects are defined as a combination of the following two files:

1. HTML
1. Style

Objects can be composed of Globals, other Objects, or can exist as completely independent elements.

#### Globals

Globals are similar to Atomic designs [Atoms](http://atomicdesign.bradfrost.com/chapter-2/#atoms).

A Global is a unique style for a [Basic HTML Element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element). Globals will **NEVER** apply the style to the raw HTML element.

Globals are defined as a single Style file.
