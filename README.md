<p align="center">
<!-- <a href="http://papertrain.io"><img alt="Papertrain" src="_papertrain/logo.png"/></a><br/> -->
<img style="display:inline-block;" src="https://img.shields.io/badge/markup-HTML-orange.svg?style=flat-square"/>
<img style="display:inline-block;" src="https://img.shields.io/badge/style-SASS-blue.svg?style=flat-square"/>
<img style="display:inline-block;" src="https://img.shields.io/badge/typescript-3.3-yellow.svg?style=flat-square"/>
<img style="display:inline-block;" src="https://img.shields.io/badge/bundler-webpack-5299c8.svg?style=flat-square"/>
<img style="display:inline-block;" src="https://img.shields.io/badge/CMS-Craft%203.1-ff69b4.svg?style=flat-square"/>
<a style="display:inline-block;" href="https://github.com/AndrewK9/papertrain/blob/master/LICENSE"><img src="https://img.shields.io/badge/license-MIT-lightgray.svg?style=flat-square"/></a>
</p>

# The Box
In order to think outside the box you first need to define the box.

# Goals
#### User Focused
Create a framework that handles the minor utilities needed for providing a better experience by transitioning traditional afterthought design decisions to forethoughts.

#### Unify
Provide a basic and simple structure for naming elements and writing scripts with a focus on limiting friction during collaborative projects.

#### Inspire
Provide a flexible foundation that inspires developers to create, innovate, and share.

# Principles
#### Motion Provides Meaning
Motion focuses attention and maintains continuity, through subtle feedback and coherent transitions. As elements appear on screen, they transform and reorganize the environment, with interactions generating new transformations.

#### Cross-Platform
Projects should be optimized for the best user experience across all platforms. The basic product should maintain the design and feel of the target platform, however, the user interactions, content, and motion should change to work best for the active platform.

# CSS
- Using [SASS](https://sass-lang.com/) as the CSS preprocessor
- CSS architecture based on concepts by [Harry Roberts](https://csswizardry.com/2011/08/building-better-grid-systems/)
- Minimal BEM like CSS Syntax `.o-object -modifier`
- SASS snippets from [Intuit](https://github.com/intuit)
- Using [Transparent UI Namespaces](https://csswizardry.com/2015/03/more-transparent-ui-code-with-namespaces/)
- Limit transitions and animations to **ONLY** `opacity` and `transform`

### Grid System
Uses the CSS grid layout. This means we have chosen not to support IE 11 and lower, if you must support legacy browsers please consider a different framework or creating and maintaining your own fork of The Box.

# Typescirpt
- Uses a TypeScript module class structure
- Modules instantiated via HTML attributes: `data-module="ModuleName SecondModule"`
- All DOM related JavaScript is hooked to `js-` prefixed classes
- jQuery is **NOT** included and should be avoided whenever possible

# Page Transitions
Using [pjax](https://github.com/codewithkyle/pjax) for page transitions and link prefetching Build custom page transitions with the Transition Manager class.

# License
[MIT](https://github.com/codewithkyle/the-box/blob/master/LICENSE)
