import { BaseComponent } from 'BaseComponent';

export class DemoComponent extends BaseComponent {
    
    public static String COMPONENT_NAME = "DemoComponent";
    
    private _cards: Array<HTMLElement>;

    constructor(el:HTMLElement, uuid:String, manager:ManagerClass){
        super(el, uuid, manager);
        this._cards = Array.from(this.el.querySelectorAll('.js-card'));
    };

    /**
     * Called when the `click` event fires on a card.
     */
    private changeColor:EventListener = (e:Event)=>{
        const target = <HTMLElement>e.currentTarget;
        target.style.backgroundColor = 'rgb(66, 134, 244)';
    }

    /**
     * Called when the `click` event fires on the share button.
     */
    private showSharingMenu:EventListener = (e:Event)=>{
        const target = <HTMLButtonElement>e.currentTarget;
        
        // Social media sharing menu logic
    }

    /**
     * Called when the module is created.
     */
    init():void{
        console.log(`Creating a new ${ DemoComponent.MODULE_NAME } module`);
        
        this._cards.forEach((card)=>{
            card.addEventListener('click', this.changeColor);
            const shareButton = card.querySelector('.js-share-button');
            shareButton.addEventListener('click', this.showSharingMenu);
        });
    }

    /**
     * Called when the module is being removed.
     */
    destroy():void{
        super.destroy(DemoComponent.MODULE_NAME);
    }
}