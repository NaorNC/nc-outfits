# Things you should know:

* The code was built for Old QBCore, you can of course change it to new if you want. (If you need help feel free to ask)
* Make sure you change in config.lua to your Core. Config.TriggerPrefix = "FrameWork" -- Change "FrameWork".
* All player outfits data will be saved to the player in a database.json file. for example - {"OVZ61343":[]}
* You will need to change the menu export in client.lua -> line 180. exports["nc-menu"]:openMenu(menu) - this is important. Without the above menu you will not be able to see which outfits you have saved. [You can use qb-menu of - https://github.com/qbcore-framework/qb-menu]
* To add more places where you can use outfits you can see at client.lua -> line 14. local Locations = {
* If you have any further questions, you can add me to Discord.
