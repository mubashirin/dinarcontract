message Mint {
    to: Address;
    amount: Int;
}

contract GldJettonMaster(admin: Address, oracle: Address, total_supply: Int) {
    receive(msg: Mint) {
        if (sender() != self.admin) {
            throw(100);
        }
        self.total_supply += msg.amount;
    }

    get fun get_total_supply(): Int {
        return self.total_supply;
    }
}