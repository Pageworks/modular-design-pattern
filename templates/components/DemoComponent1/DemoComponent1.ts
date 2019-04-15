import { BaseModule } from 'BaseModule';

export class DemoComponent1 extends BaseModule{
    public static MODULE_NAME:string = 'DemoComponent1';

    constructor(el:HTMLElement, uuid:string, manager:ModuleManager){
        super(el, uuid, manager);

        if(this.isDebug){
            console.log(`Creating a new ${ DemoComponent1.MODULE_NAME } module`);
        }
    }

    /**
     * Called when the module is created.
     */
    init(){
        console.log('Component 1 started');
        this.el.addEventListener('mouseenter', (e)=>{
            if(this.el.classList.contains('is-alt')){
                this.el.classList.remove('is-alt');
            }else{
                this.el.classList.add('is-alt');
            }
        });
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

console.log('loaded');
