import { Pjax } from '@codewithkyle/pjax';
import * as uuid from 'uuid/v4';

class Manager{

    private _modules:Array<IModule> = [];

    constructor(){
        console.log('The Manager has started their shift');
        this.init();
    }

    /**
     * Called when Pjax fires it's custom `pjax:complete` event on the `document`.
     */
    private handlePageLoad:EventListener = ()=>{
        this.reinit();
    }

    private init():void{
        // Start Pjax
        new Pjax({ debug: true });

        // Listen for a successful page transition event
        document.addEventListener('pjax:complete', this.handlePageLoad);
    }

    /**
     * Called when a new page is loaded via Pjax.
     * Any classes/packages that need to manage their DOM hooks should be told to reinit.
     */
    public reinit():void{
        this.manageModules();
    }

    /**
     * Called when a new page is loaded via AJAX.
     */
    public manageModules():void{
        this.initModules();
        this.removeModules();
    }

    /**
     * Parses supplied string and returns an array of module names.
     * @returns `string[]`
     * @param { string } data - a string taken from an elements `data-modules` attribute
     */
    private getModuleNames(data:string): Array<string>{
        // Trim whitespace and spit the string by whitespace
        let modules = data.trim().split(/\s+/gi);

        // Fixes array for empty `data-module` attributes
        if(modules.length === 1 && modules[0] === ''){
            modules = [];
        }

        return modules;
    }

    /**
     * Get all the elements with a `data-module` attribute.
     * If the module hasn't been created (no uuid data attribute), create one.
     */
    private initModules():void{
        // Get all elements with a `data-module` attribute
        const moduleEls:Array<HTMLElement> = Array.from(document.body.querySelectorAll('[data-component]'));

        // Do nothing if no modules are required
        if(!moduleEls.length){
            return;
        }

        // Loop through all of the elements
        moduleEls.forEach((el:HTMLElement)=>{

            // Check if the module has already been created (has uuid)
            if(!el.dataset.uuid){

                // Get the requested module name(s)
                const moduleNames:Array<string> = this.getModuleNames(el.dataset.module);
                const newUUID = uuid();

                // If the `data-module` attribute isn't empty create the modules
                if(moduleNames.length){

                    // Loop through all of the names
                    moduleNames.forEach((id:string)=>{

                        // Try to create the module
                        try{
                            // Create a new instance of the module
                            const newModule = new modules[id].prototype.constructor(el, newUUID, this);
                            this._modules.push(newModule);
                            newModule.init();

                            // Check if the module was waiting for its class
                            if(el.dataset.waitingForModule){
                                // Remove the attribute if it was waiting
                                el.removeAttribute('data-waiting-for-module');
                            }
                        }
                        // Catch if the module is undefined
                        catch{
                            if(!el.dataset.waitingForModule){
                                // The module is waiting for its class to load
                                el.dataset.waitingForModule = 'true';
                            }
                        }
                    });
                }
            }
        });
    }

    /**
     * Get all the elements with a `data-module` attribute.
     * When a module no longer has an element destroy it.
     */
    private removeModules():void{

        // Do nothing if no modules need to be removed
        if(!this._modules.length){
            return;
        }

        // Get all elements with a `data-module` attribute
        const moduleEls:Array<HTMLElement> = Array.from(document.body.querySelectorAll('[data-component]'));
        const deadModules:Array<IModule> = [];

        // Loop through all of the modules that have been created
        this._modules.forEach((module)=>{

            // Assume the module is dead
            let survived:boolean = false;

            // Loop through all of the elements that require modules
            moduleEls.forEach((el:HTMLElement)=>{

                // Check if any of the elements have a matching UUID to the module
                if(el.dataset.uuid === module.uuid || el.dataset.waitingForModule){
                    survived = true;
                    return;
                }
            });

            // Check if the module survived
            if(!survived){
                deadModules.push(module);
            }
        });

        // Check if there are dead modules to remove
        if(deadModules.length){

            // Loop through the dead modules
            deadModules.forEach((deadModule)=>{

                // Loop through the current modules
                this._modules.forEach((module)=>{

                    // Check if the dead module is the same as the tracked module
                    if(deadModule.uuid === module.uuid){

                        // Trigger the modules destruction
                        module.destroy();

                        // Get the modules index in the modules array
                        const index = this._modules.indexOf(module);

                        // Splice the module from the array
                        this._modules.splice(index, 1);
                    }
                });
            });
        }
    }

    /**
     * Removes a module based on the provided UUID.
     * @param uuid - `string`
     */
    public removeModule(uuid:string):void{

        // Ensure a UUID was provided
        if(!uuid){
            return;
        }

        // Loop through all of the modules
        this._modules.forEach((module)=>{

            // Find the module that matches the provided UUID
            if(module.uuid === uuid){

                // Trigger the modules destruction
                module.destroy();

                // Get the modules index in the modules array
                const index = this._modules.indexOf(module);

                // Splice the module from the array
                this._modules.splice(index, 1);
            }
        });
    }

    /**
     * Creates a module on an element.
     * @param moduleId - `string` key of the module in the global `modules` object
     * @param el - `HTMLElement` that the module will be attached to
     */
    public createModule(moduleId:string, el:HTMLElement):void{
        if(typeof modules[moduleId] === undefined){
            return;
        }

        const newUUID = uuid();

        // Try to create the module
        try{
            // Create a new instance of the module
            const newModule = new modules[moduleId].prototype.constructor(el, newUUID, this);
            this._modules.push(newModule);
            newModule.init();
        }
        // Catch if the module is undefined
        catch{
            console.error(`Module ${ moduleId } is undefined`);
        }
    }
}

// IIFE used to start the Manager class
(()=>{
    new Manager();
})();