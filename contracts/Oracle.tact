message UpdatePrice {
    value: Int;
}

contract Oracle(admin: Address, price: Int) {
    receive(msg: UpdatePrice) {
        if (sender() != self.admin) {
            throw(101);
        }
        self.price = msg.value;
    }

    get fun get_price(): Int {
        return self.price;
    }
}
