declare module 'uuid/v4';
declare module 'animejs';

interface IEasingObject{
    ease:   string;
    in:     string;
    out:    string;
    sharp:  string;
}

interface IModule{
    index:      string;
    destroy:    Function;
    init:       Function;
    uuid:       string;
}

declare class ModuleManager{
    public static wrangleModules:   Function;
}

declare const modules: { [index:string]: Function };
