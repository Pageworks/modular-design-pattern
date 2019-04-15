import * as uuid from 'uuid/v4';
import { Env } from './Env';

export class ModuleManager{

    private static _modules:Array<IModule> = [];

    constructor(){
        ModuleManager.initModules();
    }

    /**
     * Called when a new page is loaded via AJAX.
     */
    public static wrangleModules():void{
        this.initModules();
        this.removeModules();
    }

    /**
     * Parses supplied string and returns an array of module names.
     * @returns `string[]`
     * @param { string } data - a string taken from an elements `data-modules` attribute
     */
    private static getModuleNames(data:string): Array<string>{
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
    private static initModules():void{
        console.log('Getting modules');
        // Get all elements with a `data-module` attribute
        const moduleEls:Array<HTMLElement> = Array.from(document.body.querySelectorAll('[data-module]'));

        // Do nothing if no modules are required
        if(!moduleEls.length){
            return;
        }

        // Loop through all of the elements
        moduleEls.forEach((el:HTMLElement)=>{

            // Check if the module has already been created (has uuid)
            if(!el.dataset.uuid){

                // Get the requested module name(s)
                const moduleNames:Array<string> = ModuleManager.getModuleNames(el.dataset.module);
                const newUUID = uuid();

                // If the `data-module` attribute isn't empty create the modules
                if(moduleNames.length){

                    // Loop through all of the names
                    moduleNames.forEach((id:string)=>{

                        // Check that the class object is defined
                        if(modules[id] !== undefined){

                            // Create a new instance of the module
                            const newModule = new modules[id].prototype.constructor(el, newUUID, this);
                            this._modules.push(newModule);
                            newModule.init();
                        }
                        else if(modules[id] === undefined){
                            if(Env.isDebug){
                                console.error(`Module ${ id } is undefined`);
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
    private static removeModules():void{
        // Get all elements with a `data-module` attribute
        const moduleEls:Array<HTMLElement> = Array.from(document.body.querySelectorAll('[data-module]'));
        const deadModules:Array<IModule> = [];

        // Do nothing if no elements needing modules exist
        if(!moduleEls.length){
            return;
        }

        // Loop through all of the modules that have been created
        this._modules.forEach((module)=>{

            // Assume the module is dead
            let survived:boolean = false;

            // Loop through all of the elements that require modules
            moduleEls.forEach((el:HTMLElement)=>{

                // Check if any of the elements have a matching UUID to the module
                if(el.dataset.uuid === module.uuid){
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
    public static removeModule(uuid:string):void{

        // Ensure a UUID was provided
        if(!uuid){
            if(Env.isDebug){
                console.error('UUID value was not provided');
                return;
            }
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
}
