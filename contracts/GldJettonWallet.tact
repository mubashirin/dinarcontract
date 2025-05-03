message Transfer {
    to: Address;
    amount: Int;
}

message InternalTransfer {
    amount: Int;
}

contract GldJettonWallet(owner: Address, balance: Int) {
    receive(msg: Transfer) {
        if (sender() != self.owner) {
            throw(100);
        }
        if (self.balance < msg.amount) {
            throw(101);
        }

        self.balance -= msg.amount;

        send(SendParameters {
            to: msg.to,
            value: 0,
            body: beginCell()
                .storeUint(0x01, 32)
                .storeInt(msg.amount, 64)
                .endCell()
        });
    }

    receive(msg: InternalTransfer) {
        self.balance += msg.amount;
    }

    get fun get_balance(): Int {
        return self.balance;
    }
}