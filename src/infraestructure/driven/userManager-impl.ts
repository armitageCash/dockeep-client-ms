import userManager from "../driven/userManager";

class userManagerImpl implements userManager {
    constructor(private logger: any) {

    }

    async getusers() {
        try {
            return [];
        } catch (error) {
            this.logger.error("userManagerImpl:getusers", error);
        }
    };
}

export default userManagerImpl;