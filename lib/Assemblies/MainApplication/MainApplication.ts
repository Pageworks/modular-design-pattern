import { Env } from 'Env';
import Pjax from '@codewithkyle/pjax';
import DeviceManager from '@codewithkyle/device-manager';
import { ModuleManager } from 'ModuleManager';

class MainApplication{

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
        // Start Pjax
        new Pjax({ debug: Env.isDebug });

        // Start Device Manager
        this._deviceManager = new DeviceManager(Env.isDebug, true);

        new ModuleManager();

        // Listen for a successful page transition event
        document.addEventListener('pjax:complete', this.handlePageLoad);
        document.addEventListener('pjax:scriptContentLoaded', this.invokeModuleManager);
    }

    private invokeModuleManager:EventListener = ()=>{
        // Manage the modules
        ModuleManager.manageModules();
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
        // Update custom touch status class tracking
        if(this._deviceManager !== null){
            this._deviceManager.reinit();
        }
    }
}

/**
 * IIFE for launching the application
 */
(()=>{
    new MainApplication();
})();
