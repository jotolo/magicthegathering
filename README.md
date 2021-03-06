## Cards CLI
This is a CLI to query [api.magicthegathering.io](https://api.magicthegathering.io/v1/cards) endpoint.

#### Usage
```bash
Usage: cards_cli [options]    
    -c, --colors FIELDS              Colors for filtering. Comma separated value. Eg: Blue,Red,White
    -l, --legalities FIELDS          Legality Formats for filtering. Comma separated value. Eg: "Commander,Legacy,Khans of Tarkir Block"
    -g, --group FIELDS               Fields for grouping. Comma separated value. Eg: set,rarity
    -p, --page COUNT                 Page amount to analize. Number
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

#### Merging options
```ruby
# Return cards containing "Khans of Tarkir Block" in the format and grouped by set and then by rarity.
ruby cards_cli.rb -l "Khans of Tarkir Block" -g set,rarity

# Return cards containing "Khans of Tarkir Block" in the format, with color Red and grouped by rarity in the first 3 pages.
ruby cards_cli.rb -l "Khans of Tarkir Block" -c Red -g rarity -p 3

```

#### Response Format
The CLI tool answer is given in JSON format.