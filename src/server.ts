import { DependenciesType } from "./domain/users"

const buildScope: (adapter: any) => AppScope = (adapter) => new AppScope(adapter);

class AppScope {
    private dependencies: any;
    private instances: any;
    private adapter: any;

    constructor(adapter: any) {
        this.adapter = adapter;
        this.dependencies = {};
    }

    register(factory: (dependencies: DependenciesType) => void): this {
        factory(this.dependencies);
        return this;
    }

    async execute(data?: any) {
        const { logger } = this.dependencies;

        try {
            if (data) {
                const result = await this.adapter(data, this.dependencies);
                return result;
            }

            const result = await this.adapter(this.dependencies);
            return result;
        } catch (error) {
            logger.error("AppScope:execute", error);
        }
    }
}

export {
    buildScope
}