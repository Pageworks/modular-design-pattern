import { Pjax } from '@codewithkyle/pjax';
import { ModuleManager } from '@codewithkyle/ModuleManager';
import { Env } from 'Env';

class Base{

    constructor(){
        
        if(Env.isDebug){
            console.log('The Manager has started their shift');
        }

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

        new ModuleManager();

        // Listen for a successful page transition event
        document.addEventListener('pjax:complete', this.handlePageLoad);
    }

    /**
     * Called when a new page is loaded via Pjax.
     * Any classes/packages that need to manage their DOM hooks should be told to reinit.
     */
    public reinit():void{
        ModuleManager.update();
    }
}

// IIFE used to start the Manager class
(()=>{
    new Base();
})();