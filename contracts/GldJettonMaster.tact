contract GldJettonMaster {
    address admin;
    address oracle;
    int total_supply;

    init(address _admin, address _oracle) {
        admin = _admin;
        oracle = _oracle;
        total_supply = 0;
    }

    receave("mint") {
        require(msg.sender = admin);
        let to = msg.body.getAddress();
        let amount = msg.body.getInt();
        total_supply += amount;
    }

    get price(): int {
        return oracle.run("price");
    }
}