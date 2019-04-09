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

    private static removeModules():void{

    }
}
