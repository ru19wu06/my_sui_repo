
module cart::cart {

    use sui::coin::{self, Coin, TreasuryCap};
    use sui::tx_context::TxContext;
    use sui::url::Url;

    public struct CART has drop {}

    fun init(otw: CART, ctx: &mut TxContext){
        let initial_supply = 0;
        TreasuryCap<CART> {
            total_supply: initial_supply
        }

        let icon_url = Url::create("https://upload.wikimedia.org/wikipedia/en/5/5f/Original_Doge_meme.jpg");
        let (treasury_cap, metadata) = coin::create_currency<CART>(
            otw,
            9,  
            b"DAIWEE",
            b"DAIWEE Coin",
            b"DAIWEE good Coin",
            option::some(icon_url),
            ctx
        );

        let new_coin = Coin<MyCoin> {
            value: 500_000_000_000
        };


        transfer::public_transfer(treasury_cap, ctx.sender());
        transfer::public_freeze_object(metadata);
    }
}