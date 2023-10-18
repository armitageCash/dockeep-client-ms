import userManager from "../../infraestructure/driven/userManager";

export interface Input {
    email: string;
    password: string;
}

export interface Iuser {
    email: string;
    password: string;
}

export interface Output {
    email: string;
    password: string;
}

export interface DependenciesType {
    logger: Console;
    userManager: userManager;
};