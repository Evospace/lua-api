-- Evospace Lua API 0.22.2: generated from the game's registry dump

export type Biome_spec = {
}

export type BiomeFamily_spec = {
    --- Sub-biomes this family selects from
    sub_biomes: { Biome }?,
    --- Frequency of the sub-biome selection noise
    sub_frequency: number?,
    --- Amplitude of the coarse domain warp
    perturb_amp: number?,
    --- Frequency of the coarse domain warp
    perturb_frequency: number?,
    --- Octave count of the coarse domain warp
    perturb_octaves: number?,
    --- Amplitude of the fine domain warp
    perturb_fine_amp: number?,
    --- Frequency of the fine domain warp
    perturb_fine_frequency: number?,
}

export type BiomeWorldGenerator_spec = {
    --- Global biome family laying out the surface
    global_biome: GlobalBiomeFamily?,
    --- Block filling the ground below the layered surface
    underworld_block: StaticBlock?,
    --- Ore deposits this world places; its nearest tier is seeded around the spawn
    ore_list: StaticPropList?,
    --- Item a drill takes anywhere away from a deposit
    stone_source: StaticItem?,
    --- Fluid a pump takes anywhere away from a deposit
    water_source: StaticItem?,
}

export type Component_spec = {
    --- Field name to its type: "integer", "boolean", "item" or "string". Fields go in name order; --!sim sees integer, boolean and item fields as columns, an item as its sim_id
    fields: { [string]: string }?,
    --- Version of the fields, 1 by default; a save written by a lower version goes through migrate
    version: number?,
    --- migrate(fields, version) gets the fields a save holds, by name with items as their names, and the version that wrote them; it returns the fields for the current version
    migrate: ((...any) -> ...any)??,
}

export type GhostStaticBlock_spec = {
    --- BlockLogic class driving the simulation
    logic: Class?,
    --- Presentation actor class spawned for the block
    actor: Class?,
    --- Selector widget class
    selector: Class?,
    --- Mesh tesselator used to render the block
    tesselator: Tesselator?,
    --- Occupied cells relative to the block origin
    sub_blocks: { Vec3i }?,
    --- Block local axes that keep their world direction; a turn moving a locked axis is refused
    rotation_locks: Vec3i?,
    --- Blocks sharing a tag replace each other on build
    replace_tag: string?,
    --- Block tier used for recipe speed scaling
    tier: number?,
    --- Block level within its tier
    level: number?,
    --- Energy drawn per simulation tick
    energy_consumption_per_tick: number?,
    --- Energy produced per simulation tick
    energy_production_per_tick: number?,
    --- Resource item drawn by this block
    energy_consumption_item: StaticItem?,
    --- Resource item produced by this block
    energy_production_item: StaticItem?,
    --- Effect actor class spawned when the block is destroyed
    break_effect: Class?,
    --- Called with the block logic of every new block of this type; makes its inventories and accessors
    logic_init: ((...any) -> ...any)??,
    --- Called with the block actor when it spawns
    actor_init: ((...any) -> ...any)??,
    --- Tooltip of the block: a string, or a function of the block logic returning one
    tooltip: (((...any) -> ...any) | string | nil)?,
    --- Components every block of this type keeps: component name to the values a new block starts with; a field left out starts at 0, false, nil or "". Saved with the block and part of the sim state; batch_tick gets them as arrays, BlockLogic.component and get_field read them
    components: { [string]: { [any]: any } }?,
    --- Called once every sim tick with all placed blocks of this type, in position order: batch_tick(blocks, components, inventories), or batch_tick(n, components, slots, inventories) from a --!sim chunk. components.<Component>.<field> is the array of that field of every block, read back after the call; --!sim gets integer, boolean and item fields as int64 columns, an item as its sim_id, and no string fields. slots.<inventory> holds item and count columns indexed (i-1)*slots+s, taken before the call. inventories maps an inventory name to the array of that inventory of every block. The tables are kept between ticks and change only when a block of the type comes or goes
    batch_tick: ((...any) -> ...any)??,
    --- Builds the window of a block of this type: window(logic) returns the content widget, and may return a function the window calls every frame while it is open
    window: ((...any) -> ...any)??,
    --- Cover mesh for the half-height variant
    half_cover: StaticCover?,
    --- Cover mesh for the center part
    center_cover: StaticCover?,
    --- Cover mesh for the block body
    body_cover: StaticCover?,
    --- Logic export signals published by this block type
    export_options: { LogicExportOption }?,
    --- Logic import signals accepted by this block type
    import_options: { LogicImportOption }?,
    --- Item this object is built from and mined into
    item: StaticItem?,
    --- Item a build pays and mining returns; nil when the object is not minable
    mined_item: StaticItem?,
    --- How many of mined_item a build pays and mining returns; zero when the object is not minable
    mined_count: number?,
}

export type GlobalBiomeFamily_spec = {
    --- Sub-biomes this family selects from
    sub_biomes: { Biome }?,
    --- Frequency of the sub-biome selection noise
    sub_frequency: number?,
    --- Amplitude of the coarse domain warp
    perturb_amp: number?,
    --- Frequency of the coarse domain warp
    perturb_frequency: number?,
    --- Octave count of the coarse domain warp
    perturb_octaves: number?,
    --- Amplitude of the fine domain warp
    perturb_fine_amp: number?,
    --- Frequency of the fine domain warp
    perturb_fine_frequency: number?,
}

export type HeightGenerator_spec = {
}

export type ItemGroup_spec = {
    --- Items that satisfy the group, in the order a craft takes them
    members: { StaticItem }?,
    --- Item image in UI
    image: Texture2D?,
    --- Icon path relative to the owning mod folder
    image_path: string?,
    --- Size of item stack
    stack_size: number?,
    --- Item unlock tier
    tier: number?,
    --- What the item is: "solid", "fluid" or "abstract"
    type: string?,
    --- multiplier for UI
    unit_mul: number?,
    --- Mesh for item rendering in world
    mesh: StaticMesh?,
    --- Buildable object pointer for this item
    block: StaticBlock?,
    --- Is item instance contains CustomData
    custom_data: boolean?,
    --- Class for item while in hand
    logic: Class?,
    --- Space separated search tags
    tags: string?,
    --- In-game database category
    category: string?,
    --- Equipment slot this item fits (Jetpack, Light)
    equipment_slot: string?,
    --- Localized item name
    label: Loc?,
    --- Localized description paragraphs
    description_parts: { Loc }?,
}

export type LogicExportOption_spec = {
    --- Signal item this option exports
    signal: StaticItem?,
    --- Whether the GUI row shows a signal slot
    use_signal: boolean?,
    --- Initial checkbox state in the GUI
    enabled: boolean?,
    --- Localized row name
    label: Loc?,
    --- Localized row tooltip
    tooltip: Loc?,
}

export type LogicImportOption_spec = {
    --- Signal item this option imports
    signal: StaticItem?,
    --- Whether the GUI row shows a signal slot
    use_signal: boolean?,
    --- Initial checkbox state in the GUI
    enabled: boolean?,
    --- Localized row name
    label: Loc?,
    --- Localized row tooltip
    tooltip: Loc?,
}

export type LuaWorldGenerator_spec = {
    --- Biome family selecting the surface biome
    biome_family: BiomeFamily?,
    --- Height generator for the terrain surface
    height: HeightGenerator?,
    --- Ore deposits this world places; its nearest tier is seeded around the spawn
    ore_list: StaticPropList?,
    --- Item a drill takes anywhere away from a deposit
    stone_source: StaticItem?,
    --- Fluid a pump takes anywhere away from a deposit
    water_source: StaticItem?,
}

export type NoiseGenerator_spec = {
    --- Lower bound of the remapped noise range
    min: number?,
    --- Upper bound of the remapped noise range
    max: number?,
}

export type Prototype_spec = {
}

export type Recipe_spec = {
    --- *Craft time* in engine ticks
    ticks: number?,
    --- Currently locked if **true**
    locked: boolean?,
    --- Percentage bonus (e.g. `20` = +20 %)
    productivity: number?,
    --- Item whose image and name stand for this recipe in the crafting UI; when the mods finish loading, a recipe without one takes its first output, else its first input
    icon: StaticItem?,
    --- Recipe tier used for speed scaling: every tier **above** its dictionary's `start_tier` doubles craft time; below it the recipe is clamped to `start_tier`.
    tier: number?,
    --- The dictionary's `start_tier`, copied to every recipe in it when the mods finish loading.
    start_tier: number?,
}

export type RecipeDictionary_spec = {
    --- Machine-unlock tier shared by every recipe in the dictionary
    start_tier: number?,
}

export type Setting_spec = {
    --- Changing this setting requires a restart
    restart: boolean?,
    --- Called with the new value when the setting changes
    set_action: ((...any) -> ...any)?,
    --- Localization key of the displayed name
    label: string?,
    --- Widget type used to edit the setting
    type: string?,
    --- Settings category this entry belongs to
    category: string?,
    --- Current value: a boolean for Bool, an integer for Slider and Int, a string for String and Buttons
    value: (boolean | number | string | nil)?,
    --- Default value, of the same kind as value
    default: (boolean | number | string | nil)?,
    --- Values a String or Buttons setting offers
    options: { string }?,
    --- Lower bound of a Slider or Int value
    min: number?,
    --- Upper bound of a Slider or Int value
    max: number?,
    --- Input action bound to this setting
    key_binding: string?,
    --- Default keystroke, e.g. Ctrl+Shift+F
    default_key: string?,
    --- Called with this setting when the bound key goes down; only for a key_binding of this mod's own
    key_action: ((...any) -> ...any)?,
}

export type StaticAchievement_spec = {
    --- Progress added by the last increment
    delta: number?,
    --- Accumulated progress
    total: number?,
    --- Progress required to unlock
    threshold: number?,
    --- Whether the achievement is unlocked
    unlocked: boolean?,
    --- Game time of the unlock
    unlocked_time: number?,
    --- Achievement icon
    image: Texture2D?,
    --- Steam achievement id
    steam_key: string?,
    --- Localized name
    label: Loc?,
    --- Localized description
    description: Loc?,
}

export type StaticBlock_spec = {
    --- BlockLogic class driving the simulation
    logic: Class?,
    --- Presentation actor class spawned for the block
    actor: Class?,
    --- Selector widget class
    selector: Class?,
    --- Mesh tesselator used to render the block
    tesselator: Tesselator?,
    --- Occupied cells relative to the block origin
    sub_blocks: { Vec3i }?,
    --- Block local axes that keep their world direction; a turn moving a locked axis is refused
    rotation_locks: Vec3i?,
    --- Blocks sharing a tag replace each other on build
    replace_tag: string?,
    --- Block tier used for recipe speed scaling
    tier: number?,
    --- Block level within its tier
    level: number?,
    --- Energy drawn per simulation tick
    energy_consumption_per_tick: number?,
    --- Energy produced per simulation tick
    energy_production_per_tick: number?,
    --- Resource item drawn by this block
    energy_consumption_item: StaticItem?,
    --- Resource item produced by this block
    energy_production_item: StaticItem?,
    --- Effect actor class spawned when the block is destroyed
    break_effect: Class?,
    --- Called with the block logic of every new block of this type; makes its inventories and accessors
    logic_init: ((...any) -> ...any)??,
    --- Called with the block actor when it spawns
    actor_init: ((...any) -> ...any)??,
    --- Tooltip of the block: a string, or a function of the block logic returning one
    tooltip: (((...any) -> ...any) | string | nil)?,
    --- Components every block of this type keeps: component name to the values a new block starts with; a field left out starts at 0, false, nil or "". Saved with the block and part of the sim state; batch_tick gets them as arrays, BlockLogic.component and get_field read them
    components: { [string]: { [any]: any } }?,
    --- Called once every sim tick with all placed blocks of this type, in position order: batch_tick(blocks, components, inventories), or batch_tick(n, components, slots, inventories) from a --!sim chunk. components.<Component>.<field> is the array of that field of every block, read back after the call; --!sim gets integer, boolean and item fields as int64 columns, an item as its sim_id, and no string fields. slots.<inventory> holds item and count columns indexed (i-1)*slots+s, taken before the call. inventories maps an inventory name to the array of that inventory of every block. The tables are kept between ticks and change only when a block of the type comes or goes
    batch_tick: ((...any) -> ...any)??,
    --- Builds the window of a block of this type: window(logic) returns the content widget, and may return a function the window calls every frame while it is open
    window: ((...any) -> ...any)??,
    --- Cover mesh for the half-height variant
    half_cover: StaticCover?,
    --- Cover mesh for the center part
    center_cover: StaticCover?,
    --- Cover mesh for the block body
    body_cover: StaticCover?,
    --- Logic export signals published by this block type
    export_options: { LogicExportOption }?,
    --- Logic import signals accepted by this block type
    import_options: { LogicImportOption }?,
    --- Item this object is built from and mined into
    item: StaticItem?,
    --- Item a build pays and mining returns; nil when the object is not minable
    mined_item: StaticItem?,
    --- How many of mined_item a build pays and mining returns; zero when the object is not minable
    mined_count: number?,
}

export type StaticChapter_spec = {
    --- Localized chapter title
    label: Loc?,
    --- Quests belonging to this chapter
    quests: { StaticQuest }?,
    --- Quests that must be completed before the chapter becomes available
    required_quests: { StaticQuest }?,
    --- Whether the chapter is available in the current save
    unlocked: boolean?,
    --- Called when the chapter unlocks
    on_unlock: ((...any) -> ...any)??,
    --- Called when every quest is completed
    on_complete: ((...any) -> ...any)??,
}

export type StaticCover_spec = {
}

export type StaticCoverSet_spec = {
    --- Allowed cover designs
    covers: { StaticCover }?,
}

export type StaticItem_spec = {
    --- Item image in UI
    image: Texture2D?,
    --- Icon path relative to the owning mod folder
    image_path: string?,
    --- Size of item stack
    stack_size: number?,
    --- Item unlock tier
    tier: number?,
    --- What the item is: "solid", "fluid" or "abstract"
    type: string?,
    --- multiplier for UI
    unit_mul: number?,
    --- Mesh for item rendering in world
    mesh: StaticMesh?,
    --- Buildable object pointer for this item
    block: StaticBlock?,
    --- Is item instance contains CustomData
    custom_data: boolean?,
    --- Class for item while in hand
    logic: Class?,
    --- Space separated search tags
    tags: string?,
    --- In-game database category
    category: string?,
    --- Equipment slot this item fits (Jetpack, Light)
    equipment_slot: string?,
    --- Localized item name
    label: Loc?,
    --- Localized description paragraphs
    description_parts: { Loc }?,
}

export type StaticItemPanel_spec = {
    --- Items this panel is shown for
    items: { StaticItem }?,
    --- Item category this panel is shown for
    category: string?,
    --- Sort order among the panels of one item
    order: number?,
    --- Panel widget class path; empty means build draws the panel
    widget: string?,
    --- Called with the item and the panel each time the panel is shown; returns the ui.Widget it draws, nil hides the panel
    build: ((...any) -> ...any)??,
    --- Localized panel title
    label: Loc?,
    --- Localized body paragraphs
    description_parts: { Loc }?,
    --- Inventory of items shown under the text
    context: AutosizeInventory?,
}

export type StaticModifier_spec = {
}

export type StaticObject_spec = {
    --- Item this object is built from and mined into
    item: StaticItem?,
    --- Item a build pays and mining returns; nil when the object is not minable
    mined_item: StaticItem?,
    --- How many of mined_item a build pays and mining returns; zero when the object is not minable
    mined_count: number?,
}

export type StaticOreVein_spec = {
    --- Rock the vein replaces and the ore it leaves there
    targets: { OreVeinTarget }?,
    --- Number of blobs strung along the vein
    size: number?,
    --- Veins tried per column
    count: number?,
    --- A column gets the veins with chance 1 / rarity
    rarity: number?,
    --- Lowest vein centre, world block height
    min_height: number?,
    --- Highest vein centre, world block height
    max_height: number?,
    --- Heights peak in the middle of the range instead of spreading evenly
    trapezoid: boolean?,
    --- Width of the flat top of the trapezoid
    plateau: number?,
    --- Chance an ore cell next to air stays rock
    discard_on_air_exposure: number?,
}

export type StaticPlanet_spec = {
    --- Simulation ticks per full local day
    day_length_ticks: number?,
    --- Added to the phase after day wrap
    phase_offset_ticks: number?,
    --- Day phase of the dawn anchor
    dawn_phase_ticks: number?,
    --- Day phase of the solar noon anchor
    solar_noon_phase_ticks: number?,
    --- Day phase of the sunset anchor
    sunset_phase_ticks: number?,
    --- Observer latitude used by the solar model
    latitude_deg: number?,
    --- Day of the tropical year fixing solar declination
    day_of_year: number?,
    --- Calmest point the weather cycle reaches, from 0 clear sky to 1 full storm
    weather_severity_min: number?,
    --- Stormiest point the weather cycle reaches, from 0 clear sky to 1 full storm
    weather_severity_max: number?,
    --- Radius of the body seen from space, 0 for a body never seen from orbit
    radius_meters: number?,
    --- Height of a platform orbit above the surface
    orbit_altitude_meters: number?,
    --- World generator of the surface, empty for the generator chosen for the save
    generator_name: string?,
    --- Music playlist key played while the surface is shown
    music_playlist: string?,
}

export type StaticPlayer_spec = {
    --- Recipes the player crafts in hand
    hand_recipes: RecipeDictionary?,
    --- Items put on the first hotbar row of a new player
    hotbar: { StaticItem }?,
    --- Tools always in hand; the three tool keys take the first three
    tools: { StaticItem }?,
    --- Item whose logic lights the empty light slot
    light: StaticItem?,
    --- Item that carries a captured blueprint
    blueprint_item: StaticItem?,
    --- Items a new player receives
    start_inventory: Inventory?,
    --- Researches completed when a world starts
    start_researches: { StaticResearch }?,
}

export type StaticProp_spec = {
    --- How strongly the prop follows the terrain slope
    project_to_terrain_power: number?,
    --- Height offset added after terrain projection
    additive_elevation: number?,
    --- Prop view distance as a multiple of the decoration range setting; 0 is never culled
    range_mul: number?,
    --- Lowest surface height in blocks accepting this prop
    surface_height_min: number?,
    --- Highest surface height in blocks accepting this prop
    surface_height_max: number?,
    --- Highest column top in blocks accepting this prop
    top_height_max: number?,
    --- Prop keeps its height instead of sitting on the surface
    floating: boolean?,
    --- Prop spans more than one cell and is placed sparsely
    is_big: boolean?,
    --- Prop is streamed with the sector instead of being baked
    streamed: boolean?,
    --- Mesh rendered for this prop
    mesh: StaticMesh?,
    --- Prop is walked through
    no_collision: boolean?,
    --- Prop emits light
    is_emitting: boolean?,
    --- Prop may cast high-detail shadows
    high_detail_shadow: boolean?,
    --- Called with the block position when the prop is spawned
    on_spawn: ((...any) -> ...any)?,
    --- Number of hits to break
    hits_to_break: number?,
    --- Effect actor class spawned when the prop breaks
    break_effect: Class?,
    --- Effect actor class spawned on a non-fatal hit
    damage_effect: Class?,
    --- Closing speed in cm/s at which a vehicle breaks through the prop; 0 makes the prop a solid obstacle
    vehicle_break_speed: number?,
    --- Actor class spawned instead of an instanced mesh
    actor_class: Class?,
    --- Item this object is built from and mined into
    item: StaticItem?,
    --- Item a build pays and mining returns; nil when the object is not minable
    mined_item: StaticItem?,
    --- How many of mined_item a build pays and mining returns; zero when the object is not minable
    mined_count: number?,
}

export type StaticPropList_spec = {
    --- Prop tiers owned by this list
    data: { PropListData }?,
}

export type StaticQuest_spec = {
    --- Localized quest title
    label: Loc?,
    --- Localized description paragraphs
    description_parts: { Loc }?,
    --- Inventory of items shown next to the description
    context: AutosizeInventory?,
    --- Chapter this quest belongs to
    chapter: StaticChapter?,
    --- Quests that must be completed first
    required_quests: { StaticQuest }?,
    --- Complete on any one objective instead of all of them
    any_objective: boolean?,
    --- Current state: locked, active or completed
    state: number?,
    --- Table of event handlers keyed by event id
    events: { [any]: any }??,
    --- Called when the quest becomes active
    on_unlock: ((...any) -> ...any)??,
    --- Called when the quest is completed
    on_complete: ((...any) -> ...any)??,
    --- Objectives of this quest
    objectives: { QuestObjective }?,
}

export type StaticResearch_spec = {
    --- Localized research name
    label: Loc?,
    --- Localized description paragraphs
    description_parts: { Loc }?,
    --- Science the research costs to complete
    complexity: number?,
    --- Level reached by an upgrade research, 0 for a node completed once
    level: number?,
    --- Progression tier the research belongs to
    tier: number?,
    --- Researches that must be complete before this one opens
    required_research: { StaticResearch }?,
}

export type StaticResearchBonusInventory_spec = {
    --- Localized research name
    label: Loc?,
    --- Localized description paragraphs
    description_parts: { Loc }?,
    --- Science the research costs to complete
    complexity: number?,
    --- Level reached by an upgrade research, 0 for a node completed once
    level: number?,
    --- Progression tier the research belongs to
    tier: number?,
    --- Researches that must be complete before this one opens
    required_research: { StaticResearch }?,
}

export type StaticResearchDecorationUnlock_spec = {
    --- Localized research name
    label: Loc?,
    --- Localized description paragraphs
    description_parts: { Loc }?,
    --- Science the research costs to complete
    complexity: number?,
    --- Level reached by an upgrade research, 0 for a node completed once
    level: number?,
    --- Progression tier the research belongs to
    tier: number?,
    --- Researches that must be complete before this one opens
    required_research: { StaticResearch }?,
}

export type StaticResearchEfficiency_spec = {
    --- Localized research name
    label: Loc?,
    --- Localized description paragraphs
    description_parts: { Loc }?,
    --- Science the research costs to complete
    complexity: number?,
    --- Level reached by an upgrade research, 0 for a node completed once
    level: number?,
    --- Progression tier the research belongs to
    tier: number?,
    --- Researches that must be complete before this one opens
    required_research: { StaticResearch }?,
}

export type StaticResearchModifier_spec = {
    --- Modifier prototype affected by this research
    modifier: StaticModifier?,
    --- Value added to the modifier on completion
    bonus_value: number?,
    --- Localized research name
    label: Loc?,
    --- Localized description paragraphs
    description_parts: { Loc }?,
    --- Science the research costs to complete
    complexity: number?,
    --- Level reached by an upgrade research, 0 for a node completed once
    level: number?,
    --- Progression tier the research belongs to
    tier: number?,
    --- Researches that must be complete before this one opens
    required_research: { StaticResearch }?,
}

export type StaticResearchRecipe_spec = {
    --- Localized research name
    label: Loc?,
    --- Localized description paragraphs
    description_parts: { Loc }?,
    --- Science the research costs to complete
    complexity: number?,
    --- Level reached by an upgrade research, 0 for a node completed once
    level: number?,
    --- Progression tier the research belongs to
    tier: number?,
    --- Researches that must be complete before this one opens
    required_research: { StaticResearch }?,
}

export type StaticResearchToolUnlock_spec = {
    --- Localized research name
    label: Loc?,
    --- Localized description paragraphs
    description_parts: { Loc }?,
    --- Science the research costs to complete
    complexity: number?,
    --- Level reached by an upgrade research, 0 for a node completed once
    level: number?,
    --- Progression tier the research belongs to
    tier: number?,
    --- Researches that must be complete before this one opens
    required_research: { StaticResearch }?,
}

export type StaticStructure_spec = {
    --- Callback invoked to emit the structure
    generate: ((...any) -> ...any)?,
    --- Footprint of the structure in blocks
    size: Vec2i?,
}

export type StaticTip_spec = {
    --- Localized title
    label: Loc?,
    --- Localized body paragraphs
    description_parts: { Loc }?,
    --- Illustration path relative to the owning mod folder
    image: string?,
    --- Inventory of items shown next to the text
    context: AutosizeInventory?,
    --- Tip this entry is nested under in the list
    parent: StaticTip?,
}

export type StaticWeather_spec = {
    --- Cloud coverage the sky is set to, 0..10
    cloud_coverage: number?,
    --- Thunder and lightning the sky is set to, 0..10
    thunder: number?,
    --- Fog amount the sky is set to, 0..10
    fog: number?,
}

export type Tesselator_spec = {
}

export type TesselatorCube_spec = {
}

export type TesselatorMarching_spec = {
}

export type WorldGenerator_spec = {
    --- Ore deposits this world places; its nearest tier is seeded around the spawn
    ore_list: StaticPropList?,
    --- Item a drill takes anywhere away from a deposit
    stone_source: StaticItem?,
    --- Fluid a pump takes anywhere away from a deposit
    water_source: StaticItem?,
}

export type ui_Border_props = {
    --- The child, also given as the first list item
    content: ui_Widget??,
    --- Plate the game draws behind the child: "panel", "window", "frame", "field", "plate" or "none"
    style: string?,
    --- Tint of the plate, same forms as ui.Text color; on "plate" it is the fill itself, a faint light one when empty
    color: string?,
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean?,
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number?,
    --- Fixed width in slate units; zero lets the content decide
    width: number?,
    --- Fixed height in slate units; zero lets the content decide
    height: number?,
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: (number | { number })?,
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string?,
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string?,
    [number]: ui_Widget,
}

export type ui_Button_props = {
    --- The child, also given as the first list item
    content: ui_Widget??,
    --- Called with no arguments when the player clicks the button
    on_click: ((...any) -> ...any)??,
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean?,
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number?,
    --- Fixed width in slate units; zero lets the content decide
    width: number?,
    --- Fixed height in slate units; zero lets the content decide
    height: number?,
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: (number | { number })?,
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string?,
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string?,
    [number]: ui_Widget,
}

export type ui_Grid_props = {
    --- Cells per row, at least one
    columns: number?,
    --- Space kept between cells in slate units
    gap: number?,
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean?,
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number?,
    --- Fixed width in slate units; zero lets the content decide
    width: number?,
    --- Fixed height in slate units; zero lets the content decide
    height: number?,
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: (number | { number })?,
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string?,
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string?,
    [number]: ui_Widget,
}

export type ui_HBox_props = {
    --- Space kept between children in slate units
    gap: number?,
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean?,
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number?,
    --- Fixed width in slate units; zero lets the content decide
    width: number?,
    --- Fixed height in slate units; zero lets the content decide
    height: number?,
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: (number | { number })?,
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string?,
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string?,
    [number]: ui_Widget,
}

export type ui_Image_props = {
    --- Texture drawn, an item image, a ui.texture or a ui.thumbnail; nil draws nothing and keeps the space
    image: Texture?,
    --- Width and height at once, for a square picture; reads the width
    size: number?,
    --- Clockwise turn of the picture about its centre in degrees; the space it takes stays in place
    angle: number?,
    --- Tint multiplied into the texture, same forms as ui.Text color
    color: string?,
    --- Part of the texture drawn, { u0, v0, u1, v1 } from 0 to 1 across and down; the part fills the picture's width and height. Reads { 0, 0, 1, 1 } for the whole texture
    uv: { number }?,
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean?,
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number?,
    --- Fixed width in slate units; zero lets the content decide
    width: number?,
    --- Fixed height in slate units; zero lets the content decide
    height: number?,
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: (number | { number })?,
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string?,
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string?,
    [number]: ui_Widget,
}

export type ui_Inventory_props = {
    --- Inventory shown; nil or an empty one hides the grid
    inventory: InventoryAccess?,
    --- True draws the item counts in the slots
    numbers: boolean?,
    --- Slots per row, at least one
    columns: number?,
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean?,
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number?,
    --- Fixed width in slate units; zero lets the content decide
    width: number?,
    --- Fixed height in slate units; zero lets the content decide
    height: number?,
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: (number | { number })?,
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string?,
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string?,
    [number]: ui_Widget,
}

export type ui_Scroll_props = {
    --- Space kept between children in slate units
    gap: number?,
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean?,
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number?,
    --- Fixed width in slate units; zero lets the content decide
    width: number?,
    --- Fixed height in slate units; zero lets the content decide
    height: number?,
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: (number | { number })?,
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string?,
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string?,
    [number]: ui_Widget,
}

export type ui_Spacer_props = {
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean?,
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number?,
    --- Fixed width in slate units; zero lets the content decide
    width: number?,
    --- Fixed height in slate units; zero lets the content decide
    height: number?,
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: (number | { number })?,
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string?,
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string?,
    [number]: ui_Widget,
}

export type ui_Text_props = {
    --- Source UTF-8 text, tokens and tags unexpanded
    text: string?,
    --- Font size in slate units
    font_size: number?,
    --- Where the lines sit: "left", "center" or "right"
    align: string?,
    --- Color of the text outside tinted runs: "#rrggbb", "#rrggbbaa" or a game color, "primary", "dim", "accent", "accent_light", "warning", "white"
    color: string?,
    --- True, the default, breaks long lines at the width the text is given; false keeps one line
    wrap: boolean?,
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean?,
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number?,
    --- Fixed width in slate units; zero lets the content decide
    width: number?,
    --- Fixed height in slate units; zero lets the content decide
    height: number?,
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: (number | { number })?,
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string?,
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string?,
    [number]: ui_Widget,
}

export type ui_TextBox_props = {
    --- Current UTF-8 text
    text: string?,
    --- Greyed text shown while the field is empty
    hint: string?,
    --- Called with the text after every edit the player makes
    on_changed: ((...any) -> ...any)??,
    --- Called with the text when the player presses Enter
    on_commit: ((...any) -> ...any)??,
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean?,
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number?,
    --- Fixed width in slate units; zero lets the content decide
    width: number?,
    --- Fixed height in slate units; zero lets the content decide
    height: number?,
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: (number | { number })?,
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string?,
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string?,
    [number]: ui_Widget,
}

export type ui_VBox_props = {
    --- Space kept between children in slate units
    gap: number?,
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean?,
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number?,
    --- Fixed width in slate units; zero lets the content decide
    width: number?,
    --- Fixed height in slate units; zero lets the content decide
    height: number?,
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: (number | { number })?,
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string?,
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string?,
    [number]: ui_Widget,
}

export type ui_Window_props = {
    --- The child, also given as the first list item
    content: ui_Widget??,
    --- Text shown in the title bar
    title: string?,
    --- Screen edge the window keeps to across: "left", "center" or "right"
    anchor_x: string?,
    --- Screen edge the window keeps to down: "top", "center" or "bottom"
    anchor_y: string?,
    --- Distance from the anchor across in slate units; dragging the window changes it
    offset_x: number?,
    --- Distance from the anchor down in slate units; dragging the window changes it
    offset_y: number?,
    --- True gives the window the cursor and the keyboard while the game keeps running
    input: boolean?,
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean?,
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number?,
    --- Fixed width in slate units; zero lets the content decide
    width: number?,
    --- Fixed height in slate units; zero lets the content decide
    height: number?,
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: (number | { number })?,
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string?,
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string?,
    [number]: ui_Widget,
}

--- Engine object
declare extern type Object with
    --- Object name
    name: string
    --- Class of this object
    function get_class(self): Class
end

--- Instancable object
declare extern type Instance extends Object with
    --- Returns false once the underlying engine object has been destroyed
    function is_valid(self): boolean
end

--- Runtime state of a placed block
declare extern type BlockLogic extends Instance with
    --- Whether this block shows up on the map
    map_register: boolean
    --- Prototype this block was spawned from
    static_block: StaticBlock
    --- Cell this block stands in
    pos: Vec3i
    --- Rotation turning the block's local sides into world sides
    quat: FQuat
    --- State shown under the crosshair, one of defines.block_state
    state: number
    --- Settings of the block as its window and the save hold them, a fresh copy on every read
    settings: { [any]: any }
    --- Inventories the block saves, by name, each as its own class
    inventories: { [string]: InventoryReader }
    --- Register Accessor
    function reg(self, accessor: Accessor): ()
    --- Find a registered accessor by name
    function find_accessor(self, name: string): Accessor
    --- Every accessor registered on this block
    function accessors(self): { Accessor }
    --- Fields of one of the block's components, a fresh copy on every read
    function component(self, name: string): { [any]: any }
    --- Change fields of one of the block's components: the fields given change, the rest keep their values; an item field takes the item, its name or nil
    function set_component(self, name: string, fields: { [any]: any }): ()
    --- One field of one of the block's components
    function get_field(self, name: string, field: string): ()
    --- Change one field of one of the block's components
    function set_field(self, name: string, field: string, value: any): ()
    --- Change settings the way the block's window does: only the fields given change, a prototype stands for its name. The edit goes out to the other peers and lands at the host's stamped tick, so read settings back a tick later
    function edit_settings(self, fields: { [any]: any }): ()
end

--- Base class for recipe processing machines
declare extern type AbstractCrafter extends BlockLogic with
    recipes: RecipeDictionary
    load_independent: boolean
    stable_supply: boolean
    input_gathered: boolean
    bonus_delivered: boolean
    switch_on: boolean
    ticks_passed: number
    real_ticks_passed: number
    total_production: number
    speed: number
    --- percent (e.g. 15 = +15%)
    productivity: number
    energy_input_inventory: ResourceInventory
    energy_output_inventory: ResourceInventory
    crafter_input_container: InventoryContainer
    crafter_output_container: InventoryContainer
    --- Select the recipe producing an item, the way a player picks it in the machine window
    function select_recipe_by_output(self, item: StaticItem): boolean
end

--- Block side attachment point
declare extern type Accessor extends Instance with
    --- Side direction of the owning block
    side: Vec3i
    --- Block local position
    pos: Vec3i
    --- Block this accessor belongs to
    owner: BlockLogic
    --- Cover prototype placed on this side
    cover: StaticCover
    --- Accessor of the neighbor block this side touches, nil when nothing is attached to it
    function neighbor(self): Accessor
end

--- World actor
declare extern type Actor extends Object with
    --- Create, register and attach a component of the given class
    function add_actor_component(self, component_class: Class, component_name: string): ActorComponent
    --- Assign an object into a UObject property of the actor by name
    function set_field_object(self, field_name: string, object: Object): boolean
end

--- Engine actor component
declare extern type ActorComponent with
    --- Object name
    name: string
end

--- Creative generator producing unlimited power
declare extern type AdminElectricGeneratorBlockLogic extends BlockLogic with
end

--- Engine skeletal animation sequence
declare extern type AnimSequence extends Object with
    --- Object name
    name: string
end

--- World actor representing a placed block
declare extern type BlockActor extends Actor with
    --- Block logic this actor represents
    logic: BlockLogic
    --- Material applied to the block hull
    hull_material: Material
end

--- Block actor driven by the animation manager
declare extern type AnimatedBlockActor extends BlockActor with
end

--- Crafter with a player selected recipe
declare extern type SelectCrafter extends AbstractCrafter with
end

--- Crafter that picks its recipe from the input inventory
declare extern type AutoCrafter extends SelectCrafter with
end

--- Read only inventory interface
declare extern type InventoryReader extends Instance with
    --- Number of slots in this InventoryReader
    size: number
    --- Get ItemData with index from InventoryReader
    function get(self, index: number): ItemData
    --- Looking for index of StaticItem in InventoryReader
    function find(self, item: StaticItem): number
end

--- Inventory interface with add and remove operations
declare extern type InventoryAccess extends InventoryReader with
    --- Keeps a slot whose count drops to zero
    zero_slots: boolean
    --- Whether inventory can be dragged in UI (default: true)
    draggable: boolean
    --- Whether what it holds goes to the player when the block is broken or replaced (default: true); false for a slot that only shows something
    drop_on_break: boolean
    --- Add item with count to InventoryAccess
    function add(self, item: StaticItem, count: number): number
    --- Remove item with count from InventoryAccess
    function sub(self, item: StaticItem, count: number): number
    --- Add item with count into one slot
    function add_at(self, index: number, item: StaticItem, count: number): number
    --- Remove item with count from one slot
    function sub_at(self, index: number, item: StaticItem, count: number): number
end

--- Inventory storage base with slots, filter and capacity
declare extern type BaseInventory extends InventoryAccess with
end

--- Multi slot inventory
declare extern type Inventory extends BaseInventory with
    --- Drop every empty slot from this inventory
    function remove_empty_slots(self): ()
    --- Set the number of slots; slots past the new number are dropped with what they hold
    function resize(self, size: number): ()
end

--- Inventory that grows and shrinks with its contents
declare extern type AutosizeInventory extends Inventory with
end

--- Accessor that moves items in and out of a block
declare extern type BaseInventoryAccessor extends Accessor with
    --- Push items into the neighbour on every tick
    auto_output: boolean
    --- Inventory items arriving through this side are put into
    input: InventoryAccess
    --- Inventory items leaving through this side are taken from
    output: InventoryAccess
end

--- Bed used as a respawn point
declare extern type BedBlockLogic extends BlockLogic with
end

--- Database record
declare extern type Prototype extends Object with
    --- Object name
    name: string
    --- Returns false once the underlying engine object has been destroyed
    function is_valid(self): boolean
end

--- Terrain biome definition
declare extern type Biome extends Prototype with
end

--- Biome that picks one of its sub-biomes per position
declare extern type BiomeFamily extends Biome with
    --- Sub-biomes this family selects from
    sub_biomes: { Biome }
    --- Frequency of the sub-biome selection noise
    sub_frequency: number
    --- Amplitude of the coarse domain warp
    perturb_amp: number
    --- Frequency of the coarse domain warp
    perturb_frequency: number
    --- Octave count of the coarse domain warp
    perturb_octaves: number
    --- Amplitude of the fine domain warp
    perturb_fine_amp: number
    --- Frequency of the fine domain warp
    perturb_fine_frequency: number
end

--- Terrain generator bound to a dimension
declare extern type WorldGenerator extends Prototype with
    --- Ore deposits this world places; its nearest tier is seeded around the spawn
    ore_list: StaticPropList
    --- Item a drill takes anywhere away from a deposit
    stone_source: StaticItem
    --- Fluid a pump takes anywhere away from a deposit
    water_source: StaticItem
end

--- World generator driven by a global biome family
declare extern type BiomeWorldGenerator extends WorldGenerator with
    --- Global biome family laying out the surface
    global_biome: GlobalBiomeFamily
    --- Block filling the ground below the layered surface
    underworld_block: StaticBlock
end

--- Base class for blocks that expose a storage inventory
declare extern type StorageBlockLogic extends BlockLogic with
    storage_access: InventoryAccess
end

--- Chest storage block
declare extern type ChestBlockLogic extends StorageBlockLogic with
    --- Chest slot count
    capacity: number
end

--- Engine class object
declare extern type Class extends Object with
    --- Object name
    name: string
    --- Whether this class derives from another one
    function is_child_of(self, other: Class): boolean
end

--- 8 bit per channel RGBA color
declare extern type Color with
    --- Red channel 0-255
    r: number
    --- Green channel 0-255
    g: number
    --- Blue channel 0-255
    b: number
    --- Alpha channel 0-255
    a: number
end

--- Typed data every block of a type keeps from its placement, listed by StaticBlock.components; saved by field name and part of the sim state
declare extern type Component extends Prototype with
    --- Field name to its type: "integer", "boolean", "item" or "string". Fields go in name order; --!sim sees integer, boolean and item fields as columns, an item as its sim_id Load-only: pre_init, init or post_init.
    fields: { [string]: string }
    --- Version of the fields, 1 by default; a save written by a lower version goes through migrate Load-only: pre_init, init or post_init.
    version: number
    --- migrate(fields, version) gets the fields a save holds, by name with items as their names, and the version that wrote them; it returns the fields for the current version Load-only: pre_init, init or post_init.
    migrate: ((...any) -> ...any)?
end

--- Block that speeds up nearby machines
declare extern type ComputerBlockLogic extends BlockLogic with
    --- Internal energy buffer
    energy_inventory: ResourceInventory
    --- Electric input accessor
    energy_input: ResourceAccessor
end

--- Wire block carrying a resource network
declare extern type ConductorBlockLogic extends BlockLogic with
    --- Cover mesh used for wire ends
    side_cover: StaticCover
    --- Cover mesh used for the block center
    center_cover: StaticCover
    --- Cover mesh for a run straight through the block, built along X with a flange on one end
    straight_cover: StaticCover
    --- Cover mesh for a run straight through the block with no flange, built along X
    straight_plain_cover: StaticCover
    --- Cover mesh for a right angle turn, built along +X and -Y
    elbow_cover: StaticCover
    --- Cover mesh for a single connection, built along +X
    dead_end_cover: StaticCover
    --- Cover mesh for a block with no connections
    isolated_cover: StaticCover
    --- Network channel name
    channel: string
    --- Numeric network channel
    conductor_channel: number
    --- Storage added to the network
    capacity: number
    --- Loss per tick
    drain: number
    --- Add side wire
    function add_wire(self, acc: ResourceAccessor): ()
end

--- Engine console
declare extern type Console extends Instance with
end

--- Belt carrying one item per half cell
declare extern type ConveyorBlockLogic extends BlockLogic with
    --- Exact time to carry one item across half a cell, in ticks
    ticks_per_item: number
end

--- Prototype database filled by mods
declare extern type DB extends Instance with
    --- Register Prototype in DB Load-only: pre_init, init or post_init.
    function reg(self, proto: Prototype): ()
    --- Remove Prototype from DB Load-only: pre_init, init or post_init.
    function remove(self, proto: Prototype): boolean
    --- Register object with class "class" and name "name" from table, filling all other properties from that table too Legacy, use <Class>.reg(name, { ... }) Load-only: pre_init, init or post_init.
    function from_table(self, table: { [any]: any }): ()
    --- Register mod table Load-only: pre_init, init or post_init.
    function mod(self, table: { [any]: any }): ()
    --- Return all registered objects
    function objects(self): { Object }
end

--- Storage block holding one item type
declare extern type ItemRackBlockLogic extends StorageBlockLogic with
    --- Item count the storage holds
    capacity: number
end

--- Powered storage block holding one item type
declare extern type DeepStorageBlockLogic extends ItemRackBlockLogic with
    --- Electricity buffer the block draws from
    energy: ResourceInventory
end

--- Block whose center cover can be redesigned in game
declare extern type DesignableCoverBlockLogic extends BlockLogic with
    --- Cover variants offered by the design tool
    cover_set: StaticCoverSet
end

--- Fence block connecting to its neighbors
declare extern type DesignableFenceBlockLogic extends BlockLogic with
    --- Cover spawned towards a connected neighbor
    half_cover: StaticCover
    --- Cover spawned at the block center
    center_cover: StaticCover
    --- Cover variants offered by the design tool
    cover_set: StaticCoverSet
end

--- Playable surface holding the block world
declare extern type Dimension extends Actor with
    --- Build a block the way a tool in hand builds one: the edit goes on the undo stack and out to the other peers. The cell has to be streamed in, so move the player there first. The block itself lands at the host's stamped tick, so read it back with get_block a tick later
    function place(self, bpos: Vec3i, block: StaticBlock, rotation: FQuat?): boolean
    --- Break the block standing at the position the way a tool in hand breaks it: the edit goes on the undo stack and out to the other peers. The cell has to be streamed in, so move the player there first
    function dig(self, bpos: Vec3i): boolean
    --- Block standing in the cell at the given position, nil when the cell is empty or its column is not loaded
    function get_cell(self, bpos: Vec3i): StaticBlock
    --- Runtime block standing in the cell at the given position, nil when the cell is empty or its column is not loaded
    function get_block(self, bpos: Vec3i): BlockLogic
    --- Sample the terrain surface the generator builds at XY, in world cell coordinates. Surface rock detail can still raise the built ground a few cells above this
    function sample_height(self, x: number, y: number): number
    --- Move the player to a block position, which moves the column streaming anchor with it
    function teleport(self, bpos: Vec3i): ()
    --- How much of an item machines have produced on this surface over the whole save, zero for an item no machine has made yet
    function get_produced(self, item: StaticItem): number
    --- How much of an item machines have used up on this surface over the whole save, zero for an item no machine has used yet
    function get_consumed(self, item: StaticItem): number
    --- Block position the player spawns at
    function spawn_point(self): Vec3i
    --- Tracks, signals, stations and trains of this surface
    function get_railway(self): Railway
end

--- Door the player can open and close
declare extern type DoorBlockLogic extends BlockLogic with
end

--- Base class of resource extracting machines
declare extern type DrillingMachineBase extends BlockLogic with
    --- Exact time to extract one item, in ticks
    ticks_per_item: number
    --- Energy left of the current cycle
    remaining_energy: number
    --- Bonus output percent, 15 means +15%
    productivity: number
    --- Completed cycles, bonus cycles included
    total_production: number
    --- Output inventory
    inventory: InventoryContainer
    --- Energy inventory
    energy: ResourceInventory
    --- Items produced per cycle
    production: number
    --- Output inventory capacity
    storage_size: number
    --- Last measured speed percent
    last_speed: number
    --- Ticks of the recipe in progress
    current_recipe_time: number
    --- Whether the output inventory can take one more item
    function has_storage_space(self): boolean
    --- Whether the current cycle still has energy
    function is_energy_available(self): boolean
    --- Deposit being mined, nil for machines without one
    function get_source(self): SourceData
end

--- Drilling machine that extracts ore from the ground
declare extern type DrillingRig extends DrillingMachineBase with
    --- Ore deposit under the machine
    source: SourceData
end

--- Storage node whose covers merge into a vertical column
declare extern type StackedContainerBlockLogic extends ConductorBlockLogic with
    --- Body used when the block stands alone
    single_cover: StaticCover
    --- Body used when another storage stands above
    bottom_cover: StaticCover
    --- Body used when another storage stands above and below
    middle_cover: StaticCover
    --- Body used when another storage stands below
    top_cover: StaticCover
    --- Connector placed on every face the column does not swallow
    connector_cover: StaticCover
end

--- Electricity storage node of a conductor network
declare extern type ElectricityContainerBlockLogic extends StackedContainerBlockLogic with
end

--- Player facing engine and video settings
declare extern type Engine extends Object with
    props_mul: number
    dpi: number
    mouse_sensitivity_x: number
    mouse_sensitivity_y: number
    mouse_inversion_x: boolean
    mouse_inversion_y: boolean
    props_quality: number
    reflection_preset: number
    transparency_preset: number
    gi_preset: number
    limit_texture_pool_to_vram: boolean
    texture_pool_size_mb: number
    texture_max_temp_memory_mb: number
    texture_mip_bias: number
    render_target_pool_min_mb: number
    detail_shadows: boolean
    spotlight_shadows: boolean
    fps: number
    res_x: number
    res_y: number
    loading_range: number
    performance: boolean
    performance_graph: boolean
    compass: boolean
    compass_show_nearest_ore: boolean
    compass_show_spawn_point: boolean
    quest_tracker: boolean
    tool_hints: boolean
    ctrl_hotbar: boolean
    alt_hotbar: boolean
    shift_hotbar: boolean
    fov: number
    fog: number
    window_mode: number
    autosave_period: number
    undo_confirm_minutes: number
    memory_stats: boolean
    weather_particles: number
    wind_animation: number
    cloud_preset: number
    sector_lod_count: number
    mute_on_focus_loss: boolean
    --- Apply the current settings to the engine
    function apply(self): ()
    --- Show the keep or revert confirmation dialog
    function show_confirmation(self): ()
end

--- Crafter bound to the only recipe of its dictionary from the moment it is spawned; the recipe cannot be picked, found or reset
declare extern type SingleRecipeCrafter extends SelectCrafter with
end

--- Crafter powered by solar or wind environment
declare extern type EnvironmentCrafter extends SingleRecipeCrafter with
    environment_factor01: number
    wind_powered: boolean
    --- Wind speed at which the rotor starts turning; below it output is zero
    cut_in_wind_speed: number
    --- Wind speed at which output reaches the block rated production
    rated_wind_speed: number
    --- Solar output follows the sun altitude; false keeps the sun at its zenith day and night, and only clouds cut the output
    follows_sun: boolean
    --- Cells another block of the same source must keep away from this one; closer placement is refused, 0 lets them stand side by side
    exclusion_radius: number
end

--- Base class for inventory slot filters
declare extern type InventoryFilter extends Instance with
end

--- Filter that accepts items declaring the matching equipment slot
declare extern type EquipmentSlotFilter extends InventoryFilter with
end

--- Gameplay event bus
declare extern type EventSystem with
    --- Subscribe a handler to an event, returns the handler id
    function sub(self, event: number, func: (...any) -> ...any): number
    --- Remove a previously subscribed handler
    function unsub(self, event: number, handler_id: number): ()
    --- Emit an event to every subscribed handler
    function emmit(self, event: number, context: { [any]: any }): ()
end

--- Item yielded by a resource deposit and its extraction speed
declare extern type ExtractionData with
    --- Extracted item
    item: StaticItem
    --- Extraction speed
    speed: number
end

--- Rotation quaternion
declare extern type FQuat with
    x: number
    y: number
    z: number
    w: number
    --- Rotated unit X axis
    function get_forward_vector(self): Vec3
    --- Rotated unit Y axis
    function get_right_vector(self): Vec3
    --- Rotated unit Z axis
    function get_up_vector(self): Vec3
end

--- Fence that connects to its neighbours
declare extern type FenceBlockLogic extends BlockLogic with
end

--- Fluid storage node of a conductor network
declare extern type FluidContainerBlockLogic extends StackedContainerBlockLogic with
end

--- Global game instance
declare extern type Game extends Object with
    --- Active localization culture code
    localization: string
    --- Build identification string
    build_string: string
    --- Simulation ticks per second
    tick_rate: number
end

--- Settings and counters of the current save
declare extern type GameSessionData extends Instance with
    --- Deposits never deplete
    infinite_ore: boolean
    --- Every research starts unlocked
    all_research_completed: boolean
    --- Creative mode is active
    creative_mode: boolean
    --- Creative mode may be switched on
    creative_allowed: boolean
    --- Played time in seconds
    total_game_time: number
    --- Simulated ticks since world creation
    total_game_ticks: number
    --- World generation seed
    seed: string
    --- Game version the save was written with
    version: string
    --- World generator identifier
    generator: string
    --- Save folder name
    save_name: string
    --- Save is synchronized with the cloud
    cloud: boolean
    --- Locked local day-phase ticks in planet space when frozen
    world_time: number
    --- Day phase advances on its own
    world_time_freeze: boolean
    --- Simulation ticks per second
    tick_rate: number
end

--- Column being generated, handed to StaticStructure.generate
declare extern type GenContext with
    --- Column position in sectors
    pos: Vec2i
    --- Write a block straight into a cell of the column being generated
    function set_cell(self, bpos: Vec3i, block: StaticBlock): ()
    --- Spawn a block with its logic into the column being generated
    function spawn_block(self, bpos: Vec3i, block: StaticBlock, rotation: FQuat?): BlockLogic
    --- Clear all props at the given position
    function clear_props(self, bpos: Vec3i): ()
end

--- Placeholder waiting to be materialized into a real block
declare extern type GhostBlockLogic extends BlockLogic with
    --- Block this ghost stands for
    target: StaticBlock
end

--- Base prototype for anything placeable in the world
declare extern type StaticObject extends Prototype with
    --- Item this object is built from and mined into
    item: StaticItem
    --- Item a build pays and mining returns; nil when the object is not minable
    mined_item: StaticItem
    --- How many of mined_item a build pays and mining returns; zero when the object is not minable
    mined_count: number
end

--- Placeable block prototype
declare extern type StaticBlock extends StaticObject with
    --- BlockLogic class driving the simulation
    logic: Class
    --- Presentation actor class spawned for the block
    actor: Class
    --- Selector widget class
    selector: Class
    --- Mesh tesselator used to render the block
    tesselator: Tesselator
    --- Occupied cells relative to the block origin
    sub_blocks: { Vec3i }
    --- Block local axes that keep their world direction; a turn moving a locked axis is refused
    rotation_locks: Vec3i
    --- Blocks sharing a tag replace each other on build
    replace_tag: string
    --- Block tier used for recipe speed scaling
    tier: number
    --- Block level within its tier
    level: number
    --- Energy drawn per simulation tick
    energy_consumption_per_tick: number
    --- Energy produced per simulation tick
    energy_production_per_tick: number
    --- Resource item drawn by this block
    energy_consumption_item: StaticItem
    --- Resource item produced by this block
    energy_production_item: StaticItem
    --- Lines on the power the block draws and produces, as its item tooltip shows them; empty for a block without energy
    energy_tooltip: string
    --- Effect actor class spawned when the block is destroyed
    break_effect: Class
    --- Lua prototype table holding logic_init, actor_init and tooltip Legacy, use StaticBlock.logic_init, actor_init and tooltip
    lua: { [any]: any }?
    --- Called with the block logic of every new block of this type; makes its inventories and accessors Load-only: pre_init, init or post_init.
    logic_init: ((...any) -> ...any)?
    --- Called with the block actor when it spawns Load-only: pre_init, init or post_init.
    actor_init: ((...any) -> ...any)?
    --- Tooltip of the block: a string, or a function of the block logic returning one Load-only: pre_init, init or post_init.
    tooltip: ((...any) -> ...any) | string | nil
    --- Components every block of this type keeps: component name to the values a new block starts with; a field left out starts at 0, false, nil or "". Saved with the block and part of the sim state; batch_tick gets them as arrays, BlockLogic.component and get_field read them Load-only: pre_init, init or post_init.
    components: { [string]: { [any]: any } }
    --- Called once every sim tick with all placed blocks of this type, in position order: batch_tick(blocks, components, inventories), or batch_tick(n, components, slots, inventories) from a --!sim chunk. components.<Component>.<field> is the array of that field of every block, read back after the call; --!sim gets integer, boolean and item fields as int64 columns, an item as its sim_id, and no string fields. slots.<inventory> holds item and count columns indexed (i-1)*slots+s, taken before the call. inventories maps an inventory name to the array of that inventory of every block. The tables are kept between ticks and change only when a block of the type comes or goes Load-only: pre_init, init or post_init.
    batch_tick: ((...any) -> ...any)?
    --- Builds the window of a block of this type: window(logic) returns the content widget, and may return a function the window calls every frame while it is open Load-only: pre_init, init or post_init.
    window: ((...any) -> ...any)?
    --- Cover mesh for the half-height variant
    half_cover: StaticCover
    --- Cover mesh for the center part
    center_cover: StaticCover
    --- Cover mesh for the block body
    body_cover: StaticCover
    --- Logic export signals published by this block type
    export_options: { LogicExportOption }
    --- Logic import signals accepted by this block type
    import_options: { LogicImportOption }
    --- Register a copy of this block under a new name; its item stays the item of the original until block.item is set Load-only: pre_init, init or post_init.
    function copy(self, name: string, spec: StaticBlock_spec?): StaticBlock
end

--- Static block placed as a build ghost
declare extern type GhostStaticBlock extends StaticBlock with
end

--- Planet wide biome family that also drives the global height map
declare extern type GlobalBiomeFamily extends BiomeFamily with
end

--- Engine graphics quality settings
declare extern type GraphicsSettings extends Instance with
end

--- Heat storage node of a conductor network
declare extern type HeatContainerBlockLogic extends ConductorBlockLogic with
end

--- Terrain height built from a stack of noises
declare extern type HeightGenerator extends Prototype with
    --- Add a noise generator to the height generator
    function add_noise(self, noise: NoiseGenerator): ()
end

--- Filter that rejects listed items
declare extern type InventoryBlackFilter extends InventoryFilter with
end

--- Composite inventory joining several inventories into one
declare extern type InventoryContainer extends InventoryAccess with
    --- Get a bound inventory by its index
    function get_access(self, index: number): InventoryAccess
    --- Append an inventory to this container
    function bind(self, inventory: InventoryAccess): ()
end

--- Filter driven by the contents of another inventory
declare extern type InventoryInventoryFilter extends InventoryFilter with
    --- (nil by default)
    inventory: InventoryAccess
    --- is filtering enabled (true by default)
    is_filtering: boolean
    --- is white filtering enabled (true by default)
    is_white: boolean
end

--- Filter that accepts only listed items
declare extern type InventoryWhiteFilter extends InventoryFilter with
end

--- Item prototype paired with a count
declare extern type ItemData with
    --- Item count
    count: number
    --- Item prototype
    item: StaticItem
end

--- Item prototype
declare extern type StaticItem extends Prototype with
    --- Item image in UI
    image: Texture2D
    --- Icon path relative to the owning mod folder
    image_path: string
    --- Size of item stack
    stack_size: number
    --- Number of the item in this session only, from 1 by name after init; another set of mods shifts it. What --!sim code compares; never save it
    sim_id: number
    --- Item unlock tier
    tier: number
    --- What the item is: "solid", "fluid" or "abstract" Load-only: pre_init, init or post_init.
    type: string
    --- multiplier for UI
    unit_mul: number
    --- Mesh for item rendering in world
    mesh: StaticMesh
    --- Buildable object pointer for this item
    block: StaticBlock
    --- Is item instance contains CustomData
    custom_data: boolean
    --- Class for item while in hand
    logic: Class
    --- Lua prototype table Legacy, use fields of the item itself
    lua: { [any]: any }?
    --- Space separated search tags
    tags: string
    --- In-game database category
    category: string
    --- Equipment slot this item fits (Jetpack, Light)
    equipment_slot: string
    --- Localized item name
    label: Loc
    --- Localized description paragraphs
    description_parts: { Loc }
    --- Register a copy of this item under a new name; its block stays the block of the original until item.block is set Load-only: pre_init, init or post_init.
    function copy(self, name: string, spec: StaticItem_spec?): StaticItem
end

--- Recipe ingredient that any one of its member items satisfies, one for one
declare extern type ItemGroup extends StaticItem with
    --- Items that satisfy the group, in the order a craft takes them
    members: { StaticItem }
    --- **True** when item is a member of the group
    function matches(self, item: StaticItem): boolean
end

--- Localization key table object
declare extern type Kto with
    --- Resolve Kto to localized string
    function get(self): string
end

--- Landing pad deliveries arrive on
declare extern type LandingPadBlockLogic extends BlockLogic with
end

--- Screen lit by logic signals
declare extern type LedBlockLogic extends BlockLogic with
end

--- Loader or robot arm taking items on its left side
declare extern type LoaderBaseBlockLogic extends BlockLogic with
    --- Side items leave through: Vec3i.right straight across, Vec3i.front or Vec3i.back for a turn
    output_side: Vec3i
end

--- Localization data entry
declare extern type Loc with
    --- Resolve Loc object to localized string
    function get(self): string
    --- Localized string with its tokens such as {item:Name} left in, for ui.Text to turn into links
    function raw(self): string
end

--- Non localized data entry
declare extern type LocData with
end

--- Condition paired with the signals it emits
declare extern type LogicDecider extends Instance with
end

--- One exportable signal option shown in the logic GUI
declare extern type LogicExportOption extends Prototype with
    --- Signal item this option exports
    signal: StaticItem
    --- Whether the GUI row shows a signal slot
    use_signal: boolean
    --- Initial checkbox state in the GUI
    enabled: boolean
    --- Localized row name
    label: Loc
    --- Localized row tooltip
    tooltip: Loc
end

--- One importable signal option shown in the logic GUI
declare extern type LogicImportOption extends Prototype with
    --- Signal item this option imports
    signal: StaticItem
    --- Whether the GUI row shows a signal slot
    use_signal: boolean
    --- Initial checkbox state in the GUI
    enabled: boolean
    --- Localized row name
    label: Loc
    --- Localized row tooltip
    tooltip: Loc
end

--- Per-block choice of exported and imported logic signals
declare extern type LogicSettings extends Instance with
end

--- World generator assembled from Lua defined biomes and heights
declare extern type LuaWorldGenerator extends WorldGenerator with
    --- Biome family selecting the surface biome
    biome_family: BiomeFamily
    --- Height generator for the terrain surface
    height: HeightGenerator
end

--- Structure placed on the world map at an offset
declare extern type MapStructure with
    --- Offset from the map origin in blocks
    offset: Vec2i
    --- Structure prototype to place
    structure: StaticStructure
end

--- Engine material
declare extern type Material extends Object with
    --- Object name
    name: string
end

--- Background music playback control
declare extern type Music extends Object with
    --- Key of the active playlist
    playlist: string
    --- Number of tracks in the active playlist
    track_count: number
    --- Fade out both channels and stop automatic track advance
    function request_silence(self): ()
    --- Select a named playlist (e.g. default, cosmos). Returns whether the key exists
    function set_playlist(self, key: string): boolean
    --- Play a track by zero-based index in the current playlist
    function play_track(self, index: number): ()
    --- Play a track with explicit crossfade duration in seconds (0 = immediate)
    function play_track_crossfade(self, index: number, crossfade_seconds: number): ()
    --- Start a random track from the current playlist
    function play_random(self): ()
    --- Start a random track with explicit crossfade duration in seconds
    function play_random_crossfade(self, crossfade_seconds: number): ()
end

--- Configurable FastNoise generator
declare extern type NoiseGenerator extends Prototype with
    --- Lower bound of the remapped noise range
    min: number
    --- Upper bound of the remapped noise range
    max: number
    --- Set the seed for noise generation
    function set_seed(self, seed: number): ()
    --- Get the noise value at the given position
    function get_noise(self, x: number, y: number, z: number): number
    --- Set the noise type: Simplex, SimplexFractal, Perlin, PerlinFractal, Cellular, Value, ValueFractal, Cubic, CubicFractal, White
    function set_noise_type(self, noise_type: string): ()
    --- Set the frequency for noise generation
    function set_frequency(self, frequency: number): ()
    --- Set the fractal octaves for noise generation
    function set_fractal_octaves(self, octaves: number): ()
    --- Set the fractal gain for noise generation
    function set_fractal_gain(self, gain: number): ()
    --- Set the fractal lacunarity for noise generation
    function set_fractal_lacunarity(self, lacunarity: number): ()
    --- Set the fractal type: Fbm, Ridged or Billow
    function set_fractal_type(self, fractal_type: string): ()
end

--- Rock an ore vein grows through and the ore block it leaves in that rock
declare extern type OreVeinTarget with
    --- Blocks the vein replaces
    replace: { StaticBlock }
    --- Ore block left in their place
    block: StaticBlock
end

--- Local player controller
declare extern type Player extends Actor with
    --- Whether an item stands in a hotbar slot of any modifier row
    function hotbar_has(self, item: StaticItem): boolean
    --- Block cell the player is in
    function cell(self): Vec3i
end

--- Player input and view owner
declare extern type PlayerController with
end

--- Structure that stores several StaticProp records (prop variations) with shared spawn chance
declare extern type PropListData with
    --- Spawn weight
    weight: number
    --- Minimum block distance from origin for this tier
    min_dist: number
    --- Weight multiplier at the far end of the distance band
    far_weight: number
    --- List of prop assets (prop variations)
    props: { StaticProp }
end

--- Drilling machine that extracts oil from deposits
declare extern type Pumpjack extends DrillingMachineBase with
    --- Oil deposit under the machine
    source: SourceData
end

--- Single trackable goal of a quest
declare extern type QuestObjective extends Instance with
    --- Identifier unique within the quest
    id: string
    --- Localized objective text
    label: Loc
    --- Whether the objective is done
    completed: boolean
    --- Whether the progress counter is shown
    show_progress: boolean
    --- Current progress counter
    current: number
    --- Progress counter needed to complete
    required: number
    --- Set the progress counters, completing the objective when they meet
    function set_progress(self, current: number, required: number, show_progress: boolean): ()
    --- Set the completion flag directly
    function set_completed(self, completed: boolean): ()
end

--- Quest and chapter progression manager
declare extern type QuestSubsystem with
    --- Make a chapter available, false if its requirements are not met
    function unlock_chapter(self, chapter: StaticChapter): boolean
    --- Make a quest active, false if its requirements are not met
    function unlock_quest(self, quest: StaticQuest): boolean
    --- Mark an active quest as completed
    function complete_quest(self, quest: StaticQuest): boolean
    --- Whether the quest is unlocked and not completed yet
    function is_quest_active(self, quest: StaticQuest): boolean
    --- Whether the quest is completed
    function is_quest_completed(self, quest: StaticQuest): boolean
    --- Every known quest
    function get_all_quests(self): { StaticQuest }
    --- Quests unlocked and not completed yet, as a snapshot: completing one of them unlocks its followers without changing the returned list
    function get_active_quests(self): { StaticQuest }
    --- Every known chapter
    function get_all_chapters(self): { StaticChapter }
end

--- Tracks, signals, stations and trains of a surface. Edits go out to the other peers the way the rail tools send them and land at the host's stamped tick
declare extern type Railway extends Object with
    --- Lay a track between the rail nodes standing in two cells the way the rail tool does, bending the tracks already at the nodes to meet it
    function link(self, a: Vec3i, b: Vec3i): boolean
    --- Take away the track between the rail nodes standing in two cells the way the rail tool does
    function unlink(self, a: Vec3i, b: Vec3i): boolean
    --- Whether a track runs between the rail nodes standing in two cells
    function is_linked(self, a: Vec3i, b: Vec3i): boolean
    --- Put a signal on the rail node in a cell, change its kind or take it away, the way the signal tool does
    function set_signal(self, cell: Vec3i, yaw: number, kind: string?): boolean
    --- Signal on the rail node in a cell facing a direction of travel
    function get_signal(self, cell: Vec3i, yaw: number): string?
    --- Name of the station standing in a cell
    function get_station_name(self, cell: Vec3i): string?
    --- Rename the station standing in a cell the way its window does
    function rename_station(self, cell: Vec3i, name: string): boolean
    --- Put cars on a station the way a car item in hand does: a train standing there takes them at its end, otherwise they make a new train whose only stop is this station. Find the train with get_train_at a tick later
    function place_train(self, cell: Vec3i, item: StaticItem, cars: number?, reversed: boolean?): boolean
    --- Every train of the surface
    function get_trains(self): { Train }
    --- Train standing at the station in a cell
    function get_train_at(self, cell: Vec3i): Train?
end

--- Crafting-recipe prototype used by machines and crafting UIs
declare extern type Recipe extends Prototype with
    --- *Craft time* in engine ticks Load-only: pre_init, init or post_init.
    ticks: number
    --- **True** when a research gates this recipe. Derived from the research graph, not authored: writing to it is overwritten when the research tree initializes.
    default_locked: boolean
    --- Currently locked if **true**
    locked: boolean
    --- Percentage bonus (e.g. `20` = +20 %) Load-only: pre_init, init or post_init.
    productivity: number
    --- Item whose image and name stand for this recipe in the crafting UI; when the mods finish loading, a recipe without one takes its first output, else its first input Load-only: pre_init, init or post_init.
    icon: StaticItem
    --- Read-only container of required items
    input: RecipeInventory
    --- Read-only container of produced items
    output: RecipeInventory
    --- Recipe tier used for speed scaling: every tier **above** its dictionary's `start_tier` doubles craft time; below it the recipe is clamped to `start_tier`. Load-only: pre_init, init or post_init.
    tier: number
    --- The dictionary's `start_tier`, copied to every recipe in it when the mods finish loading. Load-only: pre_init, init or post_init.
    start_tier: number
    --- The dictionary holding this recipe
    dictionary: RecipeDictionary
end

--- Named group of recipes shared by machines of one family
declare extern type RecipeDictionary extends Prototype with
    --- Machine-unlock tier shared by every recipe in the dictionary Load-only: pre_init, init or post_init.
    start_tier: number
    --- Machine items that craft from this dictionary; the first one is the face the recipe index files its recipes under
    machines: { StaticItem }
    --- Put a recipe into this dictionary Load-only: pre_init, init or post_init.
    function add(self, recipe: Recipe): boolean
    --- Name a machine item that crafts from this dictionary; the first one is the face the recipe index files its recipes under Load-only: pre_init, init or post_init.
    function used_in(self, item: StaticItem): boolean
    --- Every recipe of this dictionary, in the order the crafting UI lists them
    function recipes(self): { Recipe }
    --- Look a recipe of this dictionary up by name; recipe names repeat across dictionaries, so this is the only way to address one
    function recipe(self, name: string): Recipe
    --- Take a recipe out of this dictionary and out of every research unlocking it. Crafters that had it selected in a save fall back to no recipe Load-only: pre_init, init or post_init.
    function remove(self, recipe: Recipe): boolean
end

--- Inventory that mirrors the slots of a recipe
declare extern type RecipeInventory extends AutosizeInventory with
    recipe: Recipe
    --- Append a recipe slot holding item with count Load-only: pre_init, init or post_init.
    function add(self, item: StaticItem, count: number, data: RecipeItemData): ()
    --- Drop every slot of this recipe side Load-only: pre_init, init or post_init.
    function clear(self): ()
    --- How many slots this recipe side has
    function count(self): number
    --- Item and count of a slot, counted from 1
    function slot(self, index: number): ItemData
    --- Bonus flag, chance and capacity of a slot, counted from 1
    function slot_data(self, index: number): RecipeItemData
end

--- Per slot recipe metadata carried next to the item and its count
declare extern type RecipeItemData with
    --- Slot size override for the crafter, `0` keeps the machine's own size
    capacity: number
    --- Percent chance the slot takes part in a craft; `0` on an input marks a catalyst that is not consumed
    probability: number
    --- **True** when the slot is produced by the productivity bonus instead of the craft itself
    bonus: boolean
end

--- Square of the world map holding sources and structures
declare extern type Region extends Instance with
    --- Region position in RegionMap grid
    pos: Vec2i
    --- Add structure to this Region
    function add_structure(self, structure: MapStructure): ()
    --- Add source to this Region
    function add_source(self, source: SourceData): ()
end

--- Grid of regions covering the surface
declare extern type RegionMap extends Instance with
    --- Delete all regions
    function reset(self): ()
    --- Get Region by its position, creating it when missing
    function get_region(self, spos: Vec2i): Region
    --- Looking for existing Region with given sector position
    function find_region(self, spos: Vec2i): Region
    --- Is region exists
    function has_region(self, pos: Vec2i): boolean
end

--- Engine texture, anything a picture can be drawn from
declare extern type Texture extends Object with
    --- Object name
    name: string
end

--- Texture the game renders into, such as a block thumbnail
declare extern type RenderTexture extends Texture with
end

--- Accessor that transfers a resource through a block side
declare extern type ResourceAccessor extends Accessor with
    --- Resource inventory bound to this side
    inventory: ResourceInventory
    --- Side consumes the resource
    is_input: boolean
    --- Side produces the resource
    is_output: boolean
    --- Resource network channel name
    channel: string
    --- Configure side, position, inventory and channel at once
    function init(self, side: Vec3i, pos: Vec3i, inventory: ResourceInventory, is_input: boolean, is_output: boolean, channel: string): ()
end

--- Inventory with exactly one slot
declare extern type SingleSlotInventory extends BaseInventory with
    capacity: number
    --- Accept only the given item in this slot
    function set_simple_filter(self, item: StaticItem): ()
end

--- Single slot inventory holding one resource item
declare extern type ResourceInventory extends SingleSlotInventory with
    item: StaticItem
    drain: number
    capacity: number
    --- Put resource into the slot ignoring transfer rules
    function add_resource(self, amount: number): ()
end

--- Euler rotation in degrees
declare extern type Rotator with
    pitch: number
    yaw: number
    roll: number
end

--- Configurable game setting
declare extern type Setting extends Prototype with
    --- Changing this setting requires a restart
    restart: boolean
    --- Called with the new value when the setting changes
    set_action: (...any) -> ...any
    --- Localization key of the displayed name
    label: string
    --- Widget type used to edit the setting
    type: string
    --- Settings category this entry belongs to
    category: string
    --- Current value: a boolean for Bool, an integer for Slider and Int, a string for String and Buttons
    value: boolean | number | string | nil
    --- Default value, of the same kind as value
    default: boolean | number | string | nil
    --- Values a String or Buttons setting offers
    options: { string }
    --- Lower bound of a Slider or Int value
    min: number
    --- Upper bound of a Slider or Int value
    max: number
    --- Current boolean value Legacy, use value
    bool_value: boolean
    --- Default boolean value Legacy, use default
    bool_default_value: boolean
    --- Current string value Legacy, use value
    string_value: string
    --- Default string value Legacy, use default
    default_string_value: string
    --- Allowed string values Legacy, use options
    string_options: { string }
    --- Current integer value Legacy, use value
    int_value: number
    --- Default integer value Legacy, use default
    int_default_value: number
    --- Upper bound of the integer value Legacy, use max
    max_value: number
    --- Lower bound of the integer value Legacy, use min
    min_value: number
    --- Input action bound to this setting
    key_binding: string
    --- Default keystroke, e.g. Ctrl+Shift+F
    default_key: string
    --- Called with this setting when the bound key goes down; only for a key_binding of this mod's own
    key_action: (...any) -> ...any
end

--- Engine sound class
declare extern type SoundClass extends Object with
    --- Object name
    name: string
    --- Playback volume multiplier
    volume: number
end

--- Resource deposit placed on the map
declare extern type SourceData extends Instance with
    --- Source position in block coordinates
    position: Vec2i
    --- Item to mine
    item: StaticItem
    --- Number of miners currently extracting
    active_miners: number
    --- Deposit never depletes
    infinite_ore: boolean
    --- Total deposit yield, capacity shared among miners
    function get_total_yield(self): number
    --- Average yield per miner currently on this deposit, 0 if no miners
    function get_yield_per_miner(self): number
    --- Yield a new miner would get if placed on this deposit, for build preview
    function get_estimated_yield_for_new_miner(self): number
end

--- Belt junction feeding several sides
declare extern type SplitterBlockLogic extends BlockLogic with
    --- Exact time to carry one item across half a cell, in ticks
    ticks_per_item: number
end

--- Aimable colored spotlight
declare extern type SpotlightBlockLogic extends BlockLogic with
end

--- Achievement progress record
declare extern type StaticAchievement extends Prototype with
    --- Progress added by the last increment
    delta: number
    --- Accumulated progress
    total: number
    --- Progress required to unlock
    threshold: number
    --- Whether the achievement is unlocked
    unlocked: boolean
    --- Game time of the unlock
    unlocked_time: number
    --- Achievement icon
    image: Texture2D
    --- Steam achievement id
    steam_key: string
    --- Localized name
    label: Loc
    --- Localized description
    description: Loc
end

--- Group of quests unlocked together
declare extern type StaticChapter extends Prototype with
    --- Localized chapter title
    label: Loc
    --- Quests belonging to this chapter
    quests: { StaticQuest }
    --- Quests that must be completed before the chapter becomes available
    required_quests: { StaticQuest }
    --- Whether the chapter is available in the current save
    unlocked: boolean
    --- Called when the chapter unlocks
    on_unlock: ((...any) -> ...any)?
    --- Called when every quest is completed
    on_complete: ((...any) -> ...any)?
end

--- Instanced mesh design used to skin blocks
declare extern type StaticCover extends Prototype with
end

--- List of covers allowed by the design tool and designable blocks
declare extern type StaticCoverSet extends Prototype with
    --- Allowed cover designs
    covers: { StaticCover }
end

--- Block the recipe screen shows above the recipes of an item
declare extern type StaticItemPanel extends Prototype with
    --- Items this panel is shown for
    items: { StaticItem }
    --- Item category this panel is shown for
    category: string
    --- Sort order among the panels of one item
    order: number
    --- Panel widget class path; empty means build draws the panel
    widget: string
    --- Called with the item and the panel each time the panel is shown; returns the ui.Widget it draws, nil hides the panel
    build: ((...any) -> ...any)?
    --- Localized panel title
    label: Loc
    --- Localized body paragraphs
    description_parts: { Loc }
    --- Inventory of items shown under the text
    context: AutosizeInventory
    --- Add an item to the context inventory
    function add_context(self, item: StaticItem): ()
    --- Remove every item from the context inventory
    function clear_context(self): ()
    --- Write a number the panel widget reads by key
    function set_number(self, key: string, value: number): ()
    --- Number written under the key, or the fallback
    function get_number(self, key: string, fallback: number): number
    --- Write a string the panel widget reads by key
    function set_string(self, key: string, value: string): ()
    --- String written under the key, empty when there is none
    function get_string(self, key: string): string
end

--- Engine static mesh
declare extern type StaticMesh extends Object with
    --- Object name
    name: string
end

--- Bonus a research adds to a machine stat
declare extern type StaticModifier extends Prototype with
    --- Bonus reached so far, in percent
    value: number
end

--- Ore vein every world places in the rock its targets replace, tried Count times per 16x16 column
declare extern type StaticOreVein extends Prototype with
    --- Rock the vein replaces and the ore it leaves there Load-only: pre_init, init or post_init.
    targets: { OreVeinTarget }
    --- Number of blobs strung along the vein Load-only: pre_init, init or post_init.
    size: number
    --- Veins tried per column Load-only: pre_init, init or post_init.
    count: number
    --- A column gets the veins with chance 1 / rarity Load-only: pre_init, init or post_init.
    rarity: number
    --- Lowest vein centre, world block height Load-only: pre_init, init or post_init.
    min_height: number
    --- Highest vein centre, world block height Load-only: pre_init, init or post_init.
    max_height: number
    --- Heights peak in the middle of the range instead of spreading evenly Load-only: pre_init, init or post_init.
    trapezoid: boolean
    --- Width of the flat top of the trapezoid Load-only: pre_init, init or post_init.
    plateau: number
    --- Chance an ore cell next to air stays rock Load-only: pre_init, init or post_init.
    discard_on_air_exposure: number
end

--- Celestial body with its own day cycle in world ticks
declare extern type StaticPlanet extends Prototype with
    --- Simulation ticks per full local day
    day_length_ticks: number
    --- Added to the phase after day wrap
    phase_offset_ticks: number
    --- Day phase of the dawn anchor
    dawn_phase_ticks: number
    --- Day phase of the solar noon anchor
    solar_noon_phase_ticks: number
    --- Day phase of the sunset anchor
    sunset_phase_ticks: number
    --- Observer latitude used by the solar model
    latitude_deg: number
    --- Day of the tropical year fixing solar declination
    day_of_year: number
    --- Calmest point the weather cycle reaches, from 0 clear sky to 1 full storm Load-only: pre_init, init or post_init.
    weather_severity_min: number
    --- Stormiest point the weather cycle reaches, from 0 clear sky to 1 full storm Load-only: pre_init, init or post_init.
    weather_severity_max: number
    --- Radius of the body seen from space, 0 for a body never seen from orbit Load-only: pre_init, init or post_init.
    radius_meters: number
    --- Height of a platform orbit above the surface Load-only: pre_init, init or post_init.
    orbit_altitude_meters: number
    --- World generator of the surface, empty for the generator chosen for the save Load-only: pre_init, init or post_init.
    generator_name: string
    --- Music playlist key played while the surface is shown Load-only: pre_init, init or post_init.
    music_playlist: string
    --- Cosmetic hours [0, 24) for a tick in local day-phase space
    function cosmetic_hours_from_day_phase_ticks(self, day_phase_tick: number): number
    --- Solar hour [0, 24) for a world tick
    function time_of_day_hours_from_ticks(self, total_game_ticks: number): number
    --- Solar hour honouring a locked time of day
    function resolve_time_of_day_hours(self, world_time_auto_advance: boolean, locked_world_time_of_day_phase_ticks: number, total_game_ticks: number): number
end

--- What a player starts with and crafts in hand; the game reads the one named Player
declare extern type StaticPlayer extends Prototype with
    --- Recipes the player crafts in hand Load-only: pre_init, init or post_init.
    hand_recipes: RecipeDictionary
    --- Items put on the first hotbar row of a new player Load-only: pre_init, init or post_init.
    hotbar: { StaticItem }
    --- Tools always in hand; the three tool keys take the first three Load-only: pre_init, init or post_init.
    tools: { StaticItem }
    --- Item whose logic lights the empty light slot Load-only: pre_init, init or post_init.
    light: StaticItem
    --- Item that carries a captured blueprint Load-only: pre_init, init or post_init.
    blueprint_item: StaticItem
    --- Items a new player receives Load-only: pre_init, init or post_init.
    start_inventory: Inventory
    --- Researches completed when a world starts Load-only: pre_init, init or post_init.
    start_researches: { StaticResearch }
end

--- Decoration prototype scattered by the world generator
declare extern type StaticProp extends StaticObject with
    --- How strongly the prop follows the terrain slope
    project_to_terrain_power: number
    --- Height offset added after terrain projection
    additive_elevation: number
    --- Prop view distance as a multiple of the decoration range setting; 0 is never culled
    range_mul: number
    --- Lowest surface height in blocks accepting this prop
    surface_height_min: number
    --- Highest surface height in blocks accepting this prop
    surface_height_max: number
    --- Highest column top in blocks accepting this prop
    top_height_max: number
    --- Prop keeps its height instead of sitting on the surface
    floating: boolean
    --- Prop spans more than one cell and is placed sparsely
    is_big: boolean
    --- Prop is streamed with the sector instead of being baked
    streamed: boolean
    --- Mesh rendered for this prop
    mesh: StaticMesh
    --- Prop is walked through
    no_collision: boolean
    --- Prop emits light
    is_emitting: boolean
    --- Prop may cast high-detail shadows
    high_detail_shadow: boolean
    --- Called with the block position when the prop is spawned
    on_spawn: (...any) -> ...any
    --- Number of hits to break
    hits_to_break: number
    --- Effect actor class spawned when the prop breaks
    break_effect: Class
    --- Effect actor class spawned on a non-fatal hit
    damage_effect: Class
    --- Closing speed in cm/s at which a vehicle breaks through the prop; 0 makes the prop a solid obstacle
    vehicle_break_speed: number
    --- Actor class spawned instead of an instanced mesh
    actor_class: Class
end

--- Prototype asset that owns several PropListData records
declare extern type StaticPropList extends Prototype with
    --- Prop tiers owned by this list
    data: { PropListData }
end

--- Quest definition and its runtime progress
declare extern type StaticQuest extends Prototype with
    --- Localized quest title
    label: Loc
    --- Localized description paragraphs
    description_parts: { Loc }
    --- Inventory of items shown next to the description
    context: AutosizeInventory
    --- Chapter this quest belongs to
    chapter: StaticChapter
    --- Quests that must be completed first
    required_quests: { StaticQuest }
    --- Complete on any one objective instead of all of them
    any_objective: boolean
    --- Current state: locked, active or completed
    state: number
    --- Table of event handlers keyed by event id
    events: { [any]: any }?
    --- Called when the quest becomes active
    on_unlock: ((...any) -> ...any)?
    --- Called when the quest is completed
    on_complete: ((...any) -> ...any)?
    --- Objectives of this quest
    objectives: { QuestObjective }
    --- Add an item to the context inventory
    function add_context(self, item: StaticItem): ()
    --- Remove every item from the context inventory
    function clear_context(self): ()
    --- Resubscribe the handlers listed in events
    function refresh_events(self): ()
    --- Complete the quest and fire on_complete
    function complete(self): ()
    --- Drop every objective
    function clear_objectives(self): ()
    --- Create and append an objective
    function create_objective(self, id: string): QuestObjective
    --- Append an existing objective
    function add_objective(self, objective: QuestObjective): ()
    --- Find an objective by its identifier
    function find_objective_by_id(self, id: string): QuestObjective
    --- Replace the objective list
    function set_objective_list(self, objectives: { [any]: any }): ()
    --- Set the completion flag of an objective by index
    function set_objective_complete(self, index: number, completed: boolean): boolean
    --- Set the completion flag of an objective by identifier
    function set_objective_complete_by_id(self, id: string, completed: boolean): boolean
    --- Set the progress counters of an objective
    function set_objective_progress(self, index: number, current: number, required: number, show_progress: boolean): boolean
    --- Set the localized text of an objective
    function set_objective_label(self, index: number, label: Loc): boolean
end

--- Research base class
declare extern type StaticResearch extends Prototype with
    --- Localized research name
    label: Loc
    --- Localized description paragraphs
    description_parts: { Loc }
    --- Science the research costs to complete
    complexity: number
    --- Level reached by an upgrade research, 0 for a node completed once
    level: number
    --- Progression tier the research belongs to
    tier: number
    --- Researches that must be complete before this one opens
    required_research: { StaticResearch }
    --- Whether the research is already complete
    completed: boolean
end

--- Research granting extra player inventory slots
declare extern type StaticResearchBonusInventory extends StaticResearch with
end

--- Research unlocking decorations built from building material
declare extern type StaticResearchDecorationUnlock extends StaticResearch with
    --- Decorations this research unlocks
    decorations: { StaticItem }
end

--- Research adding a productivity bonus to a recipe
declare extern type StaticResearchEfficiency extends StaticResearch with
end

--- Research raising a global player modifier
declare extern type StaticResearchModifier extends StaticResearch with
    --- Modifier prototype affected by this research
    modifier: StaticModifier
    --- Value added to the modifier on completion
    bonus_value: number
end

--- Research unlocking a set of recipes
declare extern type StaticResearchRecipe extends StaticResearch with
    --- Recipes this research unlocks
    recipe_unlocks: { Recipe }
    --- Make this research unlock a recipe; a recipe of `HandRecipeDictionary` also puts its output item into hand crafting Load-only: pre_init, init or post_init.
    function unlocks(self, recipe: Recipe): boolean
end

--- Research unlocking a player tool
declare extern type StaticResearchToolUnlock extends StaticResearch with
    --- Tool this research puts in the tool belt
    tool: StaticItem
end

--- Map generation script object with a footprint
declare extern type StaticStructure extends Prototype with
    --- Callback invoked to emit the structure
    generate: (...any) -> ...any
    --- Footprint of the structure in blocks
    size: Vec2i
end

--- Encyclopedia entry shown to the player
declare extern type StaticTip extends Prototype with
    --- Localized title
    label: Loc
    --- Localized body paragraphs
    description_parts: { Loc }
    --- Illustration path relative to the owning mod folder
    image: string
    --- Inventory of items shown next to the text
    context: AutosizeInventory
    --- Tip this entry is nested under in the list
    parent: StaticTip
    --- Add an item to the context inventory shown next to the text
    function add_context(self, item: StaticItem): ()
    --- Remove every item from the context inventory
    function clear_context(self): ()
end

--- Weather preset a biome shows for one severity band
declare extern type StaticWeather extends Prototype with
    --- Cloud coverage the sky is set to, 0..10
    cloud_coverage: number
    --- Thunder and lightning the sky is set to, 0..10
    thunder: number
    --- Fog amount the sky is set to, 0..10
    fog: number
end

--- Generation setup of one planetary surface
declare extern type SurfaceDefinition extends Instance with
    --- Region map driving surface generation
    region_map: RegionMap
    --- World generator identifier
    generator_name: string
end

--- Column of generated block cells
declare extern type TallSectorData with
    --- Cell height the column starts at
    zero_height: number
    --- Number of cells in the column
    height: number
    --- Block at the given position
    function get_block(self, pos: Vec3i): StaticBlock
    --- Write a block at the given position
    function set_block(self, pos: Vec3i, block: StaticBlock): ()
end

--- Sector mesh builder prototype
declare extern type Tesselator extends Prototype with
end

--- Sector mesh builder of cube blocks
declare extern type TesselatorCube extends Tesselator with
end

--- Sector mesh builder of smooth terrain
declare extern type TesselatorMarching extends Tesselator with
end

--- Texture loaded from an image, such as an item icon
declare extern type Texture2D extends Texture with
end

--- Train on the railway of a surface. Schedule edits go out to the other peers the way the train window sends them and land at the host's stamped tick
declare extern type Train extends Instance with
    --- Number of the train, the same on every peer and across saves
    id: number
    --- Name the player gave the train, nil while it has none
    name: string?
    --- Car items from the front of the train to its back
    cars: { StaticItem }
    --- Stops of the schedule in order
    stops: { TrainScheduleStop }
    --- Stop the train goes to or stands at, nil while the schedule is empty
    current_stop: TrainScheduleStop?
    --- Whether the schedule starts over after its last stop
    loop: boolean
    --- Name the train the way its window does
    function set_name(self, name: string): boolean
    --- Add a stop to the schedule
    function add_stop(self, station: string, before: TrainScheduleStop?): boolean
    --- Take a stop out of the schedule
    function remove_stop(self, stop: TrainScheduleStop): boolean
    --- Move a stop within the schedule
    function move_stop(self, stop: TrainScheduleStop, before: TrainScheduleStop?): boolean
    --- Send a stop to another station
    function set_stop_station(self, stop: TrainScheduleStop, station: string): boolean
    --- Replace when the train leaves a stop
    function set_condition(self, stop: TrainScheduleStop, condition: { [any]: any }): boolean
    --- Make the schedule start over after its last stop or end there
    function set_loop(self, loop: boolean): boolean
    --- Send the train to a stop of its schedule
    function set_current_stop(self, stop: TrainScheduleStop): boolean
    --- Make the train waiting at its stop leave without its condition
    function depart(self): boolean
end

--- One entry of a train schedule
declare extern type TrainScheduleStop extends Instance with
    --- Number of the stop, the same on every peer and across saves
    id: number
    --- Name of the station the train goes to
    station: string
    --- When the train leaves the station, in the shape Train.set_condition takes
    condition: { [any]: any }?
end

--- Location, rotation and scale of an object
declare extern type Transform with
    function set_location(self, location: Vec3): ()
    function set_rotation(self, rotation: FQuat): ()
    function set_scale(self, scale: Vec3): ()
    function get_location(self): Vec3
    function get_rotation(self): FQuat
    function get_scale(self): Vec3
end

--- Integer vector 2
declare extern type Vec2i with
    x: number
    y: number
    function __add(self, other: Vec2i): Vec2i
    function __sub(self, other: Vec2i): Vec2i
    function __mul(self, other: Vec2i): Vec2i
    function __div(self, other: Vec2i): Vec2i
end

--- Float vector 3
declare extern type Vec3 with
    x: number
    y: number
    z: number
    --- Unit vector with the same direction
    function normalize(self): Vec3
    function __add(self, other: Vec3): Vec3
    function __sub(self, other: Vec3): Vec3
    function __mul(self, other: Vec3): Vec3
    function __div(self, other: Vec3): Vec3
end

--- Integer vector 3
declare extern type Vec3i with
    x: number
    y: number
    z: number
    --- Drop the Z component
    function xy(self): Vec2i
    function __add(self, other: Vec3i): Vec3i
    function __sub(self, other: Vec3i): Vec3i
    function __mul(self, other: Vec3i): Vec3i
    function __div(self, other: Vec3i): Vec3i
end

--- Base of every widget. A widget is built by calling its class with a table: named fields set its properties, the list part holds its children; ui.Text, ui.Window and ui.Button also take their main field alone, as ui.Text "...", ui.Window "..." and ui.Button(fn)
declare extern type ui_Widget extends Object with
    --- Hidden widgets keep their place in the tree and take no input
    visible: boolean
    --- Share of the free space this widget takes along an HBox or VBox; zero keeps it at the size of its content
    fill: number
    --- Fixed width in slate units; zero lets the content decide
    width: number
    --- Fixed height in slate units; zero lets the content decide
    height: number
    --- Space between the edge of the widget and its content: one number for every side, { horizontal, vertical } or { left, top, right, bottom }; reads as the four sides
    padding: number | { number }
    --- Where the widget sits across the width its parent gives it: "fill", "left", "center" or "right"; unset is "fill", or "left" when the width is fixed
    halign: string
    --- Where the widget sits across the height its parent gives it: "fill", "top", "center" or "bottom"; unset is "fill", or "top" when the height is fixed
    valign: string
end

--- Plate drawn behind one child; padding is kept inside the plate
declare extern type ui_Border extends ui_Widget with
    --- The child, also given as the first list item
    content: ui_Widget?
    --- Plate the game draws behind the child: "panel", "window", "frame", "field", "plate" or "none"
    style: string
    --- Tint of the plate, same forms as ui.Text color; on "plate" it is the fill itself, a faint light one when empty
    color: string
end

--- Button around one child; padding is kept inside the button
declare extern type ui_Button extends ui_Widget with
    --- The child, also given as the first list item
    content: ui_Widget?
    --- Called with no arguments when the player clicks the button
    on_click: ((...any) -> ...any)?
end

--- Grid of equal cells, filled row by row
declare extern type ui_Grid extends ui_Widget with
    --- Cells per row, at least one
    columns: number
    --- Space kept between cells in slate units
    gap: number
    --- Put a widget that has no parent yet in the next free cell
    function add(self, child: ui_Widget): ()
    --- Drop every child, leaving the grid empty
    function clear(self): ()
end

--- Row of children laid out left to right
declare extern type ui_HBox extends ui_Widget with
    --- Space kept between children in slate units
    gap: number
    --- Append a child widget that has no parent yet
    function add(self, child: ui_Widget): ()
    --- Drop every child, leaving the box empty
    function clear(self): ()
end

--- Picture of a texture, 64 by 64 unless its width and height say otherwise
declare extern type ui_Image extends ui_Widget with
    --- Texture drawn, an item image, a ui.texture or a ui.thumbnail; nil draws nothing and keeps the space
    image: Texture
    --- Width and height at once, for a square picture; reads the width
    size: number
    --- Clockwise turn of the picture about its centre in degrees; the space it takes stays in place
    angle: number
    --- Tint multiplied into the texture, same forms as ui.Text color
    color: string
    --- Part of the texture drawn, { u0, v0, u1, v1 } from 0 to 1 across and down; the part fills the picture's width and height. Reads { 0, 0, 1, 1 } for the whole texture
    uv: { number }
end

--- Grid of item slots showing an inventory with the game's own slot widget
declare extern type ui_Inventory extends ui_Widget with
    --- Inventory shown; nil or an empty one hides the grid
    inventory: InventoryAccess
    --- True draws the item counts in the slots
    numbers: boolean
    --- Slots per row, at least one
    columns: number
end

--- Vertical list that scrolls instead of overflowing
declare extern type ui_Scroll extends ui_Widget with
    --- Space kept between children in slate units
    gap: number
    --- Append a child widget that has no parent yet
    function add(self, child: ui_Widget): ()
    --- Drop every child, leaving the list empty
    function clear(self): ()
    --- Scroll back to the first child
    function to_start(self): ()
end

--- Empty space as wide and tall as its width and height
declare extern type ui_Spacer extends ui_Widget with
end

--- Text the way the game's descriptions read: tokens such as {item:Name} become links with icons, <blue>, <yellow>, <red> and <green> tint a run
declare extern type ui_Text extends ui_Widget with
    --- Source UTF-8 text, tokens and tags unexpanded
    text: string
    --- Font size in slate units
    font_size: number
    --- Where the lines sit: "left", "center" or "right"
    align: string
    --- Color of the text outside tinted runs: "#rrggbb", "#rrggbbaa" or a game color, "primary", "dim", "accent", "accent_light", "warning", "white"
    color: string
    --- True, the default, breaks long lines at the width the text is given; false keeps one line
    wrap: boolean
end

--- Single line the player types into
declare extern type ui_TextBox extends ui_Widget with
    --- Current UTF-8 text
    text: string
    --- Greyed text shown while the field is empty
    hint: string
    --- Called with the text after every edit the player makes
    on_changed: ((...any) -> ...any)?
    --- Called with the text when the player presses Enter
    on_commit: ((...any) -> ...any)?
    --- Give the field keyboard focus
    function focus(self): ()
end

--- Column of children laid out top to bottom
declare extern type ui_VBox extends ui_Widget with
    --- Space kept between children in slate units
    gap: number
    --- Append a child widget that has no parent yet
    function add(self, child: ui_Widget): ()
    --- Drop every child, leaving the box empty
    function clear(self): ()
end

--- Top level window with a title bar the player can drag it by; its width and height size the window, its padding is kept around the content
declare extern type ui_Window extends ui_Widget with
    --- The child, also given as the first list item
    content: ui_Widget?
    --- Text shown in the title bar
    title: string
    --- Screen edge the window keeps to across: "left", "center" or "right"
    anchor_x: string
    --- Screen edge the window keeps to down: "top", "center" or "bottom"
    anchor_y: string
    --- Distance from the anchor across in slate units; dragging the window changes it
    offset_x: number
    --- Distance from the anchor down in slate units; dragging the window changes it
    offset_y: number
    --- True gives the window the cursor and the keyboard while the game keeps running
    input: boolean
    --- Put the window on the screen
    function show(self): ()
    --- Take the window off the screen
    function close(self): ()
end

declare AbstractCrafter: {
    --- Trying to cast Object into AbstractCrafter
    cast: (object: Object) -> AbstractCrafter,
    --- Return AbstractCrafter class object
    get_class: () -> Class,
    --- Creates a new AbstractCrafter instance
    new: (parent: Object, name: string) -> AbstractCrafter,
    --- Creates a new AbstractCrafter instance
    new_simple: () -> AbstractCrafter,
}

declare Accessor: {
    --- Trying to cast Object into Accessor
    cast: (object: Object) -> Accessor,
    --- Return Accessor class object
    get_class: () -> Class,
    --- Creates a new Accessor attached to a block
    new: (parent: BlockLogic, name: string) -> Accessor,
}

declare AdminElectricGeneratorBlockLogic: {
    --- Trying to cast Object into AdminElectricGeneratorBlockLogic
    cast: (object: Object) -> AdminElectricGeneratorBlockLogic,
    --- Return AdminElectricGeneratorBlockLogic class object
    get_class: () -> Class,
    --- Creates a new AdminElectricGeneratorBlockLogic instance
    new: (parent: Object, name: string) -> AdminElectricGeneratorBlockLogic,
    --- Creates a new AdminElectricGeneratorBlockLogic instance
    new_simple: () -> AdminElectricGeneratorBlockLogic,
}

declare AnimSequence: {
    --- Load an animation sequence asset
    load: (path: string) -> AnimSequence,
}

declare AutoCrafter: {
    --- Trying to cast Object into AutoCrafter
    cast: (object: Object) -> AutoCrafter,
    --- Return AutoCrafter class object
    get_class: () -> Class,
    --- Creates a new AutoCrafter instance
    new: (parent: Object, name: string) -> AutoCrafter,
    --- Creates a new AutoCrafter instance
    new_simple: () -> AutoCrafter,
}

declare AutosizeInventory: {
    --- Trying to cast Object into AutosizeInventory
    cast: (object: Object) -> AutosizeInventory,
    --- Return AutosizeInventory class object
    get_class: () -> Class,
    --- Creates a new AutosizeInventory instance
    new: (parent: Object, name: string) -> AutosizeInventory,
    --- Creates a new AutosizeInventory instance
    new_simple: () -> AutosizeInventory,
}

declare BaseInventory: {
    --- Trying to cast Object into BaseInventory
    cast: (object: Object) -> BaseInventory,
    --- Return BaseInventory class object
    get_class: () -> Class,
}

declare BaseInventoryAccessor: {
    --- Trying to cast Object into BaseInventoryAccessor
    cast: (object: Object) -> BaseInventoryAccessor,
    --- Return BaseInventoryAccessor class object
    get_class: () -> Class,
    --- Creates a new BaseInventoryAccessor attached to a block
    new: (parent: BlockLogic, name: string) -> BaseInventoryAccessor,
}

declare BedBlockLogic: {
    --- Trying to cast Object into BedBlockLogic
    cast: (object: Object) -> BedBlockLogic,
    --- Return BedBlockLogic class object
    get_class: () -> Class,
    --- Creates a new BedBlockLogic instance
    new: (parent: Object, name: string) -> BedBlockLogic,
    --- Creates a new BedBlockLogic instance
    new_simple: () -> BedBlockLogic,
}

declare Biome: {
    --- Trying to cast Object into Biome
    cast: (object: Object) -> Biome,
    --- Return Biome class object
    get_class: () -> Class,
    --- Looks Biome up in db, nil when there is none
    find: (name: string) -> Biome,
    --- Takes Biome from db, reports a miss to the log
    get: (name: string) -> Biome,
    --- Register a new Biome static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: Biome_spec?) -> Biome,
}

declare BiomeFamily: {
    --- Trying to cast Object into BiomeFamily
    cast: (object: Object) -> BiomeFamily,
    --- Return BiomeFamily class object
    get_class: () -> Class,
    --- Looks BiomeFamily up in db, nil when there is none
    find: (name: string) -> BiomeFamily,
    --- Takes BiomeFamily from db, reports a miss to the log
    get: (name: string) -> BiomeFamily,
    --- Register a new BiomeFamily static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: BiomeFamily_spec?) -> BiomeFamily,
}

declare BiomeWorldGenerator: {
    --- Trying to cast Object into BiomeWorldGenerator
    cast: (object: Object) -> BiomeWorldGenerator,
    --- Return BiomeWorldGenerator class object
    get_class: () -> Class,
    --- Looks BiomeWorldGenerator up in db, nil when there is none
    find: (name: string) -> BiomeWorldGenerator,
    --- Takes BiomeWorldGenerator from db, reports a miss to the log
    get: (name: string) -> BiomeWorldGenerator,
    --- Register a new BiomeWorldGenerator static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: BiomeWorldGenerator_spec?) -> BiomeWorldGenerator,
}

declare BlockActor: {
    --- Trying to cast Object into BlockActor
    cast: (object: Object) -> BlockActor,
}

declare BlockLogic: {
    --- Trying to cast Object into BlockLogic
    cast: (object: Object) -> BlockLogic,
    --- Return BlockLogic class object
    get_class: () -> Class,
    --- Creates a new BlockLogic instance
    new: (parent: Object, name: string) -> BlockLogic,
    --- Creates a new BlockLogic instance
    new_simple: () -> BlockLogic,
}

declare ChestBlockLogic: {
    --- Trying to cast Object into ChestBlockLogic
    cast: (object: Object) -> ChestBlockLogic,
    --- Return ChestBlockLogic class object
    get_class: () -> Class,
    --- Creates a new ChestBlockLogic instance
    new: (parent: Object, name: string) -> ChestBlockLogic,
    --- Creates a new ChestBlockLogic instance
    new_simple: () -> ChestBlockLogic,
}

declare Class: {
    --- Find a loaded class by name
    find: (name: string) -> Class,
    --- Load a class asset
    load: (path: string) -> Class,
    --- Trying to cast Object into Class
    cast: (object: Object) -> Class,
}

declare Color: {
    --- (255, 0, 0, 255)
    red: Color,
    --- (0, 255, 0, 255)
    green: Color,
    --- (0, 0, 255, 255)
    blue: Color,
    --- (255, 255, 0, 255)
    yellow: Color,
    --- (0, 255, 255, 255)
    cyan: Color,
    --- (255, 0, 255, 255)
    magenta: Color,
    --- (255, 255, 255, 255)
    white: Color,
    --- (0, 0, 0, 255)
    black: Color,
    --- (128, 128, 128, 255)
    gray: Color,
    --- (243, 156, 18, 255)
    orange: Color,
    --- (169, 7, 228, 255)
    purple: Color,
    --- (0, 0, 0, 0)
    transparent: Color,
    --- Create a color from channel values 0-255
    new: (r: number, g: number, b: number, a: number) -> Color,
}

declare Component: {
    --- Trying to cast Object into Component
    cast: (object: Object) -> Component,
    --- Return Component class object
    get_class: () -> Class,
    --- Looks Component up in db, nil when there is none
    find: (name: string) -> Component,
    --- Takes Component from db, reports a miss to the log
    get: (name: string) -> Component,
    --- Register a new Component static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: Component_spec?) -> Component,
}

declare ComputerBlockLogic: {
    --- Trying to cast Object into ComputerBlockLogic
    cast: (object: Object) -> ComputerBlockLogic,
    --- Return ComputerBlockLogic class object
    get_class: () -> Class,
    --- Creates a new ComputerBlockLogic instance
    new: (parent: Object, name: string) -> ComputerBlockLogic,
    --- Creates a new ComputerBlockLogic instance
    new_simple: () -> ComputerBlockLogic,
}

declare ConductorBlockLogic: {
    --- Trying to cast Object into ConductorBlockLogic
    cast: (object: Object) -> ConductorBlockLogic,
    --- Return ConductorBlockLogic class object
    get_class: () -> Class,
    --- Creates a new ConductorBlockLogic instance
    new: (parent: Object, name: string) -> ConductorBlockLogic,
    --- Creates a new ConductorBlockLogic instance
    new_simple: () -> ConductorBlockLogic,
}

declare Console: {
    --- Executes engine console command
    run: (command: string) -> (),
    --- Get engine console variable
    get_string: (variable: string) -> string,
    --- Get engine console variable
    get_float: (variable: string) -> number,
    --- Get engine console variable
    get_int: (variable: string) -> number,
    --- Trying to cast Object into Console
    cast: (object: Object) -> Console,
    --- Return Console class object
    get_class: () -> Class,
    --- Creates a new Console instance
    new: (parent: Object, name: string) -> Console,
    --- Creates a new Console instance
    new_simple: () -> Console,
}

declare ConveyorBlockLogic: {
    --- Trying to cast Object into ConveyorBlockLogic
    cast: (object: Object) -> ConveyorBlockLogic,
    --- Return ConveyorBlockLogic class object
    get_class: () -> Class,
    --- Creates a new ConveyorBlockLogic instance
    new: (parent: Object, name: string) -> ConveyorBlockLogic,
    --- Creates a new ConveyorBlockLogic instance
    new_simple: () -> ConveyorBlockLogic,
}

declare DB: {
    --- Trying to cast Object into DB
    cast: (object: Object) -> DB,
    --- Return DB class object
    get_class: () -> Class,
    --- Creates a new DB instance
    new: (parent: Object, name: string) -> DB,
    --- Creates a new DB instance
    new_simple: () -> DB,
}

declare DeepStorageBlockLogic: {
    --- Trying to cast Object into DeepStorageBlockLogic
    cast: (object: Object) -> DeepStorageBlockLogic,
    --- Return DeepStorageBlockLogic class object
    get_class: () -> Class,
    --- Creates a new DeepStorageBlockLogic instance
    new: (parent: Object, name: string) -> DeepStorageBlockLogic,
    --- Creates a new DeepStorageBlockLogic instance
    new_simple: () -> DeepStorageBlockLogic,
}

declare DesignableCoverBlockLogic: {
    --- Trying to cast Object into DesignableCoverBlockLogic
    cast: (object: Object) -> DesignableCoverBlockLogic,
    --- Return DesignableCoverBlockLogic class object
    get_class: () -> Class,
    --- Creates a new DesignableCoverBlockLogic instance
    new: (parent: Object, name: string) -> DesignableCoverBlockLogic,
    --- Creates a new DesignableCoverBlockLogic instance
    new_simple: () -> DesignableCoverBlockLogic,
}

declare DesignableFenceBlockLogic: {
    --- Trying to cast Object into DesignableFenceBlockLogic
    cast: (object: Object) -> DesignableFenceBlockLogic,
    --- Return DesignableFenceBlockLogic class object
    get_class: () -> Class,
    --- Creates a new DesignableFenceBlockLogic instance
    new: (parent: Object, name: string) -> DesignableFenceBlockLogic,
    --- Creates a new DesignableFenceBlockLogic instance
    new_simple: () -> DesignableFenceBlockLogic,
}

declare DoorBlockLogic: {
    --- Trying to cast Object into DoorBlockLogic
    cast: (object: Object) -> DoorBlockLogic,
    --- Return DoorBlockLogic class object
    get_class: () -> Class,
    --- Creates a new DoorBlockLogic instance
    new: (parent: Object, name: string) -> DoorBlockLogic,
    --- Creates a new DoorBlockLogic instance
    new_simple: () -> DoorBlockLogic,
}

declare DrillingMachineBase: {
    --- Trying to cast Object into DrillingMachineBase
    cast: (object: Object) -> DrillingMachineBase,
    --- Return DrillingMachineBase class object
    get_class: () -> Class,
}

declare DrillingRig: {
    --- Trying to cast Object into DrillingRig
    cast: (object: Object) -> DrillingRig,
    --- Return DrillingRig class object
    get_class: () -> Class,
    --- Creates a new DrillingRig instance
    new: (parent: Object, name: string) -> DrillingRig,
    --- Creates a new DrillingRig instance
    new_simple: () -> DrillingRig,
}

declare ElectricityContainerBlockLogic: {
    --- Trying to cast Object into ElectricityContainerBlockLogic
    cast: (object: Object) -> ElectricityContainerBlockLogic,
    --- Return ElectricityContainerBlockLogic class object
    get_class: () -> Class,
    --- Creates a new ElectricityContainerBlockLogic instance
    new: (parent: Object, name: string) -> ElectricityContainerBlockLogic,
    --- Creates a new ElectricityContainerBlockLogic instance
    new_simple: () -> ElectricityContainerBlockLogic,
}

declare EnvironmentCrafter: {
    --- Trying to cast Object into EnvironmentCrafter
    cast: (object: Object) -> EnvironmentCrafter,
    --- Return EnvironmentCrafter class object
    get_class: () -> Class,
    --- Creates a new EnvironmentCrafter instance
    new: (parent: Object, name: string) -> EnvironmentCrafter,
    --- Creates a new EnvironmentCrafter instance
    new_simple: () -> EnvironmentCrafter,
}

declare EquipmentSlotFilter: {
    --- Trying to cast Object into EquipmentSlotFilter
    cast: (object: Object) -> EquipmentSlotFilter,
    --- Return EquipmentSlotFilter class object
    get_class: () -> Class,
    --- Creates a new EquipmentSlotFilter instance
    new: (parent: Object, name: string) -> EquipmentSlotFilter,
    --- Creates a new EquipmentSlotFilter instance
    new_simple: () -> EquipmentSlotFilter,
}

declare EventSystem: {
    --- Get the event bus singleton
    get: () -> EventSystem,
}

declare ExtractionData: {
    --- Create new instance of ExtractionData
    new: () -> ExtractionData,
}

declare FQuat: {
    --- Zero rotation
    identity: FQuat,
    --- Create a quaternion from raw components
    new: (x: number, y: number, z: number, w: number) -> FQuat,
}

declare FenceBlockLogic: {
    --- Trying to cast Object into FenceBlockLogic
    cast: (object: Object) -> FenceBlockLogic,
    --- Return FenceBlockLogic class object
    get_class: () -> Class,
    --- Creates a new FenceBlockLogic instance
    new: (parent: Object, name: string) -> FenceBlockLogic,
    --- Creates a new FenceBlockLogic instance
    new_simple: () -> FenceBlockLogic,
}

declare FluidContainerBlockLogic: {
    --- Trying to cast Object into FluidContainerBlockLogic
    cast: (object: Object) -> FluidContainerBlockLogic,
    --- Return FluidContainerBlockLogic class object
    get_class: () -> Class,
    --- Creates a new FluidContainerBlockLogic instance
    new: (parent: Object, name: string) -> FluidContainerBlockLogic,
    --- Creates a new FluidContainerBlockLogic instance
    new_simple: () -> FluidContainerBlockLogic,
}

declare Game: {
    --- List of the screen resolutions supported by the hardware
    get_supported_resolutions: () -> { string },
    --- Resolution of the primary display as WxH
    get_desktop_resolution: () -> string,
    --- The game runs on a Steam Deck
    is_steam_deck: () -> boolean,
}

declare GameSessionData: {
    --- Trying to cast Object into GameSessionData
    cast: (object: Object) -> GameSessionData,
    --- Return GameSessionData class object
    get_class: () -> Class,
    --- Creates a new GameSessionData instance
    new: (parent: Object, name: string) -> GameSessionData,
    --- Creates a new GameSessionData instance
    new_simple: () -> GameSessionData,
}

declare GhostBlockLogic: {
    --- Trying to cast Object into GhostBlockLogic
    cast: (object: Object) -> GhostBlockLogic,
    --- Return GhostBlockLogic class object
    get_class: () -> Class,
    --- Creates a new GhostBlockLogic instance
    new: (parent: Object, name: string) -> GhostBlockLogic,
    --- Creates a new GhostBlockLogic instance
    new_simple: () -> GhostBlockLogic,
}

declare GhostStaticBlock: {
    --- Trying to cast Object into GhostStaticBlock
    cast: (object: Object) -> GhostStaticBlock,
    --- Return GhostStaticBlock class object
    get_class: () -> Class,
    --- Looks GhostStaticBlock up in db, nil when there is none
    find: (name: string) -> GhostStaticBlock,
    --- Takes GhostStaticBlock from db, reports a miss to the log
    get: (name: string) -> GhostStaticBlock,
    --- Register a new GhostStaticBlock static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: GhostStaticBlock_spec?) -> GhostStaticBlock,
}

declare GlobalBiomeFamily: {
    --- Trying to cast Object into GlobalBiomeFamily
    cast: (object: Object) -> GlobalBiomeFamily,
    --- Return GlobalBiomeFamily class object
    get_class: () -> Class,
    --- Looks GlobalBiomeFamily up in db, nil when there is none
    find: (name: string) -> GlobalBiomeFamily,
    --- Takes GlobalBiomeFamily from db, reports a miss to the log
    get: (name: string) -> GlobalBiomeFamily,
    --- Register a new GlobalBiomeFamily static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: GlobalBiomeFamily_spec?) -> GlobalBiomeFamily,
}

declare GraphicsSettings: {
    --- Apply a scalability quality preset
    set_scalability_preset: (preset_index: number) -> (),
    --- Trying to cast Object into GraphicsSettings
    cast: (object: Object) -> GraphicsSettings,
    --- Return GraphicsSettings class object
    get_class: () -> Class,
    --- Creates a new GraphicsSettings instance
    new: (parent: Object, name: string) -> GraphicsSettings,
    --- Creates a new GraphicsSettings instance
    new_simple: () -> GraphicsSettings,
}

declare HeatContainerBlockLogic: {
    --- Trying to cast Object into HeatContainerBlockLogic
    cast: (object: Object) -> HeatContainerBlockLogic,
    --- Return HeatContainerBlockLogic class object
    get_class: () -> Class,
    --- Creates a new HeatContainerBlockLogic instance
    new: (parent: Object, name: string) -> HeatContainerBlockLogic,
    --- Creates a new HeatContainerBlockLogic instance
    new_simple: () -> HeatContainerBlockLogic,
}

declare HeightGenerator: {
    --- Trying to cast Object into HeightGenerator
    cast: (object: Object) -> HeightGenerator,
    --- Return HeightGenerator class object
    get_class: () -> Class,
    --- Looks HeightGenerator up in db, nil when there is none
    find: (name: string) -> HeightGenerator,
    --- Takes HeightGenerator from db, reports a miss to the log
    get: (name: string) -> HeightGenerator,
    --- Register a new HeightGenerator static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: HeightGenerator_spec?) -> HeightGenerator,
}

declare Inventory: {
    --- Trying to cast Object into Inventory
    cast: (object: Object) -> Inventory,
    --- Return Inventory class object
    get_class: () -> Class,
    --- Creates a new Inventory instance
    new: (parent: Object, name: string) -> Inventory,
    --- Creates a new Inventory instance
    new_simple: () -> Inventory,
}

declare InventoryAccess: {
    --- Trying to cast Object into InventoryAccess
    cast: (object: Object) -> InventoryAccess,
    --- Return InventoryAccess class object
    get_class: () -> Class,
}

declare InventoryBlackFilter: {
    --- Trying to cast Object into InventoryBlackFilter
    cast: (object: Object) -> InventoryBlackFilter,
    --- Return InventoryBlackFilter class object
    get_class: () -> Class,
    --- Creates a new InventoryBlackFilter instance
    new: (parent: Object, name: string) -> InventoryBlackFilter,
    --- Creates a new InventoryBlackFilter instance
    new_simple: () -> InventoryBlackFilter,
}

declare InventoryContainer: {
    --- Trying to cast Object into InventoryContainer
    cast: (object: Object) -> InventoryContainer,
    --- Return InventoryContainer class object
    get_class: () -> Class,
    --- Creates a new InventoryContainer instance
    new: (parent: Object, name: string) -> InventoryContainer,
    --- Creates a new InventoryContainer instance
    new_simple: () -> InventoryContainer,
}

declare InventoryFilter: {
    --- Trying to cast Object into InventoryFilter
    cast: (object: Object) -> InventoryFilter,
    --- Return InventoryFilter class object
    get_class: () -> Class,
}

declare InventoryInventoryFilter: {
    --- Trying to cast Object into InventoryInventoryFilter
    cast: (object: Object) -> InventoryInventoryFilter,
    --- Return InventoryInventoryFilter class object
    get_class: () -> Class,
    --- Creates a new InventoryInventoryFilter instance
    new: (parent: Object, name: string) -> InventoryInventoryFilter,
    --- Creates a new InventoryInventoryFilter instance
    new_simple: () -> InventoryInventoryFilter,
}

declare InventoryReader: {
    --- Trying to cast Object into InventoryReader
    cast: (object: Object) -> InventoryReader,
    --- Return InventoryReader class object
    get_class: () -> Class,
}

declare InventoryWhiteFilter: {
    --- Trying to cast Object into InventoryWhiteFilter
    cast: (object: Object) -> InventoryWhiteFilter,
    --- Return InventoryWhiteFilter class object
    get_class: () -> Class,
    --- Creates a new InventoryWhiteFilter instance
    new: (parent: Object, name: string) -> InventoryWhiteFilter,
    --- Creates a new InventoryWhiteFilter instance
    new_simple: () -> InventoryWhiteFilter,
}

declare ItemData: {
    --- Create an item stack holding nothing
    new_empty: () -> ItemData,
    --- Create an item stack
    new: (item: StaticItem, count: number) -> ItemData,
    --- Create an item stack with a zero count
    new_zero: (item: StaticItem) -> ItemData,
}

declare ItemGroup: {
    --- Trying to cast Object into ItemGroup
    cast: (object: Object) -> ItemGroup,
    --- Return ItemGroup class object
    get_class: () -> Class,
    --- Looks ItemGroup up in db, nil when there is none
    find: (name: string) -> ItemGroup,
    --- Takes ItemGroup from db, reports a miss to the log
    get: (name: string) -> ItemGroup,
    --- Register a new ItemGroup static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: ItemGroup_spec?) -> ItemGroup,
}

declare ItemRackBlockLogic: {
    --- Trying to cast Object into ItemRackBlockLogic
    cast: (object: Object) -> ItemRackBlockLogic,
    --- Return ItemRackBlockLogic class object
    get_class: () -> Class,
    --- Creates a new ItemRackBlockLogic instance
    new: (parent: Object, name: string) -> ItemRackBlockLogic,
    --- Creates a new ItemRackBlockLogic instance
    new_simple: () -> ItemRackBlockLogic,
}

declare Kto: {
    --- Create new Kto object
    new: (key: string, table: string) -> Kto,
}

declare LandingPadBlockLogic: {
    --- Trying to cast Object into LandingPadBlockLogic
    cast: (object: Object) -> LandingPadBlockLogic,
    --- Return LandingPadBlockLogic class object
    get_class: () -> Class,
    --- Creates a new LandingPadBlockLogic instance
    new: (parent: Object, name: string) -> LandingPadBlockLogic,
    --- Creates a new LandingPadBlockLogic instance
    new_simple: () -> LandingPadBlockLogic,
}

declare LedBlockLogic: {
    --- Trying to cast Object into LedBlockLogic
    cast: (object: Object) -> LedBlockLogic,
    --- Return LedBlockLogic class object
    get_class: () -> Class,
    --- Creates a new LedBlockLogic instance
    new: (parent: Object, name: string) -> LedBlockLogic,
    --- Creates a new LedBlockLogic instance
    new_simple: () -> LedBlockLogic,
}

declare LoaderBaseBlockLogic: {
    --- Trying to cast Object into LoaderBaseBlockLogic
    cast: (object: Object) -> LoaderBaseBlockLogic,
    --- Return LoaderBaseBlockLogic class object
    get_class: () -> Class,
    --- Creates a new LoaderBaseBlockLogic instance
    new: (parent: Object, name: string) -> LoaderBaseBlockLogic,
    --- Creates a new LoaderBaseBlockLogic instance
    new_simple: () -> LoaderBaseBlockLogic,
}

declare Loc: {
    --- Create new Loc object
    new: (key: string, table: string) -> Loc,
    --- Create new Loc object substituting a ready text into the line
    text: (key: string, table: string, value: string) -> Loc,
    --- Resolve key value to localized string
    get: (key: string, table: string) -> string,
    --- Localized line with {0}, {1}... filled in order and its tokens left for ui.Text
    format: (key: string, table: string, args: { any }) -> string,
    --- Get number as string for GUI (3000 -> 3.0k)
    gui_number: (value: number) -> string,
}

declare LocData: {
    --- Set non localized data value by key
    set: (key: string, value: string) -> (),
}

declare LogicDecider: {
    --- Trying to cast Object into LogicDecider
    cast: (object: Object) -> LogicDecider,
    --- Return LogicDecider class object
    get_class: () -> Class,
    --- Creates a new LogicDecider instance
    new: (parent: Object, name: string) -> LogicDecider,
    --- Creates a new LogicDecider instance
    new_simple: () -> LogicDecider,
}

declare LogicExportOption: {
    --- Trying to cast Object into LogicExportOption
    cast: (object: Object) -> LogicExportOption,
    --- Return LogicExportOption class object
    get_class: () -> Class,
    --- Looks LogicExportOption up in db, nil when there is none
    find: (name: string) -> LogicExportOption,
    --- Takes LogicExportOption from db, reports a miss to the log
    get: (name: string) -> LogicExportOption,
    --- Register a new LogicExportOption static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: LogicExportOption_spec?) -> LogicExportOption,
}

declare LogicImportOption: {
    --- Trying to cast Object into LogicImportOption
    cast: (object: Object) -> LogicImportOption,
    --- Return LogicImportOption class object
    get_class: () -> Class,
    --- Looks LogicImportOption up in db, nil when there is none
    find: (name: string) -> LogicImportOption,
    --- Takes LogicImportOption from db, reports a miss to the log
    get: (name: string) -> LogicImportOption,
    --- Register a new LogicImportOption static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: LogicImportOption_spec?) -> LogicImportOption,
}

declare LogicSettings: {
    --- Trying to cast Object into LogicSettings
    cast: (object: Object) -> LogicSettings,
    --- Return LogicSettings class object
    get_class: () -> Class,
    --- Creates a new LogicSettings instance
    new: (parent: Object, name: string) -> LogicSettings,
    --- Creates a new LogicSettings instance
    new_simple: () -> LogicSettings,
}

declare LuaWorldGenerator: {
    --- Trying to cast Object into LuaWorldGenerator
    cast: (object: Object) -> LuaWorldGenerator,
    --- Return LuaWorldGenerator class object
    get_class: () -> Class,
    --- Looks LuaWorldGenerator up in db, nil when there is none
    find: (name: string) -> LuaWorldGenerator,
    --- Takes LuaWorldGenerator from db, reports a miss to the log
    get: (name: string) -> LuaWorldGenerator,
    --- Register a new LuaWorldGenerator static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: LuaWorldGenerator_spec?) -> LuaWorldGenerator,
}

declare MapStructure: {
    --- Create new instance of MapStructure
    new: () -> MapStructure,
}

declare Material: {
    --- Load a material asset
    load: (path: string) -> Material,
}

declare NoiseGenerator: {
    --- Trying to cast Object into NoiseGenerator
    cast: (object: Object) -> NoiseGenerator,
    --- Return NoiseGenerator class object
    get_class: () -> Class,
    --- Looks NoiseGenerator up in db, nil when there is none
    find: (name: string) -> NoiseGenerator,
    --- Takes NoiseGenerator from db, reports a miss to the log
    get: (name: string) -> NoiseGenerator,
    --- Register a new NoiseGenerator static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: NoiseGenerator_spec?) -> NoiseGenerator,
}

declare Object: {
    --- Find an already loaded object by name
    find: (name: string) -> Object,
    --- Trying to cast Object into Object
    cast: (object: Object) -> Object,
    --- Return Object class object
    get_class: () -> Class,
}

declare OreVeinTarget: {
    --- Create new instance of OreVeinTarget
    new: () -> OreVeinTarget,
}

declare Player: {
    --- The local player, nil outside a game session
    get: () -> Player,
}

declare PropListData: {
    --- Create new instance of PropListData
    new: () -> PropListData,
}

declare Pumpjack: {
    --- Trying to cast Object into Pumpjack
    cast: (object: Object) -> Pumpjack,
    --- Return Pumpjack class object
    get_class: () -> Class,
    --- Creates a new Pumpjack instance
    new: (parent: Object, name: string) -> Pumpjack,
    --- Creates a new Pumpjack instance
    new_simple: () -> Pumpjack,
}

declare QuestObjective: {
    --- Trying to cast Object into QuestObjective
    cast: (object: Object) -> QuestObjective,
    --- Return QuestObjective class object
    get_class: () -> Class,
    --- Creates a new QuestObjective instance
    new: (parent: Object, name: string) -> QuestObjective,
    --- Creates a new QuestObjective instance
    new_simple: () -> QuestObjective,
}

declare Recipe: {
    --- Trying to cast Object into Recipe
    cast: (object: Object) -> Recipe,
    --- Return Recipe class object
    get_class: () -> Class,
    --- Looks Recipe up in db, nil when there is none
    find: (name: string) -> Recipe,
    --- Takes Recipe from db, reports a miss to the log
    get: (name: string) -> Recipe,
    --- Register a new Recipe static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: Recipe_spec?) -> Recipe,
}

declare RecipeDictionary: {
    --- Trying to cast Object into RecipeDictionary
    cast: (object: Object) -> RecipeDictionary,
    --- Return RecipeDictionary class object
    get_class: () -> Class,
    --- Looks RecipeDictionary up in db, nil when there is none
    find: (name: string) -> RecipeDictionary,
    --- Takes RecipeDictionary from db, reports a miss to the log
    get: (name: string) -> RecipeDictionary,
    --- Register a new RecipeDictionary static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: RecipeDictionary_spec?) -> RecipeDictionary,
}

declare RecipeInventory: {
    --- Trying to cast Object into RecipeInventory
    cast: (object: Object) -> RecipeInventory,
    --- Return RecipeInventory class object
    get_class: () -> Class,
    --- Creates a new RecipeInventory instance
    new: (parent: Object, name: string) -> RecipeInventory,
    --- Creates a new RecipeInventory instance
    new_simple: () -> RecipeInventory,
}

declare RecipeItemData: {
    --- Create default slot metadata: consumed or produced every craft, machine slot size
    new: () -> RecipeItemData,
}

declare Region: {
    --- Trying to cast Object into Region
    cast: (object: Object) -> Region,
    --- Return Region class object
    get_class: () -> Class,
    --- Creates a new Region instance
    new: (parent: Object, name: string) -> Region,
    --- Creates a new Region instance
    new_simple: () -> Region,
}

declare RegionMap: {
    --- Convert Block World position to the RegionMap grid cell containing it
    world_block_to_grid: (bpos: Vec3i) -> Vec2i,
    --- Trying to cast Object into RegionMap
    cast: (object: Object) -> RegionMap,
    --- Return RegionMap class object
    get_class: () -> Class,
    --- Creates a new RegionMap instance
    new: (parent: Object, name: string) -> RegionMap,
    --- Creates a new RegionMap instance
    new_simple: () -> RegionMap,
}

declare ResourceAccessor: {
    --- Trying to cast Object into ResourceAccessor
    cast: (object: Object) -> ResourceAccessor,
    --- Return ResourceAccessor class object
    get_class: () -> Class,
    --- Creates a new ResourceAccessor attached to a block
    new: (parent: BlockLogic, name: string) -> ResourceAccessor,
}

declare ResourceInventory: {
    --- Trying to cast Object into ResourceInventory
    cast: (object: Object) -> ResourceInventory,
    --- Return ResourceInventory class object
    get_class: () -> Class,
    --- Creates a new ResourceInventory instance
    new: (parent: Object, name: string) -> ResourceInventory,
    --- Creates a new ResourceInventory instance
    new_simple: () -> ResourceInventory,
}

declare Rotator: {
    --- (0, 0, 0)
    zero: Rotator,
    --- Create a rotator, note the roll, pitch, yaw argument order
    new: (roll: number, pitch: number, yaw: number) -> Rotator,
}

declare SelectCrafter: {
    --- Trying to cast Object into SelectCrafter
    cast: (object: Object) -> SelectCrafter,
    --- Return SelectCrafter class object
    get_class: () -> Class,
    --- Creates a new SelectCrafter instance
    new: (parent: Object, name: string) -> SelectCrafter,
    --- Creates a new SelectCrafter instance
    new_simple: () -> SelectCrafter,
}

declare Setting: {
    --- Refresh every settings widget from the current values
    update_widgets: () -> (),
    --- Trying to cast Object into Setting
    cast: (object: Object) -> Setting,
    --- Return Setting class object
    get_class: () -> Class,
    --- Looks Setting up in db, nil when there is none
    find: (name: string) -> Setting,
    --- Takes Setting from db, reports a miss to the log
    get: (name: string) -> Setting,
    --- Register a new Setting static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: Setting_spec?) -> Setting,
}

declare SingleRecipeCrafter: {
    --- Trying to cast Object into SingleRecipeCrafter
    cast: (object: Object) -> SingleRecipeCrafter,
    --- Return SingleRecipeCrafter class object
    get_class: () -> Class,
    --- Creates a new SingleRecipeCrafter instance
    new: (parent: Object, name: string) -> SingleRecipeCrafter,
    --- Creates a new SingleRecipeCrafter instance
    new_simple: () -> SingleRecipeCrafter,
}

declare SingleSlotInventory: {
    --- Trying to cast Object into SingleSlotInventory
    cast: (object: Object) -> SingleSlotInventory,
    --- Return SingleSlotInventory class object
    get_class: () -> Class,
    --- Creates a new SingleSlotInventory instance
    new: (parent: Object, name: string) -> SingleSlotInventory,
    --- Creates a new SingleSlotInventory instance
    new_simple: () -> SingleSlotInventory,
}

declare SoundClass: {
    --- Load a sound class asset
    load: (path: string) -> SoundClass,
}

declare SourceData: {
    --- Trying to cast Object into SourceData
    cast: (object: Object) -> SourceData,
    --- Return SourceData class object
    get_class: () -> Class,
    --- Creates a new SourceData instance
    new: (parent: Object, name: string) -> SourceData,
    --- Creates a new SourceData instance
    new_simple: () -> SourceData,
}

declare SplitterBlockLogic: {
    --- Trying to cast Object into SplitterBlockLogic
    cast: (object: Object) -> SplitterBlockLogic,
    --- Return SplitterBlockLogic class object
    get_class: () -> Class,
    --- Creates a new SplitterBlockLogic instance
    new: (parent: Object, name: string) -> SplitterBlockLogic,
    --- Creates a new SplitterBlockLogic instance
    new_simple: () -> SplitterBlockLogic,
}

declare SpotlightBlockLogic: {
    --- Trying to cast Object into SpotlightBlockLogic
    cast: (object: Object) -> SpotlightBlockLogic,
    --- Return SpotlightBlockLogic class object
    get_class: () -> Class,
    --- Creates a new SpotlightBlockLogic instance
    new: (parent: Object, name: string) -> SpotlightBlockLogic,
    --- Creates a new SpotlightBlockLogic instance
    new_simple: () -> SpotlightBlockLogic,
}

declare StackedContainerBlockLogic: {
    --- Trying to cast Object into StackedContainerBlockLogic
    cast: (object: Object) -> StackedContainerBlockLogic,
    --- Return StackedContainerBlockLogic class object
    get_class: () -> Class,
    --- Creates a new StackedContainerBlockLogic instance
    new: (parent: Object, name: string) -> StackedContainerBlockLogic,
    --- Creates a new StackedContainerBlockLogic instance
    new_simple: () -> StackedContainerBlockLogic,
}

declare StaticAchievement: {
    --- Trying to cast Object into StaticAchievement
    cast: (object: Object) -> StaticAchievement,
    --- Return StaticAchievement class object
    get_class: () -> Class,
    --- Looks StaticAchievement up in db, nil when there is none
    find: (name: string) -> StaticAchievement,
    --- Takes StaticAchievement from db, reports a miss to the log
    get: (name: string) -> StaticAchievement,
    --- Register a new StaticAchievement static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticAchievement_spec?) -> StaticAchievement,
}

declare StaticBlock: {
    --- Trying to cast Object into StaticBlock
    cast: (object: Object) -> StaticBlock,
    --- Return StaticBlock class object
    get_class: () -> Class,
    --- Looks StaticBlock up in db, nil when there is none
    find: (name: string) -> StaticBlock,
    --- Takes StaticBlock from db, reports a miss to the log
    get: (name: string) -> StaticBlock,
    --- Register a new StaticBlock static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticBlock_spec?) -> StaticBlock,
}

declare StaticChapter: {
    --- Trying to cast Object into StaticChapter
    cast: (object: Object) -> StaticChapter,
    --- Return StaticChapter class object
    get_class: () -> Class,
    --- Looks StaticChapter up in db, nil when there is none
    find: (name: string) -> StaticChapter,
    --- Takes StaticChapter from db, reports a miss to the log
    get: (name: string) -> StaticChapter,
    --- Register a new StaticChapter static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticChapter_spec?) -> StaticChapter,
}

declare StaticCover: {
    --- Trying to cast Object into StaticCover
    cast: (object: Object) -> StaticCover,
    --- Return StaticCover class object
    get_class: () -> Class,
    --- Looks StaticCover up in db, nil when there is none
    find: (name: string) -> StaticCover,
    --- Takes StaticCover from db, reports a miss to the log
    get: (name: string) -> StaticCover,
    --- Register a new StaticCover static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticCover_spec?) -> StaticCover,
}

declare StaticCoverSet: {
    --- Trying to cast Object into StaticCoverSet
    cast: (object: Object) -> StaticCoverSet,
    --- Return StaticCoverSet class object
    get_class: () -> Class,
    --- Looks StaticCoverSet up in db, nil when there is none
    find: (name: string) -> StaticCoverSet,
    --- Takes StaticCoverSet from db, reports a miss to the log
    get: (name: string) -> StaticCoverSet,
    --- Register a new StaticCoverSet static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticCoverSet_spec?) -> StaticCoverSet,
}

declare StaticItem: {
    --- Trying to cast Object into StaticItem
    cast: (object: Object) -> StaticItem,
    --- Return StaticItem class object
    get_class: () -> Class,
    --- Looks StaticItem up in db, nil when there is none
    find: (name: string) -> StaticItem,
    --- Takes StaticItem from db, reports a miss to the log
    get: (name: string) -> StaticItem,
    --- Register a new StaticItem static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticItem_spec?) -> StaticItem,
}

declare StaticItemPanel: {
    --- Trying to cast Object into StaticItemPanel
    cast: (object: Object) -> StaticItemPanel,
    --- Return StaticItemPanel class object
    get_class: () -> Class,
    --- Looks StaticItemPanel up in db, nil when there is none
    find: (name: string) -> StaticItemPanel,
    --- Takes StaticItemPanel from db, reports a miss to the log
    get: (name: string) -> StaticItemPanel,
    --- Register a new StaticItemPanel static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticItemPanel_spec?) -> StaticItemPanel,
}

declare StaticMesh: {
    --- Load a static mesh asset
    load: (path: string) -> StaticMesh,
}

declare StaticModifier: {
    --- Trying to cast Object into StaticModifier
    cast: (object: Object) -> StaticModifier,
    --- Return StaticModifier class object
    get_class: () -> Class,
    --- Looks StaticModifier up in db, nil when there is none
    find: (name: string) -> StaticModifier,
    --- Takes StaticModifier from db, reports a miss to the log
    get: (name: string) -> StaticModifier,
    --- Register a new StaticModifier static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticModifier_spec?) -> StaticModifier,
}

declare StaticObject: {
    --- Trying to cast Object into StaticObject
    cast: (object: Object) -> StaticObject,
    --- Return StaticObject class object
    get_class: () -> Class,
    --- Looks StaticObject up in db, nil when there is none
    find: (name: string) -> StaticObject,
    --- Takes StaticObject from db, reports a miss to the log
    get: (name: string) -> StaticObject,
}

declare StaticOreVein: {
    --- Trying to cast Object into StaticOreVein
    cast: (object: Object) -> StaticOreVein,
    --- Return StaticOreVein class object
    get_class: () -> Class,
    --- Looks StaticOreVein up in db, nil when there is none
    find: (name: string) -> StaticOreVein,
    --- Takes StaticOreVein from db, reports a miss to the log
    get: (name: string) -> StaticOreVein,
    --- Register a new StaticOreVein static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticOreVein_spec?) -> StaticOreVein,
}

declare StaticPlanet: {
    --- Trying to cast Object into StaticPlanet
    cast: (object: Object) -> StaticPlanet,
    --- Return StaticPlanet class object
    get_class: () -> Class,
    --- Looks StaticPlanet up in db, nil when there is none
    find: (name: string) -> StaticPlanet,
    --- Takes StaticPlanet from db, reports a miss to the log
    get: (name: string) -> StaticPlanet,
    --- Register a new StaticPlanet static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticPlanet_spec?) -> StaticPlanet,
}

declare StaticPlayer: {
    --- Trying to cast Object into StaticPlayer
    cast: (object: Object) -> StaticPlayer,
    --- Return StaticPlayer class object
    get_class: () -> Class,
    --- Looks StaticPlayer up in db, nil when there is none
    find: (name: string) -> StaticPlayer,
    --- Takes StaticPlayer from db, reports a miss to the log
    get: (name: string) -> StaticPlayer,
    --- Register a new StaticPlayer static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticPlayer_spec?) -> StaticPlayer,
}

declare StaticProp: {
    --- Trying to cast Object into StaticProp
    cast: (object: Object) -> StaticProp,
    --- Return StaticProp class object
    get_class: () -> Class,
    --- Looks StaticProp up in db, nil when there is none
    find: (name: string) -> StaticProp,
    --- Takes StaticProp from db, reports a miss to the log
    get: (name: string) -> StaticProp,
    --- Register a new StaticProp static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticProp_spec?) -> StaticProp,
}

declare StaticPropList: {
    --- Trying to cast Object into StaticPropList
    cast: (object: Object) -> StaticPropList,
    --- Return StaticPropList class object
    get_class: () -> Class,
    --- Looks StaticPropList up in db, nil when there is none
    find: (name: string) -> StaticPropList,
    --- Takes StaticPropList from db, reports a miss to the log
    get: (name: string) -> StaticPropList,
    --- Register a new StaticPropList static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticPropList_spec?) -> StaticPropList,
}

declare StaticQuest: {
    --- Trying to cast Object into StaticQuest
    cast: (object: Object) -> StaticQuest,
    --- Return StaticQuest class object
    get_class: () -> Class,
    --- Looks StaticQuest up in db, nil when there is none
    find: (name: string) -> StaticQuest,
    --- Takes StaticQuest from db, reports a miss to the log
    get: (name: string) -> StaticQuest,
    --- Register a new StaticQuest static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticQuest_spec?) -> StaticQuest,
}

declare StaticResearch: {
    --- Trying to cast Object into StaticResearch
    cast: (object: Object) -> StaticResearch,
    --- Return StaticResearch class object
    get_class: () -> Class,
    --- Looks StaticResearch up in db, nil when there is none
    find: (name: string) -> StaticResearch,
    --- Takes StaticResearch from db, reports a miss to the log
    get: (name: string) -> StaticResearch,
}

declare StaticResearchBonusInventory: {
    --- Trying to cast Object into StaticResearchBonusInventory
    cast: (object: Object) -> StaticResearchBonusInventory,
    --- Return StaticResearchBonusInventory class object
    get_class: () -> Class,
    --- Looks StaticResearchBonusInventory up in db, nil when there is none
    find: (name: string) -> StaticResearchBonusInventory,
    --- Takes StaticResearchBonusInventory from db, reports a miss to the log
    get: (name: string) -> StaticResearchBonusInventory,
    --- Register a new StaticResearchBonusInventory static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticResearchBonusInventory_spec?) -> StaticResearchBonusInventory,
}

declare StaticResearchDecorationUnlock: {
    --- Trying to cast Object into StaticResearchDecorationUnlock
    cast: (object: Object) -> StaticResearchDecorationUnlock,
    --- Return StaticResearchDecorationUnlock class object
    get_class: () -> Class,
    --- Looks StaticResearchDecorationUnlock up in db, nil when there is none
    find: (name: string) -> StaticResearchDecorationUnlock,
    --- Takes StaticResearchDecorationUnlock from db, reports a miss to the log
    get: (name: string) -> StaticResearchDecorationUnlock,
    --- Register a new StaticResearchDecorationUnlock static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticResearchDecorationUnlock_spec?) -> StaticResearchDecorationUnlock,
}

declare StaticResearchEfficiency: {
    --- Trying to cast Object into StaticResearchEfficiency
    cast: (object: Object) -> StaticResearchEfficiency,
    --- Return StaticResearchEfficiency class object
    get_class: () -> Class,
    --- Looks StaticResearchEfficiency up in db, nil when there is none
    find: (name: string) -> StaticResearchEfficiency,
    --- Takes StaticResearchEfficiency from db, reports a miss to the log
    get: (name: string) -> StaticResearchEfficiency,
    --- Register a new StaticResearchEfficiency static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticResearchEfficiency_spec?) -> StaticResearchEfficiency,
}

declare StaticResearchModifier: {
    --- Trying to cast Object into StaticResearchModifier
    cast: (object: Object) -> StaticResearchModifier,
    --- Return StaticResearchModifier class object
    get_class: () -> Class,
    --- Looks StaticResearchModifier up in db, nil when there is none
    find: (name: string) -> StaticResearchModifier,
    --- Takes StaticResearchModifier from db, reports a miss to the log
    get: (name: string) -> StaticResearchModifier,
    --- Register a new StaticResearchModifier static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticResearchModifier_spec?) -> StaticResearchModifier,
}

declare StaticResearchRecipe: {
    --- Trying to cast Object into StaticResearchRecipe
    cast: (object: Object) -> StaticResearchRecipe,
    --- Return StaticResearchRecipe class object
    get_class: () -> Class,
    --- Looks StaticResearchRecipe up in db, nil when there is none
    find: (name: string) -> StaticResearchRecipe,
    --- Takes StaticResearchRecipe from db, reports a miss to the log
    get: (name: string) -> StaticResearchRecipe,
    --- Register a new StaticResearchRecipe static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticResearchRecipe_spec?) -> StaticResearchRecipe,
}

declare StaticResearchToolUnlock: {
    --- Trying to cast Object into StaticResearchToolUnlock
    cast: (object: Object) -> StaticResearchToolUnlock,
    --- Return StaticResearchToolUnlock class object
    get_class: () -> Class,
    --- Looks StaticResearchToolUnlock up in db, nil when there is none
    find: (name: string) -> StaticResearchToolUnlock,
    --- Takes StaticResearchToolUnlock from db, reports a miss to the log
    get: (name: string) -> StaticResearchToolUnlock,
    --- Register a new StaticResearchToolUnlock static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticResearchToolUnlock_spec?) -> StaticResearchToolUnlock,
}

declare StaticStructure: {
    --- Trying to cast Object into StaticStructure
    cast: (object: Object) -> StaticStructure,
    --- Return StaticStructure class object
    get_class: () -> Class,
    --- Looks StaticStructure up in db, nil when there is none
    find: (name: string) -> StaticStructure,
    --- Takes StaticStructure from db, reports a miss to the log
    get: (name: string) -> StaticStructure,
    --- Register a new StaticStructure static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticStructure_spec?) -> StaticStructure,
}

declare StaticTip: {
    --- Trying to cast Object into StaticTip
    cast: (object: Object) -> StaticTip,
    --- Return StaticTip class object
    get_class: () -> Class,
    --- Looks StaticTip up in db, nil when there is none
    find: (name: string) -> StaticTip,
    --- Takes StaticTip from db, reports a miss to the log
    get: (name: string) -> StaticTip,
    --- Register a new StaticTip static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticTip_spec?) -> StaticTip,
}

declare StaticWeather: {
    --- Trying to cast Object into StaticWeather
    cast: (object: Object) -> StaticWeather,
    --- Return StaticWeather class object
    get_class: () -> Class,
    --- Looks StaticWeather up in db, nil when there is none
    find: (name: string) -> StaticWeather,
    --- Takes StaticWeather from db, reports a miss to the log
    get: (name: string) -> StaticWeather,
    --- Register a new StaticWeather static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: StaticWeather_spec?) -> StaticWeather,
}

declare StorageBlockLogic: {
    --- Trying to cast Object into StorageBlockLogic
    cast: (object: Object) -> StorageBlockLogic,
    --- Return StorageBlockLogic class object
    get_class: () -> Class,
    --- Creates a new StorageBlockLogic instance
    new: (parent: Object, name: string) -> StorageBlockLogic,
    --- Creates a new StorageBlockLogic instance
    new_simple: () -> StorageBlockLogic,
}

declare SurfaceDefinition: {
    --- Trying to cast Object into SurfaceDefinition
    cast: (object: Object) -> SurfaceDefinition,
    --- Return SurfaceDefinition class object
    get_class: () -> Class,
    --- Creates a new SurfaceDefinition instance
    new: (parent: Object, name: string) -> SurfaceDefinition,
    --- Creates a new SurfaceDefinition instance
    new_simple: () -> SurfaceDefinition,
}

declare Tesselator: {
    --- Trying to cast Object into Tesselator
    cast: (object: Object) -> Tesselator,
    --- Return Tesselator class object
    get_class: () -> Class,
    --- Looks Tesselator up in db, nil when there is none
    find: (name: string) -> Tesselator,
    --- Takes Tesselator from db, reports a miss to the log
    get: (name: string) -> Tesselator,
    --- Register a new Tesselator static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: Tesselator_spec?) -> Tesselator,
}

declare TesselatorCube: {
    --- Trying to cast Object into TesselatorCube
    cast: (object: Object) -> TesselatorCube,
    --- Return TesselatorCube class object
    get_class: () -> Class,
    --- Looks TesselatorCube up in db, nil when there is none
    find: (name: string) -> TesselatorCube,
    --- Takes TesselatorCube from db, reports a miss to the log
    get: (name: string) -> TesselatorCube,
    --- Register a new TesselatorCube static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: TesselatorCube_spec?) -> TesselatorCube,
}

declare TesselatorMarching: {
    --- Trying to cast Object into TesselatorMarching
    cast: (object: Object) -> TesselatorMarching,
    --- Return TesselatorMarching class object
    get_class: () -> Class,
    --- Looks TesselatorMarching up in db, nil when there is none
    find: (name: string) -> TesselatorMarching,
    --- Takes TesselatorMarching from db, reports a miss to the log
    get: (name: string) -> TesselatorMarching,
    --- Register a new TesselatorMarching static object, or take the registered one of that name Load-only: pre_init, init or post_init.
    reg: (name: string, spec: TesselatorMarching_spec?) -> TesselatorMarching,
}

declare Texture: {
    --- Find a loaded texture by name
    find: (name: string) -> Texture2D,
    --- Load a texture asset
    load: (path: string) -> Texture2D,
}

declare Train: {
    --- Trying to cast Object into Train
    cast: (object: Object) -> Train,
    --- Return Train class object
    get_class: () -> Class,
    --- Creates a new Train instance
    new: (parent: Object, name: string) -> Train,
    --- Creates a new Train instance
    new_simple: () -> Train,
}

declare TrainScheduleStop: {
    --- Trying to cast Object into TrainScheduleStop
    cast: (object: Object) -> TrainScheduleStop,
    --- Return TrainScheduleStop class object
    get_class: () -> Class,
    --- Creates a new TrainScheduleStop instance
    new: (parent: Object, name: string) -> TrainScheduleStop,
    --- Creates a new TrainScheduleStop instance
    new_simple: () -> TrainScheduleStop,
}

declare Transform: {
    --- Create an identity transform
    new: () -> Transform,
}

declare Vec2i: {
    --- (0, 0)
    zero: Vec2i,
    --- (1, 1)
    one: Vec2i,
    --- Create a vector from components
    new: (x: number, y: number) -> Vec2i,
}

declare Vec3: {
    --- (1, 1, 1)
    one: Vec3,
    --- (0, 0, 0)
    zero: Vec3,
    --- (0, 0, 1)
    up: Vec3,
    --- (0, 0, -1)
    down: Vec3,
    --- (0, 1, 0)
    left: Vec3,
    --- (0, -1, 0)
    right: Vec3,
    --- (-1, 0, 0)
    back: Vec3,
    --- (1, 0, 0)
    front: Vec3,
    --- Create a vector from components
    new: (x: number, y: number, z: number) -> Vec3,
    --- Create a vector with all components equal
    repeating: (x: number) -> Vec3,
}

declare Vec3i: {
    --- (1, 1, 1)
    one: Vec3i,
    --- (0, 0, 0)
    zero: Vec3i,
    --- (0, 0, 1)
    up: Vec3i,
    --- (0, 0, -1)
    down: Vec3i,
    --- (0, 1, 0)
    left: Vec3i,
    --- (0, -1, 0)
    right: Vec3i,
    --- (-1, 0, 0)
    back: Vec3i,
    --- (1, 0, 0)
    front: Vec3i,
    --- Create a vector from components
    new: (x: number, y: number, z: number) -> Vec3i,
}

declare WorldGenerator: {
    --- Trying to cast Object into WorldGenerator
    cast: (object: Object) -> WorldGenerator,
    --- Return WorldGenerator class object
    get_class: () -> Class,
    --- Looks WorldGenerator up in db, nil when there is none
    find: (name: string) -> WorldGenerator,
    --- Takes WorldGenerator from db, reports a miss to the log
    get: (name: string) -> WorldGenerator,
}

--- Block, sector and world coordinate conversions
declare cs: {
    --- Sector dimensions in blocks
    sector_size: Vec3i,
    --- Convert a block position to a sector position
    bp2sp: (bpos: Vec3i) -> Vec3i,
    --- Convert a world position to a block position
    w2bp: (world: Vec3) -> Vec3i,
    --- Convert a block position to a world position
    bp2w: (bpos: Vec3i) -> Vec3,
    --- Convert a world position to a sector position
    w2sp: (world: Vec3) -> Vec3i,
}

declare defines: {
    --- Values BlockLogic.state takes
    block_state: {
        --- An input item is missing
        input_shortage: number,
        --- Working
        working: number,
        --- The output has no room for the result
        no_room_in_output: number,
        --- Nothing takes the energy it gives
        resource_saturated: number,
        --- Not enough energy comes in
        resource_required: number,
        --- Has not run yet
        not_initialized: number,
        --- Switched off
        switch_off: number,
        --- Nothing to do
        idle: number,
    },
    --- Identifiers of the gameplay events the event bus can emit
    events: {
        --- Player mined an item. Context: { item, count }
        on_player_mined_item: number,
        --- Block was built. Context: { block, position }, position in block cells
        on_built_block: number,
        --- Player pawn entered the world
        on_player_spawn: number,
        --- World region was generated
        on_region_spawn: number,
        --- Player crossed into another sector
        on_player_at_sector: number,
        --- Entity died
        on_entity_died: number,
        --- Entity took damage
        on_entity_damaged: number,
        --- Entity spawned
        on_entity_spawn: number,
        --- Day phase changed. Context: { anchor }, "dawn" or "sunset"
        on_surface_day_phase: number,
        --- Research completed. Context: { research }
        on_research_finished: number,
        --- Quest became active. Context: { quest }
        on_quest_activated: number,
        --- Player finished a hand craft. Context: { item, count }, one per output
        on_player_crafted: number,
        --- A window was opened. Context: { gui }, "inventory", "research", "map", "questbook", "pause", "spawn", "saves", "tips", "blueprints", "trains", "production" or "decor"
        on_gui_opened: number,
        --- A window was closed. Context: { gui, any_open }, gui named as in on_gui_opened; any_open is false when the window that closed was the last one
        on_gui_closed: number,
        --- Player typed into the item database search. Context: { text, items }, items lists what the search found
        on_item_searched: number,
        --- Recipe window showed an item. Context: { item }
        on_recipes_shown: number,
    },
    --- Values StaticQuest.state takes
    quest_state: {
        --- Prerequisites are not met yet
        locked: number,
        --- Unlocked and tracked
        active: number,
        --- Every objective is done
        completed: number,
    },
}

--- The player's own heads-up display
declare hud: {
    --- Put a toggle of this mod's own into the player's control bar, where it can be reordered and hidden like the built-in ones
    add_toggle: (spec: { [any]: any }) -> boolean,
}

--- Simulation tick scheduler
declare sim: {
    --- Current simulation tick of the running session
    tick: () -> number,
    --- Call a handler once at an absolute tick, returns the cancellation handle
    at: (due_tick: number, handler: (...any) -> ...any) -> number,
    --- Call a handler once after a delay, returns the cancellation handle
    after: (delay_ticks: number, handler: (...any) -> ...any) -> number,
    --- Call a handler on a repeating interval, returns the cancellation handle
    every: (interval_ticks: number, handler: (...any) -> ...any) -> number,
    --- Cancel a scheduled callback
    cancel: (handle: number) -> boolean,
}

declare ui: {
    --- Picture from a png file in the calling mod's folder for ui.Image, loaded once; a picture under 64 pixels is drawn without smoothing
    texture: (path: string) -> Texture2D?,
    --- Rendered picture of a block for ui.Image, made once and kept; nil where nothing can be rendered
    thumbnail: (block: StaticBlock) -> RenderTexture?,
    --- Plate drawn behind one child; padding is kept inside the plate
    Border: ((spec: ui_Border_props) -> ui_Border),
    --- Button around one child; padding is kept inside the button
    Button: ((spec: ui_Button_props | ((...any) -> ...any)?) -> ui_Button),
    --- Grid of equal cells, filled row by row
    Grid: ((spec: ui_Grid_props) -> ui_Grid),
    --- Row of children laid out left to right
    HBox: ((spec: ui_HBox_props) -> ui_HBox),
    --- Picture of a texture, 64 by 64 unless its width and height say otherwise
    Image: ((spec: ui_Image_props) -> ui_Image),
    --- Grid of item slots showing an inventory with the game's own slot widget
    Inventory: ((spec: ui_Inventory_props) -> ui_Inventory),
    --- Vertical list that scrolls instead of overflowing
    Scroll: ((spec: ui_Scroll_props) -> ui_Scroll),
    --- Empty space as wide and tall as its width and height
    Spacer: ((spec: ui_Spacer_props) -> ui_Spacer),
    --- Text the way the game's descriptions read: tokens such as {item:Name} become links with icons, <blue>, <yellow>, <red> and <green> tint a run
    Text: ((spec: ui_Text_props | string) -> ui_Text),
    --- Single line the player types into
    TextBox: ((spec: ui_TextBox_props) -> ui_TextBox),
    --- Column of children laid out top to bottom
    VBox: ((spec: ui_VBox_props) -> ui_VBox),
    --- Top level window with a title bar the player can drag it by; its width and height size the window, its padding is kept around the content
    Window: ((spec: ui_Window_props | string) -> ui_Window),
}

--- Runtime weather control
declare weather: {
    --- Transition naturally to a StaticWeather preset by name
    set: (name: string) -> boolean,
    --- Immediately snap to a StaticWeather preset by name
    snap: (name: string) -> boolean,
    --- Clear the explicit preset and the wind override, and immediately restore biome-driven weather
    clear: () -> boolean,
    --- Hold the wind speed at a fixed value, clamped to the planet maximum of 20
    wind: (speed: number) -> boolean,
    --- Release the wind override and let the surface environment drive the wind again
    wind_clear: () -> boolean,
}

--- Global game instance
declare game: Game

--- Global prototype database
declare db: DB

--- Global engine data
declare engine: Engine

--- Global music manager
declare music: Music

--- Global quest manager
declare quests: QuestSubsystem

declare LuaLogFlag: boolean?

--- Prints info to log
declare function print_info(message: string): ()

--- Prints error to log but do not breaks execution
declare function print_err(message: string): ()

--- Prints warning to log
declare function print_warn(message: string): ()

--- Dimension of the running session
declare dim: Dimension

--- This mod's table of the local player, kept in the save under the player's profile: booleans, numbers, strings, Vec3i and tables of them. nil outside a game session
declare storage: { [any]: any }?

--- Files of the calling mod, by a path relative to its folder
declare evo: {
    fs: {
        --- Text of the file, nil when there is none; a path leaving the mod folder is an error
        read: (path: string) -> string?,
        --- True when the file exists
        exists: (path: string) -> boolean,
    },
}

--- Column of a --!sim chunk: one 64-bit integer per block, indexed from 1
export type column = { number }

--- 64-bit integers of a --!sim chunk; outside one they are made with integer.create
declare integer: {
    maxsigned: number,
    minsigned: number,
    create: (value: number) -> number,
    tonumber: (value: number) -> number,
    fromstring: (text: string, base: number?) -> number?,
    neg: (a: number) -> number,
    add: (a: number, b: number) -> number,
    sub: (a: number, b: number) -> number,
    mul: (a: number, b: number) -> number,
    div: (a: number, b: number) -> number,
    idiv: (a: number, b: number) -> number,
    udiv: (a: number, b: number) -> number,
    rem: (a: number, b: number) -> number,
    urem: (a: number, b: number) -> number,
    mod: (a: number, b: number) -> number,
    min: (a: number, b: number) -> number,
    max: (a: number, b: number) -> number,
    clamp: (value: number, low: number, high: number) -> number,
    lt: (a: number, b: number) -> boolean,
    le: (a: number, b: number) -> boolean,
    gt: (a: number, b: number) -> boolean,
    ge: (a: number, b: number) -> boolean,
    ult: (a: number, b: number) -> boolean,
    ule: (a: number, b: number) -> boolean,
    ugt: (a: number, b: number) -> boolean,
    uge: (a: number, b: number) -> boolean,
    band: (a: number, b: number) -> number,
    bor: (a: number, b: number) -> number,
    bxor: (a: number, b: number) -> number,
    bnot: (a: number) -> number,
    btest: (a: number, b: number) -> boolean,
    lshift: (a: number, bits: number) -> number,
    rshift: (a: number, bits: number) -> number,
    arshift: (a: number, bits: number) -> number,
    lrotate: (a: number, bits: number) -> number,
    rrotate: (a: number, bits: number) -> number,
    extract: (a: number, field: number, width: number?) -> number,
    replace: (a: number, value: number, field: number, width: number?) -> number,
    countlz: (a: number) -> number,
    countrz: (a: number) -> number,
    bswap: (a: number) -> number,
}
