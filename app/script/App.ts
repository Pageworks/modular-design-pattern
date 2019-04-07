import { Env } from './Env';
import Pjax from '@codewithkyle/pjax';
import DeviceManager from '@codewithkyle/device-manager';

class App{

    private _deviceManager: any;

    constructor(){
        this._deviceManager = null;
        this.init();
    }

    /**
     * Called when the class first loads.
     * Use this method to launch any additional classes/packages.
     */
    private init(): void{
        // Start the Enviroment class
        new Env();

        // Start Pjax
        new Pjax({ debug: Env.isDebug });

        // Start Device Manager
        this._deviceManager = new DeviceManager(Env.isDebug, true);

        // Listen for a successful page transition event
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
        if(this._deviceManager !== null){
            this._deviceManager.reinit();
        }
    }
}

/**
 * IIFE for launching the application
 */
(()=>{
    new App();
})();
