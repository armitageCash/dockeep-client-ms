import { DependenciesType, Output, Input} from "../../../domain/users"

export type CaseType = (input: Input, dependencies: DependenciesType) => Promise<Output | null>;

export const userCase = (): CaseType => async (input, dependencies) => {
    const { logger, userManager } = dependencies;
    return userManager.getusers();
}