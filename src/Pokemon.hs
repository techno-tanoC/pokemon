module Pokemon where

type Name = String
type Attack = Type
type Defend = Type
type Power = Double
type Damege = Double
type Scale = Double
type Moves = [Move]

data Type = Fire | Water | Grass deriving Show
data Move = Move {
    mName :: Name
  , mType :: Attack
  , power :: Power
}
data Pokemon = Pokemon {
    pName :: Name
  , pType :: Defend
  , moves :: Moves
}

ember, bubble, vineWhip :: Move
ember    = Move "Ember" Fire 40
bubble   = Move "Bubble" Water 40
vineWhip = Move "Vine Whip" Grass 45

bulbasaur, charmander, squirtle :: Pokemon
bulbasaur = Pokemon "Bulbasaur" Grass [vineWhip]
charmander = Pokemon "Charmander" Fire [ember]
squirtle = Pokemon "Squirtle" Water [bubble]

scale :: Attack -> Defend -> Scale
scale a d = case (a, d) of
  (Fire,  Fire)  -> 0.5
  (Fire,  Water) -> 0.5
  (Fire,  Grass) -> 2
  (Water, Fire)  -> 2
  (Water, Water) -> 0.5
  (Water, Grass) -> 0.5
  (Grass, Fire)  -> 0.5
  (Grass, Water) -> 2
  (Grass, Grass) -> 0.5

calc :: Move -> Pokemon -> Damege
calc (Move _ a p) (Pokemon _ d _) = p * scale a d
