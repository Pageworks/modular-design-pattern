# 📦 The Box

It's hard to think outside the box when you don't have the box. [Start with the box](https://github.com/codewithkyle/the-box/releases).

## Table of Contents

1. [Goals](#project-goals)
1. [License](#license)
1. [Preface](#preface)
1. [Terminology](#terminology)
    - [HTML](#html)
    - [Script](#script)
    - [Style](#style)
    - [Page](#page)
1. [Specification](#specification)
    - [Components](#components)
    - [Objects](#objects)
    - [Globals](#globals)
    - [Assemblies](#assemblies)
1. [Technologies](#technologies)
    - [Webpack](#webpack)
    - [SASS](#sass)
    - [TypeScript](#typescript)
    - [Pjax](#pjax)
1. [Architecture](#architecture)
1. [Infrastructure](#infrastructure)

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

At a high level the box is a relatively simple framework. It attempts to codify Brad Frost's [Atomic Design](http://bradfrost.com/blog/post/atomic-web-design/) by presenting a simple project architecture schema alongside development tools.

## Terminology

This specification will refer to the [Atomic design methodology](http://atomicdesign.bradfrost.com/table-of-contents/) and how it has been interpreted. Throughout the document the following terms will be referenced:

- HTML
- Script
- Style
- Page

### HTML

When referring to **HTML** the intention is to refer simply to the final result that will be parsed by the DOM. This document will not make assumptions about any templating engines that may or may not be used.

### Script

When referring to **Script** the intention is to refer to JavaScript, however, examples, documentation, and raw code will be provided/written in [TypeScript](http://www.typescriptlang.org/).

### Style

When referring to **Style** the intention is to refer to CSS, however, examples, documentation, and raw code will be provided/written in [SASS](https://sass-lang.com/).

### Page

When referring to a **Page** the intention is to refer to a general or unified DOM structure. Depending on the development environment the Page could refer to the base template that other templates extend, a specific section of the website such as an e-commerce section, or a unique section of the website such as a member dashboard. Although each section lives under one namespace the primary functionality of each section depends on the context of the section and the needs of the user when within that section.

## Specification

The goal of this specification document is to define a solid foundation for design systems and pattern libraries to be build upon. This document will refrain from presenting examples written in any specific templating engine where the end result can be converted into any CMS/templating engine combination such as [Craft CMS](https://craftcms.com/) and [Twig](https://twig.symfony.com/), [Laravel](https://laravel.com/) and [Blade](https://laravel.com/docs/5.8/blade), or even a JavaScript templating engine such as [handlebars.js](https://handlebarsjs.com/).

### Components

Components are similar to Atomic designs [Organisms](http://atomicdesign.bradfrost.com/chapter-2/#organisms).

A component can be a relatively complex structure ranging from a simple component, like a websites footer, all the way up to an incredibly complex component, such as a product display with advanced live filtering and sorting features.

Components are defined as a combination of following three files:

1. HTML
1. Script
1. Style

Components can be composed of Objects, Globals, other Components, or can exist as completely independent elements.

### Objects

Objects are similar to Atomic designs [Molecules](http://atomicdesign.bradfrost.com/chapter-2/#molecules).

An object is a single or group of UI elements functioning together such as a search result card on a websites search results page.

Objects are defined as a combination of the following two files:

1. HTML
1. Style

Objects can be composed of Globals, other Objects, or can exist as completely independent elements.

### Globals

Globals are similar to Atomic designs [Atoms](http://atomicdesign.bradfrost.com/chapter-2/#atoms).

A Global is a unique style for a [Basic HTML Element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element). Globals will **NEVER** apply the style to the raw HTML element.

Globals are defined as a single Style file.

### Assemblies

Assemblies are loosely similar to Atomic designs [Templates](http://atomicdesign.bradfrost.com/chapter-2/#templates) or [Pages](http://atomicdesign.bradfrost.com/chapter-2/#pages).

An Assembly is a group of components that need to work together to perform a tasks that would be too advanced for any single component to achieve on it's own. The role of an Assembly is to manage the components that are assigned to it.

An example of an Assembly could be a websites checkout page since the checkout usually has it's own unique base layout and functionality. Each step of the checkout process could be independent components that handle their own unique functionality, however, they will always report the users information back to the Assembly they're assigned to.

Assemblies are defined as a combination of the following two files:

1. HTML
1. Script
1. Style

Assemblies can be composed of Globals, Objects, or Components.

## Technologies

The following technologies will used:

### Webpack

[Webpack](https://webpack.js.org/) is used to bundle the ES Modules into individual files so that they can be lazy-loaded or dynamically imported into the global space without the need for full page reloads. Webpack will be replaced by the [dynamic import syntax](https://developers.google.com/web/updates/2017/11/dynamic-import) when it becomes available in [Edge and Firefox](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/import#Browser_compatibility).

### SASS

[Node SASS](https://github.com/sass/node-sass) is used as the stylesheet preprocessor to process the CSS extension language [SASS](https://sass-lang.com/).

### TypeScript

[TypeScript](http://www.typescriptlang.org/) is used to transpile the TypeScript into JavaScript. TypeScript is a typed superset of JavaScript and forces developers to [declare](http://www.typescriptlang.org/docs/handbook/declaration-files/introduction.html) the interfaces they'll be using along with [typing](https://www.typescriptlang.org/docs/handbook/basic-types.html) their variables.

### Pjax

[Pjax](https://github.com/codewithkyle/pjax) is used to prefetch pages, swap out HTML content, and dynamically importing CSS & JavaScript all under one HTTP request.

## Architecture

Every [Page](#page) has an [Assembly](#assemblies). The Assembly will manage the utilities along with creation and management of any [Components](#components).

A Component will manage the functionality scoped to the base element of the Component along with any functionality assigned to [Objects](#objects) that exist within the Component.

Components **can not** communicate directly with other Components, they will only send information up the hierarchy to their assigned Assembly.

The Assembly is responsible for handling cross Component communication.

The Assembly will publicly store any information that is required to be used between multiple Components.

Objects can exist anywhere within the Page as a visual element.

Objects do **not** inherently have any functionality. They can be assigned functionality if they're apart of a Component.

A Page will only include the [Styles](#style) and [Scripts](#script) required to run the page.

Each Style and Script will be packaged independently with a focus on creating small optimized file sizes.

## Infrastructure
