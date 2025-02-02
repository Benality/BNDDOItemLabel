
# Installation
1. Copy all files from the zip folder into your resources folder
2. ensure bnddo_itemlabel in your server resources.cfg
3. Add your item label to the database or change the name in the config to match your item. (This must be unique)

#### Note:
- Descriptions are set to be between 5 and 50 characters
- Labels are set to be between 5 and 20 characters

I COULD add this as a configuration option, but this should be sufficient. Labels should be short and descriptions shouldn't be a paragraph.

# Configuration Options

```Debug: true | false``` If true, will print useful information in the console. Not recommended to have enabled on live servers

```itemLabel | string```: this item must exist in your database and be unique. You can change the name to whatever you wish

```oneLabelPerItem: true | false ``` This will determine how many of the itemLabel will be required for each label. If this is true then each item you want to label will also use an itemLabel. Example: It will consume 5 item labels to label 5 cakes. If this is fale, it will allow players to label an entire stack of an item with one label. 

```labelMode | number```: 

1. Labels Only: When you open the menu, only the label will be available to edit
2. Descriptions Only: The description field is the only option available in the menu
3. Labels and Descriptions: Both are allowed. If the user provides both, both will be used. 

```allowAmmo true | false```: Allows ammo items to be displayed for item labels. You will need to test if this will have any impact in your weapon script. This could be useful for gunsmiths if it doesn't interfere.


```blacklistedItems | table``` - Provide any item names that you do not wish to be listed in the item select screen. I would include items that you know are part of other scripts that could potentially break the script. For instnace, mining picaxes that have durability. Test these items to ensure they work. You must use the format `['item_name'] = true` in order for the item to be blacklisted.

```jobs false | table ``` If you want to define a list of jobs that are allowed to use the Itemlabel define those using the below format. Otherwise, leave the jobs value to false.

```lua
 jobs = {
    ['jobname'] = true,
    ['GunSmith'] = true
  } ,
 ```

```blacklistedWords | table``` List of words to be blacklisted in order to moderate item label names. Players can still be sneaky and slide in alternative spellings, add words as you need. This will convert any word to lowercase to match against these words. Leet speak is mitigated due to now allowing special characters or numbers.


```useWebhookURL string ```: Add the URL of the Discord webhook if you want to receive webhooks whenever a new item label is created. This is useful to help moderate item label names.

```useCustomNotification true | false```: If true place your custom notification within the LabelNotification function.  FUTURE IMPLEMENTATION

## Debug Command
If you are testing, there is a chance that you might break the ability to open your inventory. Since players are tricky, we are disabling the inventory when the itemLabel is used to prevent duplication. In Debug mode only, you can use the /resetinventory command to enable opening the inventory. This shouldn't be necessary to use at all as long as nothing breaks. 

---
### If items already have meta data defined, either from a previous item_label or from a 3rd party script items will not be displayed. This is to prevent item name collisions and script errors with 3rd party scripts.

### When you create an item label, that item becomes "unique" in the items_crafted table. There are some instances, where this may break the usability of said item. I have confirmed that consumables with Outsider_needs work, you will need to verify with other scripts. For instance, 556 mining uses metadata to track durability. It writes new meta data each time the durability changes. Therefore, any meta data on the item will break the functionality.

### I have not yet tested with vorp degredation. This shouldn't be an impact since degradation doesn't use metadata. 
