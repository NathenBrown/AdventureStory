//This is gunna be painfully fun

int del = 000; //delay variable
string_t choice = "none", item, YN, p_name; //these are variables that will later be used to allow players to make different choices
int player_s, e_distance, g_accuracy, range, shot, hp, misses, stealth, team_m, loop=0, action; //number player adds or subtract to random number to make shots ,enemy distance, accuracy
int player_hp = 3, hp_start; //varables for players starting hp at beginings of combat, and total heath

void info(){
    printf("COMBAT TUTORIAL:\nWHEN ENTERING COMBAT WITH A GUN YOU WILL BE PROMPTED BY A GRID WITH 1 \"O\", REPRESENTING A HEAD\nAND 2 \"0\"'s REPRESENTING THE BODY. YOU WILL BE GIVEN AN \"AIM POINT\" WHEN COMBAT STARTS\nYOU MUST FIND WHERE YOUR AIM POINT IN ON THE GRID COUNTING FROM THE TOP LEFT DOWN TO THE BOTTOM RIGHT\nONCE YOU KNOW WHERE YOUR AIM POINT IS YOU MUST ADD OR SUBTRACT A NUMBER FROM YOUR AIM POINT TO LAND ON THE TARGET\n");
    delay(5000);
    printf("EXAMPLE:\n| | |\n| O |\n| 0 |\n| 0 |\n| | |\nAIM POINT = 9\nIN THIS CASE YOU WOULD WANT TO ENTER \"-1 AS THAT WILL MOVE YOUR AIMING POINT TO 8 MAKING IT A BODY SHOT\n OR YOU CAN ENTER \"-4\" TO MAKE IT A HEADSHOT ENDING THE FIGHT INSTANTLY");
}

void combat(){
    //combat system
    hp = 3;
    hp_start = player_hp;
 
    while (hp > 0){             //loop combat till fight finishes
        if (player_hp == 0){//player dies
            printf("You died, fight restarting...\n");
            hp = 3;
            player_hp = hp_start;
        }
        if (e_distance >= 50 && e_distance != 0 && e_distance < 100){ //function for combat 50 meters
            range = randint(0, 12);
            printf("| | |\n| O |\n| 0 |\n| 0 |\n| | |\n"); //aiming grid for display
            printf("[NOTE: HEAD=O BODY=0, TYPE: \"100\" FOR HELP]\nAIM POINT:%i\n", range);
            scanf("%i", &player_s);
            if (player_s == 100){
                info();
            }
            shot = range + player_s;
            if (shot == 8 || shot == 11){ //coordinates for body shots
                printf("HIT BODY\n");
                hp = hp - g_accuracy;//damage
            }
            else if (shot == 5){ //headshot coordinates
                printf("HEADSHOT\n");
                hp = hp - hp; //damage
                delay(2000);
            }
            else{
                printf("You missed, bozo.\n"); //making sure player knows they are not very gamer because they missed
                player_hp = player_hp - 1;
            }
        }
        
        if (e_distance >= 100 && e_distance != 0 && e_distance < 200){ //function for combat 100 meters
            range = randint(0, 49);
            printf("| | | | | | |\n| | | | | | |\n| | | O | | |\n| | | 0 | | |\n| | | 0 | | |\n| | | | | | |\n| | | | | | |\n"); //aiming grid for display
            printf("[NOTE: HEAD=O BODY=0, TYPE: \"INFO\" FOR HELP]\nAIM POINT:%i\n", range);
            scanf("%i", &player_s);
            if (player_s == 100){
                info();
            }
            shot = range + player_s;
            if (shot == 25 || shot == 32){//coordinates for body shots
                printf("HIT BODY\n");
                hp = hp - g_accuracy;//damage
                delay(2000);
            }
            else if (shot == 18){ //headshot coordinates
                printf("HEADSHOT\n");
                hp = hp - hp;//damage
                delay(2000);
            }
            else{
                printf("You missed, bozo.\n"); //making sure player knows they are not very gamer because they missed
                misses = misses++; //adding to miss counter to see if player completes challenge
                printf("The enemy shoots back hitting you: -1 hp\n");
                player_hp = player_hp - 1;
            }
        }
        if (e_distance >= 200 && e_distance != 0){ // function for combat 200+ meters
            range = randint(0, 77);
            printf("| | | | | | | | | | |\n| | | | | | | | | | |\n| | | | | O | | | | |\n| | | | | 0 | | | | |\n| | | | | 0 | | | | |\n| | | | | | | | | | |\n| | | | | | | | | | |\n"); //aiming grid for display
            printf("[NOTE: HEAD=O BODY=0, TYPE: \"INFO\" FOR HELP]\nAIM POINT:%i\n", range);
            scanf("%i", &player_s);
            if (player_s == 100){
                info();
            }
            shot = range + player_s;
            if (shot == 39 || shot == 50){ //coordinates for body shots
                printf("HIT BODY\n");
                hp = hp - g_accuracy;//damage
                delay(2000);
            }
            else if (shot == 28){//headshot coordinates
                printf("HEADSHOT\n");
                hp = hp - hp;//damage
                delay(2000);
            }
            else{
                printf("You missed, bozo.\n");//making sure player knows they are not very gamer because they missed
                misses = misses++; //adding to miss counter to see if player completes challenge
                printf("The enemy shoots back hitting you: -1 hp\n");
                player_hp = player_hp - 1;
                
            }
        }
    }
}


void introduction(){
    //introduction to story:
    printf("A new potential Talaban threat has spread around\nThe U.S has been drafting promising soldiers\ninto the MARSOC unit to counteract this threat.\nYou have been drafted into the higher recruitment\nregime after showing extreme promise from\nyour performance in multiple Afghanistan battles.\n");
    delay(5000);
    printf("What is your last name?: ");
    scanf("%s", &p_name);

    printf("Lieutenant Nile: We are sending you on a top secret mission Captain %s.\n", p_name); //introduction to to the Lieutenant and mission
    delay(del);
    printf("You are going to be taking out the suspected leader of the PLEDON terrorist threat.\n");
    delay(del);
    printf("We have reason to believe that he will be organizing his followers soon and will show up in person to give a speech.\n");
    delay(del);
    printf("Your mission is to stop the fighting before it even starts.\n");

    string_t m_name; //player chosen mission name
    printf("Lets have some fun, what do you want to name this mission Captain?\n");
    scanf("%s", &m_name);
    printf("You: How about Operation %s?\n", m_name);
    delay(del);
    printf("Lieutenant Nile: Alright, oporation %s it is.\n",m_name);
    delay(del);
    printf("We are putting the full process of strategizing, planning, and executing oporation %s into your hands.\n", m_name); //player now knows tasks
    delay(del);
    printf("What approach are you going to be taking to this mission Captain?\n");
    delay(del);
    printf("Do you want to go solo.\n");
    delay(2000);
    printf("You can also take a squadron from the MARSOC task force with you.\n");
    delay(2000);
    printf("Or if you want, we can pull Private Walters from his current assignment if you would like him to accomany you as well.\n");
    delay(2000);
    printf("I know how much you like working with Walters, he truly is the best of his class.\n");

    //mission type choice:

    int team_m; // the number variable for later inputs based off the choice of the player (1 = solo, 2 = team, 3 = partner)
    string_t team_c; //the varable for the players choice in who to take on the mission
    

    //player inputs how they would like to approch the mission
    while(loop != 1){
        printf("INPUT: SOLO, TEAM, PARTNER: "); //tell the player there options
        scanf("%s", &team_c);
        if (team_c == "solo" || team_c == "SOLO" || team_c == "Solo"){
            printf("You: I think I will be taking this one alone Lieutenant.\n");
            delay(del);
            middle1();
            return;
        }
        if (team_c == "team" || team_c == "Team" || team_c == "TEAM"){
            printf("You: Lets take the MARSOC task force, I might need some help in this one.\n");
            delay(del);
            middle3();
            return;
        }
        if (team_c == "partner" || team_c == "Partner" || team_c == "PARTNER"){
            printf("You: Private Walters has been showing extreme promise on his missions.\n");
            delay(del);
            printf("His usefull spotting and markmanship skills will be very usefull in this mission.\n");
            delay(del);
            middle2();
            return;
        }
        if (team_c != "partner" || team_c != "Partner" || team_c != "PARTNER" || team_c != "team" || team_c != "Team" || team_c != "TEAM" || team_c == "solo" || team_c == "SOLO" || team_c == "Solo"){
            printf("SYNTAX ERROR: CHECK SPELLING AND CAPITALIZATION\n");
            delay(del);
        }
    }
}
//weapon choice function
void weaponChoice(){
    string_t i, YN; // variable for player menu navigations, YN will be used for YES NO answers
    string_t weapon = "none"; //this variable will keep the primary weapon of the player (1 = M40A5, 2 = M16A5, 3 = MK18 Custom, 4 = SCAR SSR);
    
    while(weapon = "none"){
        printf("Select a gun: M40A5, M16A4, MK18: ");
        scanf("%s", &weapon); //player enters weapon choice
        if (weapon == "M40A5" || weapon == "M16A4" || weapon == "MK18"){
            printf("OPTIONS:\nSELECT\nINFO\nBACK\n"); //give player menu of options
            scanf("%s", &i); //player chooses option in menu
            if (i == "Select" || i == "SELECT" || i == "select"){
                printf("ARE YOU SURE YOU WOULD LIKE TO CHOOSE THIS AS YOUR WEAPON\nYES/NO\n");
                scanf("%s", &YN);
                if (YN == "YES" || YN == "yes" || YN == "Yes"){
                    weapon = weapon;
                    printf("I think I'll be taking the %s Lieutenant.\n", weapon);
                    break;
                    delay(del);
                }
                if (YN == "No" || YN == "no" || YN == "NO"){
                    weapon == "none";
                    printf("WEAPON DE-SELECTED");
                }
            }
            if (i == "INFO" || i == "Info" || i == "info"){ //player chooses INFO option and gets information on selected weapon
                if (weapon == "M40A5"){
                    printf("M40A5, a modern bolt action Sniper rifle\nthat will aid you in taking out targets\nfrom very far away but with a\nslow rate of fire it will not help much at close range...\n");
                }
                if(weapon == "M16A4"){
                    printf("A M16A4 a burst automatic rifle that\nbrings very balanced range and close quarters\nability to the field allowing\nfor consistency in most situations...\n");
                }
                if (weapon == "MK18"){
                    printf("The MK18 custom carbine rifle, this carbine\nhas very strong close range performance\ndue to its rate of fire and smaller\nbuild making it easy to\nmaneuver, it might struggle to accomplish\nlong range tasks...\n");
                }
            }
            if (i == "BACK" || i == "Back" || i == "back"){
                printf("WEAPON DE-SELECTED\n");
                weapon = "none";
            }
        }
        else{
            printf("ERROR: INVALID CHOICE\n"); //give user error message when they mess something up when inputing commands
            delay(1000);
            weapon = "none";
        }
    if (weapon = "M40A5"){
        g_accuracy = 3;
    }
    if (weapon = "M16A4"){
        g_accuracy = 2;
    }
    if (weapon = "M16A4"){
        g_accuracy = 1;
    }
    }

    
}

//PART 1: This will be the code for how the story will play out if the player chose to go alone (option 1)
int middle1(){
    printf("Lieutenant Nile: That is fine, we will have a task force waiting to pull you out once the task is complete.\n");
    delay(del);
    printf("But now for the fun part.\n");
    delay(del);
    printf("What weapon would you like to take on this mission Captain.\n");
    delay(del);
    printf("We have 3 choices for you on hand, a M40A5, a M16A4, and a MK18 Custom.\n");
    printf("NOTE: CHOOSE INFO FOR INFORMATION ON A GUN\n");
    delay(del);
    
    weaponChoice();
    
    //diolog continues after weapon choices
    printf("Lieutenant Nile: Now that you have your weapon we will deliver you to the sight.\n");
    delay(del);
    printf("You will be given a G17 as your sidearm. Once you are on sight we wont be able to assist you with supplies\n");
    delay(del);
    printf("Remember that you are entering a highly militarized area so if supplies get low see if you can find anything usefull.\n");
    delay(del);
    printf("Im sure you knew that already though...\n");
    delay(4000);
    printf("NOTE YOU ARRIVE ON SIGHT GUNS LOADED AND READY FOR YOUR MISSION\n"); //player begins mission, exposition text
    delay(del);
    printf("YOU CAN SEE THE ABANDONED OIL REFINERY AHEAD\n");
    delay(del);
    printf("THE REFINERY IS COMPLETLY SURROUNDED BY A THICK FOREST AND A NEAR BY MOUNTAIN RANGE\n");
    delay(del);
    printf("AS YOU LAND YOU GET A DEBRIEF FROM THE LIEUTENANT...\n");
    delay(del);
    printf("Lieutenant Nile: Little is known about the site you are infiltrating Captain.\n");
    delay(del);
    printf("The only thing we are sure of is the enemy has no idea you will be showing up to crash this party.\n");
    delay(del);
    printf("You are on your own so I advise you move carefully, but I believe in your judgement Captain.\n");
    delay(del);
    printf("There are also 2 main complexes that used to be where oil trucks would fill their tanks when the refinery was in operation.\n");
    delay(del);
    printf("We have been informed that the meeting will be in one of these buildings.\n");
    delay(del);
    printf("We will be picking you up after the mission is over at the LZ near the north west corner of the complex.\n");
    delay(del);
    printf("Good luck Captain, if there is someone who can do this alone its you.\n");
    //FULL INTRO NOW COMPLETE MISSION STARTS
    delay(4000);
    printf("NOTE: MIDDLE 1 - THE LONE WOLF\n");
    delay(del);
    printf("You have just walked the 8 mile hike from the LZ and are approching the complex\n");
    delay(del);
    printf("You can see the main gate to the refinery\n");
    delay(del);
    
    //player starts first interaction
    while(loop != 1){
        printf("OPTIONS: Investigate, Run, Sneak, Attack: "); //tell the player there options
        scanf("%s", &choice);
        if (choice == "Investigate" || choice == "INVESTIGATE" || choice == "investigate"){
            printf("You move further down the trail with a pair of binoculars to get a better look at the situation ahead.\n");
            delay(del);
            printf("You see 2 rifle men standing next to a road block stripped yellow and black.\n");
            delay(del);
            printf("There is a third guard in the booth next to the road block in what is probably the oporation booth\n.");
        }
        if (choice == "Run" || choice == "run" || choice == "RUN"){
            printf("You run around the walls of the complex, looking for another way in.\n");
            delay(del);
            printf("You find a rather large tree which happens to be close to and taller than the wall.\n");
            delay(del);
            printf("Do you want to climb it?\nYES/NO\n");
            scanf("%s", &YN);
            if (YN == "YES" || YN == "yes" || YN == "Yes"){
                printf("You climb the tree making it over the fence you are now behind the enemy, unnoticed\n.");
                stealth = 1;
            }
            if (YN == "NO" || YN == "No" || YN == "no"){
                printf("You decide that the tree might be to tall to climb, and run back to the gate.\n");
            }
        }
        if (choice == "Attack" || choice == "ATTACK" || choice == "attack"){
            if (stealth == 1){ 
                printf("You sneak up behind the 2 guards rifle drawn");
                delay(del);
                printf("Your approach from behind catches the guards lacking and you shoot both before they can turn around to face you.\n");
                delay(del);
                printf("You break into the booth and take out the first guard without causing much noise other than the previous gunshots.\n");
                break;
            }
            else{
                printf("You run up on the road block rifle drawn, you approch the 2 rifle men and guard in the booth.\n");
                e_distance = 50;
                combat();
                combat();
                break;
            }
        }
        if (choice == "sneak" || choice == "SNEAK" || choice == "Sneak"){
            printf("Using the thick forest you move closer the the gate.\n");
            delay(del);
            printf("You an now see past the road block ahead slightly, there are no guards behind it.\n");
            delay(del);
        }
        else{
            printf("");
        }
    }
    printf("With the guards down you move further into the refinery grounds...\n");
    delay(del);
    printf("While walking down the trail you see a nearby sniper tower lights glowing in the night.\n");
    delay(del);
    if (stealth != 1){
        printf("The sniper on the tower spots you by the gate and takes aim.\n"); //player chooses non stealthy option causing extra fights
        e_distance = 100;
        combat();
        printf("The area looks clear from here so you continue on your path forward.\n");
        delay(del);
    }
    printf("Continuing down the trail you see a light in the brush of the trees.\n");
    delay(del);
    printf("You can not make out what if it coming from but it is not to far ahead.\n");
    while(loop != 1){
        printf("OPTIONS: Investigate, Run, Sneak, Attack: "); //tell the player there options
        scanf("%s", &choice);
        if (choice == "Investigate" || choice == "INVESTIGATE" || choice == "investigate"){
            printf("You continue your walk closer watching the light as you go by it seems like an odd place to have a building.\n");
            delay(del);
            printf("Suddenly gun shots rip through the air in your direction, one hits you.\n");
            delay(del);
            printf("The bullet knocks you down to the ground in a daze, you slowly look up as you come to your senses.\n");
            delay(del);
            printf("You can see blinding muzzle flash through the bushes, there appears to be some kind of mounted machine gun stationed there.\n");
            break;
        }
        if (choice == "Run" || choice == "run" || choice == "RUN"){
            printf("You run back the other direction\n");
            delay(del);
            printf("You find there is no other path this is the only way forward.\n");
        }
        if (choice == "Attack" || choice == "ATTACK" || choice == "attack"){
            printf("You run up gun drawn this could be some form of fight ahead.\n");
            delay(del);
            printf("You hear bullets whizzing through the air by you and jump behind cover.\n");
            delay(del);
            printf("There appears to be some form of bunker with a mounted machine gun, You ready your rifle.\n");
            break;
        }
        if (choice == "sneak" || choice == "SNEAK" || choice == "Sneak"){
            printf("You walk up to the light soure making sure to be as careful as possible.\n");
            delay(del);
            printf("You move up slowly and quietly to see that there is some form of bunker infront of you with some form of mounted machine gun.\n");
            delay(del);
            printf("You ready your rifle.\n");
            break;
        }
        else{
            printf("SYNTAX ERROR: CHECK GRAMMAR AND SPELLING\n");
        }
    }
    e_distance = 50;
    combat();
    combat();
    e_distance = 100;
    combat();
    printf("Now that the bunker is clear you move forward to investigate the camp.\n");
    delay(del);
    printf("You find a ballistic vest in the bunker as well as the mounted turret you saw before.\n");
    delay(del);
    printf("You put the vest on which will give you some armor against bullets!\n");
    printf("+1hp\n");
    player_hp = player_hp++;
    delay(del);
    printf("You walk far deeper into the complex and see 2 large warehouses ahead of you.\n");
    delay(del);
    printf("Outside of the farthest warehouse there is 3 large oil tanks which have a tube leading to the warehouse.\n");
    printf("You: Those must be the the buildings that are expected to have the meeting inside of them, but which one.\n");
    delay(del);
    printf("Which building would you like to enter first?\n");
    printf("Farthest/Closest\n");
    while(loop != 1){
        scanf("%s", &YN);
        if (YN == "Farthest" || YN == "farthest" || YN == "FARTHEST" || YN == "Closest" || YN == "closest" || YN == "CLOSEST"){
            break;
        }
        else{
            printf("SYNTAX ERROR: CHECK SPELLING AND CAPITALIZAION\n");
        }
        
    }
    printf("You start moving toward the warehouse, when you see a convoy of jeeps drive into the warehouse farthest from you.\n");
    delay(del);
    printf("That convoy should be the convoy that has the target inside of it.\n");
    delay(del);
    printf("OPTIONS:\nAttack\nInvestigate");
    while (loop != 1){
        scanf("%s", &choice);
        if (choice == "Investigate" || choice == "INVESTIGATE" || choice == "investigate"){
            printf("You decide to keep exploring the area rather than to go forward.\n");
            delay(del);
            printf("You walk to the warehouse closest to you, and step inside it appears to be some form if armory.\n");
            delay(del);
            printf("A guard walk through the hallway and sees you, he shouts alerting more guards.\n");
            delay(del);
            printf("You begin the fight...\n");
            e_distance = 50;
            combat();
            combat();
            combat();
            combat();
            printf("Now that the armory is clear you search the place to see if you can find anything useful.\n");
            delay(del);
            printf("You find a large valve on the wall that has a large FUEL label above it.\n");
            delay(del);
            printf("This valve most likely goes to the large fuel tanks you saw outside.\n");
            delay(del);
            
            while(loop != 1){
                printf("Do you want to turn the valve? YES/NO\n");
                scanf("%s", &YN);
                if (YN == "yes" || YN == "Yes" || YN == "YES"){
                    printf("You turn the valve, you can hear liquid start to move through the pipes in the walls.\n");
                    action = 1;
                    break;
                }
                else if (YN == "No" || YN == "no" || YN == "NO"){
                    printf("You leave the valve as you found it.\n");
                    break;
                }
                else{
                    printf("SYNTAX ERROR: CHECK SPELLING AND CAPITALIZATION\n");
                }
            }
            if (action != 1){
                printf("You find a grenade from a guard while searching the place.\n");
                delay(del);
                printf("This could be a good chance to complete the mission if you could throw it into the other warehouse.\n");
                delay(del);
                printf("You try and throw the grenade through a nearby window into to other warehouse and you make it through the window.\n");
                delay(del);
                printf("The grenade lands in the other warehouse and you hear it go off, you go outside to check the damage done to find a large croud of enemies waiting outside the door.\n");
                delay(del);
                printf("You prepare for your final stand...\n");
                e_distance = 50;
                combat();
                combat();
                combat();
                combat();
                combat();
                e_distance = 100;
                combat();
                combat();
                combat();
                combat();
                e_distance = 200;
                combat();
                combat();
                combat();
                printf("You manage to stand your ground but you can hear more people approaching in the distance.\n");
                delay(del);
                printf("You run into the warehouse to find the target standing there wounded from the grenade blast.\n");
                delay(del);
                printf("You take the target out and turn to face 50+ Taliban members flooding into the warehouse behind you.\n");
                delay(del);
                printf("You find you have ran out of ammo from your last battle and have no weapons left.\n");
                delay(del);
                printf("At least you managed to complete 1 last mission...");
                delay(del);
                printf("ENDING 1/9 - AN EYE FOR AN EYE\n");
                break;
            }
            if (action == 1){
                printf("You find a grenade from a guard while seaching the place.\n");
                delay(del);
                printf("This could be a good chance to complete the mission if you could throw it into the other warehouse\n");
                delay(del);
                printf("You try and throw the grenade through a nearby window into to other warehouse and you make it through the window\n");
                delay(del);
                printf("The grenade lands in the other warehouse and you hear it go off, the grenade explodes the gas running through the wall in the other warehouse causing it to go up in flames.\n");
                delay(del);
                printf("You shoot your flair into the air alerting the pick up helicopter, they pick you up shortly from your mission.\n");
                delay(del);
                printf("Lieutenant Nile: Good work Captain, you will be rewarded greatly for your mission.\n");
                delay(del);
                if (misses == 0){
                    printf("It appears you have aimbot...\n"); //achievment for not missing a single shot
                    delay(del);
                }
                printf("ENDING 2/9 - FIREWORKS");
                break;
            }
        
        }
        if (choice == "attack"){
            printf("You run forward to face the fight infront of you...\n");
            e_distance = 50;
            combat();
            combat();
            combat();
            combat();
            combat();
            e_distance = 100;
            combat();
            combat();
            combat();
            combat();
            e_distance = 200;
            combat();
            combat();
            combat();
            printf("You are holding your ground from the massive force you face.\n");
            delay(del);
            printf("Running low on ammo, you try to hide but your presence is well known and they follow you.\n");
            delay(del);
            printf("After fighting till your last round you find yourself still facing many foes.\n");
            delay(del);
            printf("You know this is the end as there is not escape from here, at least you tried.\n");
            delay(del);
            printf("ENDING 3/9 - HARD FOUGHT DEFEAT");
            break;
        }
    }
return(1);
}





int middle2(){      //PART 2: This will be the code for how the story will play out if the player chose to go with a partner (option 2)
    printf("Lieutenant Nile: That is fine, we will have a task force waiting to pull you out once the task is complete.\n");
    delay(del);
    printf("But now for the fun part.\n");
    delay(del);
    printf("What weapon would you like to take on this mission Captain.\n");
    delay(del);
    printf("We have 3 choices for you on hand, a M40A5, a M16A4, and a MK18 Custom.\n");
    printf("NOTE: CHOOSE INFO FOR INFORMATION ON A GUN\n");
    delay(del);
    
    weaponChoice();
    
    //diolog continues after weapon choices
    printf("Lieutenant Nile: Now that you have your weapon we will deliver you to the sight.\n");
    delay(del);
    printf("Walters will be taking his usual MK17 battle rifle to this mission once we can pull him from his assignment.\n");
    delay(del);
    printf("Remember that you are entering a highly militarized area so if supplies get low see if you can find anything usefull.\n");
    delay(del);
    printf("Im sure you knew that already though...\n");
    delay(4000);
    printf("NOTE YOU ARRIVE ON SIGHT GUNS LOADED AND READY FOR YOUR MISSION WALTERS ALONG SIDE YOU\n"); //player begins mission, exposition text
    delay(del);
    printf("YOU CAN SEE THE ABANDONED OIL REFINERY AHEAD\n");
    delay(del);
    printf("THE REFINERY IS COMPLETEY SURROUDED BY A THICK FOREST AND A NEAR BY MOUNTAIN RANGE\n");
    delay(del);
    printf("AS YOU LAND YOU GET A DEBRIEF FROM THE LIEUTENANT...\n");
    delay(del);
    printf("Lieutenant Nile: Little is known about the site you are infiltrating Captain.\n");
    delay(del);
    printf("The only thing we are sure of is the enemy has no idea you two will be showing up to crash this party.\n");
    delay(del);
    printf("You two are both extremely talented soldiers, and I believe in your judgement Captain.\n");
    delay(del);
    printf("There are also 2 main complexes that used to be where oil trucks would fill there tanks when the refinery was in operation.\n");
    delay(del);
    printf("We have been informed that the meeting will be in one of these buildings.\n");
    delay(del);
    printf("We will be picking you up after the mission is over at the LZ near the north west corner of the complex.\n");
    delay(del);
    printf("Good luck Captain, if there is someone who can pull this oporation off it is you two.\n");
    //FULL INTRO NOW COMPLETE MISSION STARTS
    delay(4000);
    printf("NOTE: MIDDLE 2 - TWO CATS AND A MOUSE\n");
    delay(del);
    printf("You and Walters have just walked the 8 mile hike from the LZ and are approching the complex.\n");
    delay(del);
    printf("You can see the main gate to the refinery.\n");
    delay(del);
    printf("Walters scouts further down the trail with a pair of binoculars to get a better look at the situation ahead.\n");
    delay(del);
    printf("He sees 2 rifle men standing next to a road block stripped yellow and black.\n");
    delay(del);
    printf("There is a third guard in the booth next to the road block in what is probably the oporation booth.\n");

    //player starts first interaction
    while(loop != 1){
        printf("OPTIONS: Run, Sneak, Attack: "); //tell the player there options
        scanf("%s", &choice);
        if (choice == "Run" || choice == "run" || choice == "RUN"){
            printf("You run around the walls of the complex, looking for another way in.\n");
            delay(del);
            printf("You find a rather large tree which happens to be close to and taller than the wall.\n");
            delay(del);
            printf("Do you want to climb it?\nYES/NO\n");
            scanf("%s", &YN);
            if (YN == "YES" || YN == "yes" || YN == "Yes"){
                printf("You and Walters climb the tree making it over the fence you are now behind the enemy, unnoticed.\n");
                stealth = 1;
            }
            if (YN == "NO" || YN == "No" || YN == "no"){
                printf("You both decide that the tree might be to tall to climb, and run back to the gate.\n");
            }
        }
        if (choice == "Attack" || choice == "ATTACK" || choice == "attack"){
            if (stealth == 1){ 
                printf("You and Walters sneak up behind the 2 guards rifle drawn");
                delay(del);
                printf("Your approach from behind catches the guards lacking and you shoot both before they can turn around to face you.\n");
                delay(del);
                printf("You break into the booth and take out the first guard without causing much noise other than the previous gunshots.\n");
                break;
            }
            else{
                printf("You run up on the road block rifle drawn, you approch the 2 rifle men and guard in the booth.\n");
                e_distance = 50;
                combat();
                printf("Walters makes quick work or the other guard not missing his shot.\n");
                break;
            }
        }
        if (choice == "sneak" || choice == "SNEAK" || choice == "Sneak"){
            printf("Using the thick forest you move closer the the gate.\n");
            delay(del);
            printf("You an now see past the road block ahead slightly, there are no guards behind it.\n");
            delay(del);
        }
        else{
            printf("");
        }
    }
    printf("With the guards down you move further into the refinery grounds...\n");
    delay(del);
    printf("While walking down the trail you see a nearby sniper tower lights glowing in the night.\n");
    delay(del);
    if (stealth != 1){
        printf("The sniper on the tower spots you by the gate and takes aim.\n"); //player chooses non stealthy option causing extra fights
        delay(del);
        printf("Walters reacts quick dropping to the ground taking aim.\n");
        delay(del);
        printf("Walters makes quick work of the sniper in the town with one single shot.\n");
        delay(del);
        printf("The area looks clear from here so you continue on your path forward.\n");
        delay(del);
    }
    printf("Continuing down the trail you see a light in the brush of the trees.\n");
    delay(del);
    printf("You can not make out what if it coming from but it is not to far ahead.\n");
    while(loop != 1){
        printf("OPTIONS: Investigate, Run, Sneak, Attack: "); //tell the player there options
        scanf("%s", &choice);
        if (choice == "Investigate" || choice == "INVESTIGATE" || choice == "investigate"){
            printf("You and Walters continue your walk closer watching the light as you go by it seems like an odd place to have a building.\n");
            delay(del);
            printf("Suddenly gun shots rip through the air in your direction, one hits you.\n");
            delay(del);
            printf("The bullet knocks you down to the ground in a daze, you slowly look up as you come to your senses.\n");
            delay(del);
            printf("You can see blinding muzzle flash through the bushes, there appears to be some kind of mounted machine gun stationed there.\n");
            break;
        }
        else if (choice == "Run" || choice == "run" || choice == "RUN"){
            printf("You tell Walters to look back the other direction\n");
            delay(del);
            printf("He returns to you saying there is no other path, this is the only way forward.\n");
        }
        else if (choice == "Attack" || choice == "ATTACK" || choice == "attack"){
            printf("You run up gun drawn this could be some form of fight ahead.\n");
            delay(del);
            printf("You hear bullets whizzing through the air by you and jump behind cover. Walters \n");
            delay(del);
            printf("There appears to be some form of bunker with a mounted machine gun, You and Walters take aim.\n");
            break;
        }
        else if (choice == "sneak" || choice == "SNEAK" || choice == "Sneak"){
            printf("You walk up to the light source making sure to be as careful as possible.\n");
            delay(del);
            printf("You move up slowly and quietly to see that there is some form of bunker infront of you with some form of mounted machine gun.\n");
            delay(del);
            printf("You ready your rifle and Walters moves in from behind to catch the enemy off guard.\n");
            break;
        }
        else{
            printf("SYNTAX ERROR: CHECK GRAMMAR AND SPELLING\n");
        }
    }
    e_distance = 50;
    combat();
    printf("Walters jumps on a enemy soldier knife in hand and deals the final blow, you turn to face the gunner at the turret.\n");
    delay(del);
    e_distance = 100;
    combat();
    printf("Now that the bunker is clear you move forward to investigate the camp.\n");
    delay(del);
    printf("You find a ballistic vest in the bunker as well as the mounted turret you saw before.\n");
    delay(del);
    printf("You put the vest on which will give you some armor against bullets!\n");
    printf("+1hp\n");
    player_hp = player_hp++;
    delay(del);
    printf("You walk farther into the complex and see 2 large warehouses ahead of you.\n");
    delay(del);
    printf("Outside of the farthest warehouse there is 3 large oil tanks which have a tube leading to the warehouse.\n");
    printf("You: Those must be the the buildings that are expected to have the meeting inside of them, but which one.\n");
    delay(del);
    printf("Walters: I'm not sure they look the exact same.\n");
    delay(del);
    printf("Which one you wanna enter first?\n");
    printf("Farthest/Closest\n");
    while(loop != 1){
        scanf("%s", &YN);
        if (YN == "Farthest" || YN == "farthest" || YN == "FARTHEST" || YN == "Closest" || YN == "closest" || YN == "CLOSEST"){
            break;
        }
        else{
            printf("SYNTAX ERROR: CHECK SPELLING AND CAPITALIZAION\n");
        }
        
    }
    printf("You start moving toward the warehouse, when you see a convoy of 82022 Polaris Slingshot R Liquid Lime Fade drive into the warehouse farthest from you.\n");
    delay(del);
    printf("That convoy should be the convoy that has the target inside of it.\n");
    delay(del);
    printf("Walters looks to you ready for your decision...\n");
    delay(del);
    printf("OPTIONS:\nAttack\nInvestigate\n");
    while (loop != 1){
        scanf("%s", &choice);
        if (choice == "Investigate" || choice == "INVESTIGATE" || choice == "investigate"){
            printf("You decide to Continue looking around and attack later.\n");
            delay(del);
            printf("You walk to the warehouse closest to you, and step inside it appears to be some form if armory.\n");
            delay(del);
            printf("A guard walks through the hallway and sees you, he shouts alerting more guards.\n");
            delay(del);
            printf("You begin the fight...\n");
            e_distance = 50;
            combat();
            combat();
            printf("Walters shoots over your shoulder covering the angles you arent with his excellent markmanship.\n");
            delay(del);
            combat();
            printf("Now that the Armory is clear you search the place to see if you can find anything useful.\n");
            delay(del);
            printf("You find a large valve on the wall that has a large FUEL label above it.\n");
            delay(del);
            printf("Walters: This valve most likely goes to the large fuel tanks you saw outside running to the other warehouse right?\n");
            delay(del);
            
            while(loop != 1){
                printf("Do you want to turn the valve? YES/NO\n");
                scanf("%s", &YN);
                if (YN == "yes" || YN == "Yes" || YN == "YES"){
                    printf("You turn the valve, you can hear liquid start to move through the pipes in the walls.\n");
                    delay(del);
                    printf("Walters: Where is that fuel going to, it must be the other warehouse...\n");
                    delay(del);
                    action = 1;
                    break;
                }
                else if (YN == "No" || YN == "no" || YN == "NO"){
                    printf("You leave the valve as you found it.\n");
                    break;
                }
                else{
                    printf("SYNTAX ERROR: CHECK SPELLING AND CAPITALIZATION\n");
                }
            }
            if (action != 1){
                printf("Walters: Hey check this out, this guard had a grenade on his vest thank god he didnt use it.\n");
                delay(del);
                printf("Walters puts the grenade in a velcro loop on his vest.\n");
                delay(del);
                printf("You both walk outside to see what the convoy is doing to find them all waiting outside the door.\n");
                delay(del);
                printf("Walters lays down on a mound nearby, You both prepare for your final stand...\n");
                e_distance = 50;
                combat();
                combat();
                combat();
                printf("Walters continues shooting as you reload your weapon making sure you back is covered, you can see him pull the grenade off his vest getting ready to use it if need be.\n");
                combat();
                combat();
                e_distance = 100;
                combat();
                combat();
                printf("Walters call out that he is running low on rounds and begins unzipping his backpack to find a few extra mags.\n");
                combat();
                combat();
                e_distance = 200;
                combat();
                combat();
                combat();
                printf("You manage to stand your ground but you can hear more people approaching in the distance.\n");
                delay(del);
                printf("You run into the warehouse to find the target standing there pistol in hand aiming at the door.\n");
                delay(del);
                printf("Just as he pulls the trigger Walters pushes you forward causing you to stuble to the ground.\n");
                delay(del);
                printf("Walters falls to the ground pulling his sidearm out its holster.\n");
                delay(del);
                printf("He unloads all the rounds in his gun at the target 3 of which hit there mark.\n");
                delay(del);
                printf("You rush over to Walters...\n");
                delay(del);
                printf("You: Are you hit?\n");
                delay(del);
                printf("Walters grunts: Yeah upper torso I dont know if I am going to make it Captain.\n");
                delay(del);
                printf("You: Don't you give me that talk we've made it out of worse than this.\n");
                delay(del);
                printf("Walters: Captain I have a request; You can hear the sound of engines from other 2022 Polaris Slingshot R Liquid Lime Fade and other vehicles approaching outside.\n");
                delay(del);
                printf("You: What is it soldier.\n");
                delay(del);
                printf("Walters: Im going to need you to go and turn that fuel valve.\n");
                delay(del);
                printf("You see walters grab the grenade off his vest, You: I understand...\n");
                delay(del);
                printf("You get up and sprint for the back door in the warehouse, running around to the other warehouse.\n");
                delay(del);
                printf("You run inside and can see 50 or more Taliban members entering the warehouse, you turn the valve.\n");
                delay(del);
                printf("Suddenly your eyes are met with a massive explosion in the other warehouse.\n");
                delay(del);
                printf("Walters must have set off the grenade in the warehouse with the oil lines causing the building to explode.\n");
                delay(del);
                printf("NOTE: BACK AT BASE...\n");
                delay(del);
                printf("You: I must say that I new a soldier whos sacrafice and selflessness is the only reason I may stand in front of you all today.\n");
                delay(del);
                printf("That soldier was Private Walters, one of the brightest and best snipers I've ever had the pleasure of working with.\n");
                delay(del);
                printf("In the end I can only hope to live my life well enough to be worthy of the sacrafice he made for me that day,\n");
                delay(del);
                printf("To live life to the caliber that man did is something most will only dream of doing...\n");
                delay(del);
                printf("ENDING 4/9 - HALF OF 2\n");
                break;
            }
            if (action == 1){
                printf("Walters: Hey check this out, this guard had a grenade on his vest thank god he didnt use it.\n");
                delay(del);
                printf("Walters puts the grenade in a velcro loop on his vest.\n");
                delay(del);
                printf("You: Wait I have an idea give me that grenade.\n");
                delay(del);
                printf("You try and throw the grenade through a nearby window into to other warehouse and you make it through the window\n");
                delay(del);
                printf("The grenade lands in the other warehouse and you hear it go off, the grenade explodes the oil running through the wall in the other warehouse causing it to go up in flames.\n");
                delay(del);
                printf("You shoot your flair into the air alerting the pick up helicopter, they pick you up shortly from your mission.\n");
                delay(del);
                printf("Lieutenant Nile: Good work Captain, as well as Private Walters you will both be rewarded greatly for your mission.\n");
                delay(del);
                printf("ENDING 5/9 - 2 MATCHES 1 FLAME");
                break;
            }
        
        }
        if (choice == "attack"){
            printf("You run forward to face the fight infront of you...\n");
            e_distance = 50;
            combat();
            combat();
            combat();
            combat();
            combat();
            e_distance = 100;
            combat();
            combat();
            combat();
            combat();
            e_distance = 200;
            combat();
            combat();
            combat();
            printf("You manage to stand your ground but you can hear more people approaching in the distance.\n");
            delay(del);
            printf("You run into the warehouse to find the target standing there pistol in hand aiming at the door.\n");
            delay(del);
            printf("Just as he pulls the trigger Walters pushes you forward causing you to stuble to the ground.\n");
            delay(del);
            printf("Walters falls to the ground pulling his sidearm out its holster.\n");
            delay(del);
            printf("He unloads all the rounds in his gun at the target 3 of which hit there mark.\n");
            delay(del);
            printf("You rush over to Walters...\n");
            delay(del);
            printf("You: Are you hit?\n");
            delay(del);
            printf("Walters grunts: Yeah upper torso I dont know if I am going to make it Captain.\n");
            delay(del);
            printf("You: Don't you give me that talk we've made it out of worse than this.\n");
            delay(del);
            printf("You turn to see a flood of Talibanban members entering the warehouse.\n");
            delay(del);
            printf("You: Well maybe not worse than this...\n");
            delay(del);
            printf("ENDING 6/9 - CURIOSITY KILLED THE CATS");
            break;
        }
    }
return(1);
}

int middle3(){
    printf("Lieutenant Nile: Better safe than sorry I guess, we will have you in charge of the unit you are taking into this mission.\n");
    delay(del);
    printf("But now for the fun part.\n");
    delay(del);
    printf("What weapon would you like to take on this mission Captain.\n");
    delay(del);
    printf("We have 3 choices for you on hand, a M40A5, a M16A4, and a MK18 Custom.\n");
    printf("NOTE: CHOOSE INFO FOR INFORMATION ON A GUN\n");
    delay(del);
    
    weaponChoice();
    
    //diolog continues after weapon choices
    printf("Lieutenant Nile: Now that you have your weapon we will deliver you to the sight.\n");
    delay(del);
    printf("We will be flying you and the MARSOC unit in by helicopter.\n");
    delay(del);
    printf("You will be landing just outside of the sight meaning your precence will be known.\n");
    delay(del);
    printf("Im sure you knew that already though...\n");
    delay(4000);
    printf("NOTE YOU ARRIVE ON SIGHT GUNS LOADED AND READY FOR YOUR MISSION\n"); //player begins mission, exposition text
    delay(del);
    printf("YOU CAN SEE THE ABANDONED OIL REFINERY AHEAD\n");
    delay(del);
    printf("THE REFINERY IS COMPLETLY SURROUNDED BY A THICK FOREST AND A NEAR BY MOUNTAIN RANGE\n");
    delay(del);
    printf("AS YOU LAND YOU GET A DEBRIEF FROM THE LIEUTENANT...\n");
    delay(del);
    printf("Lieutenant Nile: When you drop off this helicopter it is all up to you Captain.\n");
    delay(del);
    printf("There are also 2 main complexes that used to be where oil trucks would fill their tanks when the refinery was in operation.\n");
    delay(del);
    printf("We have been informed that the meeting will be in one of these buildings.\n");
    delay(del);
    printf("We will be picking you up after the mission is over at the LZ near the north west corner of the complex.\n");
    delay(del);
    printf("Good luck Captain, I believe in your guidence.\n");
    //FULL INTRO NOW COMPLETE MISSION STARTS
    delay(4000);
    printf("NOTE: MIDDLE 3 - CASTLE RAID\n");
    delay(del);
    printf("You land and rush out of the helicopter 19 armed soldiers behind you.\n");
    delay(del);
    printf("You can see the main gate to the refinery\n");
    delay(del);
    printf("You all run up to find 4 enemies there rifles rased.\n");
    delay(del);
    printf("They open fire but are quickly overran by the numbers of your squadron.\n");
    delay(del);
    printf("You all continue forward and see a glowing light in the distance your team all stop waiting for your camand.\n");
    delay(del);
    while(loop != 1){
        printf("OPTIONS: Investigate, Sneak, Attack: "); //tell the player there options
        scanf("%s", &choice);
        if (choice == "Investigate" || choice == "INVESTIGATE" || choice == "investigate"){
            printf("You all continue to walk farther down the trail eyes on the light ahead trying to get a better look at what it is.\n");
            delay(del);
            printf("Suddenly the sound of gunfire rattles the air and dust begins to kick up all around you.\n");
            delay(del);
            printf("there is some form of bunker ahead with a mounted machine gun laying down fire on your squad.\n");
            delay(del);
            printf("Thinking fast you tell your men to find cover and begin returing fire.\n");
            delay(del);
            printf("You can see that some of your men are hit from the machine gun spray and you begin shooting back.\n");
            e_distance = 100;
            combat();
            break;
        }
        if (choice == "Attack" || choice == "ATTACK" || choice == "attack"){
            printf("You tell your men to continue forward.\n");
            delay(del);
            printf("Suddenly the sound of gunfire rattles the air and dust begins to kick up all around you.\n");
            delay(del);
            printf("there is some form of bunker ahead with a mounted machine gun laying down fire on your squad.\n");
            delay(del);
            printf("Thinking fast you tell your men to find cover and begin returing fire.\n");
            delay(del);
            printf("Looking around it looks like everyone is ok so you turn to start returning fire.\n");
            e_distance = 100;
            combat();
            break;
        }
        if (choice == "sneak" || choice == "SNEAK" || choice == "Sneak"){
            printf("You decide it would be better for most of your forces to stay back while only a group of 3 move forward.\n");
            delay(del);
            printf("They all slowly move forward trying to be as quite as possible.\n");
            delay(del);
            printf("You can hear gunfire errupt further down the trail where the light is.\n");
            delay(del);
            printf("You wave a hand signal to your squadron and sprint foward to assist your scouts from whatever is shooting");
            delay(del);
            printf("You run up to the light to find that there was a small bunker there and your scouts managed to take out the gunner and the other soldiers in the bunker.\n");
            delay(del);
            printf("You commemorate your scouts on there work and continue forward.\n");
            delay(del);
            break;
        }
        else{
            printf("");
        }
    }
    printf("Moving past the bunker you come upon 2 warehouses that you assume are what the Lieutenant was talking about for where the target will be having the meeting.\n");
    delay(del);
    printf("You look around to see if there are any more note worthy objects in your surroundings.\n");
    delay(del);
    printf("You turn from the noise of a convoy of cars driving to the warehouse that is farthest from you.\n");
    delay(del);
    printf("You assume this convoy is carrying the target in one of the cars.\n");
    delay(del);
    while (loop != 1){
        printf("INVESTIGATE\nATTACK\n");
        scanf("%s", &choice);
        if (choice == "Investigate" || choice == "INVESTIGATE" || choice == "investigate"){
            printf("You decide to take the fight later and keep looking around the warehouses.\n");
            delay(del);
            printf("You walk to the warehouse closest to you, and step inside it appears to be some form if armory.\n");
            delay(del);
            printf("A guard walks through the hallway and sees you, he shouts alerting more guards.\n");
            delay(del);
            printf("You begin the fight...\n");
            delay(del);
            printf("You squadron breaches the armory and clears all of the rooms with haste making quick work of any armed resistance within.\n");
            delay(del);
            printf("Now that the Armory is clear you search the place to see if you can find anything useful.\n");
            delay(del);
            printf("You find a large valve on the wall that has a large FUEL label above it.\n");
            delay(del);
            printf("One of the soldiers in your squad walks up to you.\n");
            delay(del);
            printf("Sir I believe I know what this valve goes to.\n");
            delay(del);
            printf("You: What is it soldier.\n");
            delay(del);
            printf("Soldier: I believe I saw some fuel tanks outside with a gas line that lead to the warehouses, I think it goes to those.\n");
            delay(del);
            printf("Considering this you think if you want to turn the valve.\n");
            delay(del);
            
            while(loop != 1){
                printf("Do you want to turn the valve? YES/NO\n");
                scanf("%s", &YN);
                if (YN == "yes" || YN == "Yes" || YN == "YES"){
                    printf("You turn the valve, you can hear liquid start to move through the pipes in the walls.\n");
                    delay(del);
                    action = 1;
                    break;
                }
                else if (YN == "No" || YN == "no" || YN == "NO"){
                    printf("You leave the valve as you found it.\n");
                    break;
                }
                else{
                    printf("SYNTAX ERROR: CHECK SPELLING AND CAPITALIZATION\n");
                }
            }
            if (action != 1){
                printf("You and your squadron walk out of the warehouse getting ready to fight the near by convoy.\n");
                delay(del);
                printf("As you walk out of the warehouse you team is imediatly caught by gunfire from all directions.\n");
                delay(del);
                printf("Your men duck behind whatever they can or back inside the building to get out of the fire fight.\n");
                delay(del);
                printf("You laydown and ready your rifle rallying your men, You all prepare for your final stand...\n");
                e_distance = 50;
                combat();
                printf("One of your men loads his M249 SAW machine gun and starts to lay down suppressive fire on the enemy causing mavise enemy losses.\n");
                combat();
                e_distance = 100;
                combat();
                printf("It appears you are winning this fight though many of your men are falling, overall this situation does not look good for you.\n");
                combat();
                e_distance = 200;
                combat();
                printf("You manage to stand your ground but you can hear more people approaching in the distance.\n");
                delay(del);
                printf("You order your squad to retrete in order to save as many lives as possible.\n");
                delay(del);
                printf("You all begin to grab guns and dogtags off of dead soldiers if you can and hurry back the way you came.\n");
                delay(del);
                printf("While running your men are cut off by a massive convoy of terrorists.\n");
                delay(del);
                printf("You can see your men beginning to return fire and you begin to shoot back at the enemy.\n");
                delay(del);
                printf("Running low on rounds and out numbered 2 to 1 you start attempting to think of a way out of this situation\n");
                delay(del);
                printf("Nothing comes to mind as you have been trapped in a kill box and enemies are approaching on all sides.\n");
                delay(del);
                printf("Your squad is soon over ran by enemies.\n");
                delay(del);
                printf("ENDING 7/9 - HEAVY LOSS\n");
                break;
            }
            if (action == 1){
                printf("You and your squadron walk out of the warehouse getting ready to fight the near by convoy.\n");
                delay(del);
                printf("As you walk out of the warehouse you team is imediatly caught by gunfire from all directions.\n");
                delay(del);
                printf("Your men duck behind whatever they can or back inside the building to get out of the fire fight.\n");
                delay(del);
                printf("You laydown and ready your rifle rallying your men, You all prepare for your final stand...\n");
                e_distance = 50;
                combat();
                printf("One of your men loads his M249 SAW machine gun and starts to lay down suppressive fire on the enemy causing mavise enemy losses.\n");
                combat();
                e_distance = 100;
                combat();
                printf("It appears you are winning this fight though many of your men are falling, overall this situation does not look good for you.\n");
                combat();
                e_distance = 200;
                combat();
                printf("You manage to stand your ground but you can hear more people approaching in the distance.\n");
                delay(del);
                printf("You order your squad to retrete in order to save as many lives as possible.\n");
                delay(del);
                printf("Some of your men begin to throw grenades around to clear out the enemies.\n");
                delay(del);
                printf("You have an idea and have a soldier hand you a grenade.\n");
                delay(del);
                printf("You throw the grenade through a near by window of the warehouse with the convoy in it and hear it go off\n");
                delay(del);
                printf("As it goes off the entire building goes up in flames in a massive exposition, this must have been caused by the fuel running through the walls of the warehouse.\n");
                delay(del);
                printf("You manage to clear out the remaning enemies in front of you and round everyone up.\n");
                delay(del);
                printf("Your men begin walking to the LZ where you are to be picked up and begin to get shot at by a massive group of talaban soldiers.\n");
                delay(del);
                printf("You and your team begin to shoot back but being caught in the open are suffering heavy losses.\n");
                delay(del);
                printf("You slowly begin to loose more and more men and there does not look to be a way out of this.\n");
                delay(del);
                printf("ENDING 8/9 - BITTER SWEET\n");
                break;
            }
        
        }
        if (choice == "attack"){
            printf("You run forward to face the fight infront of you...\n");
            e_distance = 50;
            combat();
            combat();
            printf("Your team is making quick work of the enemy soldiers in the convoy taking one out after another.\n");
            e_distance = 100;
            combat();
            printf("The fighting force of you men appears to be to much for the enemy and they all start to retrete.\n");
            combat();
            e_distance = 200;
            combat();
            printf("After blazing through the convoy you run into the warehouse to find the target standing with a few guards.\n");
            delay(del);
            printf("Without even needing to give the command your men open fire making light work of the small group ahead.\n");
            delay(del);
            printf("You all rush outside and shoot the flare into the air to alert the Lieutenant that the mission is comleted.\n");
            delay(del);
            printf("NOTE: BACK ON THE HELICOPTER\n");
            delay(del);
            printf("Lieutenant Nile: Good work Captain %s.\n", p_name);
            delay(del);
            printf("You got through that mission with quick haste and with minimal casualties.\n");
            delay(del);
            printf("I am very happy with your performance\n");
            delay(del);
            printf("You will be commemorated back at base for your work on the field.\n");
            delay(del);
            printf("ENDING 9/9 - BLAZE OF FURY");
            break;
        }
    }
    
return(1);
}

int main(){
    introduction();
    return(1);
}



