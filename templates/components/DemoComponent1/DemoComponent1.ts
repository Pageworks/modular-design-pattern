import { BaseModule } from 'BaseModule';
import { ModuleManager } from 'ModuleManager';

export class DemoComponent1 extends BaseModule{
    public static MODULE_NAME:string = 'DemoComponent1';

    constructor(el:HTMLElement, uuid:string, manager:ModuleManager){
        super(el, uuid, manager);
    }

    /**
     * Called when the module is created.
     */
    init(){

    }

    /**
     * Called when the module is being removed.
     */
    destroy(){
        super.destroy(DemoComponent1.MODULE_NAME);
    }
}

// Adds module to the global Modules object
modules[DemoComponent1.MODULE_NAME] = DemoComponent1;
ModuleManager.wrangleModules();
