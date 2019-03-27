import Env from './Env';
import Pjax from '@codewithkyle/pjax';

export default class App{
    constructor(){
        this.init();
    }

    /**
     * Called when the class first loads.
     * Use this method to launch any additional classes/packages.
     */
    private init(): void{
        new Env();
        new Pjax({ debug: Env.isDebug });

        document.addEventListener('pjax:complete', this.handlePageLoad);
    }

    /**
     * Called when Pjax fires it's custom `pjax:complete` event on the `document`.
     */
    private handlePageLoad:EventListener = ()=>{
        this.reinit();
    }

    /**
     * Called when a new page is loaded via Pjax.
     * Any classes/packages that need to manage their DOM hooks should be told to reinit.
     */
    public reinit():void{

    }
}

/**
 * IIFE for launching the application
 */
(()=>{
    new App();
})();
