import Env from './Env';
import Pjax from '@codewithkyle/pjax';

export default class App{
    constructor(){
        this.init();
    }

    /**
     * Called when the class first loads.
     */
    private init(): void{
        new Pjax({ debug: Env.isDebug });
    }
}

/**
 * IIFE for launching the application
 */
(()=>{
    new App();
})();
