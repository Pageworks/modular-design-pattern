interface IModule{
    index:      string;
    destroy:    Function;
    init:       Function;
    uuid:       string;
}

declare class Manager{
    public manageModules:    Function;
    public createModule(moduleId:string, el:HTMLElement):void;
}

declare const modules: { [index:string]: Function };