import userManager from "../../infraestructure/driven/userManager";

export interface Input {
    tenandId: string;
}

export interface SubscriptionPlan {
    name: string;
    price: number;
    features: string[]; 
}

export interface UserProfile {
    firstName: string;
    lastName: string;
    dateOfBirth: Date;
    address: string;
    phoneNumber: string;
    countryCode: string;
    ciudad: string;
    zipcode: string;
    subscription: SubscriptionPlan;
}

export interface User {
    id: number;
    username: string;
    email: string;
    tenantId: number;
    profile: UserProfile;
}

export interface Output {
    user: User;
}

export interface DependenciesType {
    logger: Console;
    userManager: userManager;
};