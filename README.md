# Modular Design Pattern

The Modular Design Pattern attempts to codify Brad Frost's [Atomic Design methodology](http://bradfrost.com/blog/post/atomic-web-design/) using a variation of the [MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) architectural pattern. The use of this pattern makes it possible to work with an infinite amount of interchangeable components that can each individually communicate with an infinite amount of business-logic controllers.

# Table of Contents

1. [Overview](#overview)
1. [Structure](#structure)
1. [Usage](#usage)
    1. [Pseudocode](#pseudocode)
    1. [Module Lifecycle](#module-lifecycle)
    1. [Communication](#communication)
1. [License](#license)

# Overview

The Modular Design Pattern solves problems like:

- How to work with [modular programming](https://en.wikipedia.org/wiki/Modular_programming)
- How modules can instantiate other submodules

The Modular Design Pattern describes how to solves such as:

- Define an operation for creating modules
- Define an operation for destroying modules
- Define communication between modules and submodules

# Structure

The Modular Design Pattern uses a variation of the [model–view–controller](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) and [Hierarchical model–view–controller](https://en.wikipedia.org/wiki/Hierarchical_model–view–controller) software architectural patterns. The major difference being that controllers can directly communicate with other controllers or the server(s) without having to send the request up the hierarchy to the top-level controller.

![Applicaiton Structure](https://github.com/Pageworks/modular-design-pattern/blob/master/_assets/application-structure-v2.png)

The runtime application will instantiate the initial modules and any submodules that are required will be instantiated by the module that requires them.

![Instantiation Structure](https://github.com/Pageworks/modular-design-pattern/blob/master/_assets/instantiation-structure.png)

# Usage

### Pseudocode

```javascript
interface Application
{
    public static modules;

    public static createModule(view, uuid, parent = null) returns Module;
    public static deleteModule(uuid) returns void;

    private mountModules()
    {
        requestedModules = getRequestedModules();
        foreach module in requestedModules
        {
            uuid = getUniversallyUniqueIdentifier();
            moduleInstance = Application.createModule(view, uuid);
            modulesInstance.mounted();
            push moduleInstance into modules;
        }
    }
}
```

```javascript
interface Module
{
    public view;
    public uuid;
    public parent;
    public children;

    constructor(view, uuid, parent = null);

    public mounted()
    {
        requiredModules = getRequestedModules();
        foreach submodule in requiredModules {
            UUID = getUniversallyUniqueIdentifier();
            submoduleInstance = Application.createModule(view, uuid, this);
            submoduleInstance.mounted();
            push moduleInstance into children;
        }
    }

    public beforeDestroy(){ }
    public destroy(){ }
}
```

### Module Lifecycle

![Module Lifecycle](https://github.com/Pageworks/modular-design-pattern/blob/master/_assets/base-module-lifecycle.png)

### Communication

Client side controllers are allowed limited communication between one another. All controllers can directly communication with Static Module controllers or server side controllers.

```javascript
interface StaticModule
{

    private static value;

    public static setValueMethod(value) returns void;
}
```

```javascript
interface StandardModule extends Module
{
    
    ...snip...

    mounted()
    {
        StaticModule.setValueMethod(value);
    }
}
```

All other Module controllers are restricted to direct communication between the Modules parent or its children.

```javascript
interface StandardModule extends Module
{
    
    ...snip...

    private user object;

    public setValue(key, value)
    {
        user[key] = value;
    }
}
```

```javascript
interface ChildModule extends Module
{
    
    ...snip...

    mounted()
    {
        if(this.parent)
        {
            this.parent.setValue(key, value);
        }
    }
}
```

# License

The Modular Design Pattern is published under the [MIT](https://github.com/Pageworks/modular-design-pattern/blob/master/LICENSE) license.
