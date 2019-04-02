export default class Env {

    public static PJAX_CONTAINER:string = '.js-pjax';
    public static SCROLL_TRIGGER:number = 100;
    public static APP_NAME:string       = 'REPLACE_ME';
    public static isDebug:boolean       = false;

    public static EASING:IEasingObject   = {
        ease: 'cubicBezier(0.4, 0.0, 0.2, 1)',
        in: 'cubicBezier(0.0, 0.0, 0.2, 1)',
        out: 'cubicBezier(0.4, 0.0, 1, 1)',
        sharp: 'cubicBezier(0.4, 0.0, 0.6, 1)'
    };


    constructor(){
        if(window.location.hostname.match(/.local/gi)){
            // Checks if the hostname is set to `.local`
            Env.setDebug(true);
        }
        else if(document.documentElement.getAttribute('debug') !== null){
            // Checks if the `debug` attribute is set on the `document
            Env.setDebug(true);
        }
        console.log('Env started');
    }

    /**
     * Sets the static `Env.isDebug` status to the provided parameter.
     * @param status - `boolean`
     */
    public static setDebug(status:boolean): void{
        Env.isDebug = status;
    }
}
