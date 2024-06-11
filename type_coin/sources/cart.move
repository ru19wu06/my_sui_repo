
module cart::cart {

    use sui::coin;

    public struct CART has drop {}

    fun init(otw: CART, ctx: &mut TxContext){
        let (treasury_cap, metadata) = coin::create_currency<CART>(
            otw,
            9,  
            b"DAIWEE",
            b"DAIWEE Coin",
            b"DAIWEE good Coin",
            option::none(),
            ctx
        );

        transfer::public_transfer(treasury_cap, ctx.sender());
        transfer::public_freeze_object(metadata);
    }
}