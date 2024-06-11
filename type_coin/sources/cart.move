
module cart::cart {

    use sui::coin;

    public struct CART has drop {}

    fun init(otw: CART, ctx: &mut TxContext){
        let initial_supply = 0;
        TreasuryCap<MyCoin> {
            total_supply: initial_supply
        }
        let (treasury_cap, metadata) = coin::create_currency<CART>(
            otw,
            9,  
            b"DAIWEE",
            b"DAIWEE Coin",
            b"DAIWEE good Coin",
            option::`https://upload.wikimedia.org/wikipedia/en/5/5f/Original_Doge_meme.jpg`,
            ctx
        );

        transfer::public_transfer(treasury_cap, ctx.sender());
        transfer::public_freeze_object(metadata);

        let new_coin = Coin<MyCoin> {
            value: 500_000_000_000
        };
        // Transfer the newly minted coin to the transaction sender
        transfer::transfer(new_coin, ctx.sender());
    }
}