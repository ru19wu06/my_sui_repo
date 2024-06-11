module cart::cart {
    use sui::coin::{self, Coin, TreasuryCap};
    use sui::tx_context::TxContext;
    use sui::url::Url;

    public struct CART has drop {}

    fun init(otw: CART, ctx: &mut TxContext){
        let initial_supply = 500_000_000_000;  // Assume a non-zero initial supply
        let icon_url = Url::create("https://example.com/coin.jpg");  // Properly create a URL

        let (treasury_cap, metadata) = coin::create_currency<CART>(
            otw,
            9,
            b"DAIWEE",
            b"DAIWEE Coin",
            b"DAIWEE good Coin",
            option::some(icon_url),
            ctx
        );

        transfer::public_transfer(treasury_cap, ctx.sender());
        transfer::public_freeze_object(metadata);
    }
}
