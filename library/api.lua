--- @type boolean|nil
LuaLogFlag = false

--- Prints info to log
--- @param message string
function print_info(message) end

--- Prints error to log but do not breaks execution
--- @param message string
function print_err(message) end

--- Prints warning to log
--- @param message string
function print_warn(message) end

--- Dimension of the running session
--- @type Dimension
dim = {}


-- end of common --

--- Base class for recipe processing machines
--- 
--- @class AbstractCrafter : BlockLogic
--- @field recipes RecipeDictionary
--- @field load_independent boolean
--- @field stable_supply boolean
--- @field input_gathered boolean
--- @field bonus_delivered boolean
--- @field switch_on boolean
--- @field ticks_passed integer
--- @field real_ticks_passed integer
--- @field total_production integer
--- @field speed integer
--- @field productivity integer percent (e.g. 15 = +15%)
--- @field energy_input_inventory ResourceInventory
--- @field energy_output_inventory ResourceInventory
--- @field crafter_input_container InventoryContainer
--- @field crafter_output_container InventoryContainer
AbstractCrafter = {}

--- Select the recipe producing an item, the way a player picks it in the machine window
--- @param item StaticItem
--- @return boolean False when the crafter has no recipe dictionary, or when a network session took the pick over and will apply it on its own tick; either way the current recipe is untouched right now
function AbstractCrafter:select_recipe_by_output(item) end

--- Trying to cast Object into AbstractCrafter
--- @param object Object Value to cast
--- @return AbstractCrafter
function AbstractCrafter.cast(object) end

--- Return AbstractCrafter class object
--- @return Class
function AbstractCrafter.get_class() end

--- Creates a new AbstractCrafter instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return AbstractCrafter
function AbstractCrafter.new(parent, name) end

--- Creates a new AbstractCrafter instance
--- @return AbstractCrafter
function AbstractCrafter.new_simple() end

--- Block side attachment point
--- 
--- @class Accessor : Instance
--- @field side Vec3i Side direction of the owning block
--- @field pos Vec3i Block local position
--- @field owner BlockLogic Block this accessor belongs to
--- @field cover StaticCover Cover prototype placed on this side
Accessor = {}

--- Accessor of the neighbor block this side touches, nil when nothing is attached to it
--- @return Accessor Accessor facing this one
function Accessor:neighbor() end

--- Trying to cast Object into Accessor
--- @param object Object Value to cast
--- @return Accessor
function Accessor.cast(object) end

--- Return Accessor class object
--- @return Class
function Accessor.get_class() end

--- Creates a new Accessor attached to a block
--- @param parent BlockLogic Owning block
--- @param name string The name of the accessor
--- @return Accessor
function Accessor.new(parent, name) end

--- World actor
--- 
--- @class Actor : Object
Actor = {}

--- Create, register and attach a component of the given class
--- @param component_class Class Component class to instantiate
--- @param component_name string Subobject name
--- @return ActorComponent
function Actor:add_actor_component(component_class, component_name) end

--- Assign an object into a UObject property of the actor by name
--- @param field_name string UPROPERTY name
--- @param object Object Value to assign
--- @return boolean
function Actor:set_field_object(field_name, object) end

--- Engine actor component
--- 
--- @class ActorComponent
--- @field name string Object name
ActorComponent = {}

--- Creative generator producing unlimited power
--- 
--- @class AdminElectricGeneratorBlockLogic : BlockLogic
AdminElectricGeneratorBlockLogic = {}

--- Trying to cast Object into AdminElectricGeneratorBlockLogic
--- @param object Object Value to cast
--- @return AdminElectricGeneratorBlockLogic
function AdminElectricGeneratorBlockLogic.cast(object) end

--- Return AdminElectricGeneratorBlockLogic class object
--- @return Class
function AdminElectricGeneratorBlockLogic.get_class() end

--- Creates a new AdminElectricGeneratorBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return AdminElectricGeneratorBlockLogic
function AdminElectricGeneratorBlockLogic.new(parent, name) end

--- Creates a new AdminElectricGeneratorBlockLogic instance
--- @return AdminElectricGeneratorBlockLogic
function AdminElectricGeneratorBlockLogic.new_simple() end

--- Engine skeletal animation sequence
--- 
--- @class AnimSequence : Object
--- @field name string Object name
AnimSequence = {}

--- Load an animation sequence asset
--- @param path string Path to the object
--- @return AnimSequence
function AnimSequence.load(path) end

--- Block actor driven by the animation manager
--- 
--- @class AnimatedBlockActor : BlockActor
AnimatedBlockActor = {}

--- Crafter that picks its recipe from the input inventory
--- 
--- @class AutoCrafter : SelectCrafter
AutoCrafter = {}

--- Trying to cast Object into AutoCrafter
--- @param object Object Value to cast
--- @return AutoCrafter
function AutoCrafter.cast(object) end

--- Return AutoCrafter class object
--- @return Class
function AutoCrafter.get_class() end

--- Creates a new AutoCrafter instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return AutoCrafter
function AutoCrafter.new(parent, name) end

--- Creates a new AutoCrafter instance
--- @return AutoCrafter
function AutoCrafter.new_simple() end

--- Inventory that grows and shrinks with its contents
--- 
--- @class AutosizeInventory : Inventory
AutosizeInventory = {}

--- Trying to cast Object into AutosizeInventory
--- @param object Object Value to cast
--- @return AutosizeInventory
function AutosizeInventory.cast(object) end

--- Return AutosizeInventory class object
--- @return Class
function AutosizeInventory.get_class() end

--- Creates a new AutosizeInventory instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return AutosizeInventory
function AutosizeInventory.new(parent, name) end

--- Creates a new AutosizeInventory instance
--- @return AutosizeInventory
function AutosizeInventory.new_simple() end

--- Inventory storage base with slots, filter and capacity
--- 
--- @class BaseInventory : InventoryAccess
BaseInventory = {}

--- Trying to cast Object into BaseInventory
--- @param object Object Value to cast
--- @return BaseInventory
function BaseInventory.cast(object) end

--- Return BaseInventory class object
--- @return Class
function BaseInventory.get_class() end

--- Accessor that moves items in and out of a block
--- 
--- @class BaseInventoryAccessor : Accessor
--- @field auto_output boolean Push items into the neighbour on every tick
--- @field input InventoryAccess Inventory items arriving through this side are put into
--- @field output InventoryAccess Inventory items leaving through this side are taken from
BaseInventoryAccessor = {}

--- Trying to cast Object into BaseInventoryAccessor
--- @param object Object Value to cast
--- @return BaseInventoryAccessor
function BaseInventoryAccessor.cast(object) end

--- Return BaseInventoryAccessor class object
--- @return Class
function BaseInventoryAccessor.get_class() end

--- Creates a new BaseInventoryAccessor attached to a block
--- @param parent BlockLogic Owning block
--- @param name string The name of the accessor
--- @return BaseInventoryAccessor
function BaseInventoryAccessor.new(parent, name) end

--- Bed used as a respawn point
--- 
--- @class BedBlockLogic : BlockLogic
BedBlockLogic = {}

--- Trying to cast Object into BedBlockLogic
--- @param object Object Value to cast
--- @return BedBlockLogic
function BedBlockLogic.cast(object) end

--- Return BedBlockLogic class object
--- @return Class
function BedBlockLogic.get_class() end

--- Creates a new BedBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return BedBlockLogic
function BedBlockLogic.new(parent, name) end

--- Creates a new BedBlockLogic instance
--- @return BedBlockLogic
function BedBlockLogic.new_simple() end

--- Terrain biome definition
--- 
--- @class Biome : Prototype
Biome = {}

--- Trying to cast Object into Biome
--- @param object Object Value to cast
--- @return Biome
function Biome.cast(object) end

--- Return Biome class object
--- @return Class
function Biome.get_class() end

--- Looks Biome up in db, nil when there is none
--- @param name string The name of the object
--- @return Biome
function Biome.find(name) end

--- Takes Biome from db, reports a miss to the log
--- @param name string The name of the object
--- @return Biome
function Biome.get(name) end

--- Register a new Biome static object
--- @param name string The name of the object
--- @return Biome
function Biome.reg(name) end

--- Biome that picks one of its sub-biomes per position
--- 
--- @class BiomeFamily : Biome
--- @field sub_biomes Biome[] Sub-biomes this family selects from
--- @field sub_frequency number Frequency of the sub-biome selection noise
--- @field perturb_amp number Amplitude of the coarse domain warp
--- @field perturb_frequency number Frequency of the coarse domain warp
--- @field perturb_octaves integer Octave count of the coarse domain warp
--- @field perturb_fine_amp number Amplitude of the fine domain warp
--- @field perturb_fine_frequency number Frequency of the fine domain warp
BiomeFamily = {}

--- Trying to cast Object into BiomeFamily
--- @param object Object Value to cast
--- @return BiomeFamily
function BiomeFamily.cast(object) end

--- Return BiomeFamily class object
--- @return Class
function BiomeFamily.get_class() end

--- Looks BiomeFamily up in db, nil when there is none
--- @param name string The name of the object
--- @return BiomeFamily
function BiomeFamily.find(name) end

--- Takes BiomeFamily from db, reports a miss to the log
--- @param name string The name of the object
--- @return BiomeFamily
function BiomeFamily.get(name) end

--- Register a new BiomeFamily static object
--- @param name string The name of the object
--- @return BiomeFamily
function BiomeFamily.reg(name) end

--- World generator driven by a global biome family
--- 
--- @class BiomeWorldGenerator : WorldGenerator
--- @field global_biome GlobalBiomeFamily Global biome family laying out the surface
BiomeWorldGenerator = {}

--- Trying to cast Object into BiomeWorldGenerator
--- @param object Object Value to cast
--- @return BiomeWorldGenerator
function BiomeWorldGenerator.cast(object) end

--- Return BiomeWorldGenerator class object
--- @return Class
function BiomeWorldGenerator.get_class() end

--- Looks BiomeWorldGenerator up in db, nil when there is none
--- @param name string The name of the object
--- @return BiomeWorldGenerator
function BiomeWorldGenerator.find(name) end

--- Takes BiomeWorldGenerator from db, reports a miss to the log
--- @param name string The name of the object
--- @return BiomeWorldGenerator
function BiomeWorldGenerator.get(name) end

--- Register a new BiomeWorldGenerator static object
--- @param name string The name of the object
--- @return BiomeWorldGenerator
function BiomeWorldGenerator.reg(name) end

--- World actor representing a placed block
--- 
--- @class BlockActor : Actor
--- @field logic BlockLogic Block logic this actor represents
--- @field hull_material Material Material applied to the block hull
BlockActor = {}

--- Trying to cast Object into BlockActor
--- @param object Object Object to cast
--- @return BlockActor
function BlockActor.cast(object) end

--- Runtime state of a placed block
--- 
--- @class BlockLogic : Instance
--- @field map_register boolean Whether this block shows up on the map
--- @field static_block StaticBlock Prototype this block was spawned from
--- @field pos Vec3i Cell this block stands in
--- @field quat FQuat Rotation turning the block's local sides into world sides
BlockLogic = {}

--- Register Accessor
--- @param accessor Accessor Accessor instance to register
function BlockLogic:reg(accessor) end

--- Find a registered accessor by name
--- @param name string Accessor name
--- @return Accessor
function BlockLogic:find_accessor(name) end

--- Every accessor registered on this block
--- @return Accessor[] Registered accessors
function BlockLogic:accessors() end

--- Trying to cast Object into BlockLogic
--- @param object Object Value to cast
--- @return BlockLogic
function BlockLogic.cast(object) end

--- Return BlockLogic class object
--- @return Class
function BlockLogic.get_class() end

--- Creates a new BlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return BlockLogic
function BlockLogic.new(parent, name) end

--- Creates a new BlockLogic instance
--- @return BlockLogic
function BlockLogic.new_simple() end

--- Chest storage block
--- 
--- @class ChestBlockLogic : StorageBlockLogic
--- @field capacity integer Chest slot count
ChestBlockLogic = {}

--- Trying to cast Object into ChestBlockLogic
--- @param object Object Value to cast
--- @return ChestBlockLogic
function ChestBlockLogic.cast(object) end

--- Return ChestBlockLogic class object
--- @return Class
function ChestBlockLogic.get_class() end

--- Creates a new ChestBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return ChestBlockLogic
function ChestBlockLogic.new(parent, name) end

--- Creates a new ChestBlockLogic instance
--- @return ChestBlockLogic
function ChestBlockLogic.new_simple() end

--- Engine class object
--- 
--- @class Class : Object
--- @field name string Object name
Class = {}

--- Find a loaded class by name
--- @param name string Class name
--- @return Class
function Class.find(name) end

--- Load a class asset
--- @param path string Path to the object
--- @return Class
function Class.load(path) end

--- Trying to cast Object into Class
--- @param object Object Object to cast
--- @return Class
function Class.cast(object) end

--- Whether this class derives from another one
--- @param other Class Candidate parent class
--- @return boolean
function Class:is_child_of(other) end

--- 8 bit per channel RGBA color
--- 
--- @class Color
--- @field r integer Red channel 0-255
--- @field g integer Green channel 0-255
--- @field b integer Blue channel 0-255
--- @field a integer Alpha channel 0-255
--- @field red Color (255, 0, 0, 255)
--- @field green Color (0, 255, 0, 255)
--- @field blue Color (0, 0, 255, 255)
--- @field yellow Color (255, 255, 0, 255)
--- @field cyan Color (0, 255, 255, 255)
--- @field magenta Color (255, 0, 255, 255)
--- @field white Color (255, 255, 255, 255)
--- @field black Color (0, 0, 0, 255)
--- @field gray Color (128, 128, 128, 255)
--- @field orange Color (243, 156, 18, 255)
--- @field purple Color (169, 7, 228, 255)
--- @field transparent Color (0, 0, 0, 0)
Color = {}

--- Create a color from channel values 0-255
--- @param r integer Red channel
--- @param g integer Green channel
--- @param b integer Blue channel
--- @param a integer Alpha channel
--- @return Color
function Color.new(r, g, b, a) end

--- Block that speeds up nearby machines
--- 
--- @class ComputerBlockLogic : BlockLogic
--- @field energy_inventory ResourceInventory Internal energy buffer
--- @field energy_input ResourceAccessor Electric input accessor
ComputerBlockLogic = {}

--- Trying to cast Object into ComputerBlockLogic
--- @param object Object Value to cast
--- @return ComputerBlockLogic
function ComputerBlockLogic.cast(object) end

--- Return ComputerBlockLogic class object
--- @return Class
function ComputerBlockLogic.get_class() end

--- Creates a new ComputerBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return ComputerBlockLogic
function ComputerBlockLogic.new(parent, name) end

--- Creates a new ComputerBlockLogic instance
--- @return ComputerBlockLogic
function ComputerBlockLogic.new_simple() end

--- Wire block carrying a resource network
--- 
--- @class ConductorBlockLogic : BlockLogic
--- @field side_cover StaticCover Cover mesh used for wire ends
--- @field center_cover StaticCover Cover mesh used for the block center
--- @field channel string Network channel name
--- @field conductor_channel integer Numeric network channel
--- @field capacity integer Storage added to the network
--- @field drain integer Loss per tick
ConductorBlockLogic = {}

--- Add side wire
--- @param acc ResourceAccessor Resource accessor to attach
function ConductorBlockLogic:add_wire(acc) end

--- Trying to cast Object into ConductorBlockLogic
--- @param object Object Value to cast
--- @return ConductorBlockLogic
function ConductorBlockLogic.cast(object) end

--- Return ConductorBlockLogic class object
--- @return Class
function ConductorBlockLogic.get_class() end

--- Creates a new ConductorBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return ConductorBlockLogic
function ConductorBlockLogic.new(parent, name) end

--- Creates a new ConductorBlockLogic instance
--- @return ConductorBlockLogic
function ConductorBlockLogic.new_simple() end

--- Engine console
--- 
--- @class Console : Instance
Console = {}

--- Executes engine console command
--- @param command string Command line
function Console.run(command) end

--- Get engine console variable
--- @param variable string Variable name
--- @return string
function Console.get_string(variable) end

--- Get engine console variable
--- @param variable string Variable name
--- @return number
function Console.get_float(variable) end

--- Get engine console variable
--- @param variable string Variable name
--- @return integer
function Console.get_int(variable) end

--- Trying to cast Object into Console
--- @param object Object Value to cast
--- @return Console
function Console.cast(object) end

--- Return Console class object
--- @return Class
function Console.get_class() end

--- Creates a new Console instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return Console
function Console.new(parent, name) end

--- Creates a new Console instance
--- @return Console
function Console.new_simple() end

--- Belt carrying one item per half cell
--- 
--- @class ConveyorBlockLogic : BlockLogic
--- @field ticks_per_item integer Exact time to carry one item across half a cell, in ticks
ConveyorBlockLogic = {}

--- Trying to cast Object into ConveyorBlockLogic
--- @param object Object Value to cast
--- @return ConveyorBlockLogic
function ConveyorBlockLogic.cast(object) end

--- Return ConveyorBlockLogic class object
--- @return Class
function ConveyorBlockLogic.get_class() end

--- Creates a new ConveyorBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return ConveyorBlockLogic
function ConveyorBlockLogic.new(parent, name) end

--- Creates a new ConveyorBlockLogic instance
--- @return ConveyorBlockLogic
function ConveyorBlockLogic.new_simple() end

--- Prototype database filled by mods
--- 
--- @class DB : Instance
DB = {}

--- Register Prototype in DB
--- @param proto Prototype Prototype to register
function DB:reg(proto) end

--- Remove Prototype from DB
--- @param proto Prototype Prototype to remove
--- @return boolean was Prototype removed
function DB:remove(proto) end

--- Register object with class "class" and name "name" from table, filling all other properties from that table too
--- @param table table Object table
function DB:from_table(table) end

--- Register mod table
--- @param table table Mod table
function DB:mod(table) end

--- Return all registered objects
--- @return Object[]
function DB:objects() end

--- Trying to cast Object into DB
--- @param object Object Value to cast
--- @return DB
function DB.cast(object) end

--- Return DB class object
--- @return Class
function DB.get_class() end

--- Creates a new DB instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return DB
function DB.new(parent, name) end

--- Creates a new DB instance
--- @return DB
function DB.new_simple() end

--- Block whose center cover can be redesigned in game
--- 
--- @class DesignableCoverBlockLogic : BlockLogic
--- @field cover_set StaticCoverSet Cover variants offered by the design tool
DesignableCoverBlockLogic = {}

--- Trying to cast Object into DesignableCoverBlockLogic
--- @param object Object Value to cast
--- @return DesignableCoverBlockLogic
function DesignableCoverBlockLogic.cast(object) end

--- Return DesignableCoverBlockLogic class object
--- @return Class
function DesignableCoverBlockLogic.get_class() end

--- Creates a new DesignableCoverBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return DesignableCoverBlockLogic
function DesignableCoverBlockLogic.new(parent, name) end

--- Creates a new DesignableCoverBlockLogic instance
--- @return DesignableCoverBlockLogic
function DesignableCoverBlockLogic.new_simple() end

--- Fence block connecting to its neighbors
--- 
--- @class DesignableFenceBlockLogic : BlockLogic
--- @field half_cover StaticCover Cover spawned towards a connected neighbor
--- @field center_cover StaticCover Cover spawned at the block center
--- @field cover_set StaticCoverSet Cover variants offered by the design tool
DesignableFenceBlockLogic = {}

--- Trying to cast Object into DesignableFenceBlockLogic
--- @param object Object Value to cast
--- @return DesignableFenceBlockLogic
function DesignableFenceBlockLogic.cast(object) end

--- Return DesignableFenceBlockLogic class object
--- @return Class
function DesignableFenceBlockLogic.get_class() end

--- Creates a new DesignableFenceBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return DesignableFenceBlockLogic
function DesignableFenceBlockLogic.new(parent, name) end

--- Creates a new DesignableFenceBlockLogic instance
--- @return DesignableFenceBlockLogic
function DesignableFenceBlockLogic.new_simple() end

--- Playable surface holding the block world
--- 
--- @class Dimension : Actor
Dimension = {}

--- Build a block the way a tool in hand builds one: the edit goes on the undo stack and out to the other peers. The cell has to be streamed in, so move the player there first. The block itself lands at the host's stamped tick, so read it back with get_block a tick later
--- @param bpos Vec3i Block position
--- @param block StaticBlock Block type to build
--- @param rotation FQuat? Rotation, nil for identity
--- @return boolean True when the edit was taken
function Dimension:place(bpos, block, rotation) end

--- Break the block standing at the position the way a tool in hand breaks it: the edit goes on the undo stack and out to the other peers. The cell has to be streamed in, so move the player there first
--- @param bpos Vec3i Block position
--- @return boolean True when the edit was taken
function Dimension:dig(bpos) end

--- Block standing in the cell at the given position, nil when the cell is empty or its column is not loaded
--- @param bpos Vec3i Block position
--- @return StaticBlock Block type in the cell
function Dimension:get_cell(bpos) end

--- Runtime block standing in the cell at the given position, nil when the cell is empty or its column is not loaded
--- @param bpos Vec3i Block position
--- @return BlockLogic Block logic in the cell
function Dimension:get_block(bpos) end

--- Sample the terrain surface the generator builds at XY, in world cell coordinates. Surface rock detail can still raise the built ground a few cells above this
--- @param x number X coordinate in world cells
--- @param y number Y coordinate in world cells
--- @return number Surface height in cells, sea level at 0
function Dimension:sample_height(x, y) end

--- Move the player to a block position, which moves the column streaming anchor with it
--- @param bpos Vec3i Block position
function Dimension:teleport(bpos) end

--- Whether a teleport is still waiting for the target columns to finish compiling
--- @return boolean True while the player is still in transit
function Dimension:teleport_pending() end

--- How many columns the streaming area around the player is still generating or reading from disk
--- @return number Columns waiting on the load worker
function Dimension:columns_loading() end

--- How many sectors of streamed-in columns have no mesh built for their current contents
--- @return number Sectors waiting on the mesh compiler
function Dimension:sectors_compiling() end

--- Whether the world around the player has finished streaming: nothing left to load, nothing left to mesh
--- @return boolean True when both counts are zero
function Dimension:streaming_ready() end

--- How much of an item machines and hand crafts have produced on this surface over the whole save, zero for an item nothing has made yet
--- @param item StaticItem Item to count
--- @return number Units produced all time
function Dimension:get_produced(item) end

--- Place a build ghost standing for a block, the way the build tool places one when the item in hand runs out. The ghost lands at the host's stamped tick, so read it back with get_block a tick later
--- @param bpos Vec3i Block position
--- @param target StaticBlock Block the ghost stands for
--- @param rotation FQuat? Rotation, nil for identity
--- @return boolean True when the edit was taken
function Dimension:place_ghost(bpos, target, rotation) end

--- Block position the player spawns at
--- @return Vec3i Spawn position in block cells
function Dimension:spawn_point() end

--- Door the player can open and close
--- 
--- @class DoorBlockLogic : BlockLogic
DoorBlockLogic = {}

--- Trying to cast Object into DoorBlockLogic
--- @param object Object Value to cast
--- @return DoorBlockLogic
function DoorBlockLogic.cast(object) end

--- Return DoorBlockLogic class object
--- @return Class
function DoorBlockLogic.get_class() end

--- Creates a new DoorBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return DoorBlockLogic
function DoorBlockLogic.new(parent, name) end

--- Creates a new DoorBlockLogic instance
--- @return DoorBlockLogic
function DoorBlockLogic.new_simple() end

--- Base class of resource extracting machines
--- 
--- @class DrillingMachineBase : BlockLogic
--- @field ticks_per_item integer Exact time to extract one item, in ticks
--- @field remaining_energy integer Energy left of the current cycle
--- @field productivity integer Bonus output percent, 15 means +15%
--- @field total_production integer Completed cycles, bonus cycles included
--- @field inventory InventoryContainer Output inventory
--- @field energy ResourceInventory Energy inventory
--- @field production integer Items produced per cycle
--- @field storage_size integer Output inventory capacity
--- @field last_speed integer Last measured speed percent
--- @field current_recipe_time integer Ticks of the recipe in progress
DrillingMachineBase = {}

--- Whether the output inventory can take one more item
--- @return boolean
function DrillingMachineBase:has_storage_space() end

--- Whether the current cycle still has energy
--- @return boolean
function DrillingMachineBase:is_energy_available() end

--- Deposit being mined, nil for machines without one
--- @return SourceData
function DrillingMachineBase:get_source() end

--- Trying to cast Object into DrillingMachineBase
--- @param object Object Value to cast
--- @return DrillingMachineBase
function DrillingMachineBase.cast(object) end

--- Return DrillingMachineBase class object
--- @return Class
function DrillingMachineBase.get_class() end

--- Drilling machine that extracts ore from the ground
--- 
--- @class DrillingRig : DrillingMachineBase
--- @field source SourceData Ore deposit under the machine
DrillingRig = {}

--- Trying to cast Object into DrillingRig
--- @param object Object Value to cast
--- @return DrillingRig
function DrillingRig.cast(object) end

--- Return DrillingRig class object
--- @return Class
function DrillingRig.get_class() end

--- Creates a new DrillingRig instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return DrillingRig
function DrillingRig.new(parent, name) end

--- Creates a new DrillingRig instance
--- @return DrillingRig
function DrillingRig.new_simple() end

--- Electricity storage node of a conductor network
--- 
--- @class ElectricityContainerBlockLogic : ConductorBlockLogic
ElectricityContainerBlockLogic = {}

--- Trying to cast Object into ElectricityContainerBlockLogic
--- @param object Object Value to cast
--- @return ElectricityContainerBlockLogic
function ElectricityContainerBlockLogic.cast(object) end

--- Return ElectricityContainerBlockLogic class object
--- @return Class
function ElectricityContainerBlockLogic.get_class() end

--- Creates a new ElectricityContainerBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return ElectricityContainerBlockLogic
function ElectricityContainerBlockLogic.new(parent, name) end

--- Creates a new ElectricityContainerBlockLogic instance
--- @return ElectricityContainerBlockLogic
function ElectricityContainerBlockLogic.new_simple() end

--- Player facing engine and video settings
--- 
--- @class Engine : Object
--- @field props_mul number
--- @field dpi number
--- @field mouse_sensitivity_x number
--- @field mouse_sensitivity_y number
--- @field mouse_inversion_x boolean
--- @field mouse_inversion_y boolean
--- @field props_quality number
--- @field reflection_preset integer
--- @field transparency_preset integer
--- @field gi_preset integer
--- @field limit_texture_pool_to_vram boolean
--- @field texture_pool_size_mb integer
--- @field texture_max_temp_memory_mb integer
--- @field texture_mip_bias number
--- @field render_target_pool_min_mb integer
--- @field detail_shadows boolean
--- @field spotlight_shadows boolean
--- @field fps integer
--- @field res_x integer
--- @field res_y integer
--- @field loading_range integer
--- @field performance boolean
--- @field performance_graph boolean
--- @field compass boolean
--- @field compass_show_nearest_ore boolean
--- @field compass_show_spawn_point boolean
--- @field quest_tracker boolean
--- @field ctrl_hotbar boolean
--- @field alt_hotbar boolean
--- @field shift_hotbar boolean
--- @field fov number
--- @field fog number
--- @field window_mode integer
--- @field autosave_period integer
--- @field memory_stats boolean
--- @field weather_particles integer
--- @field wind_animation number
--- @field cloud_preset integer
--- @field sector_lod_count integer
--- @field mute_on_focus_loss boolean
Engine = {}

--- Apply the current settings to the engine
function Engine:apply() end

--- Show the keep or revert confirmation dialog
function Engine:show_confirmation() end

--- Crafter powered by solar or wind environment
--- 
--- @class EnvironmentCrafter : SelectCrafter
--- @field environment_factor01 number
--- @field wind_powered boolean
--- @field cut_in_wind_speed number Wind speed at which the rotor starts turning; below it output is zero
--- @field rated_wind_speed number Wind speed at which output reaches the block rated production
EnvironmentCrafter = {}

--- Trying to cast Object into EnvironmentCrafter
--- @param object Object Value to cast
--- @return EnvironmentCrafter
function EnvironmentCrafter.cast(object) end

--- Return EnvironmentCrafter class object
--- @return Class
function EnvironmentCrafter.get_class() end

--- Creates a new EnvironmentCrafter instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return EnvironmentCrafter
function EnvironmentCrafter.new(parent, name) end

--- Creates a new EnvironmentCrafter instance
--- @return EnvironmentCrafter
function EnvironmentCrafter.new_simple() end

--- Filter that accepts items declaring the matching equipment slot
--- 
--- @class EquipmentSlotFilter : InventoryFilter
EquipmentSlotFilter = {}

--- Trying to cast Object into EquipmentSlotFilter
--- @param object Object Value to cast
--- @return EquipmentSlotFilter
function EquipmentSlotFilter.cast(object) end

--- Return EquipmentSlotFilter class object
--- @return Class
function EquipmentSlotFilter.get_class() end

--- Creates a new EquipmentSlotFilter instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return EquipmentSlotFilter
function EquipmentSlotFilter.new(parent, name) end

--- Creates a new EquipmentSlotFilter instance
--- @return EquipmentSlotFilter
function EquipmentSlotFilter.new_simple() end

--- Gameplay event bus
--- 
--- @class EventSystem
EventSystem = {}

--- Get the event bus singleton
--- @return EventSystem
function EventSystem.get() end

--- Subscribe a handler to an event, returns the handler id
--- @param event integer Event id from defines.events
--- @param func function Handler called with the event context table
--- @return integer
function EventSystem:sub(event, func) end

--- Remove a previously subscribed handler
--- @param event integer Event id from defines.events
--- @param handler_id integer Value returned by sub
function EventSystem:unsub(event, handler_id) end

--- Emit an event to every subscribed handler
--- @param event integer Event id from defines.events
--- @param context table Context table passed to handlers
function EventSystem:emmit(event, context) end

--- Item yielded by a resource deposit and its extraction speed
--- 
--- @class ExtractionData
--- @field item StaticItem Extracted item
--- @field speed integer Extraction speed
ExtractionData = {}

--- Create new instance of ExtractionData
--- @return ExtractionData
function ExtractionData.new() end

--- Rotation quaternion
--- 
--- @class FQuat
--- @field identity FQuat Zero rotation
--- @field x number
--- @field y number
--- @field z number
--- @field w number
FQuat = {}

--- Create a quaternion from raw components
--- @param x number
--- @param y number
--- @param z number
--- @param w number
--- @return FQuat
function FQuat.new(x, y, z, w) end

--- Rotated unit X axis
--- @return Vec3
function FQuat:get_forward_vector() end

--- Rotated unit Y axis
--- @return Vec3
function FQuat:get_right_vector() end

--- Rotated unit Z axis
--- @return Vec3
function FQuat:get_up_vector() end

--- Fence that connects to its neighbours
--- 
--- @class FenceBlockLogic : BlockLogic
FenceBlockLogic = {}

--- Trying to cast Object into FenceBlockLogic
--- @param object Object Value to cast
--- @return FenceBlockLogic
function FenceBlockLogic.cast(object) end

--- Return FenceBlockLogic class object
--- @return Class
function FenceBlockLogic.get_class() end

--- Creates a new FenceBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return FenceBlockLogic
function FenceBlockLogic.new(parent, name) end

--- Creates a new FenceBlockLogic instance
--- @return FenceBlockLogic
function FenceBlockLogic.new_simple() end

--- Fluid storage node of a conductor network
--- 
--- @class FluidContainerBlockLogic : ConductorBlockLogic
FluidContainerBlockLogic = {}

--- Trying to cast Object into FluidContainerBlockLogic
--- @param object Object Value to cast
--- @return FluidContainerBlockLogic
function FluidContainerBlockLogic.cast(object) end

--- Return FluidContainerBlockLogic class object
--- @return Class
function FluidContainerBlockLogic.get_class() end

--- Creates a new FluidContainerBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return FluidContainerBlockLogic
function FluidContainerBlockLogic.new(parent, name) end

--- Creates a new FluidContainerBlockLogic instance
--- @return FluidContainerBlockLogic
function FluidContainerBlockLogic.new_simple() end

--- Global game instance
--- 
--- @class Game : Object
--- @field localization string Active localization culture code
--- @field build_string string Build identification string
--- @field tick_rate integer Simulation ticks per second
Game = {}

--- List of the screen resolutions supported by the hardware
--- @return string[]
function Game.get_supported_resolutions() end

--- Settings and counters of the current save
--- 
--- @class GameSessionData : Instance
--- @field infinite_ore boolean Deposits never deplete
--- @field all_research_completed boolean Every research starts unlocked
--- @field creative_mode boolean Creative mode is active
--- @field creative_allowed boolean Creative mode may be switched on
--- @field total_game_time number Played time in seconds
--- @field total_game_ticks integer Simulated ticks since world creation
--- @field seed string World generation seed
--- @field version string Game version the save was written with
--- @field generator string World generator identifier
--- @field save_name string Save folder name
--- @field cloud boolean Save is synchronized with the cloud
--- @field world_time integer Locked local day-phase ticks in planet space when frozen
--- @field world_time_freeze boolean Day phase advances on its own
--- @field tick_rate integer Simulation ticks per second
GameSessionData = {}

--- Trying to cast Object into GameSessionData
--- @param object Object Value to cast
--- @return GameSessionData
function GameSessionData.cast(object) end

--- Return GameSessionData class object
--- @return Class
function GameSessionData.get_class() end

--- Creates a new GameSessionData instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return GameSessionData
function GameSessionData.new(parent, name) end

--- Creates a new GameSessionData instance
--- @return GameSessionData
function GameSessionData.new_simple() end

--- Column being generated, handed to StaticStructure.generate
--- 
--- @class GenContext
--- @field pos Vec2i Column position in sectors
GenContext = {}

--- Write a block straight into a cell of the column being generated
--- @param bpos Vec3i Block position
--- @param block StaticBlock Block type, nil to clear the cell
function GenContext:set_cell(bpos, block) end

--- Spawn a block with its logic into the column being generated
--- @param bpos Vec3i Block position
--- @param block StaticBlock Block type to spawn
--- @param rotation FQuat? Rotation, nil for identity
--- @return BlockLogic The spawned block logic
function GenContext:spawn_block(bpos, block, rotation) end

--- Clear all props at the given position
--- @param bpos Vec3i Block position
function GenContext:clear_props(bpos) end

--- Placeholder waiting to be materialized into a real block
--- 
--- @class GhostBlockLogic : BlockLogic
--- @field target StaticBlock Block this ghost stands for
GhostBlockLogic = {}

--- Trying to cast Object into GhostBlockLogic
--- @param object Object Value to cast
--- @return GhostBlockLogic
function GhostBlockLogic.cast(object) end

--- Return GhostBlockLogic class object
--- @return Class
function GhostBlockLogic.get_class() end

--- Creates a new GhostBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return GhostBlockLogic
function GhostBlockLogic.new(parent, name) end

--- Creates a new GhostBlockLogic instance
--- @return GhostBlockLogic
function GhostBlockLogic.new_simple() end

--- Static block placed as a build ghost
--- 
--- @class GhostStaticBlock : StaticBlock
GhostStaticBlock = {}

--- Trying to cast Object into GhostStaticBlock
--- @param object Object Value to cast
--- @return GhostStaticBlock
function GhostStaticBlock.cast(object) end

--- Return GhostStaticBlock class object
--- @return Class
function GhostStaticBlock.get_class() end

--- Looks GhostStaticBlock up in db, nil when there is none
--- @param name string The name of the object
--- @return GhostStaticBlock
function GhostStaticBlock.find(name) end

--- Takes GhostStaticBlock from db, reports a miss to the log
--- @param name string The name of the object
--- @return GhostStaticBlock
function GhostStaticBlock.get(name) end

--- Register a new GhostStaticBlock static object
--- @param name string The name of the object
--- @return GhostStaticBlock
function GhostStaticBlock.reg(name) end

--- Planet wide biome family that also drives the global height map
--- 
--- @class GlobalBiomeFamily : BiomeFamily
GlobalBiomeFamily = {}

--- Trying to cast Object into GlobalBiomeFamily
--- @param object Object Value to cast
--- @return GlobalBiomeFamily
function GlobalBiomeFamily.cast(object) end

--- Return GlobalBiomeFamily class object
--- @return Class
function GlobalBiomeFamily.get_class() end

--- Looks GlobalBiomeFamily up in db, nil when there is none
--- @param name string The name of the object
--- @return GlobalBiomeFamily
function GlobalBiomeFamily.find(name) end

--- Takes GlobalBiomeFamily from db, reports a miss to the log
--- @param name string The name of the object
--- @return GlobalBiomeFamily
function GlobalBiomeFamily.get(name) end

--- Register a new GlobalBiomeFamily static object
--- @param name string The name of the object
--- @return GlobalBiomeFamily
function GlobalBiomeFamily.reg(name) end

--- Engine graphics quality settings
--- 
--- @class GraphicsSettings : Instance
GraphicsSettings = {}

--- Apply a scalability quality preset
--- @param preset_index integer Quality level from 0 (low) to 3 (epic)
function GraphicsSettings.set_scalability_preset(preset_index) end

--- Trying to cast Object into GraphicsSettings
--- @param object Object Value to cast
--- @return GraphicsSettings
function GraphicsSettings.cast(object) end

--- Return GraphicsSettings class object
--- @return Class
function GraphicsSettings.get_class() end

--- Creates a new GraphicsSettings instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return GraphicsSettings
function GraphicsSettings.new(parent, name) end

--- Creates a new GraphicsSettings instance
--- @return GraphicsSettings
function GraphicsSettings.new_simple() end

--- Heat storage node of a conductor network
--- 
--- @class HeatContainerBlockLogic : ConductorBlockLogic
HeatContainerBlockLogic = {}

--- Trying to cast Object into HeatContainerBlockLogic
--- @param object Object Value to cast
--- @return HeatContainerBlockLogic
function HeatContainerBlockLogic.cast(object) end

--- Return HeatContainerBlockLogic class object
--- @return Class
function HeatContainerBlockLogic.get_class() end

--- Creates a new HeatContainerBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return HeatContainerBlockLogic
function HeatContainerBlockLogic.new(parent, name) end

--- Creates a new HeatContainerBlockLogic instance
--- @return HeatContainerBlockLogic
function HeatContainerBlockLogic.new_simple() end

--- Terrain height built from a stack of noises
--- 
--- @class HeightGenerator : Prototype
HeightGenerator = {}

--- Add a noise generator to the height generator
--- @param noise NoiseGenerator Noise generator to add
function HeightGenerator:add_noise(noise) end

--- Trying to cast Object into HeightGenerator
--- @param object Object Value to cast
--- @return HeightGenerator
function HeightGenerator.cast(object) end

--- Return HeightGenerator class object
--- @return Class
function HeightGenerator.get_class() end

--- Looks HeightGenerator up in db, nil when there is none
--- @param name string The name of the object
--- @return HeightGenerator
function HeightGenerator.find(name) end

--- Takes HeightGenerator from db, reports a miss to the log
--- @param name string The name of the object
--- @return HeightGenerator
function HeightGenerator.get(name) end

--- Register a new HeightGenerator static object
--- @param name string The name of the object
--- @return HeightGenerator
function HeightGenerator.reg(name) end

--- Instancable object
--- 
--- @class Instance : Object
Instance = {}

--- Returns false once the underlying engine object has been destroyed
--- @return boolean
function Instance:is_valid() end

--- Multi slot inventory
--- 
--- @class Inventory : BaseInventory
Inventory = {}

--- Drop every empty slot from this inventory
function Inventory:remove_empty_slots() end

--- Trying to cast Object into Inventory
--- @param object Object Value to cast
--- @return Inventory
function Inventory.cast(object) end

--- Return Inventory class object
--- @return Class
function Inventory.get_class() end

--- Creates a new Inventory instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return Inventory
function Inventory.new(parent, name) end

--- Creates a new Inventory instance
--- @return Inventory
function Inventory.new_simple() end

--- Inventory interface with add and remove operations
--- 
--- @class InventoryAccess : InventoryReader
--- @field zero_slots boolean
--- @field draggable boolean Whether inventory can be dragged in UI (default: true)
InventoryAccess = {}

--- Add item with count to InventoryAccess
--- @param item StaticItem
--- @param count integer
--- @return integer Remainder
function InventoryAccess:add(item, count) end

--- Remove item with count from InventoryAccess
--- @param item StaticItem
--- @param count integer
--- @return integer Remainder
function InventoryAccess:sub(item, count) end

--- Trying to cast Object into InventoryAccess
--- @param object Object Value to cast
--- @return InventoryAccess
function InventoryAccess.cast(object) end

--- Return InventoryAccess class object
--- @return Class
function InventoryAccess.get_class() end

--- Filter that rejects listed items
--- 
--- @class InventoryBlackFilter : InventoryFilter
InventoryBlackFilter = {}

--- Trying to cast Object into InventoryBlackFilter
--- @param object Object Value to cast
--- @return InventoryBlackFilter
function InventoryBlackFilter.cast(object) end

--- Return InventoryBlackFilter class object
--- @return Class
function InventoryBlackFilter.get_class() end

--- Creates a new InventoryBlackFilter instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return InventoryBlackFilter
function InventoryBlackFilter.new(parent, name) end

--- Creates a new InventoryBlackFilter instance
--- @return InventoryBlackFilter
function InventoryBlackFilter.new_simple() end

--- Composite inventory joining several inventories into one
--- 
--- @class InventoryContainer : InventoryAccess
InventoryContainer = {}

--- Get a bound inventory by its index
--- @param index integer
--- @return InventoryAccess
function InventoryContainer:get_access(index) end

--- Append an inventory to this container
--- @param inventory InventoryAccess
function InventoryContainer:bind(inventory) end

--- Trying to cast Object into InventoryContainer
--- @param object Object Value to cast
--- @return InventoryContainer
function InventoryContainer.cast(object) end

--- Return InventoryContainer class object
--- @return Class
function InventoryContainer.get_class() end

--- Creates a new InventoryContainer instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return InventoryContainer
function InventoryContainer.new(parent, name) end

--- Creates a new InventoryContainer instance
--- @return InventoryContainer
function InventoryContainer.new_simple() end

--- Base class for inventory slot filters
--- 
--- @class InventoryFilter : Instance
InventoryFilter = {}

--- Trying to cast Object into InventoryFilter
--- @param object Object Value to cast
--- @return InventoryFilter
function InventoryFilter.cast(object) end

--- Return InventoryFilter class object
--- @return Class
function InventoryFilter.get_class() end

--- Filter driven by the contents of another inventory
--- 
--- @class InventoryInventoryFilter : InventoryFilter
--- @field inventory InventoryAccess (nil by default)
--- @field is_filtering boolean is filtering enabled (true by default)
--- @field is_white boolean is white filtering enabled (true by default)
InventoryInventoryFilter = {}

--- Trying to cast Object into InventoryInventoryFilter
--- @param object Object Value to cast
--- @return InventoryInventoryFilter
function InventoryInventoryFilter.cast(object) end

--- Return InventoryInventoryFilter class object
--- @return Class
function InventoryInventoryFilter.get_class() end

--- Creates a new InventoryInventoryFilter instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return InventoryInventoryFilter
function InventoryInventoryFilter.new(parent, name) end

--- Creates a new InventoryInventoryFilter instance
--- @return InventoryInventoryFilter
function InventoryInventoryFilter.new_simple() end

--- Read only inventory interface
--- 
--- @class InventoryReader : Instance
--- @field size integer Number of slots in this InventoryReader
InventoryReader = {}

--- Get ItemData with index from InventoryReader
--- @param index integer
--- @return ItemData
function InventoryReader:get(index) end

--- Looking for index of StaticItem in InventoryReader
--- @param item StaticItem
--- @return integer index of found item or -1
function InventoryReader:find(item) end

--- Trying to cast Object into InventoryReader
--- @param object Object Value to cast
--- @return InventoryReader
function InventoryReader.cast(object) end

--- Return InventoryReader class object
--- @return Class
function InventoryReader.get_class() end

--- Filter that accepts only listed items
--- 
--- @class InventoryWhiteFilter : InventoryFilter
InventoryWhiteFilter = {}

--- Trying to cast Object into InventoryWhiteFilter
--- @param object Object Value to cast
--- @return InventoryWhiteFilter
function InventoryWhiteFilter.cast(object) end

--- Return InventoryWhiteFilter class object
--- @return Class
function InventoryWhiteFilter.get_class() end

--- Creates a new InventoryWhiteFilter instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return InventoryWhiteFilter
function InventoryWhiteFilter.new(parent, name) end

--- Creates a new InventoryWhiteFilter instance
--- @return InventoryWhiteFilter
function InventoryWhiteFilter.new_simple() end

--- Item prototype paired with a count
--- 
--- @class ItemData
--- @field count integer Item count
--- @field item StaticItem Item prototype
ItemData = {}

--- Create an item stack holding nothing
--- @return ItemData
function ItemData.new_empty() end

--- Create an item stack
--- @param item StaticItem Item prototype
--- @param count integer Item count
--- @return ItemData
function ItemData.new(item, count) end

--- Create an item stack with a zero count
--- @param item StaticItem Item prototype
--- @return ItemData
function ItemData.new_zero(item) end

--- Localization key table object
--- 
--- @class Kto
Kto = {}

--- Create new Kto object
--- @param key string Localization key
--- @param table string Localization table name
--- @return Kto
function Kto.new(key, table) end

--- Resolve Kto to localized string
--- @return string
function Kto:get() end

--- Landing pad deliveries arrive on
--- 
--- @class LandingPadBlockLogic : BlockLogic
LandingPadBlockLogic = {}

--- Trying to cast Object into LandingPadBlockLogic
--- @param object Object Value to cast
--- @return LandingPadBlockLogic
function LandingPadBlockLogic.cast(object) end

--- Return LandingPadBlockLogic class object
--- @return Class
function LandingPadBlockLogic.get_class() end

--- Creates a new LandingPadBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return LandingPadBlockLogic
function LandingPadBlockLogic.new(parent, name) end

--- Creates a new LandingPadBlockLogic instance
--- @return LandingPadBlockLogic
function LandingPadBlockLogic.new_simple() end

--- Screen lit by logic signals
--- 
--- @class LedBlockLogic : BlockLogic
LedBlockLogic = {}

--- Trying to cast Object into LedBlockLogic
--- @param object Object Value to cast
--- @return LedBlockLogic
function LedBlockLogic.cast(object) end

--- Return LedBlockLogic class object
--- @return Class
function LedBlockLogic.get_class() end

--- Creates a new LedBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return LedBlockLogic
function LedBlockLogic.new(parent, name) end

--- Creates a new LedBlockLogic instance
--- @return LedBlockLogic
function LedBlockLogic.new_simple() end

--- Localization data entry
--- 
--- @class Loc
Loc = {}

--- Create new Loc object
--- @param key string Localization key
--- @param table string Localization table name
--- @return Loc
function Loc.new(key, table) end

--- Create new Loc object substituting a ready text into the line
--- @param key string Localization key
--- @param table string Localization table name
--- @param value string Text put in place of {0}
--- @return Loc
function Loc.text(key, table, value) end

--- Resolve key value to localized string
--- @param key string Localization key
--- @param table string Localization table name
--- @return string
function Loc.get(key, table) end

--- Get number as string for GUI (3000 -> 3.0k)
--- @param value number Number to format
--- @return string
function Loc.gui_number(value) end

--- Resolve Loc object to localized string
--- @return string
function Loc:get() end

--- Non localized data entry
--- 
--- @class LocData
LocData = {}

--- Set non localized data value by key
--- @param key string Localization key
--- @param value string Text value
function LocData.set(key, value) end

--- Condition paired with the signals it emits
--- 
--- @class LogicDecider : Instance
LogicDecider = {}

--- Trying to cast Object into LogicDecider
--- @param object Object Value to cast
--- @return LogicDecider
function LogicDecider.cast(object) end

--- Return LogicDecider class object
--- @return Class
function LogicDecider.get_class() end

--- Creates a new LogicDecider instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return LogicDecider
function LogicDecider.new(parent, name) end

--- Creates a new LogicDecider instance
--- @return LogicDecider
function LogicDecider.new_simple() end

--- One exportable signal option shown in the logic GUI
--- 
--- @class LogicExportOption : Prototype
--- @field signal StaticItem Signal item this option exports
--- @field use_signal boolean Whether the GUI row shows a signal slot
--- @field enabled boolean Initial checkbox state in the GUI
--- @field label Loc Localized row name
--- @field tooltip Loc Localized row tooltip
LogicExportOption = {}

--- Trying to cast Object into LogicExportOption
--- @param object Object Value to cast
--- @return LogicExportOption
function LogicExportOption.cast(object) end

--- Return LogicExportOption class object
--- @return Class
function LogicExportOption.get_class() end

--- Looks LogicExportOption up in db, nil when there is none
--- @param name string The name of the object
--- @return LogicExportOption
function LogicExportOption.find(name) end

--- Takes LogicExportOption from db, reports a miss to the log
--- @param name string The name of the object
--- @return LogicExportOption
function LogicExportOption.get(name) end

--- Register a new LogicExportOption static object
--- @param name string The name of the object
--- @return LogicExportOption
function LogicExportOption.reg(name) end

--- One importable signal option shown in the logic GUI
--- 
--- @class LogicImportOption : Prototype
--- @field signal StaticItem Signal item this option imports
--- @field use_signal boolean Whether the GUI row shows a signal slot
--- @field enabled boolean Initial checkbox state in the GUI
--- @field label Loc Localized row name
--- @field tooltip Loc Localized row tooltip
LogicImportOption = {}

--- Trying to cast Object into LogicImportOption
--- @param object Object Value to cast
--- @return LogicImportOption
function LogicImportOption.cast(object) end

--- Return LogicImportOption class object
--- @return Class
function LogicImportOption.get_class() end

--- Looks LogicImportOption up in db, nil when there is none
--- @param name string The name of the object
--- @return LogicImportOption
function LogicImportOption.find(name) end

--- Takes LogicImportOption from db, reports a miss to the log
--- @param name string The name of the object
--- @return LogicImportOption
function LogicImportOption.get(name) end

--- Register a new LogicImportOption static object
--- @param name string The name of the object
--- @return LogicImportOption
function LogicImportOption.reg(name) end

--- Per-block choice of exported and imported logic signals
--- 
--- @class LogicSettings : Instance
LogicSettings = {}

--- Trying to cast Object into LogicSettings
--- @param object Object Value to cast
--- @return LogicSettings
function LogicSettings.cast(object) end

--- Return LogicSettings class object
--- @return Class
function LogicSettings.get_class() end

--- Creates a new LogicSettings instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return LogicSettings
function LogicSettings.new(parent, name) end

--- Creates a new LogicSettings instance
--- @return LogicSettings
function LogicSettings.new_simple() end

--- World generator assembled from Lua defined biomes and heights
--- 
--- @class LuaWorldGenerator : WorldGenerator
--- @field biome_family BiomeFamily Biome family selecting the surface biome
--- @field height HeightGenerator Height generator for the terrain surface
LuaWorldGenerator = {}

--- Trying to cast Object into LuaWorldGenerator
--- @param object Object Value to cast
--- @return LuaWorldGenerator
function LuaWorldGenerator.cast(object) end

--- Return LuaWorldGenerator class object
--- @return Class
function LuaWorldGenerator.get_class() end

--- Looks LuaWorldGenerator up in db, nil when there is none
--- @param name string The name of the object
--- @return LuaWorldGenerator
function LuaWorldGenerator.find(name) end

--- Takes LuaWorldGenerator from db, reports a miss to the log
--- @param name string The name of the object
--- @return LuaWorldGenerator
function LuaWorldGenerator.get(name) end

--- Register a new LuaWorldGenerator static object
--- @param name string The name of the object
--- @return LuaWorldGenerator
function LuaWorldGenerator.reg(name) end

--- Structure placed on the world map at an offset
--- 
--- @class MapStructure
--- @field offset Vec2i Offset from the map origin in blocks
--- @field structure StaticStructure Structure prototype to place
MapStructure = {}

--- Create new instance of MapStructure
--- @return MapStructure
function MapStructure.new() end

--- Engine material
--- 
--- @class Material : Object
--- @field name string Object name
Material = {}

--- Load a material asset
--- @param path string Path to the object
--- @return Material
function Material.load(path) end

--- Background music playback control
--- 
--- @class Music : Object
--- @field playlist string Key of the active playlist
--- @field track_count integer Number of tracks in the active playlist
Music = {}

--- Fade out both channels and stop automatic track advance
function Music:request_silence() end

--- Select a named playlist (e.g. default, cosmos). Returns whether the key exists
--- @param key string Playlist key
--- @return boolean
function Music:set_playlist(key) end

--- Play a track by zero-based index in the current playlist
--- @param index integer Zero-based track index
function Music:play_track(index) end

--- Play a track with explicit crossfade duration in seconds (0 = immediate)
--- @param index integer Zero-based track index
--- @param crossfade_seconds number Crossfade duration in seconds
function Music:play_track_crossfade(index, crossfade_seconds) end

--- Start a random track from the current playlist
function Music:play_random() end

--- Start a random track with explicit crossfade duration in seconds
--- @param crossfade_seconds number Crossfade duration in seconds
function Music:play_random_crossfade(crossfade_seconds) end

--- Configurable FastNoise generator
--- 
--- @class NoiseGenerator : Prototype
--- @field min number Lower bound of the remapped noise range
--- @field max number Upper bound of the remapped noise range
NoiseGenerator = {}

--- Set the seed for noise generation
--- @param seed integer Seed value
function NoiseGenerator:set_seed(seed) end

--- Get the noise value at the given position
--- @param x number X coordinate
--- @param y number Y coordinate
--- @param z number Z coordinate
--- @return number
function NoiseGenerator:get_noise(x, y, z) end

--- Set the noise type: Simplex, SimplexFractal, Perlin, PerlinFractal, Cellular, Value, ValueFractal, Cubic, CubicFractal, White
--- @param noise_type string Noise type
function NoiseGenerator:set_noise_type(noise_type) end

--- Set the frequency for noise generation
--- @param frequency number Frequency value
function NoiseGenerator:set_frequency(frequency) end

--- Set the fractal octaves for noise generation
--- @param octaves integer Octaves value
function NoiseGenerator:set_fractal_octaves(octaves) end

--- Set the fractal gain for noise generation
--- @param gain number Gain value
function NoiseGenerator:set_fractal_gain(gain) end

--- Set the fractal lacunarity for noise generation
--- @param lacunarity number Lacunarity value
function NoiseGenerator:set_fractal_lacunarity(lacunarity) end

--- Set the fractal type: Fbm, Ridged or Billow
--- @param fractal_type string Fractal type
function NoiseGenerator:set_fractal_type(fractal_type) end

--- Trying to cast Object into NoiseGenerator
--- @param object Object Value to cast
--- @return NoiseGenerator
function NoiseGenerator.cast(object) end

--- Return NoiseGenerator class object
--- @return Class
function NoiseGenerator.get_class() end

--- Looks NoiseGenerator up in db, nil when there is none
--- @param name string The name of the object
--- @return NoiseGenerator
function NoiseGenerator.find(name) end

--- Takes NoiseGenerator from db, reports a miss to the log
--- @param name string The name of the object
--- @return NoiseGenerator
function NoiseGenerator.get(name) end

--- Register a new NoiseGenerator static object
--- @param name string The name of the object
--- @return NoiseGenerator
function NoiseGenerator.reg(name) end

--- Engine object
--- 
--- @class Object
--- @field name string Object name
Object = {}

--- Find an already loaded object by name
--- @param name string Object name
--- @return Object
function Object.find(name) end

--- Trying to cast Object into Object
--- @param object Object Object to cast
--- @return Object
function Object.cast(object) end

--- Class of this object
--- @return Class
function Object:get_class() end

--- Return Object class object
--- @return Class
function Object.get_class() end

--- Local player controller
--- 
--- @class Player : Actor
Player = {}

--- Player input and view owner
--- 
--- @class PlayerController
PlayerController = {}

--- Structure that stores several StaticProp records (prop variations) with shared spawn chance
--- 
--- @class PropListData
--- @field weight integer Spawn weight
--- @field min_dist number Minimum block distance from origin for this tier
--- @field far_weight number Weight multiplier at the far end of the distance band
--- @field props StaticProp[] List of prop assets (prop variations)
PropListData = {}

--- Create new instance of PropListData
--- @return PropListData
function PropListData.new() end

--- Database record
--- 
--- @class Prototype : Object
--- @field name string Object name
Prototype = {}

--- Returns false once the underlying engine object has been destroyed
--- @return boolean
function Prototype:is_valid() end

--- Drilling machine that extracts oil from deposits
--- 
--- @class Pumpjack : DrillingMachineBase
--- @field source SourceData Oil deposit under the machine
Pumpjack = {}

--- Trying to cast Object into Pumpjack
--- @param object Object Value to cast
--- @return Pumpjack
function Pumpjack.cast(object) end

--- Return Pumpjack class object
--- @return Class
function Pumpjack.get_class() end

--- Creates a new Pumpjack instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return Pumpjack
function Pumpjack.new(parent, name) end

--- Creates a new Pumpjack instance
--- @return Pumpjack
function Pumpjack.new_simple() end

--- Single trackable goal of a quest
--- 
--- @class QuestObjective : Instance
--- @field id string Identifier unique within the quest
--- @field label Loc Localized objective text
--- @field completed boolean Whether the objective is done
--- @field show_progress boolean Whether the progress counter is shown
--- @field current integer Current progress counter
--- @field required integer Progress counter needed to complete
QuestObjective = {}

--- Set the progress counters, completing the objective when they meet
--- @param current integer Current amount
--- @param required integer Required amount
--- @param show_progress boolean Whether the counter is shown
function QuestObjective:set_progress(current, required, show_progress) end

--- Set the completion flag directly
--- @param completed boolean New completion state
function QuestObjective:set_completed(completed) end

--- Trying to cast Object into QuestObjective
--- @param object Object Value to cast
--- @return QuestObjective
function QuestObjective.cast(object) end

--- Return QuestObjective class object
--- @return Class
function QuestObjective.get_class() end

--- Creates a new QuestObjective instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return QuestObjective
function QuestObjective.new(parent, name) end

--- Creates a new QuestObjective instance
--- @return QuestObjective
function QuestObjective.new_simple() end

--- Quest and chapter progression manager
--- 
--- @class QuestSubsystem
QuestSubsystem = {}

--- Make a chapter available, false if its requirements are not met
--- @param chapter StaticChapter Chapter to unlock
--- @return boolean
function QuestSubsystem:unlock_chapter(chapter) end

--- Make a quest active, false if its requirements are not met
--- @param quest StaticQuest Quest to unlock
--- @return boolean
function QuestSubsystem:unlock_quest(quest) end

--- Mark an active quest as completed
--- @param quest StaticQuest Quest to complete
--- @return boolean
function QuestSubsystem:complete_quest(quest) end

--- Whether the quest is unlocked and not completed yet
--- @param quest StaticQuest Quest to test
--- @return boolean
function QuestSubsystem:is_quest_active(quest) end

--- Whether the quest is completed
--- @param quest StaticQuest Quest to test
--- @return boolean
function QuestSubsystem:is_quest_completed(quest) end

--- Every known quest
--- @return StaticQuest[]
function QuestSubsystem:get_all_quests() end

--- Quests unlocked and not completed yet, as a snapshot: completing one of them unlocks its followers without changing the returned list
--- @return StaticQuest[] Quests active right now
function QuestSubsystem:get_active_quests() end

--- Every known chapter
--- @return StaticChapter[]
function QuestSubsystem:get_all_chapters() end

--- Crafting-recipe prototype used by machines and crafting UIs
--- 
--- @class Recipe : Prototype
--- @field ticks integer *Craft time* in engine ticks
--- @field default_locked boolean If **true**, the recipe starts hidden until research unlocks it.
--- @field locked boolean Currently locked if **true**
--- @field productivity integer Percentage bonus (e.g. `20` = +20 %)
--- @field input RecipeInventory Read-only container of required items
--- @field output RecipeInventory Read-only container of produced items
--- @field tier integer Recipe tier used for speed scaling: every tier **above** its dictionary's `start_tier` doubles craft time; below it the recipe is clamped to `start_tier`.
--- @field start_tier integer The dictionary's `start_tier`, copied to every recipe in it when the mods finish loading.
Recipe = {}

--- Trying to cast Object into Recipe
--- @param object Object Value to cast
--- @return Recipe
function Recipe.cast(object) end

--- Return Recipe class object
--- @return Class
function Recipe.get_class() end

--- Looks Recipe up in db, nil when there is none
--- @param name string The name of the object
--- @return Recipe
function Recipe.find(name) end

--- Takes Recipe from db, reports a miss to the log
--- @param name string The name of the object
--- @return Recipe
function Recipe.get(name) end

--- Register a new Recipe static object
--- @param name string The name of the object
--- @return Recipe
function Recipe.reg(name) end

--- Named group of recipes shared by machines of one family
--- 
--- @class RecipeDictionary : Prototype
--- @field start_tier integer Machine-unlock tier shared by every recipe in the dictionary
RecipeDictionary = {}

--- Put a recipe into this dictionary
--- @param recipe Recipe
--- @return boolean False when the recipe is null or its name is already taken
function RecipeDictionary:add(recipe) end

--- Name a machine item that crafts from this dictionary; the first one is the face the recipe index files its recipes under
--- @param item StaticItem
--- @return boolean False when the item is null
function RecipeDictionary:used_in(item) end

--- Trying to cast Object into RecipeDictionary
--- @param object Object Value to cast
--- @return RecipeDictionary
function RecipeDictionary.cast(object) end

--- Return RecipeDictionary class object
--- @return Class
function RecipeDictionary.get_class() end

--- Looks RecipeDictionary up in db, nil when there is none
--- @param name string The name of the object
--- @return RecipeDictionary
function RecipeDictionary.find(name) end

--- Takes RecipeDictionary from db, reports a miss to the log
--- @param name string The name of the object
--- @return RecipeDictionary
function RecipeDictionary.get(name) end

--- Register a new RecipeDictionary static object
--- @param name string The name of the object
--- @return RecipeDictionary
function RecipeDictionary.reg(name) end

--- Inventory that mirrors the slots of a recipe
--- 
--- @class RecipeInventory : AutosizeInventory
--- @field recipe Recipe
RecipeInventory = {}

--- Append a recipe slot holding item with count
--- @param item StaticItem
--- @param count integer
function RecipeInventory:add(item, count) end

--- Trying to cast Object into RecipeInventory
--- @param object Object Value to cast
--- @return RecipeInventory
function RecipeInventory.cast(object) end

--- Return RecipeInventory class object
--- @return Class
function RecipeInventory.get_class() end

--- Creates a new RecipeInventory instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return RecipeInventory
function RecipeInventory.new(parent, name) end

--- Creates a new RecipeInventory instance
--- @return RecipeInventory
function RecipeInventory.new_simple() end

--- Square of the world map holding sources and structures
--- 
--- @class Region : Instance
--- @field pos Vec2i Region position in RegionMap grid
Region = {}

--- Add structure to this Region
--- @param structure MapStructure Structure to place
function Region:add_structure(structure) end

--- Add source to this Region
--- @param source SourceData Deposit to place
function Region:add_source(source) end

--- Trying to cast Object into Region
--- @param object Object Value to cast
--- @return Region
function Region.cast(object) end

--- Return Region class object
--- @return Class
function Region.get_class() end

--- Creates a new Region instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return Region
function Region.new(parent, name) end

--- Creates a new Region instance
--- @return Region
function Region.new_simple() end

--- Grid of regions covering the surface
--- 
--- @class RegionMap : Instance
RegionMap = {}

--- Delete all regions
function RegionMap:reset() end

--- Get Region by its position, creating it when missing
--- @param spos Vec2i Position in RegionMap grid
--- @return Region
function RegionMap:get_region(spos) end

--- Looking for existing Region with given sector position
--- @param spos Vec2i Position in RegionMap grid
--- @return Region
function RegionMap:find_region(spos) end

--- Is region exists
--- @param pos Vec2i Region position
--- @return boolean
function RegionMap:has_region(pos) end

--- Convert Block World position to the RegionMap grid cell containing it
--- @param bpos Vec3i Block position
--- @return Vec2i
function RegionMap.world_block_to_grid(bpos) end

--- Trying to cast Object into RegionMap
--- @param object Object Value to cast
--- @return RegionMap
function RegionMap.cast(object) end

--- Return RegionMap class object
--- @return Class
function RegionMap.get_class() end

--- Creates a new RegionMap instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return RegionMap
function RegionMap.new(parent, name) end

--- Creates a new RegionMap instance
--- @return RegionMap
function RegionMap.new_simple() end

--- Accessor that transfers a resource through a block side
--- 
--- @class ResourceAccessor : Accessor
--- @field inventory ResourceInventory Resource inventory bound to this side
--- @field is_input boolean Side consumes the resource
--- @field is_output boolean Side produces the resource
--- @field channel string Resource network channel name
ResourceAccessor = {}

--- Configure side, position, inventory and channel at once
--- @param side Vec3i Side direction of the owning block
--- @param pos Vec3i Block local position
--- @param inventory ResourceInventory Resource inventory to bind
--- @param is_input boolean Side consumes the resource
--- @param is_output boolean Side produces the resource
--- @param channel string Resource network channel name
function ResourceAccessor:init(side, pos, inventory, is_input, is_output, channel) end

--- Trying to cast Object into ResourceAccessor
--- @param object Object Value to cast
--- @return ResourceAccessor
function ResourceAccessor.cast(object) end

--- Return ResourceAccessor class object
--- @return Class
function ResourceAccessor.get_class() end

--- Creates a new ResourceAccessor attached to a block
--- @param parent BlockLogic Owning block
--- @param name string The name of the accessor
--- @return ResourceAccessor
function ResourceAccessor.new(parent, name) end

--- Single slot inventory holding one resource item
--- 
--- @class ResourceInventory : SingleSlotInventory
--- @field item StaticItem
--- @field drain integer
--- @field capacity integer
ResourceInventory = {}

--- Put resource into the slot ignoring transfer rules
--- @param amount integer
function ResourceInventory:add_resource(amount) end

--- Trying to cast Object into ResourceInventory
--- @param object Object Value to cast
--- @return ResourceInventory
function ResourceInventory.cast(object) end

--- Return ResourceInventory class object
--- @return Class
function ResourceInventory.get_class() end

--- Creates a new ResourceInventory instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return ResourceInventory
function ResourceInventory.new(parent, name) end

--- Creates a new ResourceInventory instance
--- @return ResourceInventory
function ResourceInventory.new_simple() end

--- Euler rotation in degrees
--- 
--- @class Rotator
--- @field zero Rotator (0, 0, 0)
--- @field pitch number
--- @field yaw number
--- @field roll number
Rotator = {}

--- Create a rotator, note the roll, pitch, yaw argument order
--- @param roll number Rotation around the X axis
--- @param pitch number Rotation around the Y axis
--- @param yaw number Rotation around the Z axis
--- @return Rotator
function Rotator.new(roll, pitch, yaw) end

--- Crafter with a player selected recipe
--- 
--- @class SelectCrafter : AbstractCrafter
SelectCrafter = {}

--- Trying to cast Object into SelectCrafter
--- @param object Object Value to cast
--- @return SelectCrafter
function SelectCrafter.cast(object) end

--- Return SelectCrafter class object
--- @return Class
function SelectCrafter.get_class() end

--- Creates a new SelectCrafter instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return SelectCrafter
function SelectCrafter.new(parent, name) end

--- Creates a new SelectCrafter instance
--- @return SelectCrafter
function SelectCrafter.new_simple() end

--- Configurable game setting
--- 
--- @class Setting : Prototype
--- @field restart boolean Changing this setting requires a restart
--- @field set_action function Called with the new value when the setting changes
--- @field label string Localization key of the displayed name
--- @field type string Widget type used to edit the setting
--- @field category string Settings category this entry belongs to
--- @field bool_value boolean Current boolean value
--- @field bool_default_value boolean Default boolean value
--- @field string_value string Current string value
--- @field default_string_value string Default string value
--- @field string_options string[] Allowed string values
--- @field int_value integer Current integer value
--- @field int_default_value integer Default integer value
--- @field max_value integer Upper bound of the integer value
--- @field min_value integer Lower bound of the integer value
--- @field key_binding string Input action bound to this setting
--- @field default_key string Default keystroke, e.g. Ctrl+Shift+F
--- @field key_action function Called with this setting when the bound key goes down; only for a key_binding of this mod's own
Setting = {}

--- Refresh every settings widget from the current values
function Setting.update_widgets() end

--- Trying to cast Object into Setting
--- @param object Object Value to cast
--- @return Setting
function Setting.cast(object) end

--- Return Setting class object
--- @return Class
function Setting.get_class() end

--- Looks Setting up in db, nil when there is none
--- @param name string The name of the object
--- @return Setting
function Setting.find(name) end

--- Takes Setting from db, reports a miss to the log
--- @param name string The name of the object
--- @return Setting
function Setting.get(name) end

--- Register a new Setting static object
--- @param name string The name of the object
--- @return Setting
function Setting.reg(name) end

--- Inventory with exactly one slot
--- 
--- @class SingleSlotInventory : BaseInventory
--- @field capacity integer
SingleSlotInventory = {}

--- Accept only the given item in this slot
--- @param item StaticItem
function SingleSlotInventory:set_simple_filter(item) end

--- Trying to cast Object into SingleSlotInventory
--- @param object Object Value to cast
--- @return SingleSlotInventory
function SingleSlotInventory.cast(object) end

--- Return SingleSlotInventory class object
--- @return Class
function SingleSlotInventory.get_class() end

--- Creates a new SingleSlotInventory instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return SingleSlotInventory
function SingleSlotInventory.new(parent, name) end

--- Creates a new SingleSlotInventory instance
--- @return SingleSlotInventory
function SingleSlotInventory.new_simple() end

--- Engine sound class
--- 
--- @class SoundClass : Object
--- @field name string Object name
--- @field volume number Playback volume multiplier
SoundClass = {}

--- Load a sound class asset
--- @param path string Path to the object
--- @return SoundClass
function SoundClass.load(path) end

--- Resource deposit placed on the map
--- 
--- @class SourceData : Instance
--- @field position Vec2i Source position in block coordinates
--- @field item StaticItem Item to mine
--- @field active_miners integer Number of miners currently extracting
--- @field infinite_ore boolean Deposit never depletes
SourceData = {}

--- Total deposit yield, capacity shared among miners
--- @return integer
function SourceData:get_total_yield() end

--- Average yield per miner currently on this deposit, 0 if no miners
--- @return integer
function SourceData:get_yield_per_miner() end

--- Yield a new miner would get if placed on this deposit, for build preview
--- @return integer
function SourceData:get_estimated_yield_for_new_miner() end

--- Trying to cast Object into SourceData
--- @param object Object Value to cast
--- @return SourceData
function SourceData.cast(object) end

--- Return SourceData class object
--- @return Class
function SourceData.get_class() end

--- Creates a new SourceData instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return SourceData
function SourceData.new(parent, name) end

--- Creates a new SourceData instance
--- @return SourceData
function SourceData.new_simple() end

--- Belt junction feeding several sides
--- 
--- @class SplitterBlockLogic : BlockLogic
--- @field ticks_per_item integer Exact time to carry one item across half a cell, in ticks
SplitterBlockLogic = {}

--- Trying to cast Object into SplitterBlockLogic
--- @param object Object Value to cast
--- @return SplitterBlockLogic
function SplitterBlockLogic.cast(object) end

--- Return SplitterBlockLogic class object
--- @return Class
function SplitterBlockLogic.get_class() end

--- Creates a new SplitterBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return SplitterBlockLogic
function SplitterBlockLogic.new(parent, name) end

--- Creates a new SplitterBlockLogic instance
--- @return SplitterBlockLogic
function SplitterBlockLogic.new_simple() end

--- Aimable colored spotlight
--- 
--- @class SpotlightBlockLogic : BlockLogic
SpotlightBlockLogic = {}

--- Trying to cast Object into SpotlightBlockLogic
--- @param object Object Value to cast
--- @return SpotlightBlockLogic
function SpotlightBlockLogic.cast(object) end

--- Return SpotlightBlockLogic class object
--- @return Class
function SpotlightBlockLogic.get_class() end

--- Creates a new SpotlightBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return SpotlightBlockLogic
function SpotlightBlockLogic.new(parent, name) end

--- Creates a new SpotlightBlockLogic instance
--- @return SpotlightBlockLogic
function SpotlightBlockLogic.new_simple() end

--- Achievement progress record
--- 
--- @class StaticAchievement : Prototype
--- @field delta integer Progress added by the last increment
--- @field total integer Accumulated progress
--- @field threshold integer Progress required to unlock
--- @field unlocked boolean Whether the achievement is unlocked
--- @field unlocked_time number Game time of the unlock
--- @field image Texture Achievement icon
--- @field steam_key string Steam achievement id
--- @field label Loc Localized name
--- @field description Loc Localized description
StaticAchievement = {}

--- Trying to cast Object into StaticAchievement
--- @param object Object Value to cast
--- @return StaticAchievement
function StaticAchievement.cast(object) end

--- Return StaticAchievement class object
--- @return Class
function StaticAchievement.get_class() end

--- Looks StaticAchievement up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticAchievement
function StaticAchievement.find(name) end

--- Takes StaticAchievement from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticAchievement
function StaticAchievement.get(name) end

--- Register a new StaticAchievement static object
--- @param name string The name of the object
--- @return StaticAchievement
function StaticAchievement.reg(name) end

--- Placeable block prototype
--- 
--- @class StaticBlock : StaticObject
--- @field logic Class BlockLogic class driving the simulation
--- @field actor Class Presentation actor class spawned for the block
--- @field selector Class Selector widget class
--- @field tesselator Tesselator Mesh tesselator used to render the block
--- @field sub_blocks Vec3i[] Occupied cells relative to the block origin
--- @field rotation_locks Vec3i Block local axes that keep their world direction; a turn moving a locked axis is refused
--- @field replace_tag string Blocks sharing a tag replace each other on build
--- @field tier integer Block tier used for recipe speed scaling
--- @field level integer Block level within its tier
--- @field energy_consumption_per_tick integer Energy drawn per simulation tick
--- @field energy_production_per_tick integer Energy produced per simulation tick
--- @field energy_consumption_item StaticItem Resource item drawn by this block
--- @field energy_production_item StaticItem Resource item produced by this block
--- @field break_effect Class Effect actor class spawned when the block is destroyed
--- @field lua table? Lua prototype table with logic_init and actor_init hooks
--- @field half_cover StaticCover Cover mesh for the half-height variant
--- @field center_cover StaticCover Cover mesh for the center part
--- @field body_cover StaticCover Cover mesh for the block body
--- @field export_options LogicExportOption[] Logic export signals published by this block type
--- @field import_options LogicImportOption[] Logic import signals accepted by this block type
StaticBlock = {}

--- Trying to cast Object into StaticBlock
--- @param object Object Value to cast
--- @return StaticBlock
function StaticBlock.cast(object) end

--- Return StaticBlock class object
--- @return Class
function StaticBlock.get_class() end

--- Looks StaticBlock up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticBlock
function StaticBlock.find(name) end

--- Takes StaticBlock from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticBlock
function StaticBlock.get(name) end

--- Register a new StaticBlock static object
--- @param name string The name of the object
--- @return StaticBlock
function StaticBlock.reg(name) end

--- Group of quests unlocked together
--- 
--- @class StaticChapter : Prototype
--- @field label Loc Localized chapter title
--- @field quests StaticQuest[] Quests belonging to this chapter
--- @field required_quests StaticQuest[] Quests that must be completed before the chapter becomes available
--- @field unlocked boolean Whether the chapter is available in the current save
--- @field on_unlock function? Called when the chapter unlocks
--- @field on_complete function? Called when every quest is completed
StaticChapter = {}

--- Trying to cast Object into StaticChapter
--- @param object Object Value to cast
--- @return StaticChapter
function StaticChapter.cast(object) end

--- Return StaticChapter class object
--- @return Class
function StaticChapter.get_class() end

--- Looks StaticChapter up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticChapter
function StaticChapter.find(name) end

--- Takes StaticChapter from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticChapter
function StaticChapter.get(name) end

--- Register a new StaticChapter static object
--- @param name string The name of the object
--- @return StaticChapter
function StaticChapter.reg(name) end

--- Instanced mesh design used to skin blocks
--- 
--- @class StaticCover : Prototype
StaticCover = {}

--- Trying to cast Object into StaticCover
--- @param object Object Value to cast
--- @return StaticCover
function StaticCover.cast(object) end

--- Return StaticCover class object
--- @return Class
function StaticCover.get_class() end

--- Looks StaticCover up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticCover
function StaticCover.find(name) end

--- Takes StaticCover from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticCover
function StaticCover.get(name) end

--- Register a new StaticCover static object
--- @param name string The name of the object
--- @return StaticCover
function StaticCover.reg(name) end

--- List of covers allowed by the design tool and designable blocks
--- 
--- @class StaticCoverSet : Prototype
--- @field covers StaticCover[] Allowed cover designs
StaticCoverSet = {}

--- Trying to cast Object into StaticCoverSet
--- @param object Object Value to cast
--- @return StaticCoverSet
function StaticCoverSet.cast(object) end

--- Return StaticCoverSet class object
--- @return Class
function StaticCoverSet.get_class() end

--- Looks StaticCoverSet up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticCoverSet
function StaticCoverSet.find(name) end

--- Takes StaticCoverSet from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticCoverSet
function StaticCoverSet.get(name) end

--- Register a new StaticCoverSet static object
--- @param name string The name of the object
--- @return StaticCoverSet
function StaticCoverSet.reg(name) end

--- Item prototype
--- 
--- @class StaticItem : Prototype
--- @field image Texture Item image in UI
--- @field image_path string Icon path relative to the owning mod folder
--- @field stack_size integer Size of item stack
--- @field tier integer Item unlock tier
--- @field unit_mul number multiplier for UI
--- @field mesh StaticMesh Mesh for item rendering in world
--- @field block StaticBlock Buildable object pointer for this item
--- @field custom_data boolean Is item instance contains CustomData
--- @field logic Class Class for item while in hand
--- @field lua table? Lua prototype table
--- @field tags string Space separated search tags
--- @field category string In-game database category
--- @field equipment_slot string Equipment slot this item fits (Jetpack, Light)
--- @field label Loc Localized item name
--- @field description_parts Loc[] Localized description paragraphs
StaticItem = {}

--- Trying to cast Object into StaticItem
--- @param object Object Value to cast
--- @return StaticItem
function StaticItem.cast(object) end

--- Return StaticItem class object
--- @return Class
function StaticItem.get_class() end

--- Looks StaticItem up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticItem
function StaticItem.find(name) end

--- Takes StaticItem from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticItem
function StaticItem.get(name) end

--- Register a new StaticItem static object
--- @param name string The name of the object
--- @return StaticItem
function StaticItem.reg(name) end

--- Block the recipe screen shows above the recipes of an item
--- 
--- @class StaticItemPanel : Prototype
--- @field items StaticItem[] Items this panel is shown for
--- @field category string Item category this panel is shown for
--- @field order integer Sort order among the panels of one item
--- @field widget string Panel widget class path; empty means the built-in text panel
--- @field label Loc Localized panel title
--- @field description_parts Loc[] Localized body paragraphs
--- @field context AutosizeInventory Inventory of items shown under the text
StaticItemPanel = {}

--- Add an item to the context inventory
--- @param item StaticItem Item to show
function StaticItemPanel:add_context(item) end

--- Remove every item from the context inventory
function StaticItemPanel:clear_context() end

--- Write a number the panel widget reads by key
--- @param key string
--- @param value number
function StaticItemPanel:set_number(key, value) end

--- Number written under the key, or the fallback
--- @param key string
--- @param fallback number
--- @return number
function StaticItemPanel:get_number(key, fallback) end

--- Write a string the panel widget reads by key
--- @param key string
--- @param value string
function StaticItemPanel:set_string(key, value) end

--- String written under the key, empty when there is none
--- @param key string
--- @return string
function StaticItemPanel:get_string(key) end

--- Trying to cast Object into StaticItemPanel
--- @param object Object Value to cast
--- @return StaticItemPanel
function StaticItemPanel.cast(object) end

--- Return StaticItemPanel class object
--- @return Class
function StaticItemPanel.get_class() end

--- Looks StaticItemPanel up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticItemPanel
function StaticItemPanel.find(name) end

--- Takes StaticItemPanel from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticItemPanel
function StaticItemPanel.get(name) end

--- Register a new StaticItemPanel static object
--- @param name string The name of the object
--- @return StaticItemPanel
function StaticItemPanel.reg(name) end

--- Engine static mesh
--- 
--- @class StaticMesh : Object
--- @field name string Object name
StaticMesh = {}

--- Load a static mesh asset
--- @param path string Path to the object
--- @return StaticMesh
function StaticMesh.load(path) end

--- 
--- 
--- @class StaticModifier
StaticModifier = {}

--- Trying to cast Object into StaticModifier
--- @param object Object Value to cast
--- @return StaticModifier
function StaticModifier.cast(object) end

--- Return StaticModifier class object
--- @return Class
function StaticModifier.get_class() end

--- Looks StaticModifier up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticModifier
function StaticModifier.find(name) end

--- Takes StaticModifier from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticModifier
function StaticModifier.get(name) end

--- Register a new StaticModifier static object
--- @param name string The name of the object
--- @return StaticModifier
function StaticModifier.reg(name) end

--- Base prototype for anything placeable in the world
--- 
--- @class StaticObject : Prototype
--- @field item StaticItem Item this object is built from and mined into
StaticObject = {}

--- Trying to cast Object into StaticObject
--- @param object Object Value to cast
--- @return StaticObject
function StaticObject.cast(object) end

--- Return StaticObject class object
--- @return Class
function StaticObject.get_class() end

--- Looks StaticObject up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticObject
function StaticObject.find(name) end

--- Takes StaticObject from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticObject
function StaticObject.get(name) end

--- Celestial body with its own day cycle in world ticks
--- 
--- @class StaticPlanet : Prototype
--- @field day_length_ticks integer Simulation ticks per full local day
--- @field phase_offset_ticks integer Added to the phase after day wrap
--- @field dawn_phase_ticks integer Day phase of the dawn anchor
--- @field solar_noon_phase_ticks integer Day phase of the solar noon anchor
--- @field sunset_phase_ticks integer Day phase of the sunset anchor
--- @field latitude_deg number Observer latitude used by the solar model
--- @field day_of_year integer Day of the tropical year fixing solar declination
StaticPlanet = {}

--- Cosmetic hours [0, 24) for a tick in local day-phase space
--- @param day_phase_tick integer Tick within the local day
--- @return number
function StaticPlanet:cosmetic_hours_from_day_phase_ticks(day_phase_tick) end

--- Solar hour [0, 24) for a world tick
--- @param total_game_ticks integer Absolute world tick
--- @return number
function StaticPlanet:time_of_day_hours_from_ticks(total_game_ticks) end

--- Solar hour honouring a locked time of day
--- @param world_time_auto_advance boolean False freezes the sky at the locked phase
--- @param locked_world_time_of_day_phase_ticks integer Phase used while frozen
--- @param total_game_ticks integer Absolute world tick
--- @return number
function StaticPlanet:resolve_time_of_day_hours(world_time_auto_advance, locked_world_time_of_day_phase_ticks, total_game_ticks) end

--- Trying to cast Object into StaticPlanet
--- @param object Object Value to cast
--- @return StaticPlanet
function StaticPlanet.cast(object) end

--- Return StaticPlanet class object
--- @return Class
function StaticPlanet.get_class() end

--- Looks StaticPlanet up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticPlanet
function StaticPlanet.find(name) end

--- Takes StaticPlanet from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticPlanet
function StaticPlanet.get(name) end

--- Register a new StaticPlanet static object
--- @param name string The name of the object
--- @return StaticPlanet
function StaticPlanet.reg(name) end

--- Decoration prototype scattered by the world generator
--- 
--- @class StaticProp : StaticObject
--- @field project_to_terrain_power number How strongly the prop follows the terrain slope
--- @field additive_elevation number Height offset added after terrain projection
--- @field range_mul number Prop view distance as a multiple of the decoration range setting; 0 is never culled
--- @field surface_height_min number Lowest surface height in blocks accepting this prop
--- @field surface_height_max number Highest surface height in blocks accepting this prop
--- @field top_height_max number Highest column top in blocks accepting this prop
--- @field floating boolean Prop keeps its height instead of sitting on the surface
--- @field is_big boolean Prop spans more than one cell and is placed sparsely
--- @field streamed boolean Prop is streamed with the sector instead of being baked
--- @field mesh StaticMesh Mesh rendered for this prop
--- @field no_collision boolean Prop is walked through
--- @field is_emitting boolean Prop emits light
--- @field high_detail_shadow boolean Prop may cast high-detail shadows
--- @field on_spawn function Called with the block position when the prop is spawned
--- @field hits_to_break integer Number of hits to break
--- @field break_effect Class Effect actor class spawned when the prop breaks
--- @field damage_effect Class Effect actor class spawned on a non-fatal hit
--- @field actor_class Class Actor class spawned instead of an instanced mesh
StaticProp = {}

--- Trying to cast Object into StaticProp
--- @param object Object Value to cast
--- @return StaticProp
function StaticProp.cast(object) end

--- Return StaticProp class object
--- @return Class
function StaticProp.get_class() end

--- Looks StaticProp up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticProp
function StaticProp.find(name) end

--- Takes StaticProp from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticProp
function StaticProp.get(name) end

--- Register a new StaticProp static object
--- @param name string The name of the object
--- @return StaticProp
function StaticProp.reg(name) end

--- Prototype asset that owns several PropListData records
--- 
--- @class StaticPropList : Prototype
--- @field data PropListData[] Prop tiers owned by this list
StaticPropList = {}

--- Trying to cast Object into StaticPropList
--- @param object Object Value to cast
--- @return StaticPropList
function StaticPropList.cast(object) end

--- Return StaticPropList class object
--- @return Class
function StaticPropList.get_class() end

--- Looks StaticPropList up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticPropList
function StaticPropList.find(name) end

--- Takes StaticPropList from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticPropList
function StaticPropList.get(name) end

--- Register a new StaticPropList static object
--- @param name string The name of the object
--- @return StaticPropList
function StaticPropList.reg(name) end

--- Quest definition and its runtime progress
--- 
--- @class StaticQuest : Prototype
--- @field label Loc Localized quest title
--- @field description_parts Loc[] Localized description paragraphs
--- @field context AutosizeInventory Inventory of items shown next to the description
--- @field chapter StaticChapter Chapter this quest belongs to
--- @field required_quests StaticQuest[] Quests that must be completed first
--- @field any_objective boolean Complete on any one objective instead of all of them
--- @field state integer Current state: locked, active or completed
--- @field events table? Table of event handlers keyed by event id
--- @field on_unlock function? Called when the quest becomes active
--- @field on_complete function? Called when the quest is completed
--- @field objectives QuestObjective[] Objectives of this quest
StaticQuest = {}

--- Add an item to the context inventory
--- @param item StaticItem Item to show
function StaticQuest:add_context(item) end

--- Remove every item from the context inventory
function StaticQuest:clear_context() end

--- Resubscribe the handlers listed in events
function StaticQuest:refresh_events() end

--- Complete the quest and fire on_complete
function StaticQuest:complete() end

--- Drop every objective
function StaticQuest:clear_objectives() end

--- Create and append an objective
--- @param id string Identifier unique within the quest
--- @return QuestObjective
function StaticQuest:create_objective(id) end

--- Append an existing objective
--- @param objective QuestObjective Objective to append
function StaticQuest:add_objective(objective) end

--- Find an objective by its identifier
--- @param id string Objective identifier
--- @return QuestObjective
function StaticQuest:find_objective_by_id(id) end

--- Replace the objective list
--- @param objectives table Array of objectives or objective descriptions
function StaticQuest:set_objective_list(objectives) end

--- Set the completion flag of an objective by index
--- @param index integer Zero based objective index
--- @param completed boolean New completion state
--- @return boolean
function StaticQuest:set_objective_complete(index, completed) end

--- Set the completion flag of an objective by identifier
--- @param id string Objective identifier
--- @param completed boolean New completion state
--- @return boolean
function StaticQuest:set_objective_complete_by_id(id, completed) end

--- Set the progress counters of an objective
--- @param index integer Zero based objective index
--- @param current integer Current amount
--- @param required integer Required amount
--- @param show_progress boolean Whether the counter is shown
--- @return boolean
function StaticQuest:set_objective_progress(index, current, required, show_progress) end

--- Set the localized text of an objective
--- @param index integer Zero based objective index
--- @param label Loc New localized text
--- @return boolean
function StaticQuest:set_objective_label(index, label) end

--- Trying to cast Object into StaticQuest
--- @param object Object Value to cast
--- @return StaticQuest
function StaticQuest.cast(object) end

--- Return StaticQuest class object
--- @return Class
function StaticQuest.get_class() end

--- Looks StaticQuest up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticQuest
function StaticQuest.find(name) end

--- Takes StaticQuest from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticQuest
function StaticQuest.get(name) end

--- Register a new StaticQuest static object
--- @param name string The name of the object
--- @return StaticQuest
function StaticQuest.reg(name) end

--- Research base class
--- 
--- @class StaticResearch : Prototype
--- @field label Loc Localized research name
--- @field description_parts Loc[] Localized description paragraphs
--- @field complexity integer Science the research costs to complete
--- @field level integer Level reached by an upgrade research, 0 for a node completed once
--- @field tier integer Progression tier the research belongs to
--- @field required_research StaticResearch[] Researches that must be complete before this one opens
--- @field completed boolean Whether the research is already complete
StaticResearch = {}

--- Trying to cast Object into StaticResearch
--- @param object Object Value to cast
--- @return StaticResearch
function StaticResearch.cast(object) end

--- Return StaticResearch class object
--- @return Class
function StaticResearch.get_class() end

--- Looks StaticResearch up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticResearch
function StaticResearch.find(name) end

--- Takes StaticResearch from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticResearch
function StaticResearch.get(name) end

--- Research granting extra player inventory slots
--- 
--- @class StaticResearchBonusInventory : StaticResearch
StaticResearchBonusInventory = {}

--- Trying to cast Object into StaticResearchBonusInventory
--- @param object Object Value to cast
--- @return StaticResearchBonusInventory
function StaticResearchBonusInventory.cast(object) end

--- Return StaticResearchBonusInventory class object
--- @return Class
function StaticResearchBonusInventory.get_class() end

--- Looks StaticResearchBonusInventory up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticResearchBonusInventory
function StaticResearchBonusInventory.find(name) end

--- Takes StaticResearchBonusInventory from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticResearchBonusInventory
function StaticResearchBonusInventory.get(name) end

--- Register a new StaticResearchBonusInventory static object
--- @param name string The name of the object
--- @return StaticResearchBonusInventory
function StaticResearchBonusInventory.reg(name) end

--- Research unlocking a decoration item
--- 
--- @class StaticResearchDecorationUnlock : StaticResearch
StaticResearchDecorationUnlock = {}

--- Trying to cast Object into StaticResearchDecorationUnlock
--- @param object Object Value to cast
--- @return StaticResearchDecorationUnlock
function StaticResearchDecorationUnlock.cast(object) end

--- Return StaticResearchDecorationUnlock class object
--- @return Class
function StaticResearchDecorationUnlock.get_class() end

--- Looks StaticResearchDecorationUnlock up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticResearchDecorationUnlock
function StaticResearchDecorationUnlock.find(name) end

--- Takes StaticResearchDecorationUnlock from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticResearchDecorationUnlock
function StaticResearchDecorationUnlock.get(name) end

--- Register a new StaticResearchDecorationUnlock static object
--- @param name string The name of the object
--- @return StaticResearchDecorationUnlock
function StaticResearchDecorationUnlock.reg(name) end

--- Research adding a productivity bonus to a recipe
--- 
--- @class StaticResearchEfficiency : StaticResearch
StaticResearchEfficiency = {}

--- Trying to cast Object into StaticResearchEfficiency
--- @param object Object Value to cast
--- @return StaticResearchEfficiency
function StaticResearchEfficiency.cast(object) end

--- Return StaticResearchEfficiency class object
--- @return Class
function StaticResearchEfficiency.get_class() end

--- Looks StaticResearchEfficiency up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticResearchEfficiency
function StaticResearchEfficiency.find(name) end

--- Takes StaticResearchEfficiency from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticResearchEfficiency
function StaticResearchEfficiency.get(name) end

--- Register a new StaticResearchEfficiency static object
--- @param name string The name of the object
--- @return StaticResearchEfficiency
function StaticResearchEfficiency.reg(name) end

--- Research raising a global player modifier
--- 
--- @class StaticResearchModifier : StaticResearch
--- @field modifier StaticModifier Modifier prototype affected by this research
--- @field bonus_value integer Value added to the modifier on completion
StaticResearchModifier = {}

--- Trying to cast Object into StaticResearchModifier
--- @param object Object Value to cast
--- @return StaticResearchModifier
function StaticResearchModifier.cast(object) end

--- Return StaticResearchModifier class object
--- @return Class
function StaticResearchModifier.get_class() end

--- Looks StaticResearchModifier up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticResearchModifier
function StaticResearchModifier.find(name) end

--- Takes StaticResearchModifier from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticResearchModifier
function StaticResearchModifier.get(name) end

--- Register a new StaticResearchModifier static object
--- @param name string The name of the object
--- @return StaticResearchModifier
function StaticResearchModifier.reg(name) end

--- Research unlocking a set of recipes
--- 
--- @class StaticResearchRecipe : StaticResearch
--- @field recipe_unlocks Recipe[] Recipes this research unlocks
StaticResearchRecipe = {}

--- Make this research unlock a recipe; a recipe of `HandRecipeDictionary` also puts its output item into hand crafting
--- @param recipe Recipe
--- @return boolean False when the recipe is null
function StaticResearchRecipe:unlocks(recipe) end

--- Trying to cast Object into StaticResearchRecipe
--- @param object Object Value to cast
--- @return StaticResearchRecipe
function StaticResearchRecipe.cast(object) end

--- Return StaticResearchRecipe class object
--- @return Class
function StaticResearchRecipe.get_class() end

--- Looks StaticResearchRecipe up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticResearchRecipe
function StaticResearchRecipe.find(name) end

--- Takes StaticResearchRecipe from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticResearchRecipe
function StaticResearchRecipe.get(name) end

--- Register a new StaticResearchRecipe static object
--- @param name string The name of the object
--- @return StaticResearchRecipe
function StaticResearchRecipe.reg(name) end

--- Research unlocking a player tool
--- 
--- @class StaticResearchToolUnlock : StaticResearch
StaticResearchToolUnlock = {}

--- Trying to cast Object into StaticResearchToolUnlock
--- @param object Object Value to cast
--- @return StaticResearchToolUnlock
function StaticResearchToolUnlock.cast(object) end

--- Return StaticResearchToolUnlock class object
--- @return Class
function StaticResearchToolUnlock.get_class() end

--- Looks StaticResearchToolUnlock up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticResearchToolUnlock
function StaticResearchToolUnlock.find(name) end

--- Takes StaticResearchToolUnlock from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticResearchToolUnlock
function StaticResearchToolUnlock.get(name) end

--- Register a new StaticResearchToolUnlock static object
--- @param name string The name of the object
--- @return StaticResearchToolUnlock
function StaticResearchToolUnlock.reg(name) end

--- Map generation script object with a footprint
--- 
--- @class StaticStructure : Prototype
--- @field generate function Callback invoked to emit the structure
--- @field size Vec2i Footprint of the structure in blocks
StaticStructure = {}

--- Trying to cast Object into StaticStructure
--- @param object Object Value to cast
--- @return StaticStructure
function StaticStructure.cast(object) end

--- Return StaticStructure class object
--- @return Class
function StaticStructure.get_class() end

--- Looks StaticStructure up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticStructure
function StaticStructure.find(name) end

--- Takes StaticStructure from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticStructure
function StaticStructure.get(name) end

--- Register a new StaticStructure static object
--- @param name string The name of the object
--- @return StaticStructure
function StaticStructure.reg(name) end

--- Encyclopedia entry shown to the player
--- 
--- @class StaticTip : Prototype
--- @field label Loc Localized title
--- @field description_parts Loc[] Localized body paragraphs
--- @field image string Illustration path relative to the owning mod folder
--- @field context AutosizeInventory Inventory of items shown next to the text
StaticTip = {}

--- Add an item to the context inventory shown next to the text
--- @param item StaticItem Item to show
function StaticTip:add_context(item) end

--- Remove every item from the context inventory
function StaticTip:clear_context() end

--- Trying to cast Object into StaticTip
--- @param object Object Value to cast
--- @return StaticTip
function StaticTip.cast(object) end

--- Return StaticTip class object
--- @return Class
function StaticTip.get_class() end

--- Looks StaticTip up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticTip
function StaticTip.find(name) end

--- Takes StaticTip from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticTip
function StaticTip.get(name) end

--- Register a new StaticTip static object
--- @param name string The name of the object
--- @return StaticTip
function StaticTip.reg(name) end

--- Weather preset a biome shows for one severity band
--- 
--- @class StaticWeather : Prototype
--- @field cloud_coverage number Cloud coverage the sky is set to, 0..10
--- @field thunder number Thunder and lightning the sky is set to, 0..10
--- @field fog number Fog amount the sky is set to, 0..10
StaticWeather = {}

--- Trying to cast Object into StaticWeather
--- @param object Object Value to cast
--- @return StaticWeather
function StaticWeather.cast(object) end

--- Return StaticWeather class object
--- @return Class
function StaticWeather.get_class() end

--- Looks StaticWeather up in db, nil when there is none
--- @param name string The name of the object
--- @return StaticWeather
function StaticWeather.find(name) end

--- Takes StaticWeather from db, reports a miss to the log
--- @param name string The name of the object
--- @return StaticWeather
function StaticWeather.get(name) end

--- Register a new StaticWeather static object
--- @param name string The name of the object
--- @return StaticWeather
function StaticWeather.reg(name) end

--- Base class for blocks that expose a storage inventory
--- 
--- @class StorageBlockLogic : BlockLogic
--- @field storage_access InventoryAccess
StorageBlockLogic = {}

--- Trying to cast Object into StorageBlockLogic
--- @param object Object Value to cast
--- @return StorageBlockLogic
function StorageBlockLogic.cast(object) end

--- Return StorageBlockLogic class object
--- @return Class
function StorageBlockLogic.get_class() end

--- Creates a new StorageBlockLogic instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return StorageBlockLogic
function StorageBlockLogic.new(parent, name) end

--- Creates a new StorageBlockLogic instance
--- @return StorageBlockLogic
function StorageBlockLogic.new_simple() end

--- Generation setup of one planetary surface
--- 
--- @class SurfaceDefinition : Instance
--- @field region_map RegionMap Region map driving surface generation
--- @field generator_name string World generator identifier
SurfaceDefinition = {}

--- Trying to cast Object into SurfaceDefinition
--- @param object Object Value to cast
--- @return SurfaceDefinition
function SurfaceDefinition.cast(object) end

--- Return SurfaceDefinition class object
--- @return Class
function SurfaceDefinition.get_class() end

--- Creates a new SurfaceDefinition instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return SurfaceDefinition
function SurfaceDefinition.new(parent, name) end

--- Creates a new SurfaceDefinition instance
--- @return SurfaceDefinition
function SurfaceDefinition.new_simple() end

--- Column of generated block cells
--- 
--- @class TallSectorData
--- @field zero_height integer Cell height the column starts at
--- @field height integer Number of cells in the column
TallSectorData = {}

--- Block at the given position
--- @param pos Vec3i Position inside the column
--- @return StaticBlock
function TallSectorData:get_block(pos) end

--- Write a block at the given position
--- @param pos Vec3i Position inside the column
--- @param block StaticBlock Block type to write
function TallSectorData:set_block(pos, block) end

--- Sector mesh builder prototype
--- 
--- @class Tesselator : Prototype
Tesselator = {}

--- Trying to cast Object into Tesselator
--- @param object Object Value to cast
--- @return Tesselator
function Tesselator.cast(object) end

--- Return Tesselator class object
--- @return Class
function Tesselator.get_class() end

--- Looks Tesselator up in db, nil when there is none
--- @param name string The name of the object
--- @return Tesselator
function Tesselator.find(name) end

--- Takes Tesselator from db, reports a miss to the log
--- @param name string The name of the object
--- @return Tesselator
function Tesselator.get(name) end

--- Register a new Tesselator static object
--- @param name string The name of the object
--- @return Tesselator
function Tesselator.reg(name) end

--- 
--- 
--- @class TesselatorCube
TesselatorCube = {}

--- Trying to cast Object into TesselatorCube
--- @param object Object Value to cast
--- @return TesselatorCube
function TesselatorCube.cast(object) end

--- Return TesselatorCube class object
--- @return Class
function TesselatorCube.get_class() end

--- Looks TesselatorCube up in db, nil when there is none
--- @param name string The name of the object
--- @return TesselatorCube
function TesselatorCube.find(name) end

--- Takes TesselatorCube from db, reports a miss to the log
--- @param name string The name of the object
--- @return TesselatorCube
function TesselatorCube.get(name) end

--- Register a new TesselatorCube static object
--- @param name string The name of the object
--- @return TesselatorCube
function TesselatorCube.reg(name) end

--- 
--- 
--- @class TesselatorMarching
TesselatorMarching = {}

--- Trying to cast Object into TesselatorMarching
--- @param object Object Value to cast
--- @return TesselatorMarching
function TesselatorMarching.cast(object) end

--- Return TesselatorMarching class object
--- @return Class
function TesselatorMarching.get_class() end

--- Looks TesselatorMarching up in db, nil when there is none
--- @param name string The name of the object
--- @return TesselatorMarching
function TesselatorMarching.find(name) end

--- Takes TesselatorMarching from db, reports a miss to the log
--- @param name string The name of the object
--- @return TesselatorMarching
function TesselatorMarching.get(name) end

--- Register a new TesselatorMarching static object
--- @param name string The name of the object
--- @return TesselatorMarching
function TesselatorMarching.reg(name) end

--- Engine 2D texture
--- 
--- @class Texture : Object
--- @field name string Object name
Texture = {}

--- Find a loaded texture by name
--- @param name string Texture name
--- @return Texture
function Texture.find(name) end

--- One entry of a train schedule
--- 
--- @class TrainScheduleStop : Instance
TrainScheduleStop = {}

--- Trying to cast Object into TrainScheduleStop
--- @param object Object Value to cast
--- @return TrainScheduleStop
function TrainScheduleStop.cast(object) end

--- Return TrainScheduleStop class object
--- @return Class
function TrainScheduleStop.get_class() end

--- Creates a new TrainScheduleStop instance
--- @param parent Object Object of parent
--- @param name string The name of the instance
--- @return TrainScheduleStop
function TrainScheduleStop.new(parent, name) end

--- Creates a new TrainScheduleStop instance
--- @return TrainScheduleStop
function TrainScheduleStop.new_simple() end

--- Location, rotation and scale of an object
--- 
--- @class Transform
Transform = {}

--- Create an identity transform
--- @return Transform
function Transform.new() end

--- 
--- @param location Vec3
function Transform:set_location(location) end

--- 
--- @param rotation FQuat
function Transform:set_rotation(rotation) end

--- 
--- @param scale Vec3
function Transform:set_scale(scale) end

--- 
--- @return Vec3
function Transform:get_location() end

--- 
--- @return FQuat
function Transform:get_rotation() end

--- 
--- @return Vec3
function Transform:get_scale() end

--- Integer vector 2
--- 
--- @class Vec2i
--- @field zero Vec2i (0, 0)
--- @field one Vec2i (1, 1)
--- @field x integer
--- @field y integer
Vec2i = {}

--- Create a vector from components
--- @param x integer
--- @param y integer
--- @return Vec2i
function Vec2i.new(x, y) end

--- Float vector 3
--- 
--- @class Vec3
--- @field one Vec3 (1, 1, 1)
--- @field zero Vec3 (0, 0, 0)
--- @field up Vec3 (0, 0, 1)
--- @field down Vec3 (0, 0, -1)
--- @field left Vec3 (0, 1, 0)
--- @field right Vec3 (0, -1, 0)
--- @field back Vec3 (-1, 0, 0)
--- @field front Vec3 (1, 0, 0)
--- @field x number
--- @field y number
--- @field z number
Vec3 = {}

--- Create a vector from components
--- @param x number
--- @param y number
--- @param z number
--- @return Vec3
function Vec3.new(x, y, z) end

--- Create a vector with all components equal
--- @param x number
--- @return Vec3
function Vec3.repeating(x) end

--- Unit vector with the same direction
--- @return Vec3
function Vec3:normalize() end

--- Integer vector 3
--- 
--- @class Vec3i
--- @field one Vec3i (1, 1, 1)
--- @field zero Vec3i (0, 0, 0)
--- @field up Vec3i (0, 0, 1)
--- @field down Vec3i (0, 0, -1)
--- @field left Vec3i (0, 1, 0)
--- @field right Vec3i (0, -1, 0)
--- @field back Vec3i (-1, 0, 0)
--- @field front Vec3i (1, 0, 0)
--- @field x integer
--- @field y integer
--- @field z integer
Vec3i = {}

--- Create a vector from components
--- @param x integer
--- @param y integer
--- @param z integer
--- @return Vec3i
function Vec3i.new(x, y, z) end

--- Drop the Z component
--- @return Vec2i
function Vec3i:xy() end

--- Terrain generator bound to a dimension
--- 
--- @class WorldGenerator : Prototype
WorldGenerator = {}

--- Trying to cast Object into WorldGenerator
--- @param object Object Value to cast
--- @return WorldGenerator
function WorldGenerator.cast(object) end

--- Return WorldGenerator class object
--- @return Class
function WorldGenerator.get_class() end

--- Looks WorldGenerator up in db, nil when there is none
--- @param name string The name of the object
--- @return WorldGenerator
function WorldGenerator.find(name) end

--- Takes WorldGenerator from db, reports a miss to the log
--- @param name string The name of the object
--- @return WorldGenerator
function WorldGenerator.get(name) end

--- Block, sector and world coordinate conversions
--- 
--- @class cs
--- @field sector_size Vec3i Sector dimensions in blocks
cs = {}

--- Convert a block position to a sector position
--- @param bpos Vec3i Block position
--- @return Vec3i
function cs.bp2sp(bpos) end

--- Convert a world position to a block position
--- @param world Vec3 World position
--- @return Vec3i
function cs.w2bp(world) end

--- Convert a block position to a world position
--- @param bpos Vec3i Block position
--- @return Vec3
function cs.bp2w(bpos) end

--- Convert a world position to a sector position
--- @param world Vec3 World position
--- @return Vec3i
function cs.w2sp(world) end

--- @class defines
defines = defines or {}

--- Identifiers of the gameplay events the event bus can emit
--- 
--- @class defines.events
--- @field on_player_mined_item integer Player mined an item. Context: { item, count }
--- @field on_built_block integer Block was built. Context: { block, position }, position in block cells
--- @field on_player_spawn integer Player pawn entered the world
--- @field on_region_spawn integer World region was generated
--- @field on_player_at_sector integer Player crossed into another sector
--- @field on_entity_died integer Entity died
--- @field on_entity_damaged integer Entity took damage
--- @field on_entity_spawn integer Entity spawned
--- @field on_surface_day_phase integer Day phase changed. Context: { anchor }, "dawn" or "sunset"
--- @field on_research_finished integer Research completed. Context: { research }
--- @field on_quest_activated integer Quest became active. Context: { quest }
--- @field on_player_crafted integer Player finished a hand craft. Context: { item, count }, one per output
--- @field on_gui_opened integer A window was opened. Context: { gui }, "inventory", "research", "map", "questbook", "recipes", "pause", "spawn" or "saves"
--- @field on_gui_closed integer A window was closed. Context: { gui, any_open }, gui named as in on_gui_opened; any_open is false when the window that closed was the last one
defines.events = {}

--- Values StaticQuest.state takes
--- 
--- @class defines.quest_state
--- @field locked integer Prerequisites are not met yet
--- @field active integer Unlocked and tracked
--- @field completed integer Every objective is done
defines.quest_state = {}

--- The player's own heads-up display
--- 
--- @class hud
hud = {}

--- Put a toggle of this mod's own into the player's control bar, where it can be reordered and hidden like the built-in ones
--- @param spec table { id = "...", label = "..."?, icon = "/Game/Textures/EqualsIco.EqualsIco"?, on_click = function() end, is_on = function() return bool end? }
--- @return boolean False when the table is missing an id or an on_click
function hud.add_toggle(spec) end

--- Scripted screenshot capture
--- 
--- @class shot
shot = {}

--- Capture a screenshot
--- @param params table Table with path, width, height, supersample, location, rotation and fov
--- @return boolean
function shot.capture(params) end

--- Capture one widget: the pixels it holds on screen, or an offscreen render of a fresh instance
--- @param params table Table with name, path, w, h, scale, fresh and bg
--- @return boolean
function shot.widget(params) end

--- Log every widget instance with the geometry it was last arranged at
function shot.widgets() end

--- Open a hud screen and answer with the widget class it opened, empty when it did not open
--- @param name string Screen name: Inventory, Recipes, Map, Pause, Research, QuestBook, Spawn, SavesManager, Tips
--- @return string
function shot.screen(name) end

--- Restart the unit boot sequence from its first frame
--- @param mode string full or resume
--- @return boolean
function shot.boot(mode) end

--- Set a console variable
--- @param name string Console variable name
--- @param value any Boolean, number or string value
--- @return boolean
function shot.cvar(name, value) end

--- Pin the engine to a fixed time step, zero turns it off
--- @param fps number Frames per second of the fixed time step
function shot.fps(fps) end

--- Call a handler once per rendered frame
--- @param handler function Function called with the frame index
function shot.on_render_frame(handler) end

--- Stop the running script and report success
function shot.finish() end

--- Stop the running script and report failure
--- @param message string Reason written to the log
function shot.fail(message) end

--- Prop instances standing below the water plane, counted by prop
--- @return boolean
function shot.props_underwater() end

--- Transform of the local player camera
--- @return Transform
function shot.player_camera() end

--- Freeze the sky at a solar hour
--- @param hours number Solar hour, 0..24
--- @return boolean
function shot.time_of_day(hours) end

--- Simulation tick scheduler
--- 
--- @class sim
sim = {}

--- Current simulation tick of the running session
--- @return number
function sim.tick() end

--- Call a handler once at an absolute tick, returns the cancellation handle
--- @param due_tick number Absolute simulation tick
--- @param handler function Function called when the tick is reached
--- @return number
function sim.at(due_tick, handler) end

--- Call a handler once after a delay, returns the cancellation handle
--- @param delay_ticks number Delay in simulation ticks, at least one
--- @param handler function Function called when the delay expires
--- @return number
function sim.after(delay_ticks, handler) end

--- Call a handler on a repeating interval, returns the cancellation handle
--- @param interval_ticks number Interval in simulation ticks, at least one
--- @param handler function Function called on every interval
--- @return number
function sim.every(interval_ticks, handler) end

--- Cancel a scheduled callback
--- @param handle number Handle returned by at, after or every
--- @return boolean
function sim.cancel(handle) end

--- @class ui
ui = ui or {}

--- Single-slot border with uniform padding
--- 
--- @class ui.Border : ui.Widget
--- @field content ui.Widget child widget
--- @field padding number Uniform padding in slate units (all sides)
--- @field style string Plate the game draws behind the child: "panel", "window", "frame", "field" or "none"
ui.Border = {}

--- 
--- 
--- @class ui.Button : ui.Widget
--- @field content ui.Widget child widget
ui.Button = {}

--- Grid of equal cells, filled row by row
--- 
--- @class ui.Grid : ui.Widget
--- @field columns integer Cells per row, at least one
--- @field gap number Space kept between cells in slate units
ui.Grid = {}

--- Put a widget in the next free cell
--- @param child ui.Widget Widget to place
function ui.Grid:add(child) end

--- Drop every child, leaving the grid empty
function ui.Grid:clear() end

--- Horizontal container
--- 
--- @class ui.HBox : ui.Widget
--- @field gap number Space kept between children in slate units
ui.HBox = {}

--- Append a child widget (must not already be parented)
--- @param child ui.Widget Widget to append
function ui.HBox:add(child) end

--- Drop every child, leaving the box empty
function ui.HBox:clear() end

--- Vertical list that scrolls instead of overflowing
--- 
--- @class ui.Scroll : ui.Widget
--- @field gap number Space kept between children in slate units
ui.Scroll = {}

--- Append a child widget (must not already be parented)
--- @param child ui.Widget Widget to append
function ui.Scroll:add(child) end

--- Drop every child, leaving the list empty
function ui.Scroll:clear() end

--- Scroll back to the first child
function ui.Scroll:to_start() end

--- Text label
--- 
--- @class ui.Text : ui.Widget
--- @field text string Displayed UTF-8 text
--- @field font_size number Font size in slate units
--- @field align string Where the text sits in its slot: "left", "center" or "right"
--- @field wrap boolean True breaks a long line instead of letting it run out of the window
ui.Text = {}

--- Single line the player types into
--- 
--- @class ui.TextBox : ui.Widget
--- @field text string Current UTF-8 text
--- @field hint string Greyed text shown while the field is empty
ui.TextBox = {}

--- Give the field keyboard focus
function ui.TextBox:focus() end

--- Vertical container
--- 
--- @class ui.VBox : ui.Widget
--- @field gap number Space kept between children in slate units
ui.VBox = {}

--- Append a child widget (must not already be parented)
--- @param child ui.Widget Widget to append
function ui.VBox:add(child) end

--- Drop every child, leaving the box empty
function ui.VBox:clear() end

--- 
--- 
--- @class ui.Widget : Object
--- @field visible boolean Hidden widgets keep their place in the tree and take no input
ui.Widget = {}

--- Top level window with a title bar the player can drag it by
--- 
--- @class ui.Window : ui.Widget
--- @field content ui.Widget Single child (replaces previous when set)
--- @field title string Text shown in the title bar
--- @field width number Fixed width in slate units; zero lets the content decide and the window resizes with it
--- @field height number Fixed height in slate units; zero lets the content decide and the window resizes with it
--- @field input boolean True gives the window the cursor and the keyboard while the game keeps running
ui.Window = {}

--- Add to viewport at Z order 0
function ui.Window:show() end

--- Remove from parent (hide)
function ui.Window:close() end

--- Runtime weather control
--- 
--- @class weather
weather = {}

--- Transition naturally to a StaticWeather preset by name
--- @param name string StaticWeather prototype name
--- @return boolean
function weather.set(name) end

--- Immediately snap to a StaticWeather preset by name
--- @param name string StaticWeather prototype name
--- @return boolean
function weather.snap(name) end

--- Clear the explicit preset and the wind override, and immediately restore biome-driven weather
--- @return boolean
function weather.clear() end

--- Hold the wind speed at a fixed value, clamped to the planet maximum of 20
--- @param speed number Wind speed in meters per second
--- @return boolean
function weather.wind(speed) end

--- Release the wind override and let the surface environment drive the wind again
--- @return boolean
function weather.wind_clear() end


--- Global game instance
--- @type Game
game = {}

--- Global prototype database
--- @type DB
db = {}

--- Global engine data
--- @type Engine
engine = {}

--- Global music manager
--- @type Music
music = {}

--- Global quest manager
--- @type QuestSubsystem
quests = {}
