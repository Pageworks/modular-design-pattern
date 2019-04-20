export class BaseComponent{

    public el:      HTMLElement;
    public uuid:    string;
    public manager: Manager;
    public isDebug: boolean;

    constructor(el:HTMLElement, uuid:string, manager:Manager){
        this.el         = el;
        this.uuid       = uuid;
        this.manager    = manager;

        this.el.dataset.uuid = this.uuid;
    }

    public init():void{}

    public destroy(MODULE_NAME:string):void{
        this.el.removeAttribute('data-uuid');
    }

}
