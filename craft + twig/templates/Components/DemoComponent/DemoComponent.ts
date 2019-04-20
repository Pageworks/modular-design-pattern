export class DemoComponent extends BaseComponent {
    
    public static String COMPONENT_NAME = "DemoComponent";
    
    constructor(el:HTMLElement, uuid:String, manager:ManagerClass){
        super(el, uuid, manager);
    };

    private changeColor:EventListener = ()=>{
        console.log(`Creating a new ${ DemoComponent.MODULE_NAME } module`);
        this.el.style.backgroundColor = 'rgb(66, 134, 244)';
    }

    /**
     * Called when the module is created.
     */
    init():void{
        this.el.addEventListener('click', this.changeColor);
    }

    /**
     * Called when the module is being removed.
     */
    destroy():void{
        super.destroy(DemoComponent.MODULE_NAME);
    }
}