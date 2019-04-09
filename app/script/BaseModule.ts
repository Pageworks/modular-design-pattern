import { Env } from './Env';

export class BaseModule{

    public el:      HTMLElement;
    public uuid:    string;
    public manager: ModuleManager;
    public isDebug: boolean;

    constructor(el:HTMLElement, uuid:string, manager:ModuleManager){
        this.el         = el;
        this.uuid       = uuid;
        this.manager    = manager;
        this.isDebug    = Env.isDebug;

        this.el.dataset.uuid = this.uuid;
    }

    public init():void{}

    public destroy(MODULE_NAME:string):void{
        this.el.removeAttribute('data-uuid');
        if(this.isDebug){
            console.log(`${ MODULE_NAME } has been removed`);
        }
    }

}
