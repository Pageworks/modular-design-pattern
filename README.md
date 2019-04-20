# 📦 The Box

At a high level the box is a relatively simple framework. It attempts to codify Brad Frost's [Atomic Design](http://bradfrost.com/blog/post/atomic-web-design/) by presenting a simple project architecture schema alongside development tools.

# Table of Contents

1. [Terminology](#terminology)
1. [Schema](#schema)
1. [Usage](#usage)
    - [Globals](#globals)
    - [Objects](#objects)
    - [Components](#components)
    - [Assemblies](#assemblies)
1. [Interfaces](#interfaces)
1. [License](#license)

# Terminology

When referring to a **Page** the intention is to refer to a general or unified DOM structure. Depending on the development environment the Page could refer to the base template that other templates extend, a specific section of the website such as an e-commerce section, or a unique section of the website such as a member dashboard. Although each section lives under one namespace the primary functionality of each section depends on the context of the section and the needs of the user when within that section.

# Schema

HTTP request is sent to the server.

The server responds with the initial Page. Every Page has an [Assembly](#assemblies) assigned to it that is instantiated via an [IIFE](https://developer.mozilla.org/en-US/docs/Glossary/IIFE).

*Note: the term Page is referring to the base document structure, if a templating engine is used the term Page will be referring to the base layout template that the other templates extend.*

A Page will only include the Styles and Scripts required to run the page.

Each Style and Script will be packaged independently with a focus on creating small optimized file sizes.

The Assembly classes will manage 3rd party packages along with creation, deletion, and management of any classes that are required by the [Components](#components) on the Page.

A Component's class will manage the functionality scoped to the base element of the Component along with any functionality that the class assigns to [Objects](#objects) that exist within the Component.

Components **DO NOT** communicate directly with other Components, they will only send information up the hierarchy to the Assembly.

The Assembly is responsible for handling all communication between the Component classes.

# Usage

The goal of this document is to define a solid foundation for design systems and pattern libraries to be build upon. This document will refrain from presenting examples written in any specific templating engine. Please refer to the [Examples](#) page for detailed examples written with specific CMS and templating engine combinations.

## Globals

A Global is a unique style for a [Basic HTML Element](https://developer.mozilla.org/en-US/docs/Web/HTML/Element). Globals will **NEVER** apply the style to the raw HTML element.

Globals are defined as a single Style file.

### Example Code

File: `Button.scss`

**Correct Usage**

```scss
.g-button{
    border: 2px solid aqua;
    border-radius: 2px;
    padding: 0 16px;
    height: 36px;
    line-height: 36px;

    &.-solid{
        background-color: aqua;
    }
}
```

**Incorrect Usage**

```scss
button{
    border: 2px solid aqua;
    border-radius: 2px;
    padding: 0 16px;
    height: 36px;
    line-height: 36px;
}
```

## Objects

Objects can exists anywhere within the page as visual elements. Objects **DO NOT** inherently have any functionality but can be assigned functionality by a Component.

Objects can be composed of Globals and other Objects.

Objects are defined as a combination of the following files:

1. HTML
1. Style

### Example Code

**HTML**

```html
<div class="o-card">
    <img src="img.jpg" alt="Lorem Ipsume" />
    <h3 class="o-card_heading">Lorem Ipsum</h3>
    <p>Lorem ipsum dolor sit amet...</p>
    <a href="page.html" class="g-button">Read More</a>
</div>
```

**Style**

```scss
.o-card{
    width: 256px;
    height: 512px;
    border-radius: 4px;
    background-color: #ffffff;
    box-shadow: 0 2px 4px rgba(41,41,41,0.1);

    img{
        width: 100%;
        height: 128px;
        object-fit: cover;
    }

    .o-card_heading{
        font-size: 24px;
        margin-bottom: 16px;
    }

    p{
        font-size: 16px;
        line-height: 1.618;
    }
}
```

## Components

A component is similar to an Object except that is has a it's own uniquely defined piece of functionality.

Components can be composed of Objects and Globals.

Components are defined as a combination of following files:

1. HTML
1. Script
1. Style

### Example Code

**HTML**

```html
<div class="c-DemoComponent" data-component="DemoComponent">
    <div class="c-DemoComponent_card"></div>
    <div class="c-DemoComponent_card"></div>
    <div class="c-DemoComponent_card"></div>
    <div class="c-DemoComponent_card"></div>
    <div class="c-DemoComponent_card"></div>
    <div class="c-DemoComponent_card"></div>
</div>
```

**Style**

```scss
.c-DemoComponent{
    display: grid;
    gap: 16px;
    grid-template-columns: 1fr 1fr 1fr;

    .c-DemoComponent_card{
        border-radius: 4px;
        background-color: #ffffff;
        box-shadow: 0 2px 4px rgba(41,41,41,0.1);
        min-height: 256px;
    }
}
```

**Script**

```typescript
export class DemoComponent extends BaseComponent {
    
    public static String COMPONENT_NAME = "DemoComponent";
    
    constructor(el:HTMLElement, uuid:String, manager:AssemblyClass){
        super(el, uuid, manager);
    };

    private changeColor:EventListener = ()=>{
        console.log(`Creating a new ${ DemoComponent.MODULE_NAME } module`);
        this.el.style.backgroundColor = 'rgb(66, 134, 244)';
    }

    /**
     * Called when the module is created.
     */
    init():void{
        this.el.addEventListener('click', this.changeColor);
    }

    /**
     * Called when the module is being removed.
     */
    destroy():void{
        super.destroy(DemoComponent.MODULE_NAME);
    }
}

// Adds module to the global Modules object
modules[DemoComponent.MODULE_NAME] = DemoComponent;
```

## Assemblies

An Assembly is a group of components that need to work together to perform a tasks that would be too advanced for any single component to achieve on it's own. The role of an Assembly is to manage the components that are assigned to it.

An example of an Assembly could be a websites checkout page since the checkout usually has it's own unique base layout and functionality. Each step of the checkout process could be independent components that handle their own unique functionality, however, they will always report the users information back to the Assembly they're assigned to.

Assemblies are defined as a combination of the following two files:

1. HTML
1. Script
1. Style

# Interfaces

## Assembly

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

## Base Component

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

## Component

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

# License

The box is published under the [MIT](https://github.com/codewithkyle/the-box/blob/master/LICENSE) license.
