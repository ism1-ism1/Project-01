/*
    Project 01
    
    Requirements (for 15 base points)
    - Create an interactive fiction story with at least 8 knots 
    - Create at least one major choice that the player can make
    - Reflect that choice back to the player
    - Include at least one loop
    
    To get a full 20 points, expand upon the game in the following ways
    [+2] Include more than eight passages
    [+1] Allow the player to pick up items and change the state of the game if certain items are in the inventory. Acknowledge if a player does or does not have a certain item
    [+1] Give the player statistics, and allow them to upgrade once or twice. Gate certain options based on statistics (high or low. Maybe a weak person can only do things a strong person can't, and vice versa)
    [+1] Keep track of visited passages and only display the description when visiting for the first time (or requested)
    
    Make sure to list the items you changed for points in the Readme.md. I cannot guess your intentions!

*/

VAR health = 5
VAR water = 0
VAR knowledge = 0
VAR time = -1
VAR diamonds = 0

-> start

== start ==

You walk through a starch desert, dragging your tired feet across its rolling mounds of red sand. Checking your pocket watch, you see you have been searching for four days now. You feel like you're about to finally colapse until you notice something upon the horizon.

* [Approach the structure.] -> well

-> DONE

== well ==

{not fillflask: {not ask1: You walk up to what appears to be a water well. It appears quite old and dusty. The brick base is crumbling and its wooden roof seems close to colapse. Your flask is running empty but you aren't sure if the water is safe. {not badidea1: You're a little conflicted on if you should risk wasting your energy for dirty water until you hear a soft voice state, "The waterrrr... is safe for your consumptionnnn." You turn your head to see a large albino snake resting upon the wooden roof of the well. You figure that you are actually loosing it now and that this snake isn't actually talking... but, you do still need water.}}} {fillflask: The snake seems pleased that you have listened to it and stares down at the map in your pocket.} What do you do?

* [Ask the snake how it knows the water is safe.] -> ask1
+ [Fill your flask up a little.] -> fillflask
+ {not fillflask} [Ignore the snake and walk away from the well.] -> badidea1
* {fillflask} [Check your map.] -> questtalk

-> DONE

== fillflask ==

~ water = water + 1

{water < 5:You fill your flask with a little bit of water from the well.} {water >= 5:Your flask is already completely filled.} 

-> well

== ask1 ==

You decide to give into your insanity a little bit by questioning the snake on the validity of its statement. The snake responds with, "I am speaking honestlyyyy... I drink from this water well nearly each day and nightttt." The snake doesn't sound like it is lying but its hard to read their tone through its heavy accent.

-> well

== badidea1 ==

You decide to not trust the snake and walk away from the well. The snake says, "Bad ideaaaa... Best to come back and... take a drinkkkk." Listen to the snake or keep going?

* [Keep walking] -> badidea2
* [Return to the well.] -> well

->DONE

== badidea2 ==

You keep walking and quickly learn that without any water, your body isn't feeling up to being alive anymore. You pass out under the blistering sun and your life fades out of your body... and you die. Moron.

BAD END: DEHYDRATION

->DONE

/*Real game starts here*/

== questtalk ==

You pull your map out from your pocket and unroll it. This map was given to you on the start of your journey into the desert, yet you have never been able to understand it. Pictures of structures are crude and words are written in a language you do not know. You try to make any sense of the map once more until the snake leans down from the well's roof and says, "So you ARE here for thatttt... I assumed as much to be trueeee... The sacred waterssss.~" The snake wraps itself around your shoulders to support itself as it looks at your map. "This language issss... beyong human conceptionnnn... Need a translatorrrr?" You know you're never going to figure out this map yourself so you decide to let this talking snake do its thing. "Wonderfullll... I shall put this in terms that your human mind can comprehendddd... Simply put, to the west lays a sinkhole of ancient orgin, to the east is a tall cave, and due north is the oldest libraryyyy... oh, and this here well lies directly in the center of the mapppp... You shall find the three trail givers in each locationnnn." The snake then returns to its position upon the well"s decrepid roof.

* [Close the map.] -> center

->DONE

== center ==

You stand before the well on the center of your map. The albino snake rests upon the well's roof. It is currently { advance_time() }. What comes next for your journey?

+ [Travel to the west sinkhole.] -> travelwest
+[ Travel to the north library.] -> travelnorth
+ [Travel to the east cave.] -> traveleast
+ [Ask the snake some questions.] -> snaketalk
+ [Refill your flask.] -> refillflask
+ [Rest for a while.] -> timepass
* {diamonds == 3} [Offer the three diamonds to the snake.] -> wellmagic

-> DONE

== wellmagic ==

The snake sees the three diamonds in your hands and realizes you have completed the three trials. "Well done travelerrrr... You have earned your access to the sacred waterssss... Conviently for you, they are right hereeee." The snake takes the three diamonds and drops them into the well. A bright light shines up from the well and when you peer down into it, you see the water holds a mosaic like beauty in its appearence. 

* {knowledge == 3} [Tell the snake the truth you have learned.] -> bestend
* [Take the water and leave.] -> normalend

-> DONE

== normalend ==

You fill your flask with the sacred waters and without another word, you leave to return to your hometown... wanting to move on from this whole experience.

NORMAL END.

->DONE

== bestend ==

Using the sacred knowledge you have gathered throughout your journey, you look up to the snake and tell it the truth. The truth that this whole scenario is a mediorce game made by someone without much skill. I mean come on, the whole east section was clearly rushed! There wasn't even a puzzle! Not that you could consider the other puzzles any good either but still. Like seriously, whats the point of the diamonds? Why do you even want this magic water? To heal your bordom from such a dumb experience? I mean COME ON- The snake then bites your head off.

BEST END. NOW GO AWAY. :)

->DONE

== refillflask ==

~ water = water + 1

{water < 5:You fill your flask with a little bit of water from the well.} {water >= 5:Your flask is already completely filled.} 

-> center

== timepass ==

You rest for a while and let time pass for a bit.

->center

== snaketalk ==

You approach the albino snake resting atop the well to ask some questions.

+ [Why are you here?] -> whyhere
+ [Can you tell me about the trials?] -> telltrials
+ [How did you know about my quest?] -> knowquest
+ [Tell me about the sacred waters.] -> tellsacredwater
+ [Tell me about some sacred knowledge.] -> tellsacredknowledge
+ {not petsnake} [May I pet you?] -> maypet
+ {petsnake} [Pet the snake again.] -> petsnakeagain

-> DONE

== whyhere ==

You question the snake for the reason to which it is staying upon this well. The snake simply turns to you and says, "Waterrrr." Fair enough.

+ [Ask another question.] -> snaketalk
+ [Stop asking questions.] -> center

-> DONE

== telltrials ==

You ask the snake for information on the trials you have to complete. "Quite simple stuff in truthhhh... To the west is the trial of nobalismmmm... The north holds the trial of intelectttt... and the east is where the trial of strenght awaitssss... You would be better of to prepare yourself for whatever awaitssss."

+ [Ask another question.] -> snaketalk
+ [Stop asking questions.] -> center

-> DONE

== knowquest ==

You ask the snake how it knew you were here for the sacred waters. "Not much out hereeee... You're the only human I've ever seen out here sooo... it is only logical you would be here for itttt."

+ [Ask another question.] -> snaketalk
+ [Stop asking questions.] -> center

-> DONE

== tellsacredwater

You ask the snake for what is knows about the sacred water. "It is an acient gift from a higher beingggg... It holds the ability to heal any wounds, both physical and notttt... It has gone unsued for a very very long timeeee... Its location? I am not at liberty to sayyyy."

+ [Ask another question.] -> snaketalk
+ [Stop asking questions.] -> center

-> DONE

== tellsacredknowledge ==

You ask the snake to tell you some sacred knowledge. The snake chuckles. "That knowledge is ancient and doen't exist in the same form as your basic human intelectttt... The more sacred knowledge one knows, the more intelegent that individual's brain issss."

* {petsnake} [Request to be bestowed with sacred knowledge.] -> knowledgegift
+ [Ask another question.] -> snaketalk
+ [Stop asking questions.] -> center

-> DONE

== knowledgegift ==

~ knowledge = knowledge + 1

The snake chuckles. "Normoally I would deny such a requestttt... but I feel as if I can at least give you thissss.~" The snake knocks an old book of off the well's roof and onto the sand next to you. You pick it up and indulge in the sacred knowledge.

+ [Ask another question.] -> snaketalk
+ [Stop asking questions.] -> center

-> DONE

== maypet ==

You ask the snake if you can pet it. They look at you with a confused glare at first, but seem to shrug it off. "If it would please youuuu... I don't mind either wayyyy."

+ [Pet the snake.] -> petsnake
+ [Ask another question.] -> snaketalk
+ [Stop asking questions.] -> center

-> DONE

== petsnake ==

You reach out and gently pet the snake's head. While they said they didn't mind, the snake seems to quite enjoy your touch.

+ [Pet the snake again.] -> petsnakeagain
+ [Ask another question.] -> snaketalk
+ [Stop asking questions.] -> center

-> DONE

== petsnakeagain ==

You once again rub the snakes head softly. It enjoys the attention.

+ [Pet the snake again.] -> petsnakeagain
+ [Ask another question.] -> snaketalk
+ [Stop asking questions.] -> center

-> DONE



== travelwest ==

You begin to travel towards the west to were the sinkhole is supposedly placed. After a long walk, you do indeed find a very large hole sinking into the desert. You carefully slide down into the pit and after a breif look around, you discover an old chest with a lock on it, what seems to be a completely silver grandfather clock slightly buried within the sand, and a small ant just living its life on a tiny rock. {clockhandle: The giant earthworm looks down at you expectantly.}

+ [Investigate the chest.] -> lockedchest
+ [Investigate the clock.] -> silverclock
+ [Investigate the ant.] -> ant
+ [Return to the well.] -> center

-> DONE

== lockedchest ==

The chest is old but still is sturdy enough to prevent you from breaking it. The lock on its front doesn't seem like it will budge either.

* [Try to break the chest anyways.] -> breakhand
* {morewaterant} [Open the chest.] -> openchest
+ [Move back.] -> travelwest

->DONE

== breakhand ==

You punch the chest and you feel multiple finger bones breaking... Not a smart move, but at least you're out here for a magic heal all drink! {health == 0: Shame you aren't going to make it.}

~ health = health - 2

* {health == 0} [Die.] -> punchdie
+ {health > 0}[Move back.] -> travelwest

->DONE

== punchdie ==

Due to your previous injuries, this just pushed past your limits... causing you to die.

BAD END: PUNCHIES.

->DONE

== openchest ==

You slide in the key and open the old chest. Inside is an ancient book full of sacred knowledge. You quickly open it up and absorb its contents.

~ knowledge = knowledge + 1

->travelwest

== silverclock ==

Looking closely at the clock reveals a small red marking on the face. It appears to be a circle with an arrow pointing upwards. There is also a small handle on the back of the clock.

* {time == 0} [Try to pull the handle.] -> clockhandle
+ [Move back.] -> travelwest

->DONE

== clockhandle ==

The handle pulls down completely and rings a very loud bell. Suddenly, a massive earthworm rises from the desert sand and stares down at you. "Traveler. For your trial, you must show me your nobalism." That is all they say.

+ [Move back.] -> travelwest

->DONE

== ant ==

The ant simply rests upon the rock. {clockhandle: You don't know why you think this, but you believe it to be thirsty.}

* {clockhandle}{water > 0} [Pour some water out for the ant.] -> waterant
+ {waterant} [Pour some more water out for the ant.] -> morewaterant
+ [Move back.] -> travelwest

->DONE

== waterant ==

You pour some water out for the ant and it quickly strolls over to get a drink. "Excelent." The giant sandword utters one word before suddenly dropping a yellow diamond down to you. You take the diamond as a sign of success for this trial.

~ water = water - 1
~ diamonds = diamonds + 1

->travelwest

== morewaterant ==

You pour even more water out for the ant. "Wonderful." The giant sandworm suddenly drops a silver key down for you. You pick it up.

~ water = water - 1

->travelwest



== travelnorth ==

You treck yourself up north and eventually reach the library mentioned by the snake. It appears to be very old and looks like it is made of sand itself. Inside is a stark contrast as it has polished wooden floors and walls. Many books fill the large shelfs, containing endless knowledge. You stand in the center of the library. To your left and to your right are rooms lit via candles. Up the stairs appears to be one solitary bookshelf against the wall.

+ [Go to the left room.] -> leftroom
+ [Go to the right room.] -> rightroom
+ [Go up the stairs.] -> bookdoor
+ [Return to the well.] -> center

-> DONE

== leftroom ==

Inside the left room are a few books on a table, and a {not leftextinguish: large buring podium.} {leftextinguish: dark podium.}

+ [Read the books.] -> leftbooks
* {water > 0} [Pour water on the podium.] -> leftextinguish
+ [Go back.] -> travelnorth

->DONE

== leftbooks ==

Flipping through the books, you find the only ledgiable quote to be, "The worm assists the thirsty ant." Whatever that means.

-> leftroom

== leftextinguish ==

You pour some water out of your flask and over the fire. It extinguishes with a heavinly sizzle.

-> leftroom

== rightroom ==

Inside the right room are a few books on a table, and a {not rightextinguish: large buring podium.} {rightextinguish: dark podium.}

+ [Read the books.] -> rightbooks
* {water > 0} [Pour water on the podium.] -> rightextinguish
+ [Go back.] -> travelnorth

->DONE

== rightbooks ==

Flipping through the books, you find the only ledgiable quote to be, "The hydra believes there to be strength in peace." Whatever that means.

-> rightroom

== rightextinguish ==

You pour some water out of your flask and over the fire. It extinguishes with a heavinly sizzle.

-> rightroom

== bookdoor ==

You walk up the stairs and approach the solem bookshelf. {leftextinguish: You notice a small light on the left side of the bookshelf.} {rightextinguish: You find there is a light on the right side of the bookshelf.}

+ {leftextinguish}{rightextinguish} [Open the pass through the hidden door.] -> smarttrail
+ [Go back.] ->travelnorth

->DONE

== smarttrail ==

You open and walk through the bookshelf door to find a skeleton laying dead on a wooden throne. Before you can do anything, the skeleton, while still dead and motionless, begins to speak to you. "Traveler, please answer my riddle as a trail of your intelect. Five individuals are participating in a race. You is beating Me while I lags far behind. They is just ahead of You but is not able to keep pace so soon falls behind Me. I gathers a second wind and pushes past You and We. We is shocked by their sudden lost of the lead and falls behind Me. The race ends with everyone finishing in their current position. Tell me who finished in forth place."

+ [I] -> I
+ [We] -> We
+ [Me] -> Me
+ [You] -> You
+ [They] -> They
* {knowledge > 0}[Use your intelect to make the riddle easier.] -> useknowledge

-> DONE

== useknowledge ==

You think about it, and rewrite the riddle in your head to make it easier on yourself by changing it to, "Five individuals are participating in a race. Yahweh is beating Macy while Ieda lags far behind. Trenton is just ahead of Yahweh but is not able to keep pace so soon falls behind Macy. Ieda gathers a second wind and pushes past Yahweh and Weeble. Weeble is shocked by their sudden lost of the lead and falls behind Macy. The race ends with everyone finishing in their current position. Tell me who finished in forth place."

+ [Ieda] -> I
+ [Weeble] -> We
+ [Macy] -> Me
+ [Yahweh] -> You
+ [Trenton] -> They

-> DONE

== dartdie ==

The hit from the dart is enough to put an end to your boring life.

BAD END: PLAYING DARTS.

->DONE

== I ==

"Incorrect." A small dart fires from the wall and hits you. {health == 0: You are to weak to continue.}

~ health = health - 1

* {health == 0} [Die.] -> dartdie
+ {health > 0}[Try again.] -> smarttrail

->DONE

== We ==

"Correct." Suddenly, a red diamond falls into your hands. You take it as a sign of your success with this trial.

~ diamonds = diamonds + 1

+ [Go back to the library.] -> travelnorth
+ [Return to the well.] -> center

->DONE

== Me ==

"Incorrect." A small dart fires from the wall and hits you. {health == 0: You are to weak to continue.}

~ health = health - 1

* {health == 0} [Die.] -> dartdie
+ {health > 0}[Try again.] -> smarttrail

->DONE

== You ==

"Incorrect." A small dart fires from the wall and hits you. {health == 0: You are to weak to continue.}

~ health = health - 1

* {health == 0} [Die.] -> dartdie
+ {health > 0}[Try again.] -> smarttrail

->DONE

== They ==

"Incorrect." A small dart fires from the wall and hits you. {health == 0: You are to weak to continue.}

~ health = health - 1

* {health == 0} [Die.] -> dartdie
+ {health > 0}[Try again.] -> smarttrail

->DONE



== traveleast ==

You push yourself to travel to the far east of the desert where you eventually stumble onto an open cave. There in plain sight appears to be what you can only call a hydra. "Traveler. To complete the trial of strength, you must best me. I am honorable, so I shall give you the first swing."

+ [Attack the hydra directly.] -> directattack
+ [Attack the hydra from afar.] -> farattack
+ [Stand still.] -> standstill
+ [Return to the well.] -> center

-> DONE

== hydradie ==

The damages done by the hydra are enough to put you down for good.

BAD END: DIEDRA. shutupitsoundscool

->DONE

== directattack ==

You decide to charge head on towards the hydra... which promptly results in you getting swatted away like a fly. {health > 0:"I will let you try again."}

~ health = health - 1

* {health == 0} [Die.] -> hydradie
+ {health > 0}[Attack the hydra directly.] -> directattack
+ {health > 0}[Attack the hydra from afar.] -> farattack
+ {health > 0}[Stand still.] -> standstill
* {health > 0}{standstill} [Stand still again.] -> morestill
+ {health > 0}{morestill} [Stand still again.] -> evenmorestill
+ {health > 0}[Return to the well.] -> center

->DONE

== farattack ==

You step back and try to throw a rock at the hydra... which promptly results in the rock getting batting right back into your face. {health > 0:"I will let you try again."}

~ health = health - 1

* {health == 0} [Die.] -> hydradie
+ {health > 0}[Attack the hydra directly.] -> directattack
+ {health > 0}[Attack the hydra from afar.] -> farattack
+ {health > 0}[Stand still.] -> standstill
* {health > 0}{standstill} [Stand still again.] -> morestill
+ {health > 0}{morestill} [Stand still again.] -> evenmorestill
+ {health > 0}[Return to the well.] -> center

->DONE

== standstill ==

You decide to stand still for some reason. "Interesting. It seems you understand that strength not only takes form in brutality, but peace as well. Consider this trial passed." The hydra then drops a blue diamond down for you which you take as a sign of sucess.

~ diamonds = diamonds + 1

+ [Stand still again.] -> morestill
+ [Return to the well.] -> center

-> DONE

== morestill ==

"I like your tenacity. You may have this as well." The hydra give you an ancient book of sacred knowledge which you instantly flip through and take in such knowledge.

~ knowledge = knowledge + 1

+ [Stand still again.] -> evenmorestill
+ [Return to the well.] -> center

->DONE

== evenmorestill ==

{&You and the hydra endulge in the pleasentry that is pacifism.|You and the hydra enjoy the scerine moment together.|You forget that your legs are functional and that you should be doing something else by now.}

+ [Keep standing still.] -> evenmorestill
+ [Return to the well.] -> center

->DONE

== function advance_time ==

    ~ time = time + 1
    
    {
        - time > 3:
            ~ time = 0
    }    
    
    {    
        - time == 0:
            ~ return "Morning"
        
        - time == 1:
            ~ return "Noon"
        
        - time == 2:
            ~ return "Evening"
      
        - time == 3:
            ~ return "Night"
    
    }
    
    
        
    ~ return time


















