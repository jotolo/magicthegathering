## Cards CLI
This is a CLI to query [api.magicthegathering.io](https://api.magicthegathering.io/v1/cards) endpoint.

#### Usage
```bash
Usage: cards_cli [options]
    -g, --group FIELDS               Fields for grouping. Comma separated value. Eg: set,rarity
    -c, --colors FIELDS              Colors for filtering. Comma separated value. Eg: Blue,Red,White
    -l, --legalities FIELDS          Legality Formats for filtering. Comma separated value. Eg: "Commander,Legacy,Khans of Tarkir Block"
    -h, --help                       Show this help message
```

#### Examples
```ruby
# Getting all cards with only Red and Blue colors. 
ruby cards_cli.rb -c Red,Blue

# Getting all cards with at least one Legality Format specified. 
ruby cards_cli.rb -l "Legacy,Khans of Tarkir Block"

# Grouping all cards first by set and then by rarity. 
ruby cards_cli.rb -g set,rarity
```