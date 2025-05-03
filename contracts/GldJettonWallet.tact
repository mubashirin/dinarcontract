contract GldJettonWallet {
    address owner;
    int balance;

    init(address _owner) {
        owner = _owner;
        balance = 0;
    }

    receive("transfer") {
        require(msg.sender == owner);
        let to = msg.body.getAddress();
        let amount = msg.body.getInt();
        require(balance >= amount);
        balance -= amount;
        send(to, "internal_transfer", amount);
    }

    receive("internal_transfer") {
        let amount = msg.body.getInt();
        balance += amount;
    }

    get get_balance(): int {
        return balance;
    }
}