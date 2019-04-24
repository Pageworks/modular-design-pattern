# Modular Design Pattern

The Modular Design Pattern attempts to codify Brad Frost's [Atomic Design methodology](http://bradfrost.com/blog/post/atomic-web-design/) using a variation of the [MVC](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93controller) architectural pattern. The use of this pattern makes it possible to work with an infinite amount of interchangeable components that can each individually communicate with an infinite amount of business-logic controllers.

# Table of Contents

1. [Overview](#overview)
1. [Structure](#structure)
1. [Usage](#usage)
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

![Applicaiton Structure](https://github.com/Pageworks/modular-design-pattern/blob/master/_assets/application-structure.png)

The runtime application will instantiate the initial modules and any submodules that are required will be instantiated by the module that requires them.

![Instantiation Structure](https://github.com/Pageworks/modular-design-pattern/blob/master/_assets/instantiation-structure.png)

# Usage

### Pseudocode

```
interface Application {
    public static Modules;
    public static Array<Module> = currentModules;

    public static createModule(View, UUID, parent = null) returns Module;
    public static deleteModule(UUID) returns void;

    private initModules() {
        requestedModules = getRequestedModules();
        foreach module in requestedModules {
            UUID = getUniversallyUniqueIdentifier();
            moduleInstance = Application.createModule(module.View, UUID);
            modulesInstance.init();
            push moduleInstance into Application.currentModules;
        }
    }
}
```

```
interface Modules {
    string : Module
}
```

```
interface Module {
    private View;
    private string UUID;
    private Module parent;
    public Array<Module> = submodules;

    constructor(View, UUID, parent = null);

    public init() {
        requiredModules = getRequestedModules();
        foreach submodule in requiredModules {
            UUID = getUniversallyUniqueIdentifier();
            submoduleInstance = Application.createModule(submodule.View, UUID, Module);
            submoduleInstance.init();
            push moduleInstance into submodules;
        }
    }
}
```

# License

The box is published under the [MIT](https://github.com/Pageworks/modular-design-pattern/blob/master/LICENSE) license.
