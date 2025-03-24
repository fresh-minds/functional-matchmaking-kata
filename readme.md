# Functional Programming Videogame matchmaking kata
Partly taken from https://github.com/davidwhitney/CodeDojos


## Useful sources
- https://hoogle.haskell.org/?hoogle For finding Haskell functions 
- https://www.haskell.org/tutorial/functions.html
- https://www.haskell.org/tutorial/patterns.html
- https://hackage.haskell.org/package/CheatSheet-2.7/src/CheatSheet.pdf

## How to run
There are a couple of easy ways to start coding in Haskell

### Locally

#### Installing
1. Get ghcup https://www.haskell.org/ghcup/
2. Use ghcup to install ghc (the Haskell Compiler) and Cabal (build tool)
```
ghcup install ghc 9.10.1
ghcup install cabal
```
#### Running
To run the whole project use
2. Open the program in the interactive ghc shell using
```
cabal repl MatchMaker.hs
```
3. Run the program using
```
ghci> createDeathMatch
```
4. Reload file changes and recompile using
```
:reload
```

You can also run individual functions or modules.  
For example to run electHosts (defined in ElectHosts/ElectHosts.hs) with players (defined in Players.hs)
```
ghci> electHosts players
```

(Optionally) Get Visual Studio Code and download the Haskell Plugin


## The Kata

Matchmaking is a common part of online video games.  While reading the changelog for the latest revision of "Halo: The Master Chief Collection" (http://www.polygon.com/2014/12/8/7352941/another-major-update-hits-halo-the-master-chief-collection-for), it became apparent that it's something that can easily go wrong, and has lots of interesting subtleties - and is ripe for the slaying with some traditional TDD.

#### Matchmaking for games

Given a pool of players searching for a game, there are a number of factors to consider:

* The **skill** of the player
* The **latency / ping** of the player

For this Game we will organize free-for-all deathmatches. Meaning there will be one or more games with maximum 6 players each. There are no teams, every player is on its own.

From these factors, emerge *the following requirements*:

* Each game needs a host
* Each game should be balanced
* Players who are partied, should be in the same Game
* The game should be balanced
* The lower the latency of the host, the better
* Matchmaking should be as quick as possible

---  

## Lets build a matchmaker!

We have a pool of players all looking to play a balanced, 6 player, free-for-all deathmatch.

### Project setup
The source files for you to edit can be found in the MatchMaking dir.

The main code is in [MatchMaker.hs](MatchMaker/MatchMaker.hs). [Players.hs](MatchMaker/Players.hs) contains the Player and Game data types and a example list of players to test the application with. 
For the matchmaking process, [ElectHosts.hs](MatchMaker/ElectHosts.hs) and [BalancingGames.hs](MatchMaker/BalancingGames.hs) is used. For the implementation of the stories below, you should edit these two files. 

### Story 1 - Electing Hosts

    As a server
    When I have a queue of players waiting for a free for all deathmatch
    Then I should elect the most appropriate hosts for those matches

    Accept:
      Hosts should be as low-latency as possible

### Story 2 - Balancing games

    As a server
    When I have a pool of players waiting for a free for all deathmatch
    Then players in the game should be of roughly the same skill level

    Accept:
      Minimise the standard deviation of skill between players
      It's OK to make smaller, more balanced games if enough hosts are available

### Story 3 - Friends play together

    As a server
    When I form teams
    Then players who are partied together should be in the same Game

