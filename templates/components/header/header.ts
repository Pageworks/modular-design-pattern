import { BaseModule } from '../../../app/script/BaseModule';

export class Header extends BaseModule{
    public static MODULE_NAME:string = 'Header';

    constructor(el:HTMLElement, uuid:string, manager:ModuleManager){
        super(el, uuid, manager);

        if(this.isDebug){
            console.log(`Creating a new ${ Header.MODULE_NAME } module`);
        }
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
        super.destroy(Header.MODULE_NAME);
    }
}

// Adds module to the global Modules object
modules[Header.MODULE_NAME] = Header;
