# 📦 The Box

At a high level the box is a relatively simple framework. It attempts to codify Brad Frost's [Atomic Design](http://bradfrost.com/blog/post/atomic-web-design/) by presenting a simple project architecture schema alongside development tools.

## Table of Contents

1. [Terminology](#terminology)
1. [Schema](#schema)
1. [Usage](#usage)
    - [Globals](#globals)
    - [Objects](#objects)
    - [Components](#components)
    - [Assemblies](#assemblies)
1. [License](#license)

## Terminology

When referring to a **Page** the intention is to refer to a general or unified DOM structure. Depending on the development environment the Page could refer to the base template that other templates extend, a specific section of the website such as an e-commerce section, or a unique section of the website such as a member dashboard. Although each section lives under one namespace the primary functionality of each section depends on the context of the section and the needs of the user when within that section.

## Schema

Every [Page](#page) has an [Assembly](#assemblies). The Assembly will manage the utilities along with creation and management of any [Components](#components).

A Component will manage the functionality scoped to the base element of the Component along with any functionality assigned to [Objects](#objects) that exist within the Component.

Components **can not** communicate directly with other Components, they will only send information up the hierarchy to their assigned Assembly.

The Assembly is responsible for handling cross Component communication.

The Assembly will publicly store any information that is required to be used between multiple Components.

Objects can exist anywhere within the Page as a visual element.

Objects do **not** inherently have any functionality. They can be assigned functionality if they're apart of a Component.

A Page will only include the [Styles](#style) and [Scripts](#script) required to run the page.

Each Style and Script will be packaged independently with a focus on creating small optimized file sizes.

## Usage

The goal of this specification document is to define a solid foundation for design systems and pattern libraries to be build upon. This document will refrain from presenting examples written in any specific templating engine where the end result can be converted into any CMS/templating engine combination such as [Craft CMS](https://craftcms.com/) and [Twig](https://twig.symfony.com/), [Laravel](https://laravel.com/) and [Blade](https://laravel.com/docs/5.8/blade), or even a JavaScript templating engine such as [handlebars.js](https://handlebarsjs.com/).

### Globals

Globals are similar to Atomic designs [Atoms](http://atomicdesign.bradfrost.com/chapter-2/#atoms).

A Global is a unique style for a [Basic HTML Element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element). Globals will **NEVER** apply the style to the raw HTML element.

Globals are defined as a single Style file.

### Objects

Objects are similar to Atomic designs [Molecules](http://atomicdesign.bradfrost.com/chapter-2/#molecules).

An object is a single or group of UI elements functioning together such as a search result card on a websites search results page.

Objects are defined as a combination of the following two files:

1. HTML
1. Style

Objects can be composed of Globals, other Objects, or can exist as completely independent elements.

### Components

Components are similar to Atomic designs [Organisms](http://atomicdesign.bradfrost.com/chapter-2/#organisms).

A component can be a relatively complex structure ranging from a simple component, like a websites footer, all the way up to an incredibly complex component, such as a product display with advanced live filtering and sorting features.

Components are defined as a combination of following three files:

1. HTML
1. Script
1. Style

Components can be composed of Objects, Globals, other Components, or can exist as completely independent elements.

### Assemblies

Assemblies are loosely similar to Atomic designs [Templates](http://atomicdesign.bradfrost.com/chapter-2/#templates) or [Pages](http://atomicdesign.bradfrost.com/chapter-2/#pages).

An Assembly is a group of components that need to work together to perform a tasks that would be too advanced for any single component to achieve on it's own. The role of an Assembly is to manage the components that are assigned to it.

An example of an Assembly could be a websites checkout page since the checkout usually has it's own unique base layout and functionality. Each step of the checkout process could be independent components that handle their own unique functionality, however, they will always report the users information back to the Assembly they're assigned to.

Assemblies are defined as a combination of the following two files:

1. HTML
1. Script
1. Style

Assemblies can be composed of Globals, Objects, or Components.

## Infrastructure

### Assembly

```typescript
interface AssemblyClass {
    constructor();
    public Function init():void;
    private Function update():void;
    private EventListener reload = update;
}
```

`AssemblyClass.init()` is called after the class has been instantiated. It is used to instantiate any utility classes that the Assembly will need.

`AssemblyClass.update()` is called when the `reload` Event Listener is triggered. It is responsible for updating, managing, or informing any of the Assemblies utility classes that a page transition occurred.

`reload` is an [Event Listener](https://developer.mozilla.org/en-US/docs/Web/API/EventListener) that fires whenever a page transition occures.

### Base Component

```typescript
interface BaseComponent {
    constructor(el, uuid, manager);
    
    // Variables
    public HTMLElement el;
    public String uuid;
    public AssemblyClass manager;

    // Methods
    public Function init():void;
    public Function destroy():void;
}
```

`BaseComponent.el` is the top-level element that the functionality of the Component should be scoped within.

`BaseComponent.uuid` is the [Universally Unique Identifier](https://en.wikipedia.org/wiki/Universally_unique_identifier) that is assigned to the Component so it can be easily identified by the Assembly.

`BaseComponent.manger` is the reference to the Assembly that manages the Component.

`BaseComponent.init()` is called after the class has been instantiated. It is used to setup event listeners or call any initial methods.

`BaseComponent.destroy()` is called when the Component is about to be destroyed. It is used to remove any event listeners or call any final methods.

### Component

```typescript
interface Component extends BaseComponent {
    constructor(el:HTMLElement, uuid:String, manager:AssemblyClass){
        super(el, uuid, manager);
    };
    
    // Variables
    public static String COMPONENT_NAME;

    // Methods
    Function init():void;
    Function destroy():void;
}
```

`Component.COMPONENT_NAME` is key index value string that the Assembly will use to instantiate an new instance of the Component.

## License

The box is published under the [MIT](https://github.com/codewithkyle/the-box/blob/master/LICENSE) license.
