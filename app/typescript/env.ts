export default class Env {
    public static PJAX_CONTAINER:string = '.js-pjax';
    public static SCROLL_TRIGGER:number = 100;
    public static APP_NAME:string       = 'REPLACE_ME';
    public static EASING:EasingObject   = {
        ease: 'cubicBezier(0.4, 0.0, 0.2, 1)',
        in: 'cubicBezier(0.0, 0.0, 0.2, 1)',
        out: 'cubicBezier(0.4, 0.0, 1, 1)',
        sharp: 'cubicBezier(0.4, 0.0, 0.6, 1)'
    };

    public static isDebug:   boolean;

    constructor(){
        Env.isDebug   = false;
    }

    public static setDebug(status:boolean): void{
        Env.isDebug = status;
    }
}
