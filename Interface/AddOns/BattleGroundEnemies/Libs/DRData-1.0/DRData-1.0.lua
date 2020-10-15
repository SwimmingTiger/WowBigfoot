local major = "DRData-1.0"
local minor = 1050
assert(LibStub, string.format("%s requires LibStub.", major))

local Data = LibStub:NewLibrary(major, minor)
if( not Data ) then return end

local L = {
	-- WoD
	["Roots"]              = "Roots",
	["Stuns"]              = "Stuns",
	["Silences"]           = "Silences",
	["Taunts"]             = "Taunts",
	["Knockbacks"]         = "Knockbacks",
	["Incapacitates"]      = "Incapacitates",
	["Disorients"]         = "Disorients",
}

local locale = GetLocale()
if locale == "deDE" then
L["Allies"] = "Verbündete"
L["allies"] = "Verbündete"
L["ally"] = "Verbündeten"
L["Ally"] = "Verbündeter"
L["AllyJoined"] = "Ein Verbündeter hat das Schlachtfeld betreten"
L["AllyLeft"] = "Ein Verbündeter hat das Schlachtfeld verlassen"
L["AND"] = "und"
L["AttachToObject"] = "Anhängen an Objekt"
L["AttachToObject_Desc"] = "Beachte, dass nicht alle Objekte zur Befestigung sinnvoll bzw machbar sind. Wenn du beispielsweise versuchst die PvP-Talente an den Volksfähigkeiten befestigen möchtest und die Volksfähigkeiten an den PvP-Talenten befestigt sind, wird es eine Fehlermeldung geben."
L["Auras_Buffs_Container_Color_Desc"] = "Die Rahmenfarbe des Containers für die Stärkungszaubersymbole"
L["Auras_Buffs_Fontsize_Desc"] = "Die Schriftgröße der Stapel auf den Stärkungszaubersymbolen"
L["Auras_Buffs_ShowNumbers_Desc"] = "Falls diese Option aktiviert ist, werden Zahlen für die verbleibende Dauer des Stärkungszaubers angezeigt."
L["Auras_Buffs_Textcolor_Desc"] = "Die Schriftfarbe der Stapel der Stärkungszauber"
L["Auras_Debuffs_Coloring_Enabled"] = "Nach Schwächungszaubertyp färben"
L["Auras_Debuffs_Coloring_Enabled_Desc"] = "Wenn diese Option aktiviert ist, kannst du auswählen ob der Rahmen oder der Countdown-Text nach Schwächungszaubertyp gefärbt werden soll. (So wie es auch das Standard-UI macht; Gifte sind grün, Magie blau etc.)"
L["Auras_Debuffs_Container_Color_Desc"] = "Die Rahmenfarbe des Containers für die Schwächungszaubersymbole"
L["Auras_Debuffs_Fontsize_Desc"] = "Die Schriftgröße der Stapel auf den Schwächungszaubersymbolen"
L["Auras_Debuffs_ShowNumbers_Desc"] = "Falls diese Option aktiviert ist, werden Zahlen für die verbleibende Dauer des Schwächungszaubers angezeigt."
L["Auras_Debuffs_Textcolor_Desc"] = "Die Schriftfarbe der Stapel der Schwächungszauber"
L["Auras_Enabled"] = "Auren aktivieren"
L["Auras_Enabled_Desc"] = "Falls diese Option aktiviert ist, werden die Auren der Gegner angezeigt. Jede Aura zeigt die verbleibende Zeit und die momentane Anzahl der Stapel an."
L["Auras_Fontsize_Desc"] = "Die Schriftgröße der Stapel auf den Aurasymbolen"
L["Auras_ShowNumbers_Desc"] = "Falls diese Option aktiviert ist, werden Zahlen für die verbleibende Dauer der Aura angezeigt."
L["Auras_ShowTooltips"] = "Zaubertooltips anzeigen"
L["Auras_Textcolor_Desc"] = "Die Schriftfarbe der Stapel"
L["AurasFiltering_AddSpellID"] = "Zauber-ID"
L["AurasFiltering_AddSpellID_Desc"] = "Gib eine Zauber oder mehrere per Komma getrennte Zauber-IDs ein. Diese Zauber-IDs werden zu deiner Filterliste hinzugefügt. Nur Debuffs, deren Zauber-ID auf der Filterliste ist, werden angezeigt, wenn das Filtern aktiviert ist."
L["AurasFiltering_Enabled_Desc"] = "Wenn diese Option aktiviert ist, wirst du nur die %s sehen, die auf der Filterliste stehen."
L["AurasFiltering_Filterlist_Desc"] = "Klicken, um diesen %s zu entfernen"
L["AurasFilteringSettings_Desc"] = "Hier kannst du genauer einstellen, welche Auren angezeigt werden."
L["AurasSettings"] = "Auren"
L["AurasSettings_Desc"] = "Einstellungen für Auren (Stärkungs- und Schwächungszauber)"
L["AurasStacktextSettings"] = "Stapeltext"
L["BarBackground"] = "Hintergrundfarbe"
L["BarHeight_Desc"] = "Die Höher jeder Reihe. Diese Einstellung ist aufgrund Einschränkungen seitens Blizzards nicht im Kampf verfügbar."
L["BarSettings"] = "Balkeneinstellungen"
L["BarSettings_Desc"] = "Hier kannst du die einzelnen Reihen konfigurieren"
L["BarTexture"] = "Balkentextur"
L["BarWidth_Desc"] = "Die Breite jeder Reihe. Diese Einstellung ist aufgrund Einschränkungen seitens Blizzards nicht im Kampf verfügbar."
L["BattlegroundSize"] = "Schlachtfeldgröße"
L["BGSize_15"] = "1–15 Spieler"
L["BGSize_15_Desc"] = "Diese Einstellungen sind nur für %s in einem Schlachtfeld mit 1–15 Spielern pro Seite"
L["BGSize_40"] = "16–40 Spieler"
L["BGSize_40_Desc"] = "Diese Einstellungen sind nur für %s in einem Schlachtfeld mit 16–40 Spielern pro Seite"
L["BorderThickness"] = "Rahmengröße"
L["BOTTOM"] = "Unten"
L["BOTTOMLEFT"] = "Unten links"
L["BOTTOMRIGHT"] = "Unten rechts"
L["buff"] = "Stärkungszauber"
L["BuffContainer"] = "Stärkungszauber-Container"
L["BuffIcon"] = "Stärkungszaubersymbol"
L["Buffs"] = "Stärkungszauber"
L["Button"] = "Button"
L["CantAnchorToItself"] = "Kann nicht an sich selbst verankert werden!"
L["CENTER"] = "MItte"
L["Columns"] = "Spalten"
L["Columns_Desc"] = "In wieviele Spalten die Spieler unterteilt werden."
L["ConfirmProfileOverride"] = "Bist du sicher, dass du das Unterprofil %s mit dem Unterprofil %s unterschreiben willst?"
L["Container_Color"] = "Container-Rahmenfarbe"
L["ContainerPosition"] = "Containerposition"
L["ConvertCyrillic"] = "Kyrillisch umwandeln"
L["ConvertCyrillic_Desc"] = "Wandelt kyrillische Zeichen in lateinische Zeichen um. Dies macht es einfacher die Namen russischer Gegner auszusprechen."
L["Cooldown_Fontsize_Desc"] = "Die Schriftgröße für die Countdown-Zahlen auf den Anti-CC-Talenten"
L["CopySettings"] = "Kopiere Einstellungen von %s"
L["CopySettings_Desc"] = "Klicke hier, um die Einstellungen des Unterprofils %s zu importieren."
L["Countdowntext"] = "Countdown-Text"
L["Curse"] = "Fluch"
L["CustomMacro_Desc"] = [=[Hier kannst du ein benutzerdefiniertes Makro festlegen. Ein leeres Feld führt zu einem leeren Makro.
Verfügbare Ersetzungen: %n wird mit dem Gegnernamen ersetzt

Beispiel:
/targetexact %n
/cast Verwandlung
/say Verwandlung auf %n
/targetlasttarget

Dies nimmt den Gegner ins Ziel, wirkt Verwandlung auf ihn, schreibt eine Nachricht in den Sagen-Kanal und nimmt dein vorheriges Ziel ins Ziel.
Beachte, dass Makros nur 255 Zeichen lang sein dürfen (inklusive Ersetzungen).]=]
L["debuff"] = "Schwächungszauber"
L["DebuffContainer"] = "Schwächungszauber-Container"
L["DebuffIcon"] = "Schwächungszaubersymbol"
L["Debuffs"] = "Schwächungszauber"
L["DebuffType_Filtering"] = "Nach Schwächungszaubertyp filtern"
L["DebuffType_Filtering_Desc"] = "Wenn diese Option aktiviert ist werden nur Schwächungszauber des ausgewählten Typs dargestellt. Diese Option wird im Testmodus nicht simuliert, da diese eine große Datenbank mit allen Zaubern und ihren Schwächungszaubertypen benötigen würde."
L["DisableArenaFrames"] = "Arenafenster deaktivieren"
L["DisableArenaFrames_Desc"] = "Deaktiviert die Arenafenster in einem Schlachtfeld. Dies funktioniert ebenfalls wenn das Addon sArena installiert ist."
L["Disease"] = "Krankheit"
L["DisplayType"] = "Anzeigeart"
L["Downwards"] = "Nach unten"
L["DR_Disorient"] = "Desorientierung"
L["DR_Incapacitate"] = "Handlungsunfähigkeit"
L["DR_Knockback"] = "Rückstöße"
L["DR_Root"] = "Bewegungsunfähigkeit"
L["DR_Silence"] = "Stille"
L["DR_Stun"] = "Betäubungen"
L["DRContainer"] = "DR-Container"
L["DrTracking_Container_Color_Desc"] = "Die Rahmenfarbe des Containers für die DR-Symbole"
L["DrTracking_DisplayType_Desc"] = "Hier kannst du auswählen wie der DR-Status angezeigt werden soll. Er wird entweder mit einem farbigen Rahmen um das Symbol dargestellt oder mit der Textfarbe des Countdown-Textes. Beachte, dass die Einstellung Countdown-Text nur funktioniert, wenn du kein Addon installiert hast, das die Countdown-Texte verändert, wie z.B. OmniCC."
L["DrTracking_Enabled"] = "DR-Tracking aktivieren"
L["DrTracking_Enabled_Desc"] = "Wenn diese Option aktiviert ist, erscheinen Symbole neben den Balken der Gegner. Erklärung der Rahmenfarben der Symbole: Die Farben stehen für die Dauer des nächsten Kontrolleffekts auf dem Gegner. Grün: halbe Dauer. Gelb: viertel Dauer. Rot: keine Dauer (Gegner ist immun)"
L["DrTracking_ShowNumbers_Desc"] = "Zeigt die verbleibende Zeit bis zur vollen Dauer des nächsten Kontrolleffekts"
L["DrTracking_Spacing"] = "DR-Abstand"
L["DrTracking_Spacing_Desc"] = "Der Abstand der einzelnen DR-Symbole"
L["DrTrackingFiltering_Enabled_Desc"] = "Wenn diese Option aktiviert ist, wirst du nur die angehakten Kategorien sehen."
L["DrTrackingFiltering_Filterlist_Desc"] = "Klicken, um die Verfolgung dieser Kategorie zu aktivieren/deaktivieren."
L["DrTrackingFilteringSettings_Desc"] = "Hier kannst du einstellen, welche DR-Kategorien angezeigt werden sollen."
L["DrTrackingSettings"] = "DR-Tracking"
L["DrTrackingSettings_Desc"] = "Einstellungen für den DR-Tracker"
L["enemies"] = "Gegner"
L["Enemies"] = "Gegner"
L["enemy"] = "Gegner"
L["Enemy"] = "Gegner"
L["EnemyJoined"] = "Ein Gegner hat das Schlachtfeld betreten"
L["EnemyLeft"] = "Ein Gegner hat das Schlachtfeld verlassen"
L["Filtering_Enabled"] = "Filtern aktivieren"
L["Filtering_Filterlist"] = "Filterliste"
L["Font"] = "Schriftart"
L["Font_Desc"] = "Die Hauptschriftart dieses Addons"
L["Font_Outline"] = "Schriftkontur"
L["Font_Outline_Desc"] = "Der Umriss der Schrift"
L["Fontcolor"] = "Schriftfarbe"
L["FontShadow_Enabled"] = "Schriftschatten aktivieren"
L["FontShadow_Enabled_Desc"] = "Wenn diese Option aktiviert ist, erscheint ein Schatten um den Text. Du kannst die Farbe dieses Schattens wählen."
L["FontShadowColor"] = "Schattierungsfarbe"
L["FontShadowColor_Desc"] = "Die Farbe des Textschattens"
L["Fontsize"] = "Schriftgröße"
L["Frame"] = "Rahmen"
L["Framescale"] = "Skalierung"
L["Framescale_Desc"] = "Die Skalierung des Hauptrahmens. Diese Einstellung ist im Kampf aufgrund Einschränkungen seitens Blizzards nicht verfügbar."
L["General"] = "Allgemein"
L["GeneralSettings"] = "Allgemeine Einstellungen"
L["GeneralSettings_Desc"] = "Ein paar allgemeine Einstellungen"
L["GeneralSettingsAllies"] = "Diese Einstellungen werden für Verbündete verwendet, unabhängig von der Größe des Schlachtfelds"
L["GeneralSettingsEnemies"] = "Diese Einstellungen werden für Gegner verwendet, unabhängig von der Größe des Schlachtfelds"
L["HealthBar_Background_Desc"] = "Die Hintergrundfarbe des Gesundheitsbalkens."
L["HealthBar_Texture_Desc"] = "Die Textur, die für die Gesundheitsbalken verwendet wird"
L["HealthBarSettings"] = "Gesundheitsbalken"
L["HealthBarSettings_Desc"] = "Einstellungen für den Gesundheitsbalken und daran angebrachte Elemente wie der Namen oder der Zielzähler."
L["Height"] = "Höhe"
L["Highlight_Color"] = "Hervorhebungsfarbe"
L["Highlight_Color_Desc"] = "Die Farbe des Spielerbalkens, auf dem sich der Mauszeiger momentan befindet"
L["HorizontalGrowdirection"] = "Horizontale Ausbreitungsrichtung"
L["HorizontalGrowdirection_Desc"] = "Ob die Spalten sich nach links oder nach rechts erweitern sollen"
L["HorizontalSpacing"] = "Horizontaler Abstand"
L["IconsPerRow"] = "Symbole pro Reihe"
L["KeybindSettings_Desc"] = "Hier kannst du festlegen, was passieren soll, wenn du auf den Gegner mit der linken, rechten und mittleren Maustaste klickst."
L["LEFT"] = "Links"
L["LeftToTargetCounter"] = "Links neben dem Zielzähler"
L["Leftwards"] = "Nach links"
L["LevelText_Enabled"] = "Spielerstufe anzeigen"
L["LevelText_Fontsize_Desc"] = "Die Schriftgröße des Stufentexts"
L["LevelText_OnlyShowIfNotMaxLevel"] = "Nur anzeigen, falls nicht Maximalstufe"
L["LevelText_Textcolor_Desc"] = "Die Schriftfarbe des Stufentexts"
L["LevelTextSettings"] = "Spielerstufe"
L["Locked"] = "Fixieren"
L["Locked_Desc"] = "Macht den Rahmen unverschiebbar"
L["Magic"] = "Magie"
L["MainFrameSettings"] = "Hauptfenster-Einstellungen"
L["MainFrameSettings_Desc"] = "Einstellungen für das Hauptfenster, das für %s verwendet wird."
L["MaxPlayers"] = "Maximale Gegnerzahl"
L["MaxPlayers_Desc"] = "Das Addon zeigt keine Gegner an, falls die momentane Gegnerzahl größer als diese Zahl ist"
L["MyFocus_Color"] = "Fokusfarbe"
L["MyFocus_Color_Desc"] = "Die Farbe die für den Rahmen verwendet wird, falls du dieser Gegner dein Fokusziel ist"
L["MyTarget_Color"] = "Zielfarbe"
L["MyTarget_Color_Desc"] = "Die Farbe die für den Rahmen verwendet wird, falls du dieser Gegner im Ziel hast."
L["Name"] = "Name"
L["Name_Desc"] = "Einstellungen für die Namen auf dem Gesundheitsbalken"
L["Name_Fontsize_Desc"] = "Die Schriftgröße die für die Gegnernamen verwendet wird."
L["Name_Textcolor_Desc"] = "Die Farbe für die Gegnernamen"
L["None"] = "Keine"
L["Normal"] = "Normal"
L["NotAvailableInCombat"] = [=[
Diese Einstellung ist aufgrund Einschränkungen seitens Blizzards nicht im Kampf verfügbar.]=]
L["Notifications_Allies_Enabled_Desc"] = "Falls diese Option aktiviert ist, wirst du benachrichtigt, sobald ein Verbündeter das Schlachtfeld verlässt oder betritt."
L["Notifications_Enabled"] = "Benachrichtigungen aktivieren"
L["Notifications_Enemies_Enabled_Desc"] = "Falls diese Option aktiviert ist, wirst du benachrichtigt, sobald ein Gegner das Schlachtfeld verlässt oder betritt."
L["NumericTargetindicator"] = "Zielzähler"
L["NumericTargetindicator_Enabled_Desc"] = "Zeigt an wieviele %s diesen Gegner anvisieren"
L["NumericTargetindicator_Fontsize_Desc"] = "Die Schriftgröße für den Zielzähler"
L["NumericTargetindicator_Textcolor_Desc"] = "Die Schriftfarbe für den Zielzähler"
L["ObjectiveAndRespawn_Fontsize_Desc"] = "Die Schriftgröße des Schlachtfeldziel-Symbols. Der Text steht für die vorhandenen Stapel an Flaggen-Debuffs oder für die Erhöhung des erlittenen Schadens eines Kugelträgers im Tempel von Kotmugu."
L["ObjectiveAndRespawn_ObjectiveEnabled"] = "Schlachtfeldziel anzeigen"
L["ObjectiveAndRespawn_ObjectiveEnabled_Desc"] = "Zeigt Symbole für Flaggen-, Minenwagen- oder Kugelträger neben dem Gegner-Button an"
L["ObjectiveAndRespawn_Position"] = "Position"
L["ObjectiveAndRespawn_Position_Desc"] = "Hier kannst du einstellen, ob das Symbol links neben dem Spezialisierungssymbol oder rechts neben den PvP-Talenten/Volksfähigkeiten angezeigt werden soll"
L["ObjectiveAndRespawn_RespawnEnabled"] = "Wiederbelebungs-Timer"
L["ObjectiveAndRespawn_RespawnEnabled_Desc"] = "Falls diese Option aktiviert ist, wird ein Symbol angezeigt, das die verbleibende Zeit bis zur Wiederbelebung des Gegners anzeigt."
L["ObjectiveAndRespawn_ShowNumbers_Desc"] = "Falls diese Option aktiviert ist, wird auf dem Symbol angezeigt, wie lange es bis zur Wiederbelebung des Gegners dauert."
L["ObjectiveAndRespawn_Textcolor_Desc"] = "Farbe für den Text auf den Flaggen-, Kugel- oder Minenwagen-Debuffs. Der Text zeigt an wieviele Stapel des Flaggen-Debuffs ein Gegner besitzt oder um wieviel Prozent sein erhaltener Schaden erhöht wird, wenn er eine Kugel trägt."
L["ObjectiveAndRespawn_Width_Desc"] = "Breite des Schalchtfeldziel-Symbols"
L["ObjectiveAndRespawnSettings"] = "Schlachtfeldziel"
L["ObjectiveAndRespawnSettings_Desc"] = "Einstellungen für das Ziel des Schlachtfelds wie z.B. Flaggen, Kugeln oder Minenwagen"
L["OffsetX"] = "Versatz X"
L["OffsetY"] = "Versatz Y"
L["OnlyShowMine"] = "Nur meine anzeigen"
L["OnlyShowMine_Desc"] = "Nur %s anzeigen, die ich aufgebracht habe."
L["PlayerCount_Enabled"] = "Spielerzahl"
L["PlayerCount_Enabled_Desc"] = "Falls diese Option aktiviert ist, wird die momentane Spielerzahl angezeigt. Beachte, dass diese Zahl nicht unbedingt der Zahl der momentan gezeigten Spielerreihen entspricht. Falls ein Gegner ein gewertetes Schlachtfeld verlässt, besteht keine Möglichkeit herauszufinden wer gegangen ist, daher bleibt die Reihenzahl gleich. Ebenso kann es passieren, dass Gegner das Schlachtfeld betreten oder verlassen während du im Kampf bist. In diesem Fall besteht auch keine Möglichkeit eine Reihe hinzuzufügen oder zu entfernen. (Dies passiert sobald du den Kampf verlässt.)"
L["PlayerCount_Fontsize_Desc"] = "Die Schriftgröße der Spielerzahl"
L["PlayerCount_Textcolor_Desc"] = "Die Schriftfarbe der Spielerzahl"
L["Point"] = "Punkt"
L["PointAtObject"] = "Punkt am Objekt"
L["Poison"] = "Gift"
L["Position"] = "Position"
L["PowerBar_Background_Desc"] = "Die Hintergrundfarbe des Ressourcenbalkens."
L["PowerBar_Enabled"] = "Ressourcenbalken aktivieren"
L["PowerBar_Enabled_Desc"] = "Falls diese Option aktiviert ist, werden zusätzliche Balken für die Ressourcen der Gegner wie Mana, Wut, Fokus etc. angezeigt."
L["PowerBar_Height_Desc"] = "Die Höhe des Ressourcenbalkens. Wenn du die Höhe des Ressourcenbalkens vergrößerst, verkleinert sich automatisch die Höhe des Gesundheitsbalkens."
L["PowerBar_Texture_Desc"] = "Die Textur, die für die Ressourcenbalken verwendet wird"
L["PowerBarSettings"] = "Ressourcenbalken"
L["PowerBarSettings_Desc"] = "Einstellungen für den Ressourcenbalken"
L["Racial_Enabled"] = "Volksfähigkeiten aktivieren"
L["Racial_Enabled_Desc"] = "Falls diese Option aktiviert ist, werden Symbole für Volksfähigkeiten angezeigt."
L["Racial_ShowNumbers_Desc"] = "Wenn diese Option aktiviert ist, werden Abklingzeitzahlen auf den Symbolen der Volksfähigkeiten angezeigt."
L["Racial_Width_Desc"] = "Die Breite der Volksfähigkeiten."
L["RacialFiltering_Enabled_Desc"] = "Wenn diese Option aktiviert ist, wirst du nur angehakten Volksfähigkeiten sehen."
L["RacialFiltering_Filterlist_Desc"] = "Klicken, um die Verfolgung dieser Volksfähigkeit zu aktivieren/deaktivieren."
L["RacialFilteringSettings_Desc"] = "Hier kannst du festlegen, welche Volksfähigkeiten angezeigt werden"
L["RacialSettings"] = "Volksfähigkeiten"
L["RacialSettings_Desc"] = "Einstellungen bezüglich der Volksfähigkeiten"
L["RangeIndicator_Alpha"] = "Deckkraft"
L["RangeIndicator_Alpha_Desc"] = "Die Deckkraft des Balkens, wenn der Gegner außerhalb der eingestellten Reichweite ist"
L["RangeIndicator_Enabled"] = "Reichweitenindikator aktivieren"
L["RangeIndicator_Enabled_Desc"] = "Wenn diese Option aktiviert ist, wird der Balken des Gegners mit der eingestellten Transparenz angezeigt, falls der Gegner außerhalb der eingestellten Reichweite ist. "
L["RangeIndicator_Everything"] = "Die Deckkraft aller Elemente verändern"
L["RangeIndicator_Frames"] = "Deckkraft verändern von"
L["RangeIndicator_Frames_Desc"] = "Hier kannst du festlegen, welche Elemente des Gegnerbalkens eine höhere Transparenz erhalten sollen, falls der Gegner außer Reichweite ist."
L["RangeIndicator_Range"] = "Entfernung"
L["RangeIndicator_Range_Desc"] = "Falls ein Gegner mehr als diese Entfernung (in Metern) weg ist, wird sein Balken mit der eingestellten Deckkraft angezeigt."
L["RangeIndicator_Settings"] = "Reichweitenindikator"
L["RangeIndicator_Settings_Desc"] = "Einstellungen für den Reichweitenindikator."
L["RBGSpecificSettings"] = "Gewertetes Schlachtfeld"
L["RBGSpecificSettings_Desc"] = "Diese Einstellungen/Funktionen sind nur im gewerteten Schlachtfeld wirksam"
L["RIGHT"] = "Rechts"
L["Rightwards"] = "Nach rechts"
L["RoleIcon_Enabled"] = "Rollensymbole aktivieren"
L["RoleIcon_Enabled_Desc"] = "Aktiviere diese Option, falls du ein Rollensymbol auf dem Gesundheitsbalken haben willst."
L["RoleIcon_Size_Desc"] = "Die Größe der Rollensymbole (Breite und Höhe)"
L["RoleIconSettings"] = "Rollensymbol"
L["RoleIconSettings_Desc"] = "Einstellungen für das Rollensymbol, welches auf dem Gesundheitsbalken angezeigt wird."
L["ShowNumbers"] = "Zahlen anzeigen"
L["ShowRealmnames"] = "Realmnamen anzeigen"
L["ShowRealmnames_Desc"] = "Zeigt den Realm des Gegners"
L["Side"] = "Seite"
L["SideAtObject"] = "Seite des Objekts"
L["Size"] = "Größe"
L["Spec_AuraDisplay_Enabled"] = "Auraanzeige aktivieren"
L["Spec_AuraDisplay_Enabled_Desc"] = "Wenn diese Option aktiviert ist, werden Symbole von für Kontrolleffekte und Unterbrechungen (falls aktiv) anstelle des Spezialisierungssymbols angezeigt."
L["Spec_AuraDisplay_ShowNumbers_Desc"] = "Zeigt die verbleibende Dauer der Aura mit einer Countdown-Zahl an"
L["Spec_Enabled"] = "Spezialisierung aktivieren"
L["Spec_Enabled_Desc"] = "Falls diese Option aktiviert ist, werden Symbole für Spezialisierung des Spielers angezeigt."
L["Spec_Width_Desc"] = "Die Breite des Spezialisierungssymbols."
L["SpecSettings"] = "Spezialisierung"
L["SpecSettings_Desc"] = "Einstellungen für das Spezialisierungssymbol."
L["SpellID_Filtering"] = "Per Zauber-ID filtern"
L["SymbolicTargetindicator_Enabled"] = "Zielsymbole"
L["SymbolicTargetindicator_Enabled_Desc"] = "Zeigt ein quadratisches klassenfarbenes Symbol für jeden %s, der diesen Gegner im Ziel hat."
L["TargetIndicator"] = "Zielanzeiger"
L["TargetIndicator_Desc"] = "Numerische und Symbolische Zielanzeiger"
L["Testmode_Toggle"] = "Testmodus ein-/ausschalten"
L["Testmode_Toggle_Desc"] = "Aktiviert/Deaktiviert den Testmodus. Dieser Modus macht es dir einfacher zu sehen, welche Veränderungen die einzelnen Optionen mit sich bringen. Es ist nicht möglich alle Optionen zu simulieren, jedoch sind die meisten Einstellungsmöglichkeiten in diesem Testmodus abgebildet. Der Testmodus ist deaktiviert, falls du dich momentan in einem Schlachtfeld befindest. "
L["Testmode_ToggleAnimation"] = "Testmodus-Animation ein-/ausschalten"
L["Testmode_ToggleAnimation_Desc"] = "Aktiviert/Deaktiviert die Animation des Testmodus, damit du dich besser auf eine einzelne Einstellung konzentrieren kannst und nicht von der Animation abgelenkt wirst."
L["TestmodeSettings"] = "Testmodus"
L["Thick"] = "Dick"
L["TOP"] = "Oben"
L["TOPLEFT"] = "Oben links"
L["TOPRIGHT"] = "Oben rechts"
L["Trinket_Enabled"] = "PvP-Talente aktivieren"
L["Trinket_Enabled_Desc"] = "Falls diese Option aktiviert wird, wird angezeigt welches PvP-Talent der ersten Reihe der Gegner benutzt (Medaillon des Gladiators, Anpassung oder Unerbittlich)"
L["Trinket_ShowNumbers_Desc"] = "Falls diese Option aktiviert ist werden Abklingzeitzahlen auf den Symbolen angezeigt"
L["Trinket_Width_Desc"] = "Die Breite der Anti-CC-Talente."
L["TrinketSettings"] = "Anti-CC-Talent"
L["TrinketSettings_Desc"] = "Einstellungen bezüglich des PvP-Talents in der ersten Reihe"
L["Upwards"] = "Nach oben"
L["UseBarHeight"] = "Balkenhöhe verwenden"
L["UserDefined"] = "Benutzerdefiniert"
L["VerticalGrowdirection"] = "Vertikale Ausbreitungsrichtung"
L["VerticalGrowdirection_Desc"] = "Ob die Reihen nach oben oder nach unten anwachsen sollen"
L["VerticalPosition"] = "Vertikale Position"
L["VerticalSpacing"] = "Vertikaler Abstand"
L["Width"] = "Breite"

elseif locale == "esES" then
L["Allies"] = "Aliados"
L["allies"] = "aliados"
L["ally"] = "aliado"
L["Ally"] = "Aliado"
L["AllyJoined"] = "Un aliado se ha unido al campo de batalla."
L["AllyLeft"] = "Un aliado ha dejado el campo de batalla."
L["AND"] = "y"
L["AttachToObject"] = "Adjuntar al objeto"
L["AttachToObject_Desc"] = "Tenga en cuenta que no es posible seleccionar todos los objetos, dependiendo de su posición de los otros marcos. Por ejemplo, si ancla los talentos de pvp en los raciales y está tratando de anclar los raciales en los talentos de pvp, aparecerá un mensaje de error."
L["Auras_Buffs_Container_Color_Desc"] = "El color del borde de los iconos buff."
L["Auras_Buffs_Fontsize_Desc"] = "El tamaño de fuente de los stacks en los iconos buff"
L["Auras_Buffs_ShowNumbers_Desc"] = "Cuando se habilite, habrá números en los iconos buff que indicarán el tiempo restante"
L["Auras_Buffs_Textcolor_Desc"] = "El color de texto de los stacks en los buffs."
L["Auras_Debuffs_Coloring_Enabled"] = "Color por tipo de debuff"
L["Auras_Debuffs_Coloring_Enabled_Desc"] = "Cuando esta opción está habilitada, puede elegir si el borde del marco o el texto de la cuenta regresiva deben ser coloreados por tipo de debuff (como se sabe por la interfaz de usuario predeterminada, los venenos son verdes, las enfermedades son azules, etc.)"
L["Auras_Debuffs_Container_Color_Desc"] = "El color del borde de los iconos debuff."
L["Auras_Debuffs_Fontsize_Desc"] = "El tamaño de fuente de los stacks en los iconos de debuff"
L["Auras_Debuffs_ShowNumbers_Desc"] = "Cuando se habilite, habrá números en los iconos de debuff que indican el tiempo restante"
L["Auras_Debuffs_Textcolor_Desc"] = "El color del texto de los stacks en los debuffs."
L["Auras_Enabled"] = "Habilitar auras"
L["Auras_Enabled_Desc"] = "Cuando esté habilitado habrá iconos de aura. También habrá un número para el tiempo restante y uno para los stacks aplicados."
L["Auras_Fontsize_Desc"] = "El tamaño de fuente de los stacks en los iconos de aura"
L["Auras_ShowNumbers_Desc"] = "Cuando se habilite, habrá números en los íconos de aura que indicarán el tiempo restante"
L["Auras_Textcolor_Desc"] = "El color de texto de los stacks."
L["Buffs"] = "Buffos"
L["Disease"] = "Enfermedad"
L["enemies"] = "enemigos"
L["Enemies"] = "Enemigos"
L["enemy"] = "enemigo"
L["Enemy"] = "Enemigo"
L["EnemyJoined"] = "Un enemigo se ha unido al campo de batalla."
L["EnemyLeft"] = "Un enemigo abandono el campo de batalla."
L["Fontsize"] = "Tamaño de fuente"
L["Locked"] = "Bloquear"
L["Magic"] = "Magia"
L["Name"] = "Nombre"
L["ObjectiveAndRespawn_Position"] = [=[Posición
]=]
L["Poison"] = "Veneno"

elseif locale == "esMX" then

elseif locale == "frFR" then
L["Allies"] = "Alliés"
L["allies"] = "alliés"
L["ally"] = "Allié"
L["Ally"] = "Alliés"
L["AllyJoined"] = "Un allié a rejoint le champ de bataille"
L["AllyLeft"] = "Un allié a quitté le champ de bataille"
L["AND"] = "et"
L["AttachToObject"] = "Attacher à l'objet"
L["AttachToObject_Desc"] = "Notez qu'il est possible que certains objets soient impossibles à sélectionner, ceci dépendant de la position de vos autres cadres. Par exemple, si vous ancrez les talents pvp aux talents raciaux et que vous essayez d'ancrer les talents raciaux aux talents pvp, vous rencontrerez un message d'erreur."
L["Auras_Buffs_Container_Color_Desc"] = "La couleur de la bordure du conteneur des icônes de buff"
L["Auras_Buffs_Fontsize_Desc"] = "La taille de police du nombre de stacks sur les icônes de buff"
L["Auras_Buffs_ShowNumbers_Desc"] = "Si activé, il y aura des nombres sur les icônes de buff pour indiquer le temps restant"
L["Auras_Buffs_Textcolor_Desc"] = "La couleur de texte des stacks sur les buffs"
L["Auras_Debuffs_Coloring_Enabled"] = "Couleur par type de débuff"
L["Auras_Debuffs_Coloring_Enabled_Desc"] = "Quand cette option est activé, vous pouvez choisir si le contour du cadre ou le texte de compte à rebours doit être coloré par type de débuff (Comme ils sont connus dans l'interface de base, les poisons sont verts, les maladies bleues etc.)"
L["Auras_Debuffs_Container_Color_Desc"] = "La couleur de la bordure du conteneur des icônes de debuff"
L["Auras_Debuffs_Fontsize_Desc"] = "La taille de police du nombre de stacks sur les icônes de débuff"
L["Auras_Debuffs_ShowNumbers_Desc"] = "Si activé, il y aura des nombres sur les icônes de débuff pour indiquer le temps restant"
L["Auras_Debuffs_Textcolor_Desc"] = "La couleur de texte des stacks sur les débuffs"
L["Auras_Enabled"] = "Activer les auras"
L["BarBackground"] = "Couleur du fond"
L["BarHeight_Desc"] = "La hauteur de chaque rangée. Cette option n'est pas disponible en combat"
L["BarSettings"] = "Configuration des barres"
L["BarSettings_Desc"] = "Ici vous pouvez configurer les rangées"
L["BarTexture"] = "Texture des barres"
L["BarWidth_Desc"] = "La largeur de chaque rangée. Cette option n'est pas accessible en combat."
L["BattlegroundSize"] = "Taille du champs de bataille"
L["BGSize_15"] = "1-15 Joueurs"
L["BGSize_15_Desc"] = "Ces options s'appliquent aux %s dans un champs de bataille de 1 à 15 joueurs par faction"
L["BGSize_40"] = "16 à 40 joueurs"
L["BGSize_40_Desc"] = "Ces options s'appliquent aux %s dans un champs de bataille de 16 à 40 joueurs par faction"
L["BorderThickness"] = "Taille de la bordure"
L["BOTTOM"] = "En bas"
L["BOTTOMLEFT"] = "En Bas à Gauche"
L["BOTTOMRIGHT"] = "En Bas à Droite"
L["buff"] = "Buff (bonus)"
L["BuffContainer"] = "Conteneur à buff"
L["BuffIcon"] = "Icône de buff"
L["Buffs"] = "Buffs (bonus)"
L["Button"] = "Bouton"
L["CantAnchorToItself"] = "Ne peut pas s'accrocher à soi-même!"
L["CENTER"] = "Centre"
L["Columns"] = "Colonnes"
L["Columns_Desc"] = "En combien de colonnes les joueurs sont-ils affichés."
L["ConfirmProfileOverride"] = "Êtes-vous sure de vouloir écraser le profil %s avec le profil %s ?"
L["Container_Color"] = "Couleur de la bordure du conteneur"
L["ContainerPosition"] = "Position du conteneur"
L["ConvertCyrillic"] = "Convertir le Cyrillique"
L["ConvertCyrillic_Desc"] = "Converti les caractères cyrilliques, ce qui rend plus facile la lecture des noms si vous affrontez des joueurs Russes"
L["Cooldown_Fontsize_Desc"] = "Taille de la police du compte à rebours"
L["CopySettings"] = "Copier la configuration à partir de %s"
L["CopySettings_Desc"] = "Cliquez ici si vous voulez importer les options du profile %s"
L["Countdowntext"] = "Compte à rebours"
L["Curse"] = "Malédiction"
L["Disease"] = "Maladie"
L["DisplayType"] = "Type d'affichage"
L["DR_Root"] = "Enracinement"
L["enemies"] = "ennemis"
L["Enemies"] = "Ennemis"
L["enemy"] = "ennemi"
L["Enemy"] = "Ennemi"
L["EnemyJoined"] = "Un ennemi a rejoint le champ de bataille"
L["EnemyLeft"] = "Un ennemi a quitté le champ de bataille"
L["Height"] = "La Taille"
L["LEFT"] = "La Gauche"
L["Locked"] = "Vérrouillé"
L["Magic"] = "La Magie"
L["Name"] = "Prénom"
L["Point"] = "Point"
L["Poison"] = "Poison"
L["Position"] = "Position"
L["Side"] = "Le Côté"
L["TOP"] = "En Haut"
L["TOPLEFT"] = "En Haut à Gauche"
L["TOPRIGHT"] = "En Haut à Droite"

elseif locale == "itIT" then
L["Allies"] = "Alleati"
L["allies"] = "alleati"
L["ally"] = "alleato"
L["Ally"] = "Alleato"
L["AllyJoined"] = "Un alleato è entrato nel campo di battaglia"
L["AllyLeft"] = "Un alleato ha lasciato il campo di battaglia"
L["AND"] = "e"
L["AttachToObject"] = "Allega all'oggetto"
L["AttachToObject_Desc"] = "Nota che non è possibile selezionare qualunque oggetto, dipende dal posizionamento degli altri riquadri. Ad esempio, ancorando i talenti PvP alle abilità razziali e nel mentre si ancorano le stesse ai talenti PvP, comparirà un messaggio d'errore."
L["Auras_Buffs_Container_Color_Desc"] = "Il colore del bordo del contenitore delle icone dei potenziamenti"
L["Auras_Buffs_Fontsize_Desc"] = "La dimensione del carattere degli accumuli sulle icone dei potenziamenti"
L["Auras_Buffs_ShowNumbers_Desc"] = "Quando attivo, compariranno i numeri sulle icone dei potenziamenti indicando il tempo restante"
L["Auras_Buffs_Textcolor_Desc"] = "Il colore del testo degli accumuli sui potenziamenti"
L["Auras_Debuffs_Coloring_Enabled"] = "Colore per tipologia di Penalità"
L["Auras_Debuffs_Coloring_Enabled_Desc"] = "Quando questa opzione è attiva si potrà scegliere se il bordo del riquadro, o il testo del conteggio alla rovescia, dovranno colorarsi in base alla tipologia della penalità (come adottate dall'interfaccia predefinita, i veleni in verde, le malattie in blu, ecc.)"
L["Auras_Debuffs_Container_Color_Desc"] = "Il colore del bordo del contenitore delle icone delle penalità"
L["Auras_Debuffs_Fontsize_Desc"] = "La dimensione del carattere degli accumuli sulle icone delle penalità"
L["Auras_Debuffs_ShowNumbers_Desc"] = "Quando attivo, compariranno i numeri sulle icone delle penalità indicando il tempo restante"
L["TargetIndicator"] = "Indicatore Bersaglio"
L["TargetIndicator_Desc"] = "Indicatori bersaglio numerici e simbolici"
L["Testmode_Toggle"] = "Mostra/Nascondi modalità di test"
L["Testmode_Toggle_Desc"] = [=[Attiva/Disattiva la modalità di test. Questa modalità rende più semplice la visualizzazione dell'impatto della maggior parte delle impostazioni disponibili. Non è possibile simulare tutte le opzioni, ma la maggior parte di esse sono presenti in questa sofisticata modalità.
La modalità di test viene disattivata se è in corso un campo di battaglia.]=]
L["Testmode_ToggleAnimation"] = "Mostra/nascondi animazione modalità test"
L["Testmode_ToggleAnimation_Desc"] = "Attiva/Disattiva l'animazione della modalità test così da poter rivolgere maggiormente l'attenzione su un'impostazione specifica senza le distrazioni dovute all'animazione."
L["TestmodeSettings"] = "Modalità test"
L["Thick"] = "Spessore"
L["TOP"] = "Superiore"
L["TOPLEFT"] = "Superiore sinistro"
L["TOPRIGHT"] = "Superiore destro"
L["Trinket_Enabled"] = "Attiva Monili"
L["Trinket_Enabled_Desc"] = "Quando attivi, compariranno le icone per il Medaglione del Gladiatore, Adattamento e Implacabilità."
L["Trinket_ShowNumbers_Desc"] = "Quando attivo, comparirà il tempo di recupero sulle icone deli monili"
L["Trinket_Width_Desc"] = "La larghezza del monile."
L["TrinketSettings"] = "Monile"
L["TrinketSettings_Desc"] = "Impostazioni relative ai Monili"
L["Upwards"] = "Verso l'alto"
L["UseBarHeight"] = "Usa altezza barra"
L["UserDefined"] = "Definita dall'utente"
L["VerticalGrowdirection"] = "Direzione crescita verticale"
L["VerticalGrowdirection_Desc"] = "Sarà possibile scegliere la crescita delle barre verso l'alto o il basso"
L["VerticalPosition"] = "Posizione verticale"
L["VerticalSpacing"] = "Spaziatura verticale"
L["Width"] = "Larghezza"

elseif locale == "koKR" then
L["Allies"] = "아군"
L["allies"] = "아군"
L["ally"] = "아군"
L["Ally"] = "아군"
L["AllyJoined"] = "아군이 전장에 참여했습니다"
L["AllyLeft"] = "아군이 전장을 떠났습니다"
L["AND"] = "그리고"
L["AttachToObject"] = "개체에 붙이기"
L["AttachToObject_Desc"] = "다른 프레임의 위치에 따라 모든 개체를 선택할 수 있진 않습니다. 예를 들어 pvp 특성을 종족 특성에 고정시킨 후 종족 특성을 pvp 특성에 고정시키려고 시도하면 오류 메시지가 표시됩니다."
L["Auras_Buffs_Container_Color_Desc"] = "강화 효과 아이콘 묶음의 테두리 색상입니다"
L["Auras_Buffs_Fontsize_Desc"] = "강화 효과 아이콘의 중첩 글꼴 크기입니다"
L["Auras_Buffs_ShowNumbers_Desc"] = "활성화하면 강화 효과 아이콘에 남은 시간을 나타내는 숫자가 표시됩니다"
L["Auras_Buffs_Textcolor_Desc"] = "강화 효과의 중첩 글꼴 색상입니다"
L["Auras_Debuffs_Coloring_Enabled"] = "약화 효과 유형 별 색상"
L["Auras_Debuffs_Coloring_Enabled_Desc"] = "이 옵션을 활성화하면 프레임의 테두리 또는 초읽기 문자에 약화 효과 유형에 따라 색상을 입힙니다 (기본 UI에서 알 수 있는 독은 녹색, 질병은 푸른색 등.)"
L["Auras_Debuffs_Container_Color_Desc"] = "약화 효과 아이콘 묶음의 테두리 색상입니다"
L["Auras_Debuffs_Fontsize_Desc"] = "약화 효과 아이콘의 중첩 글꼴 크기입니다"
L["Auras_Debuffs_ShowNumbers_Desc"] = "활성화하면 약화 효과 아이콘에 남은 시간을 나타내는 숫자를 표시합니다"
L["Auras_Debuffs_Textcolor_Desc"] = "약화 효과의 중첩 글꼴 색상입니다"
L["Auras_Enabled"] = "효과 활성화"
L["Auras_Enabled_Desc"] = "활성화하면 효과 아이콘이 표시됩니다. 남은 시간과 중첩 적용 횟수의 숫자도 표시됩니다."
L["Auras_Fontsize_Desc"] = "효과 아이콘의 중첩 글꼴 크기입니다"
L["Auras_ShowNumbers_Desc"] = "활성화하면 효과 아이콘에 남은 시간을 나타내는 숫자를 표시합니다"
L["Auras_ShowTooltips"] = "주문 툴팁 표시"
L["Auras_Textcolor_Desc"] = "중첩 문자의 색상입니다"
L["AurasFiltering_AddSpellID"] = "주문ID"
L["AurasFiltering_AddSpellID_Desc"] = "주문ID나 콤마로 구분한 여러 개의 주문ID를 입력하세요. 주문ID는 당신의 필터 목록에 추가됩니다. 주문ID 필터가 활성화되었을 때 필터 목록에 있는 주문ID의 효과만 표시됩니다."
L["AurasFiltering_Enabled_Desc"] = "이 옵션을 활성화하면 당신이 필터 목록에 추가한 %s만 확인할 수 있습니다."
L["AurasFiltering_Filterlist_Desc"] = "이 %s|1을;를; 제거하려면 클릭"
L["AurasFilteringSettings_Desc"] = "여기서 표시된 효과를 제어할 수 있습니다"
L["AurasSettings"] = "효과"
L["AurasSettings_Desc"] = "효과를 설정합니다 (강화 효과와 약화 효과)"
L["AurasStacktextSettings"] = "중첩 문자"
L["BarBackground"] = "배경 색상"
L["BarHeight_Desc"] = "각 바의 높이입니다. 이 설정은 블리자드의 전투 보호때문에 전투 중에 설정할 수 없습니다."
L["BarSettings"] = "바 설정"
L["BarSettings_Desc"] = "여기서 바를 구성할 수 있습니다"
L["BarTexture"] = "바 텍스쳐"
L["BarWidth_Desc"] = "각 바의 너비입니다. 이 설정은 블리자드의 전투 보호때문에 전투 중에 설정할 수 없습니다."
L["BattlegroundSize"] = "전장 규모"
L["BGSize_15"] = "1-15인"
L["BGSize_15_Desc"] = "이 설정은 진영 별 1-15인 규모의 전장에서 %s에게 적용됩니다"
L["BGSize_40"] = "16-40인"
L["BGSize_40_Desc"] = "이 설정은 진영 별 16-40인 규모의 전장에서 %s에게 적용됩니다"
L["BorderThickness"] = "테두리 크기"
L["BOTTOM"] = "하단"
L["BOTTOMLEFT"] = "왼쪽 하단"
L["BOTTOMRIGHT"] = "오른쪽 하단"
L["buff"] = "강화 효과"
L["BuffContainer"] = "강화 효과 묶음"
L["BuffIcon"] = "강화 효과 아이콘"
L["Buffs"] = "강화 효과"
L["Button"] = "버튼"
L["CantAnchorToItself"] = "자기 자신에게는 고정할 수 없습니다!"
L["CENTER"] = "중앙"
L["Columns"] = "열"
L["Columns_Desc"] = "플레이어가 표시되는 열의 수입니다."
L["ConfirmProfileOverride"] = "정말 서브프로필 %s|1을;를; %s|1으로;로; 덮어쓸까요?"
L["Container_Color"] = "묶음 테두리 색상"
L["ContainerPosition"] = "묶음 위치"
L["ConvertCyrillic"] = "키릴 문자 전환"
L["ConvertCyrillic_Desc"] = "러시아어로 플레이 중이라면 이름을 읽기 쉽게 만들어 주는 키릴 문자로 전환합니다"
L["Cooldown_Fontsize_Desc"] = "장신구의 초읽기 숫자의 글꼴 크기"
L["CopySettings"] = "%s의 설정 복사하기"
L["CopySettings_Desc"] = "서브프로필 %s의 설정을 가져오려면 여기를 클릭하세요"
L["Countdowntext"] = "초읽기 문자"
L["Curse"] = "저주"
L["CustomMacro_Desc"] = [=[활성화하면 사용자 설정 매크로를 설정할 수 있습니다. 빈 영역은 빈 매크로로 이어집니다.
사용할 수 있는 대체어: %n 적의 이름으로 대체됩니다

예제:
/targetexact %n
/cast 변이
/say %n에게 변이
/targetlasttarget

적을 대상 지정하고, 변이를 시전하고, 일반 대화 채널에 메시지를 쓰고 이전 대상을 대상 지정합니다.
매크로는 255자 길이까지만 가능합니다 (대체어 포함).]=]
L["debuff"] = "약화 효과"
L["DebuffContainer"] = "약화 효과 묶음"
L["DebuffIcon"] = "약화 효과 아이콘"
L["Debuffs"] = "약화 효과"
L["DebuffType_Filtering"] = "약화 효과 유형 별 필터"
L["DebuffType_Filtering_Desc"] = "이 옵션을 활성화하면 선택한 유형의 약화 효과만 확인할 수 있습니다. 이 옵션은 많은 주문과 약화 효과 유형의 거대한 데이터베이스가 필요하기 때문에 테스트 모드에서 실현되지 않습니다."
L["DisableArenaFrames"] = "투기장 프레임 비활성"
L["DisableArenaFrames_Desc"] = "전장에서 투기장 프레임을 비활성합니다. sArena가 설치되어 있을 때도 작동합니다"
L["Disease"] = "질병"
L["DisplayType"] = "표시 형식"
L["Downwards"] = "아래로"
L["DR_Disorient"] = "방향 감각 상실"
L["DR_Incapacitate"] = "행동 불가"
L["DR_Knockback"] = "밀쳐내기"
L["DR_Root"] = "이동 불가"
L["DR_Silence"] = "침묵"
L["DR_Stun"] = "기절"
L["DRContainer"] = "점감 묶음"
L["DrTracking_Container_Color_Desc"] = "점감 아이콘 묶음의 테두리 색상입니다"
L["DrTracking_DisplayType_Desc"] = "여기서 점감 상태를 아이콘 주변의 색상화된 프레임 또는 초읽기 문자의 문자 색상으로 나타낼 지 선택할 수 있습니다. 초읽기 문자 설정은 문자 색상을 변경하는 OmniCC 같은 애드온을 사용하지 않아야 작동합니다."
L["DrTracking_Enabled"] = "점감 추적 활성화"
L["DrTracking_Enabled_Desc"] = "활성화하면 적 바 옆에 점감 추적 아이콘이 표시됩니다. 녹색 테두리: 다음 군중 제어는 절반의 지속시간을 가집니다. 노란색 테두리: 다음 군중 제어는 1/4의 지속시간을 가집니다. 빨간색 테두리: 다음 군중 제어는 플레이어가 면역이므로 적용되지 않습니다"
L["DrTracking_ShowNumbers_Desc"] = "점감이 초기화될 때까지 남은 시간을 숫자로 표시합니다"
L["DrTracking_Spacing"] = "점감 간격"
L["DrTracking_Spacing_Desc"] = "각 점감 아이콘의 간격입니다"
L["DrTrackingFiltering_Enabled_Desc"] = "이 옵션을 활성화하면 필터 목록에서 선택한 범주의 주문 아이콘만 표시합니다."
L["DrTrackingFiltering_Filterlist_Desc"] = "이 범주를 추적/추적 해제하려면 클릭"
L["DrTrackingFilteringSettings_Desc"] = "여기서 어떤 점감 범주를 표시할 지 선택할 수 있습니다."
L["DrTrackingSettings"] = "점감 추적"
L["DrTrackingSettings_Desc"] = "점감 추적에 관련된 설정입니다"
L["enemies"] = "적"
L["Enemies"] = "적"
L["enemy"] = "적"
L["Enemy"] = "적"
L["EnemyJoined"] = "적이 전장에 참여했습니다"
L["EnemyLeft"] = "적이 전장을 떠났습니다"
L["Filtering_Enabled"] = "필터 활성화"
L["Filtering_Filterlist"] = "필터 목록"
L["Font"] = "글꼴"
L["Font_Desc"] = "이 애드온에 사용할 주 글꼴입니다"
L["Font_Outline"] = "글꼴 외곽선"
L["Font_Outline_Desc"] = "글꼴의 외곽선입니다"
L["Fontcolor"] = "글꼴 색상"
L["FontShadow_Enabled"] = "글꼴 그림자 활성화"
L["FontShadow_Enabled_Desc"] = "활성화하면 글꼴 주위에 그림자가 생깁니다. 그림자의 색상을 선택할 수 있습니다"
L["FontShadowColor"] = "그림자 색상"
L["FontShadowColor_Desc"] = "문자 그림자의 색상입니다"
L["Fontsize"] = "글꼴 크기"
L["Frame"] = "프레임"
L["Framescale"] = "크기 비율"
L["Framescale_Desc"] = "주 프레임의 크기 비율입니다. 이 설정은 블리자드의 전투 보호때문에 전투 중에 설정할 수 없습니다."
L["General"] = "일반"
L["GeneralSettings"] = "일반 설정"
L["GeneralSettings_Desc"] = "일반 설정입니다"
L["GeneralSettingsAllies"] = "이 설정은 전장의 규모에 상관없이 아군에게 적용됩니다"
L["GeneralSettingsEnemies"] = "이 설정은 전장의 규모에 상관없이 적에게 적용됩니다"
L["HealthBar_Background_Desc"] = "생명력 바의 배경 색상입니다."
L["HealthBar_Texture_Desc"] = "생명력 바에 사용할 텍스쳐입니다"
L["HealthBarSettings"] = "생명력바"
L["HealthBarSettings_Desc"] = "생명력 바의 설정입니다."
L["Height"] = "높이"
L["Highlight_Color"] = "강조 색상"
L["Highlight_Color_Desc"] = "당신의 커서가 올려진 플레이어 프레임의 색상"
L["HorizontalGrowdirection"] = "수평 성장 방향"
L["HorizontalGrowdirection_Desc"] = "열이 왼쪽 또는 오른쪽 가장자리로 성장할지 선택합니다"
L["HorizontalSpacing"] = "수평 간격"
L["IconsPerRow"] = "열 당 아이콘"
L["KeybindSettings_Desc"] = "여기서 왼쪽- 오른쪽- 그리고 가운데 클릭 시 어떻게 작동할 지 구성할 수 있습니다"
L["LEFT"] = "왼쪽"
L["LeftToTargetCounter"] = "대상 지정 숫자 왼쪽에"
L["Leftwards"] = "왼쪽"
L["LevelText_Enabled"] = "플레이어의 레벨 표시"
L["LevelText_Fontsize_Desc"] = "레벨 문자에 사용할 글꼴 크기입니다"
L["LevelText_OnlyShowIfNotMaxLevel"] = "최고 레벨이 아닐 때만 표시"
L["LevelText_Textcolor_Desc"] = "레벨 문자에 사용할 색상입니다"
L["LevelTextSettings"] = "플레이어 레벨"
L["Locked"] = "고정시키기"
L["Locked_Desc"] = "프레임을 현재 위치에 고정시킵니다"
L["Magic"] = "마법"
L["MainFrameSettings"] = "주 프레임 설정"
L["MainFrameSettings_Desc"] = "%s에게 사용할 주 프레임을 설정합니다"
L["MaxPlayers"] = "최대 적"
L["MaxPlayers_Desc"] = "이 숫자보다 적이 더 많으면 애드온은 적을 표시하지 않습니다"
L["MyFocus_Color"] = "주시 대상 색상"
L["MyFocus_Color_Desc"] = "당신의 현재 주시 대상을 나타내는 테두리에 사용할 색상입니다"
L["MyTarget_Color"] = "대상 색상"
L["MyTarget_Color_Desc"] = "당신의 현재 대상을 나타내는 생명력 바 주위 테두리에 사용할 색상입니다"
L["Name"] = "이름"
L["Name_Desc"] = "생명력 바 위의 이름을 설정합니다."
L["Name_Fontsize_Desc"] = "적 이름에 사용할 글꼴 크기입니다"
L["Name_Textcolor_Desc"] = "적 이름에 사용할 문자 색상입니다"
L["None"] = "안 함"
L["Normal"] = "보통"
L["NotAvailableInCombat"] = [=[
이 설정은 블리자드의 전투 제한때문에 당신이 전투 중일 때 사용할 수 없습니다.]=]
L["Notifications_Allies_Enabled_Desc"] = "활성화하면 아군이 전장에 참여 또는 탈영 시 당신이 알립니다."
L["Notifications_Enabled"] = "알림 활성화"
L["Notifications_Enemies_Enabled_Desc"] = "활성화하면 적이 전장에 참여 또는 탈영 시 당신이 알립니다."
L["NumericTargetindicator"] = "대상 지정 숫자"
L["NumericTargetindicator_Enabled_Desc"] = "몇명의 %s|1이;가; 플레이어를 대상 지정 중인 지 표시합니다."
L["NumericTargetindicator_Fontsize_Desc"] = "대상 지정 숫자의 글꼴 크기입니다"
L["NumericTargetindicator_Textcolor_Desc"] = "대상 지정 숫자의 문자 색상입니다"
L["ObjectiveAndRespawn_Fontsize_Desc"] = "목표 아이콘 위의 문자 크기입니다. 이 문자는 깃발 약화 효과 중첩이나 코트모구의 사원에서 받는 피해 증가량을 나타냅니다."
L["ObjectiveAndRespawn_ObjectiveEnabled"] = "목표 표시"
L["ObjectiveAndRespawn_ObjectiveEnabled_Desc"] = "적 버튼 옆에 깃발, 광산 수레와 공-운반자 아이콘을 표시합니다"
L["ObjectiveAndRespawn_Position"] = "위치"
L["ObjectiveAndRespawn_Position_Desc"] = "전문화 아이콘의 왼쪽 또는 장신구/종족 특성 아이콘의 오른쪽에 아이콘을 표시합니다."
L["ObjectiveAndRespawn_RespawnEnabled"] = "재생성 타이머 활성화"
L["ObjectiveAndRespawn_RespawnEnabled_Desc"] = "활성화하면 적이 되살아나기까지 남은 시간을 나타내는 아이콘이 표시됩니다."
L["ObjectiveAndRespawn_ShowNumbers_Desc"] = "활성화하면 적이 되살아나기까지 남은 시간을 숫자로 표시합니다."
L["ObjectiveAndRespawn_Textcolor_Desc"] = "목표 아이콘 위의 문자 색상입니다. 이 문자는 깃발 약화 효과 중첩이나 코트모구의 사원에서 받는 피해 증가량을 나타냅니다."
L["ObjectiveAndRespawn_Width_Desc"] = "목표 아이콘의 너비입니다"
L["ObjectiveAndRespawnSettings"] = "목표"
L["ObjectiveAndRespawnSettings_Desc"] = "전장의 목표와 관련된 설정입니다"
L["OffsetX"] = "X 위치"
L["OffsetY"] = "Y 위치"
L["OnlyShowMine"] = "내 것만 표시"
L["OnlyShowMine_Desc"] = "내가 적용한 %s만 표시합니다"
L["PlayerCount_Enabled"] = "플레이어 인원 수"
L["PlayerCount_Enabled_Desc"] = "현재 플레이어 인원 수를 문자로 표시합니다. 전투 보호 또는 평점제 전장에서 적/아군의 탈영때문에 바에 표시된 현재 숫자와 다를 수 있습니다."
L["PlayerCount_Fontsize_Desc"] = "플레이어 인원 수에 사용할 글꼴 크기입니다"
L["PlayerCount_Textcolor_Desc"] = "플레이어 인원 수에 사용할 문자 색상입니다"
L["Point"] = "지점"
L["PointAtObject"] = "개체의 지점"
L["Poison"] = "독"
L["Position"] = "위치"
L["PowerBar_Background_Desc"] = "마력 바의 배경 색상입니다."
L["PowerBar_Enabled"] = "마력 바 활성화"
L["PowerBar_Enabled_Desc"] = "마나, 분노 등과 같은 마력 바를 보고 싶다면 이 옵션을 활성화하세요."
L["PowerBar_Height_Desc"] = "마력 바의 높이입니다. 마력 바의 높이를 키우면 자동으로 생명력 바의 높이는 줄어듭니다"
L["PowerBar_Texture_Desc"] = "마력 바에 사용할 텍스쳐입니다"
L["PowerBarSettings"] = "마력바"
L["PowerBarSettings_Desc"] = "마력 바 설정"
L["Racial_Enabled"] = "종족 특성 활성화"
L["Racial_Enabled_Desc"] = "활성화하면 종족 특성 아이콘을 표시합니다"
L["Racial_ShowNumbers_Desc"] = "활성화하면 종족 특성 아이콘 위에 재사용 대기시간 숫자를 표시합니다"
L["Racial_Width_Desc"] = "종족 특성의 너비입니다."
L["RacialFiltering_Enabled_Desc"] = "이 옵션을 활성화하면 당신이 필터 목록에서 선택한 종족 특성만 표시합니다."
L["RacialFiltering_Filterlist_Desc"] = "이 종족 특성을 추적/추적 해제하려면 클릭하세요"
L["RacialFilteringSettings_Desc"] = "여기서 당신이 추적하고 싶은 종족 특성을 선택할 수 있습니다"
L["RacialSettings"] = "종족 특성"
L["RacialSettings_Desc"] = "종족 특성과 관련된 설정입니다"
L["RangeIndicator_Alpha"] = "투명도"
L["RangeIndicator_Alpha_Desc"] = "적이 선택한 사정 거리를 벗어났을 때의 적 프레임 투명도입니다"
L["RangeIndicator_Enabled"] = "사정 거리 지시기 활성화"
L["RangeIndicator_Enabled_Desc"] = "이 옵션을 활성화하면 적이 선택한 사정 거리를 벗어났을 때 프레임에 선택한 투명도를 사용합니다"
L["RangeIndicator_Everything"] = "모든 요소의 투명도를 변경"
L["RangeIndicator_Frames"] = "투명도 변경:"
L["RangeIndicator_Frames_Desc"] = "적이 사정 거리를 벗어났을 때 적 바의 어떤 부분을 가장 높은 투명도로 표시할 지 설정합니다."
L["RangeIndicator_Range"] = "사정 거리"
L["RangeIndicator_Range_Desc"] = "적이 이 거리 (미터 단위)보다 멀어지면 그의 프레임에 선택한 투명도를 사용합니다"
L["RangeIndicator_Settings"] = "사정 거리 지시기"
L["RangeIndicator_Settings_Desc"] = "여기서 사정 거리 지시기를 설정할 수 있습니다."
L["RBGSpecificSettings"] = "평점제 전장"
L["RBGSpecificSettings_Desc"] = "이 설정은 평점제 전장에서만 적용됩니다"
L["RIGHT"] = "오른쪽"
L["Rightwards"] = "오른쪽"
L["RoleIcon_Enabled"] = "역할 아이콘 활성화"
L["RoleIcon_Enabled_Desc"] = "생명력 바 위에 역할 아이콘을 보고 싶다면 이 옵션을 활성화하세요"
L["RoleIcon_Size_Desc"] = "역할 아이콘의 크기 (너비와 높이)"
L["RoleIconSettings"] = "역할 아이콘"
L["RoleIconSettings_Desc"] = "생명력 바 위에 표시되는 역할 아이콘 설정"
L["ShowNumbers"] = "숫자 표시"
L["ShowRealmnames"] = "서버 이름 표시"
L["ShowRealmnames_Desc"] = "적의 서버를 표시합니다"
L["Side"] = "가장자리"
L["SideAtObject"] = "개체의 가장자리"
L["Size"] = "크기"
L["Spec_AuraDisplay_Enabled"] = "효과 표시 활성화"
L["Spec_AuraDisplay_Enabled_Desc"] = "이 옵션을 활성화하면 전문화 아이콘 대신 군중 제어와 시전 방해 (활성화 시) 아이콘을 표시합니다"
L["Spec_AuraDisplay_ShowNumbers_Desc"] = "초읽기 숫자로 효과의 남은 시간을 표시합니다"
L["Spec_Enabled"] = "전문화 활성화"
L["Spec_Enabled_Desc"] = "활성화하면 플레이어의 전문화 아이콘이 표시됩니다"
L["Spec_Width_Desc"] = "전문화 아이콘의 너비입니다."
L["SpecSettings"] = "전문화"
L["SpecSettings_Desc"] = "전문화 아이콘을 변경하는 설정입니다."
L["SpellID_Filtering"] = "주문ID 별 필터"
L["SymbolicTargetindicator_Enabled"] = "대상 상징"
L["SymbolicTargetindicator_Enabled_Desc"] = "플레이어를 대상 지정 중인 각 %s에게 직업 색상 네모 아이콘을 표시합니다."
L["TargetIndicator"] = "대상 지시기"
L["TargetIndicator_Desc"] = "숫자와 상징 대상 지시기"
L["Testmode_Toggle"] = "테스트 모드 전환"
L["Testmode_Toggle_Desc"] = "테스트 모드를 활성/비활성화 합니다. 이 모드는 대부분의 옵션이 주는 변화를 쉽게 확인할 수 있게 해줍니다. 모든 옵션을 표현해낼 수 없지만 이 테스트 모드에 대부분의 옵션이 포함되어 있습니다. 당신이 전장 내에 있으면 테스트 모드는 비활성화됩니다."
L["Testmode_ToggleAnimation"] = "테스트 모드 애니메이션 전환"
L["Testmode_ToggleAnimation_Desc"] = "애니메이션때문에 산만해지지 않고 특정 설정에 집중할 수 있도록 테스트 모드의 애니메이션을 켜거나/끕니다."
L["TestmodeSettings"] = "테스트 모드"
L["Thick"] = "두꺼운"
L["TOP"] = "상단"
L["TOPLEFT"] = "왼쪽 상단"
L["TOPRIGHT"] = "오른쪽 상단"
L["Trinket_Enabled"] = "장신구 활성화"
L["Trinket_Enabled_Desc"] = "활성화하면 검투사의 메달, 상황 적응과 가혹함의 아이콘을 표시합니다."
L["Trinket_ShowNumbers_Desc"] = "활성화하면 장신구 아이콘 위에 재사용 대기시간 숫자를 표시합니다"
L["Trinket_Width_Desc"] = "장신구의 너비입니다."
L["TrinketSettings"] = "장신구"
L["TrinketSettings_Desc"] = "장신구 관련 설정입니다"
L["Upwards"] = "위로"
L["UseBarHeight"] = "바 높이 사용"
L["UserDefined"] = "사용자 정의"
L["VerticalGrowdirection"] = "수직 성장 방향"
L["VerticalGrowdirection_Desc"] = "바가 위나 아래로 성장하도록 선택합니다"
L["VerticalPosition"] = "수직 위치"
L["VerticalSpacing"] = "수직 간격"
L["Width"] = "너비"

elseif locale == "ptBR" then
L["Allies"] = "Aliados"
L["AllyJoined"] = "Um aliado entrou no campo de batalha"
L["AllyLeft"] = "Um aliado saiu do campo de batalha"
L["BGSize_15"] = "1-15 Jogadores"
L["BGSize_40"] = "16-40 Jogadores"
L["General"] = "Geral"
L["GeneralSettings"] = "Configurações Gerais"

elseif locale == "ruRU" then
L["Allies"] = "Союзники"
L["allies"] = "союзники"
L["ally"] = "союзник"
L["Ally"] = "Союзник"
L["AllyJoined"] = "Союзник присоединился к полю боя"
L["AllyLeft"] = "Союзник покинул поле боя"
L["AND"] = "и"
L["AttachToObject"] = "Прикрепить к объекту"
L["Auras_Debuffs_Coloring_Enabled"] = "Цвет по типу дебаффа"
L["Auras_Debuffs_Fontsize_Desc"] = "Размер стака на иконках дебаффов"
L["Auras_Debuffs_ShowNumbers_Desc"] = "При включении на значках дебаффов будут числа, указывающие оставшееся время."
L["Auras_Debuffs_Textcolor_Desc"] = "Цвет текста стаков на дебаффах"
L["Auras_Enabled"] = "Включить ауры"
L["Auras_Enabled_Desc"] = "Когда включено, то будут значки ауры. А также будет количество времени перезарядки, а другой - для примененных стаков"
L["Auras_Fontsize_Desc"] = "Размер шрифта стаков на значках аур"
L["Auras_ShowNumbers_Desc"] = "Когда включено, на значках ауры появятся цифры, указывающие оставшееся время"
L["Auras_ShowTooltips"] = "Показать подсказки заклинаний"
L["Auras_Textcolor_Desc"] = "Цвет текстa стаков"
L["AurasFiltering_AddSpellID"] = "ID Зaклинания"
L["AurasFiltering_AddSpellID_Desc"] = "Введите ID или несколько ID, разделенными запятыми. ID добавляются в список фильтров. При включенной фильтрации ID отображается, только ауры, у которых указаны в списке фильтров."
L["AurasFiltering_Enabled_Desc"] = "Если этот параметр включен, вы увидите только %s, которые были добавлены в список фильтрации"
L["AurasFiltering_Filterlist_Desc"] = "Нажмите, чтобы удалить этот %s"
L["AurasFilteringSettings_Desc"] = "Здесь Вы можете контролировать, какая аура отображается"
L["AurasSettings"] = "Ауры"
L["AurasSettings_Desc"] = "Настройки аур (баффы и дебаффы)"
L["AurasStacktextSettings"] = "Текст стаков"
L["BarBackground"] = "Цвет Фона"
L["BarHeight_Desc"] = "Высота каждой полосы. Изменение этих настроек недоступно во время боя из-за ограничений интерфейса."
L["BarSettings"] = "Настройки полосы"
L["BarSettings_Desc"] = "Здесь вы можете настроить полосы"
L["BarTexture"] = "Текстура полосы"
L["BarWidth_Desc"] = "Ширина каждой полосы. Изменение этих настроек недоступно во время боя из-за ограничений интерфейса."
L["BattlegroundSize"] = "Размер поля боя"
L["BGSize_15"] = "1-15 игроков"
L["BGSize_15_Desc"] = "Эта настройка применяется для %s в ПБ с 1-15 игроками на каждой стороне"
L["BGSize_40"] = "16-40 игроков"
L["BGSize_40_Desc"] = "Эта настройка применяется для %s в ПБ с 16-40 игроками на каждой стороне"
L["BorderThickness"] = "Размер границы"
L["buff"] = "бафф"
L["BuffIcon"] = "Иконка баффа"
L["Buffs"] = "Баффы"
L["CENTER"] = "Центр "
L["Columns"] = "Столбцы"
L["Columns_Desc"] = "Сколько столбцов на игроках отображаются."
L["ConfirmProfileOverride"] = "Вы уверены, что хотите переопределить подпрофиль %s с подпрофилем %s"
L["ConvertCyrillic"] = "Преобразовать кириллицу"
L["ConvertCyrillic_Desc"] = "Преобразование кириллических символов, что позволяет легче читать их имена, если Вы играете против россиян"
L["Cooldown_Fontsize_Desc"] = "Размер шрифта времени перезарядки на Медальонах"
L["CopySettings"] = "Копирование настроек из %s"
L["CopySettings_Desc"] = "Нажмите здесь, если вы хотите импортировать настройки на подпрофиль %s."
L["Countdowntext"] = "Текст отсчёта"
L["Curse"] = "Curse"
L["CustomMacro_Desc"] = [=[При включении позволяет Вам задать пользовательский макрос. Пустое поле приведет к пустому макросу.
Доступные замены: %n получает замененного именем противника

Пример:
/cast Polymorph
/say Polymorph on %n
/targetlasttarget

Если цель противник, применяет Превращение, и пишет сообщение в канал say и далее выделяет вашу предыдущую цель.
Обратите внимание, что макросы можно писать только до 255 символов (включая замены).]=]
L["debuff"] = "дебафф"
L["DebuffIcon"] = "Иконка дебаффа"
L["Debuffs"] = "Дебаффы"
L["DebuffType_Filtering"] = "Фильтр по типу дебаффа"
L["DebuffType_Filtering_Desc"] = "Когда этот параметр включен, то вы увидите только дебаффы выбранного типа. Этот параметр не моделируется в тестовом режиме, так как для этого потребуется огромная база данных с тоннами заклинаний и их типом баффа."
L["DisableArenaFrames"] = "Отключение рамок арены"
L["DisableArenaFrames_Desc"] = "Отключает рамки арены на поле боя. Также работает при установке sArena"
L["Disease"] = "Болезнь"
L["DisplayType"] = "Тип отображения"
L["Downwards"] = "Вниз"
L["DR_Disorient"] = "Дезориентация"
L["DR_Incapacitate"] = "Паралич"
L["DR_Knockback"] = "Отбрасывание"
L["DR_Root"] = "Сковывание"
L["DR_Silence"] = "Немота"
L["DR_Stun"] = "Оглушение"
L["DrTracking_DisplayType_Desc"] = "Здесь Вы можете выбрать, должен ли статус DR быть с окрашенной рамкой, вокруг значка или быть, с цветовой перезарядкой в тексте. Обратите внимание, что настройки перезарядки текста будут работать - только в том случае, если Вы не используете аддон типа OmniCC, который изменяет цвет текста."
L["DrTracking_Enabled"] = "Включить слежение за DR"
L["DrTracking_Enabled_Desc"] = "Когда включено, слева от вражеских полос будут иконки слежения за диминишингом (DR). Зелёная рамка: Следующий контроль будет действовать половину времени. Жёлтая рамка: Следующий контроль будет действовать четверть времени. Красная рамка: Следующий контроль не будет действовать, потому что цель имунна."
L["DrTracking_ShowNumbers_Desc"] = "Показывать оставшееся время цифрами, пока диминишинг (DR) не сбросится."
L["DrTracking_Spacing"] = "Интервал DR"
L["DrTracking_Spacing_Desc"] = "Расстояние между иконками DR"
L["DrTrackingFiltering_Enabled_Desc"] = "При включении будут отображаться только иконки заклинаний из выбранных категорий."
L["DrTrackingFiltering_Filterlist_Desc"] = "Щёлкните чтобы отслеживать/не отслеживать эту категорию"
L["DrTrackingFilteringSettings_Desc"] = "Здесь можно выбрать какие категории DR будут отобржаться."
L["DrTrackingSettings"] = "Отслеживание DR"
L["DrTrackingSettings_Desc"] = "Настройки касающиеся отслеживания DR"
L["enemies"] = "враги"
L["Enemies"] = "Враги"
L["enemy"] = "враг"
L["Enemy"] = "Враг"
L["EnemyJoined"] = "Враг присоединился к полю боя"
L["EnemyLeft"] = "Враг покинул поле боя"
L["Filtering_Enabled"] = "Включить фильтрацию"
L["Filtering_Filterlist"] = "Список фильтров"
L["Font"] = "Шрифт"
L["Font_Desc"] = "Основной шрифт, используемый этим аддоном"
L["Font_Outline"] = "Контур шрифта"
L["Font_Outline_Desc"] = "Контур для шрифта"
L["Fontcolor"] = "Цвет шрифта"
L["FontShadow_Enabled"] = "Включить тень шрифта"
L["FontShadow_Enabled_Desc"] = "Когда включено будет тень вокруг шрифта. Вы можете выбрать цвет для этой тени"
L["FontShadowColor"] = "Цвет тени"
L["FontShadowColor_Desc"] = "Цвет тени у текста"
L["Fontsize"] = "Размер шрифта"
L["Frame"] = "Рамка"
L["Framescale"] = "Масштаб"
L["Framescale_Desc"] = "Масштаб главной рамки. Эта настройка недоступна в бою из-за боевой защиты Blizzard."
L["General"] = "Основное"
L["GeneralSettings"] = "Основные настройки"
L["GeneralSettings_Desc"] = "Некоторые основные настройки"
L["GeneralSettingsAllies"] = "Эти настройки применяются к союзникам, независимо от размера поля боя"
L["GeneralSettingsEnemies"] = "Эти настройки применяются к врагам, независимо от размера поля боя"
L["HealthBar_Background_Desc"] = "Цвет фона для полос здоровья."
L["HealthBar_Texture_Desc"] = "Текстура, используемая для полосы здоровья"
L["HealthBarSettings"] = "Полоса здоровья"
L["HealthBarSettings_Desc"] = "Настройки для полосы здоровья."
L["Height"] = "Высота"
L["Highlight_Color"] = "Цвет выделения"
L["Highlight_Color_Desc"] = "Цвет рамки игрока, на которым находится Ваш курсор"
L["HorizontalGrowdirection"] = "Горизонтальное направление роста"
L["HorizontalGrowdirection_Desc"] = "Позволяет выбрать, куда растут строки влево или вправо"
L["HorizontalSpacing"] = "Горизонтальный интервал"
L["IconsPerRow"] = "Иконка в строке"
L["KeybindSettings_Desc"] = "Здесь Вы можете настроить то, что должно произойти при нажатии левой-правой и средней кнопки"
L["LEFT"] = "Слева"
L["Leftwards"] = "Влево"
L["LevelText_Enabled"] = "Показать уровень игрока"
L["LevelText_Fontsize_Desc"] = "Размер шрифта, используемый для текста уровня"
L["LevelTextSettings"] = "Уровень игрока"
L["Locked"] = "Закрепить"
L["Locked_Desc"] = "Закрепляет рамку на месте"
L["Magic"] = "Магия"
L["MainFrameSettings"] = "Основные настройки рамки"
L["MainFrameSettings_Desc"] = "Настройки основной рамки, который используется для %s"
L["MaxPlayers"] = "Максимально врагов"
L["MaxPlayers_Desc"] = "Аддон не показывает врагов если есть больше врагов, чем заданное число"
L["MyFocus_Color"] = "Окрашивать запомненную цель"
L["MyFocus_Color_Desc"] = "Цвет, используемый для границ, указывающую, на Вашу текущую запомненную цель"
L["MyTarget_Color"] = "Окрашивать цель"
L["MyTarget_Color_Desc"] = "Цвет, используемый для границ вокруг полос здоровья, указывающую текущую цель"
L["Name"] = "Имена"
L["Name_Desc"] = "Настройки имён для полос здоровья."
L["Name_Fontsize_Desc"] = "Размер шрифта, используемый для имён врага"
L["Name_Textcolor_Desc"] = "Цвет текста, используемый для имён врага"
L["None"] = "Нет"
L["Normal"] = "Обычный"
L["NotAvailableInCombat"] = "Эта настройка недоступна, когда Вы в бою из-за боевых ограничений Blizzard."
L["Notifications_Allies_Enabled_Desc"] = "Когда включено, Вы будете уведомлены, когда союзник покидает поле боя или присоединяется к нему."
L["Notifications_Enabled"] = "Включить уведомления"
L["Notifications_Enemies_Enabled_Desc"] = "Когда включено, Вы будете уведомлены, когда враг покидает поле боя или присоединяется к нему."
L["NumericTargetindicator"] = "Счетчик целей"
L["NumericTargetindicator_Enabled_Desc"] = "Показывает, сколько %s нацелились на игрока."
L["NumericTargetindicator_Fontsize_Desc"] = "Размер шрифта для счетчика целей"
L["NumericTargetindicator_Textcolor_Desc"] = "Цвет текста для счетчика целей"
L["ObjectiveAndRespawn_Fontsize_Desc"] = "Размер текста для иконки Ключевых Задач. Отображает количество стаков дебаффа на флагоносце или количество дополнительного получаемого урона в Храме Котмогу."
L["ObjectiveAndRespawn_ObjectiveEnabled"] = "Показывать Ключевые Задачи"
L["ObjectiveAndRespawn_ObjectiveEnabled_Desc"] = "Показывать иконку флага, вагонетки или сферы могущества рядом с полоской"
L["ObjectiveAndRespawn_Position"] = "Позиция"
L["ObjectiveAndRespawn_Position_Desc"] = "Где должна быть иконка Ключевых задач, слева от иконки специализаций или справа от иконок Медальон/рассовых способностей."
L["ObjectiveAndRespawn_RespawnEnabled"] = "Включить Таймер Возрождения"
L["ObjectiveAndRespawn_RespawnEnabled_Desc"] = "При включении, появляется иконка отображающая время до возрождения врага."
L["ObjectiveAndRespawn_ShowNumbers_Desc"] = "При включении отображает оставшеея время, прежде чем враги будут живы снова."
L["ObjectiveAndRespawn_Textcolor_Desc"] = "Цвет текста для иконки Ключевых Задач. Цвет для отображения количества стаков дебаффа на флагоносце или количества дополнительного получаемого урона в Храме Котмогу."
L["ObjectiveAndRespawn_Width_Desc"] = "Ширина иконки Ключевых Задач"
L["ObjectiveAndRespawnSettings"] = "Ключевые Задачи"
L["ObjectiveAndRespawnSettings_Desc"] = "Настройки отображения Ключевых Задач на поле боя"
L["OffsetX"] = "Смещение X"
L["OffsetY"] = "Смещение Y"
L["OnlyShowMine"] = "Показывать только мой"
L["OnlyShowMine_Desc"] = "Показывать только %s что я применил(а)"
L["PlayerCount_Enabled"] = "Подсчет игроков"
L["PlayerCount_Enabled_Desc"] = "Если требуется текст для текущего числа игроков. Обратите внимание, что этот счетчик может отличаться от текущего количества показанных строк, связи с боевой защитой или покиданием союзников/врагов из РПБ"
L["PlayerCount_Fontsize_Desc"] = "Размер шрифта, используемого для подсчета игроков"
L["PlayerCount_Textcolor_Desc"] = "Цвет текста, используемый для подсчета игроков"
L["Point"] = "Точка "
L["PointAtObject"] = "Точка на объекте"
L["Poison"] = "Яд"
L["Position"] = "Позиция "
L["PowerBar_Background_Desc"] = "Цвет фона для полос ресурсов."
L["PowerBar_Enabled"] = "Включить полосу ресурсов"
L["PowerBar_Enabled_Desc"] = "Включите этот параметр, если Вы не видите полос ресурса, чтобы увидеть такие, как мана, ярость и т. д."
L["PowerBar_Height_Desc"] = "Высота полос ресурсов. Если сделать панель ресурсов выше, она автоматически сократится"
L["PowerBar_Texture_Desc"] = "Текстура используемая для полосы ресурсов"
L["PowerBarSettings"] = "Особый ресурс"
L["PowerBarSettings_Desc"] = "Настройки для полос особого ресурса"
L["Racial_Enabled"] = "Включить расовые способности"
L["Racial_Enabled_Desc"] = "Когда включено будут значки для использованных расовых способностей"
L["Racial_ShowNumbers_Desc"] = "Когда включено, то на расовых значках будет отображаться время перезарядки"
L["Racial_Width_Desc"] = "Ширина значка расовых способностей."
L["RacialFiltering_Enabled_Desc"] = "Когда этот параметр включен, Вы увидите только расы, которые проверяются в списке фильтрации."
L["RacialFiltering_Filterlist_Desc"] = "Нажмите, чтобы отслеживать / не отслеживать эту расовую способность"
L["RacialFilteringSettings_Desc"] = "Здесь вы можете выбрать расовую способность, которую Вы хотите отследить"
L["RacialSettings"] = "Расовые способности"
L["RacialSettings_Desc"] = "Настройки, касающиеся расовых способностей"
L["RangeIndicator_Alpha"] = "Прозрачность"
L["RangeIndicator_Alpha_Desc"] = "Прозрачность полоски, когда враг вне заданной зоны досягаемости"
L["RangeIndicator_Enabled"] = "Включить индикатор расстояния"
L["RangeIndicator_Enabled_Desc"] = "Когда этот параметр включен, рамка будет использовать выбранную прозрачность, когда враг вне заданной зоны досягаемости"
L["RangeIndicator_Everything"] = "Всё"
L["RangeIndicator_Frames"] = "Изменить прозрачность на"
L["RangeIndicator_Frames_Desc"] = "Задайте, какие части врага ряда, должны быть показаны с большей прозрачностью, когда противник находится вне досягаемости."
L["RangeIndicator_Range"] = "Расстояние"
L["RangeIndicator_Range_Desc"] = "Когда враг больше, чем это расстояние (в метрах), то на его рамку будет использоваться выбранная прозрачность"
L["RangeIndicator_Settings"] = "Индикатор расстояния"
L["RangeIndicator_Settings_Desc"] = "Здесь Вы можете настроить индикатор расстояния."
L["RBGSpecificSettings"] = "Рейтинговые ПБ"
L["RBGSpecificSettings_Desc"] = "Эти настройки применяются только в РПБ (Рейтинговое поле боя)"
L["RIGHT"] = "Справа"
L["Rightwards"] = "Направо"
L["RoleIcon_Enabled"] = "Включить значки ролей"
L["RoleIcon_Enabled_Desc"] = "Включите этот параметр, если Вы хотите увидеть значок роли на полосе здоровья"
L["RoleIcon_Size_Desc"] = "Размер значков для роли (ширина и высота)"
L["RoleIconSettings"] = "Значок ролей"
L["RoleIconSettings_Desc"] = "Настройки значка роли, отображаемого на полосе здоровья"
L["ShowNumbers"] = "Отображать время"
L["ShowRealmnames"] = "Отображать имена игровых миров"
L["ShowRealmnames_Desc"] = "Отображает имя игрового мира врагов"
L["Side"] = "Сторона "
L["Size"] = "Размер"
L["Spec_AuraDisplay_Enabled"] = "Включить отображение аур"
L["Spec_AuraDisplay_Enabled_Desc"] = "Когда этот параметр включен, вместо значка специализаций отображаются значки для управления толпой и прерываний (когда активна)"
L["Spec_AuraDisplay_ShowNumbers_Desc"] = "Показывать оставшееся время ауры со временем перезарядки"
L["Spec_Enabled"] = "Включить специализацию"
L["Spec_Enabled_Desc"] = "При включении будут значки для специализации игроков"
L["Spec_Width_Desc"] = "Ширина значка специализации."
L["SpecSettings"] = "Специализации"
L["SpecSettings_Desc"] = "Настройки, изменяющие значок специализации."
L["SpellID_Filtering"] = "Фильтр по spellID"
L["SymbolicTargetindicator_Enabled"] = "Метка Нацеливания"
L["SymbolicTargetindicator_Enabled_Desc"] = "Показывает квадрат, на классовых окрашенных значках для каждого %s, который нацелился на игрока."
L["TargetIndicator"] = "Индикатор цели"
L["TargetIndicator_Desc"] = "Цифровое и визуальное отображение индикаторов цели"
L["Testmode_Toggle"] = "Тестовый режим"
L["Testmode_Toggle_Desc"] = [=[Включает/выключает режим тестирования. Этот режим позволяет вам легче увидеть на то, что влияет большинства параметров. Не возможно смоделировать все варианты, но большинство из них показаны в этом причудливом тестовом режиме.
Тестовый режим отключен, если Вы находитесь на поле боя.]=]
L["Testmode_ToggleAnimation"] = "Вкл/Выкл анимацию"
L["Testmode_ToggleAnimation_Desc"] = "Включает/выключает анимацию тестового режима, так что Вы можете сосредоточиться на конкретной настройке, не отвлекаясь на анимации."
L["TestmodeSettings"] = "Тестовый режим"
L["Thick"] = "Толстый"
L["TOP"] = "Верх"
L["TOPLEFT"] = "Верхний левый"
L["TOPRIGHT"] = "В правом верхнем углу"
L["Trinket_Enabled"] = "Включить Медальоны"
L["Trinket_Enabled_Desc"] = "Когда включено, появится значки для Медальона гладиатора, Адаптации и Непреклонности."
L["Trinket_ShowNumbers_Desc"] = "Когда включено, то на значках медальонов будут отображаться, время перезарядки"
L["Trinket_Width_Desc"] = "Ширина медальона."
L["TrinketSettings"] = "Медальон"
L["TrinketSettings_Desc"] = "Настройки, касающиеся медальонов"
L["Upwards"] = "Выше"
L["UserDefined"] = "Пользовательский"
L["VerticalGrowdirection"] = "Вертикальное направление роста"
L["VerticalGrowdirection_Desc"] = "Позволяет выбрать, будут ли полосы расти вверх или вниз"
L["VerticalPosition"] = "Вертикальная позиция"
L["VerticalSpacing"] = "Вертикальный интервал"
L["Width"] = "Ширина"

elseif locale == "zhCN" then
L["Allies"] = "友方"
L["allies"] = "友方"
L["ally"] = "友方"
L["Ally"] = "友方"
L["AllyJoined"] = "一名友方玩家加入了战场"
L["AllyLeft"] = "一名友方玩家离开了战场"
L["AND"] = "和"
L["AttachToObject"] = "目标锚点"
L["AttachToObject_Desc"] = "请注意，并不是每个目标都可以选择，这取决于其他框架设置的定位。例如，你降锚点选择在种族技能或者天赋上时，将会有错误信息提示你。"
L["Auras_Buffs_Container_Color_Desc"] = "增益效果图标区域的外框颜色"
L["Auras_Buffs_Fontsize_Desc"] = "增益效果图标上对叠层数文字大小"
L["Auras_Buffs_ShowNumbers_Desc"] = "启用时，在增益效果图标上使用数字显示剩余时间"
L["Auras_Buffs_Textcolor_Desc"] = "增益效果图标上堆叠层数的文字颜色"
L["Auras_Debuffs_Coloring_Enabled"] = "通过减益效果显示颜色"
L["Auras_Debuffs_Coloring_Enabled_Desc"] = "启用时，可以选择框架边框或倒计时文本是否要通过减益效果的类型显示颜色（和默认界面一致，中毒是绿色，疾病是蓝色等等）"
L["Auras_Debuffs_Container_Color_Desc"] = "减益效果图标区域的外框颜色"
L["Auras_Debuffs_Fontsize_Desc"] = "减益效果图标上对叠层数文字大小"
L["Auras_Debuffs_ShowNumbers_Desc"] = "启用时，在减益效果图标上使用数字显示剩余时间"
L["Auras_Debuffs_Textcolor_Desc"] = "减益效果图标上堆叠层数的文字颜色"
L["Auras_Enabled"] = "开启光环"
L["Auras_Enabled_Desc"] = "启用时，会显示你在敌方身上的所有光环图标，同时会显示剩余时间和堆叠层数"
L["Auras_Fontsize_Desc"] = "光环图标上的堆叠数大小。"
L["Auras_ShowNumbers_Desc"] = "启用时，光环图标上会使用数字來显示剩余时间。"
L["Auras_ShowTooltips"] = "鼠标悬停显示法术信息"
L["Auras_Textcolor_Desc"] = "堆叠层数的文字颜色"
L["AurasFiltering_AddSpellID"] = "法术ID"
L["AurasFiltering_AddSpellID_Desc"] = "输入一个或多个想要加入到过滤列表的法术ID，使用逗号來分离。启用过滤时，只会显示在列表中法术ID的光环图标。"
L["AurasFiltering_Enabled_Desc"] = "启用时，只能看到已经加入到过滤列表中的%s。"
L["AurasFiltering_Filterlist_Desc"] = "点击删除这个%s"
L["AurasFilteringSettings_Desc"] = "你可以控制显示哪些光环"
L["AurasSettings"] = "光环"
L["AurasSettings_Desc"] = "光环设置 (增益和减益效果)。"
L["AurasStacktextSettings"] = "层数文字"
L["BarBackground"] = "背景颜色"
L["BarHeight_Desc"] = "每行的高度。由于暴雪的功能保护，此设置无法在战斗中使用。"
L["BarSettings"] = "血条设置"
L["BarSettings_Desc"] = "这里可以设置横列。"
L["BarTexture"] = "血条材质"
L["BarWidth_Desc"] = "每行的宽度。由于暴雪的战斗保护，此设置无法在战斗中使用。"
L["BattlegroundSize"] = "战场大小"
L["BGSize_15"] = "1-15 名玩家"
L["BGSize_15_Desc"] = "此设置适用于%s在每方1-15人的战场"
L["BGSize_40"] = "16-40 名玩家"
L["BGSize_40_Desc"] = "此设置适用于%s在每方16-40人的战场"
L["BorderThickness"] = "边框大小"
L["BOTTOM"] = "下"
L["BOTTOMLEFT"] = "左下"
L["BOTTOMRIGHT"] = "右下"
L["buff"] = "增益效果"
L["BuffContainer"] = "增益效果区域"
L["BuffIcon"] = "增益效果图标"
L["Buffs"] = "增益效果"
L["Button"] = "按钮"
L["CantAnchorToItself"] = "不能将锚点设置在此"
L["CENTER"] = "中"
L["Columns"] = "纵列"
L["Columns_Desc"] = "玩家需要显示成多少纵列"
L["ConfirmProfileOverride"] = "你确定要将%s设置从%s设置覆盖吗"
L["Container_Color"] = "区域边框颜色"
L["ContainerPosition"] = "区域位置"
L["ConvertCyrillic"] = "转换俄文"
L["ConvertCyrillic_Desc"] = "如果使用俄文版游戏时转换俄文，使名字更容易阅读。"
L["Cooldown_Fontsize_Desc"] = "饰品的倒计时数字大小。"
L["CopySettings"] = "从%s复制设置"
L["CopySettings_Desc"] = "点击这里从%s复制设置"
L["Countdowntext"] = "倒计时文本"
L["Curse"] = "诅咒"
L["CustomMacro_Desc"] = [=[这里您可以设置自定义宏。空字段将导致空宏。
可用的替换符号: %n 被替换为敌人的名字。

范例:
/targetexact %n
/施放 变形术
/说 已將 %n 变羊
/targetlasttarget

这个宏会将敌人选为目标施、放变形术、发送一条信息到“说”频道，然后选择您的前一个目标为当前目标
注意宏最长只能使用 255 个字符(包阔替换的名字)。]=]
L["debuff"] = "减益效果"
L["DebuffContainer"] = "减益效果区域"
L["DebuffIcon"] = "减益效果图标"
L["Debuffs"] = "减益效果"
L["DebuffType_Filtering"] = "通过减益效果过滤"
L["DebuffType_Filtering_Desc"] = "如果启用此选项，将只看到所选择类型的减益效果。测试模式中无法模拟这个选项，因为这需要一个庞大的法术和减益效果数据库。"
L["DisableArenaFrames"] = "禁用竞技场框架"
L["DisableArenaFrames_Desc"] = "在战场中禁用竞技场框架，也适用于Sarena插件。"
L["Disease"] = "疾病"
L["DisplayType"] = "显示类型"
L["Downwards"] = "向下"
L["DR_Disorient"] = "迷惑"
L["DR_Incapacitate"] = "瘫痪"
L["DR_Knockback"] = "击退"
L["DR_Root"] = "定身"
L["DR_Silence"] = "沉默"
L["DR_Stun"] = "昏迷"
L["DRContainer"] = "控制技能区域"
L["DrTracking_Container_Color_Desc"] = "控制技能图标区域的外框颜色"
L["DrTracking_DisplayType_Desc"] = "这里你可以选择控制递减状态是由图标边框颜色显示或者倒计时文本显示，请注意，倒计时文本计时只能使用一个插件如果你使用omnicc请关闭计时数字."
L["DrTracking_Enabled"] = "开启控制递减监视"
L["DrTracking_Enabled_Desc"] = "当此选项启用时，会在敌方横列边上显示控制技能递减的图标。绿色边框：下一个控制技能持续一半时间。黄色边框：下一个控制技能持续四分之一时间。红色边框：下一个控制技能无效，因为玩家已经免疫。"
L["DrTracking_ShowNumbers_Desc"] = "使用数字显示剩余时间，直到控制递减结束。"
L["DrTracking_Spacing"] = "控制递减间距"
L["DrTracking_Spacing_Desc"] = "控制递减图标之间的距离。"
L["DrTrackingFiltering_Enabled_Desc"] = "当此选项启用时，你只会看到在过滤列表中选中的法术图标."
L["DrTrackingFiltering_Filterlist_Desc"] = "点击监视/不监视类型"
L["DrTrackingFilteringSettings_Desc"] = "这里可以选择显示哪种控制递减类型"
L["DrTrackingSettings"] = "控制递减监视"
L["DrTrackingSettings_Desc"] = "控制时间和递减效果的监视。"
L["enemies"] = "敌方"
L["Enemies"] = "敌方"
L["enemy"] = "敌方"
L["Enemy"] = "敌方"
L["EnemyJoined"] = "一个敌对玩家加入了战场"
L["EnemyLeft"] = "一个敌对玩家离开了战场"
L["Filtering_Enabled"] = "开启过滤"
L["Filtering_Filterlist"] = "过滤列表"
L["Font"] = "字体"
L["Font_Desc"] = "插件所使用的主要字体。"
L["Font_Outline"] = "文字描边"
L["Font_Outline_Desc"] = "文字描边"
L["Fontcolor"] = "文字颜色"
L["FontShadow_Enabled"] = "开启文字阴影"
L["FontShadow_Enabled_Desc"] = "启用时，字体周围会出现阴影。你可以选择阴影的颜色。"
L["FontShadowColor"] = "阴影颜色"
L["FontShadowColor_Desc"] = "文字阴影颜色"
L["Fontsize"] = "字体大小"
L["Frame"] = "框架"
L["Framescale"] = "缩放大小"
L["Framescale_Desc"] = "主要框架的縮放大小。由于暴雪的战斗保护，此设置无法在战斗中使用。"
L["General"] = "常规"
L["GeneralSettings"] = "常规设置"
L["GeneralSettings_Desc"] = "一些基本的设置。"
L["GeneralSettingsAllies"] = "这种设置适用于友方，不管战场大小。"
L["GeneralSettingsEnemies"] = "这种设置适用于敌方，不管战场大小。"
L["HealthBar_Background_Desc"] = "血条背景颜色"
L["HealthBar_Texture_Desc"] = "血条材质"
L["HealthBarSettings"] = "血条"
L["HealthBarSettings_Desc"] = "血条设置。"
L["Height"] = "高度"
L["Highlight_Color"] = "高亮颜色"
L["Highlight_Color_Desc"] = "当前鼠标指向的玩家框架颜色"
L["HorizontalGrowdirection"] = "水平增长方向"
L["HorizontalGrowdirection_Desc"] = "选择水平向左或者向右方向增长"
L["HorizontalSpacing"] = "水平间距"
L["IconsPerRow"] = "每行图标"
L["KeybindSettings_Desc"] = "这里你可以设置鼠标左键、中键和右键点击配置。"
L["LEFT"] = "左侧"
L["LeftToTargetCounter"] = "目标数量的左侧"
L["Leftwards"] = "向左"
L["LevelText_Enabled"] = "显示玩家等级"
L["LevelText_Fontsize_Desc"] = "等级文字字体大小"
L["LevelText_OnlyShowIfNotMaxLevel"] = "只显示非满级玩家的等级"
L["LevelText_Textcolor_Desc"] = "等級文字字体颜色"
L["LevelTextSettings"] = "玩家等级"
L["Locked"] = "锁定位置"
L["Locked_Desc"] = "锁定框架位置。"
L["Magic"] = "魔法"
L["MainFrameSettings"] = "主框架设置"
L["MainFrameSettings_Desc"] = "%s所使用的主框架设置"
L["MaxPlayers"] = "最多敌方玩家数量"
L["MaxPlayers_Desc"] = "超过这个数量的敌方玩家插件将不会显示。"
L["MyFocus_Color"] = "焦点颜色"
L["MyFocus_Color_Desc"] = "用于显示当前焦点的边框的颜色。"
L["MyTarget_Color"] = "目标颜色"
L["MyTarget_Color_Desc"] = "用于显示当前目标的边框的颜色。"
L["Name"] = "名字"
L["Name_Desc"] = "血条上名字的设置。"
L["Name_Fontsize_Desc"] = "敌对玩家名字的文字大小。"
L["Name_Textcolor_Desc"] = "敌对玩家名字的文字颜色。"
L["None"] = "无"
L["Normal"] = "一般"
L["NotAvailableInCombat"] = "由于暴雪的战斗保护，此设置无法在战斗中使用。"
L["Notifications_Allies_Enabled_Desc"] = "启用时，您将在友方离开或加入战场时得到通知。"
L["Notifications_Enabled"] = "开启通知"
L["Notifications_Enemies_Enabled_Desc"] = " 开启时，敌方玩家加入或离开时会显示通知"
L["NumericTargetindicator"] = "目标计数"
L["NumericTargetindicator_Enabled_Desc"] = "显示有多少%s的当前目标是这个玩家"
L["NumericTargetindicator_Fontsize_Desc"] = "目标计数的文字大小。"
L["NumericTargetindicator_Textcolor_Desc"] = "目标计数的文字颜色。"
L["ObjectiveAndRespawn_Fontsize_Desc"] = "目标图标上的文字大小，用于显示旗帜减益效果层数文字或寇魔古寺的伤害加成。"
L["ObjectiveAndRespawn_ObjectiveEnabled"] = "显示目标"
L["ObjectiveAndRespawn_ObjectiveEnabled_Desc"] = "在敌方按钮旁显示旗帜、矿车、或携带宝珠图标。"
L["ObjectiveAndRespawn_Position"] = "位置"
L["ObjectiveAndRespawn_Position_Desc"] = "图标显示在专精图标的左侧，或饰品/种族技能图标的右侧。"
L["ObjectiveAndRespawn_RespawnEnabled"] = "开启复活计时"
L["ObjectiveAndRespawn_RespawnEnabled_Desc"] = "启用时，会显示敌方再次复活剩余时间的图标。"
L["ObjectiveAndRespawn_ShowNumbers_Desc"] = "启用时，会显示敌方再次复活剩余时间的数字。"
L["ObjectiveAndRespawn_Textcolor_Desc"] = "目标图标上的文字颜色，用于显示旗帜减益效果层数文字或寇魔古寺的伤害加成。"
L["ObjectiveAndRespawn_Width_Desc"] = "目标图标的宽度。"
L["ObjectiveAndRespawnSettings"] = "目标"
L["ObjectiveAndRespawnSettings_Desc"] = "关于战场目标的设置。"
L["OffsetX"] = "水平位置"
L["OffsetY"] = "垂直位置"
L["OnlyShowMine"] = "只显示我的"
L["OnlyShowMine_Desc"] = "只显示我施放的%s"
L["PlayerCount_Enabled"] = "玩家数量"
L["PlayerCount_Enabled_Desc"] = "是否要显示当前玩家数量。请注意，这个数量可能会和当前列表显示不同，因为插件在战斗中保护功能及有人离开随机战场。"
L["PlayerCount_Fontsize_Desc"] = "玩家数量文字大小"
L["PlayerCount_Textcolor_Desc"] = "玩家数量文字颜色。"
L["Point"] = "点"
L["PointAtObject"] = "目标点"
L["Poison"] = "中毒"
L["Position"] = "位置"
L["PowerBar_Background_Desc"] = "能量条背景颜色。"
L["PowerBar_Enabled"] = "开启能量条"
L["PowerBar_Enabled_Desc"] = "启用时，会显示法力、怒气等资源。"
L["PowerBar_Height_Desc"] = "能量条的高度。能量条越高生命条就会越窄。"
L["PowerBar_Texture_Desc"] = "能量条材质。"
L["PowerBarSettings"] = "能量条"
L["PowerBarSettings_Desc"] = "能量条设置。"
L["Racial_Enabled"] = "开启种族技能"
L["Racial_Enabled_Desc"] = "启用时，显示已使用的种族技能图标。"
L["Racial_ShowNumbers_Desc"] = "启用时，显示已使用的种族技能的冷却时间。"
L["Racial_Width_Desc"] = "种族技能宽度"
L["RacialFiltering_Enabled_Desc"] = "启用时，只会看到过滤列表中的种族技能。"
L["RacialFiltering_Filterlist_Desc"] = "点击监视/取消监视这个种族技能。"
L["RacialFilteringSettings_Desc"] = "在这里可以选择你想要追踪的种族技能"
L["RacialSettings"] = "种族技能"
L["RacialSettings_Desc"] = "种族技能设置。"
L["RangeIndicator_Alpha"] = "透明度"
L["RangeIndicator_Alpha_Desc"] = "敌人在超出指定范围内，敌方框架的透明度。"
L["RangeIndicator_Enabled"] = "开启距离提示"
L["RangeIndicator_Enabled_Desc"] = "启用时，敌人超出指定距离时，敌方框架会显示成指定的透明度。"
L["RangeIndicator_Everything"] = "更改所有透明度"
L["RangeIndicator_Frames"] = "更改透明度"
L["RangeIndicator_Frames_Desc"] = "当敌人超出距离范围时，敌方框架应该具有更高的透明度。"
L["RangeIndicator_Range"] = "距离范围"
L["RangeIndicator_Range_Desc"] = "敌人在这个距离范围以外时，敌方框架会显示成指定的透明度。"
L["RangeIndicator_Settings"] = "距离提示"
L["RangeIndicator_Settings_Desc"] = "这里可以调整距离提示"
L["RBGSpecificSettings"] = "评级战场"
L["RBGSpecificSettings_Desc"] = "这些设置只会生效于评级战场。"
L["RIGHT"] = "右侧"
L["Rightwards"] = "向右"
L["RoleIcon_Enabled"] = "开启职责图标"
L["RoleIcon_Enabled_Desc"] = "启用时，会在血条上显示职责图标。"
L["RoleIcon_Size_Desc"] = "职责图标的大小 (宽和高)"
L["RoleIconSettings"] = "职责图标"
L["RoleIconSettings_Desc"] = "血条上职责图标的设置"
L["ShowNumbers"] = "显示数字"
L["ShowRealmnames"] = "显示服务器"
L["ShowRealmnames_Desc"] = "显示敌方的服务器名"
L["Side"] = "方向"
L["SideAtObject"] = "目标方向"
L["Size"] = "大小"
L["Spec_AuraDisplay_Enabled"] = "开启光环显示"
L["Spec_AuraDisplay_Enabled_Desc"] = "启用此选项后，将会在专精图标上显示控制技能和打断技能图标（当控制技能在目标身上时）"
L["Spec_AuraDisplay_ShowNumbers_Desc"] = "使用倒计时数字显示光环剩余时间"
L["Spec_Enabled"] = "开启专精"
L["Spec_Enabled_Desc"] = "启用时，显示玩家的专精图标"
L["Spec_Width_Desc"] = "专精图标宽度。"
L["SpecSettings"] = "专精"
L["SpecSettings_Desc"] = "专精图标设置。"
L["SpellID_Filtering"] = "法术id过滤"
L["SymbolicTargetindicator_Enabled"] = "目标符号"
L["SymbolicTargetindicator_Enabled_Desc"] = "在被敌方选中的目标%s 上显示方形的职业颜色图标"
L["TargetIndicator"] = "目标指示"
L["TargetIndicator_Desc"] = "数字和符号的目标指示器。"
L["Testmode_Toggle"] = "测试模式"
L["Testmode_Toggle_Desc"] = [=[启用/禁用测试模式，这种模式使你更容易看到大多数选项功能。模拟所有选项是不可能的，但大多数设置选项均已在这个测试模式中。
当你在战场中时，测试模式将会被禁用。]=]
L["Testmode_ToggleAnimation"] = "测试模式动画"
L["Testmode_ToggleAnimation_Desc"] = "开启/禁用测试模式的动画，使你可以更专注于特定的设置而不受动画影响."
L["TestmodeSettings"] = "测试模式"
L["Thick"] = "饰品"
L["TOP"] = "上"
L["TOPLEFT"] = "左上"
L["TOPRIGHT"] = "右上"
L["Trinket_Enabled"] = "开启饰品"
L["Trinket_Enabled_Desc"] = "启用时会显示徽章等饰品冷却时间"
L["Trinket_ShowNumbers_Desc"] = "启用时，使用数字显示饰品的冷却时间。"
L["Trinket_Width_Desc"] = "饰品宽度"
L["TrinketSettings"] = "饰品"
L["TrinketSettings_Desc"] = "饰品设置"
L["Upwards"] = "向上"
L["UseBarHeight"] = "使用横列高度"
L["UserDefined"] = "玩家自定义"
L["VerticalGrowdirection"] = "垂直增长方向"
L["VerticalGrowdirection_Desc"] = "选择横列向上或者向下增长"
L["VerticalPosition"] = "垂直位置"
L["VerticalSpacing"] = "垂直间距"
L["Width"] = "宽度"

elseif locale == "zhTW" then
L["Allies"] = "友方"
L["allies"] = "友方"
L["ally"] = "友方"
L["Ally"] = "友方"
L["AllyJoined"] = "一位盟友加入了戰場"
L["AllyLeft"] = "一位盟友離開了戰場"
L["AND"] = "和"
L["AttachToObject"] = "對齊物件"
L["AttachToObject_Desc"] = "請注意，並不是每個物件都可以選擇，會依據和其他框架的相對位置而定。例如，如果已經將 PVP 天賦對齊到種族技能，而又嘗試將種族技能對齊到 PVP 天賦時，會出現錯誤訊息。"
L["Auras_Buffs_Container_Color_Desc"] = "增益效果圖示區域的外框顏色。"
L["Auras_Buffs_Fontsize_Desc"] = "增益效果圖示上堆疊層數的文字大小。"
L["Auras_Buffs_ShowNumbers_Desc"] = "啟用時，增益效果圖示上會有數字顯示剩餘時間。"
L["Auras_Buffs_Textcolor_Desc"] = "增益效果圖示上堆疊層數的文字顏色。"
L["Auras_Debuffs_Coloring_Enabled"] = "依據減益效果類型顯示顏色"
L["Auras_Debuffs_Coloring_Enabled_Desc"] = "啟用時，可以選擇框架邊框或倒數文字是否要依據減益效果的類型來顯示顏色 (和預設介面相同，中毒是綠色、疾病是藍色...等等)。"
L["Auras_Debuffs_Container_Color_Desc"] = "減益效果圖示區域的外框顏色。"
L["Auras_Debuffs_Fontsize_Desc"] = "減益效果圖示上堆疊層數的文字大小。"
L["Auras_Debuffs_ShowNumbers_Desc"] = "啟用時，減益效果圖示上會有數字顯示剩餘時間。"
L["Auras_Debuffs_Textcolor_Desc"] = "減益效果圖示上堆疊層數的文字顏色。"
L["Auras_Enabled"] = "啟用光環"
L["Auras_Enabled_Desc"] = "啟用時，會顯示光環圖示，同時也會顯示剩餘時間和堆疊層數的數字。"
L["Auras_Fontsize_Desc"] = "光環圖示上堆疊層數的文字大小。"
L["Auras_ShowNumbers_Desc"] = "啟用時，光環圖示上會使用數字來顯示剩餘時間。"
L["Auras_ShowTooltips"] = "顯示法術的滑鼠提示"
L["Auras_Textcolor_Desc"] = "堆疊層數的文字顏色。"
L["AurasFiltering_AddSpellID"] = "法術 ID"
L["AurasFiltering_AddSpellID_Desc"] = "輸入一個或多個要加入到過濾清單的法術 ID，使用逗號來分隔。啟用過濾時，只會顯示法術 ID 在清單內的光環。"
L["AurasFiltering_Enabled_Desc"] = "啟用時，只會看到已經加入到過濾清單內的%s。"
L["AurasFiltering_Filterlist_Desc"] = "點一下移除這個%s。"
L["AurasFilteringSettings_Desc"] = "控制要顯示哪些光環。"
L["AurasSettings"] = "光環"
L["AurasSettings_Desc"] = "光環的設定 (增益和減益效果)。"
L["AurasStacktextSettings"] = "層數文字"
L["BarBackground"] = "背景顏色"
L["BarHeight_Desc"] = "每個橫列的高度。因為暴雪的功能保護，戰鬥中無法調整設定。"
L["BarSettings"] = "條列設定"
L["BarSettings_Desc"] = "這裡可以調整橫列。"
L["BarTexture"] = "血量條材質"
L["BarWidth_Desc"] = "每個橫列的寬度。因為暴雪的功能保護，戰鬥中無法調整設定。"
L["BattlegroundSize"] = "戰場大小"
L["BGSize_15"] = "1–15 名玩家"
L["BGSize_15_Desc"] = "在每方 1-15 名玩家的戰場，設定會套用到%s。"
L["BGSize_40"] = "16-40 名玩家"
L["BGSize_40_Desc"] = "在每方 16-40 名玩家的戰場，設定會套用到%s。"
L["BorderThickness"] = "外框粗細"
L["BOTTOM"] = "下"
L["BOTTOMLEFT"] = "左下"
L["BOTTOMRIGHT"] = "右下"
L["buff"] = "增益效果"
L["BuffContainer"] = "增益效果區域"
L["BuffIcon"] = "增益效果圖示"
L["Buffs"] = "增益效果"
L["Button"] = "按鈕"
L["CantAnchorToItself"] = "不能對齊到自己!"
L["CENTER"] = "中"
L["Columns"] = "直行"
L["Columns_Desc"] = "玩家要顯示成多少個直行。"
L["ConfirmProfileOverride"] = "是否確定要覆蓋子設定檔  %s，使用子設定檔 %s 取代"
L["Container_Color"] = "區域外框顏色"
L["ContainerPosition"] = "區域位置"
L["ConvertCyrillic"] = "轉換西里爾字母"
L["ConvertCyrillic_Desc"] = "不是使用俄文版遊戲時轉換西里爾字母，讓名字更容易閱讀。"
L["Cooldown_Fontsize_Desc"] = "飾品的倒數時間數字文字大小。"
L["CopySettings"] = "從%s複製設定"
L["CopySettings_Desc"] = "點一下從%s匯入子設定檔。"
L["Countdowntext"] = "倒數時間文字"
L["Curse"] = "詛咒"
L["CustomMacro_Desc"] = [=[這裡可以設定自訂巨集，空白的欄位會產生空巨集。
可用的替換符號: %n 會替換成敵人的名字。

範例:
/targetexact %n
/施放 變形術
/說 已將 %n 變羊
/targetlasttarget

這個巨集會將敵人選為目標、施放變形術、輸出一段訊息到說話頻道，然後選取前一個目標為當前目標。

請注意，巨集最長只能使用 255 個字元(包含替換後的敵人名字)。]=]
L["debuff"] = "減益效果"
L["DebuffContainer"] = "減益效果區域"
L["DebuffIcon"] = "減益效果圖示"
L["Debuffs"] = "減益效果"
L["DebuffType_Filtering"] = "依據減益效果類型過濾"
L["DebuffType_Filtering_Desc"] = "啟用時，只會看所選類型的減益效果。測試模式中不會模擬這個選項，因為需要龐大的資料庫才能模擬出魔獸海量的法術和減益效果類型。"
L["DisableArenaFrames"] = "停用競技場框架"
L["DisableArenaFrames_Desc"] = "在戰場中停用停用競技場框架，同樣適用於 sArena 插件。"
L["Disease"] = "疾病"
L["DisplayType"] = "顯示類型"
L["Downwards"] = "向下"
L["DR_Disorient"] = "暈眩"
L["DR_Incapacitate"] = "癱瘓"
L["DR_Knockback"] = "擊退"
L["DR_Root"] = "定身"
L["DR_Silence"] = "沉默"
L["DR_Stun"] = "昏迷"
L["DRContainer"] = "控場區域"
L["DrTracking_Container_Color_Desc"] = "控場圖示區域的外框顏色。"
L["DrTracking_DisplayType_Desc"] = "選擇控場追蹤的指示要使用圖示周圍的彩色外框，還是彩色的倒數文字。請注意，沒有使用像是 OmniCC 這類型會更改文字顏色的插件時，彩色的倒數文字才能正常運作。"
L["DrTracking_Enabled"] = "啟用控場追蹤"
L["DrTracking_Enabled_Desc"] = "啟用時會在敵方的橫列旁顯示控場效果遞減的監控圖示。綠色邊框：下一個控場技能時間減半，黃色邊框：下一個控場技能時間只有四分之一，紅色邊框：下一個控場技能無效，因為玩家已經免疫。"
L["DrTracking_ShowNumbers_Desc"] = "使用數字顯示剩餘時間，直到控場效果重置。"
L["DrTracking_Spacing"] = "控場追蹤間距"
L["DrTracking_Spacing_Desc"] = "控場追蹤圖示之間的距離。"
L["DrTrackingFiltering_Enabled_Desc"] = "啟用時，只會看到過濾清單中所勾選的類別中的法術圖示。"
L["DrTrackingFiltering_Filterlist_Desc"] = "點一下以追蹤/取消追蹤這個類別。"
L["DrTrackingFilteringSettings_Desc"] = "選擇要顯示的控場追蹤類別。"
L["DrTrackingSettings"] = "控場追蹤"
L["DrTrackingSettings_Desc"] = "控場時間和遞減效果追蹤的設定。"
L["enemies"] = "敵方"
L["Enemies"] = "敵方"
L["enemy"] = "敵方"
L["Enemy"] = "敵方"
L["EnemyJoined"] = "一個敵方玩家加入了戰場"
L["EnemyLeft"] = "一個敵方玩家離開了戰場"
L["Filtering_Enabled"] = "啟用過濾"
L["Filtering_Filterlist"] = "過濾清單"
L["Font"] = "字體"
L["Font_Desc"] = "插件所使用的主要字體。"
L["Font_Outline"] = "文字外框"
L["Font_Outline_Desc"] = "文字的外框。"
L["Fontcolor"] = "顏色"
L["FontShadow_Enabled"] = "啟用文字陰影"
L["FontShadow_Enabled_Desc"] = "啟用時，文字周圍會顯示陰影，可以自行選擇陰影的顏色。"
L["FontShadowColor"] = "陰影顏色"
L["FontShadowColor_Desc"] = "文字陰影的顏色。"
L["Fontsize"] = "文字大小"
L["Frame"] = "外框"
L["Framescale"] = "縮放大小"
L["Framescale_Desc"] = "主要框架的縮放大小。因為暴雪的功能保護，戰鬥中無法調整設定。"
L["General"] = "一般"
L["GeneralSettings"] = "一般設定"
L["GeneralSettings_Desc"] = "一些基本的設定。"
L["GeneralSettingsAllies"] = "設定會套用到友方，不論戰場的大小。"
L["GeneralSettingsEnemies"] = "設定會套用到敵方，不論戰場的大小。"
L["HealthBar_Background_Desc"] = "血量條的背景顏色。"
L["HealthBar_Texture_Desc"] = "血量條的材質。"
L["HealthBarSettings"] = "血量條"
L["HealthBarSettings_Desc"] = "血量條的設定。"
L["Height"] = "高度"
L["Highlight_Color"] = "顯著標示顏色"
L["Highlight_Color_Desc"] = "滑鼠目前指向的玩家框架顏色。"
L["HorizontalGrowdirection"] = "水平增長方向"
L["HorizontalGrowdirection_Desc"] = "選擇直行要向左或向右增長。"
L["HorizontalSpacing"] = "水平間距"
L["IconsPerRow"] = "每個橫列的圖示數量"
L["KeybindSettings_Desc"] = "這裡可以設定滑鼠左鍵、右鍵和中鍵點擊時的功能。"
L["LEFT"] = "左側"
L["LeftToTargetCounter"] = "目標數量的左側"
L["Leftwards"] = "向左"
L["LevelText_Enabled"] = "顯示玩家等級"
L["LevelText_Fontsize_Desc"] = "等級文字的文字大小。"
L["LevelText_OnlyShowIfNotMaxLevel"] = "只有不是滿等時才顯示等級"
L["LevelText_Textcolor_Desc"] = "等級文字的文字顏色。"
L["LevelTextSettings"] = "玩家等級"
L["Locked"] = "鎖定位置"
L["Locked_Desc"] = "鎖定框架的位置。"
L["Magic"] = "魔法"
L["MainFrameSettings"] = "主要框架設定"
L["MainFrameSettings_Desc"] = "%s所使用的主要框架設定。"
L["MaxPlayers"] = "最多敵方數量"
L["MaxPlayers_Desc"] = "超過這個數字的敵方不會顯示出來。"
L["MyFocus_Color"] = "專注目標顏色"
L["MyFocus_Color_Desc"] = "用來顯著標示當前專注目標的血條外框顏色。"
L["MyTarget_Color"] = "目標顏色"
L["MyTarget_Color_Desc"] = "用來顯著標示當前目標的血條外框顏色。"
L["Name"] = "名字"
L["Name_Desc"] = "血條上名字的設定。"
L["Name_Fontsize_Desc"] = "敵方名字的文字大小。"
L["Name_Textcolor_Desc"] = "敵方名字的文字顏色。"
L["None"] = "無"
L["Normal"] = "一般"
L["NotAvailableInCombat"] = "因為暴雪的功能保護，戰鬥中無法調整設定。"
L["Notifications_Allies_Enabled_Desc"] = "啟用時， 友方玩家加入或離開戰場時會顯示通知。"
L["Notifications_Enabled"] = "啟用通知"
L["Notifications_Enemies_Enabled_Desc"] = "啟用時， 敵方玩家加入或離開戰場時會顯示通知。"
L["NumericTargetindicator"] = "目標數量"
L["NumericTargetindicator_Enabled_Desc"] = "顯示有多少%s的當前目標是這個玩家。"
L["NumericTargetindicator_Fontsize_Desc"] = "目標數量的文字大小。"
L["NumericTargetindicator_Textcolor_Desc"] = "目標數量的文字顏色。"
L["ObjectiveAndRespawn_Fontsize_Desc"] = "任務目標圖示上的文字大小，用於旗幟減益效果層數文字或科特魔古神廟的傷害增加量。"
L["ObjectiveAndRespawn_ObjectiveEnabled"] = "顯示任務目標"
L["ObjectiveAndRespawn_ObjectiveEnabled_Desc"] = "在敵方按鈕旁顯示旗幟、礦車、或攜帶異能球圖示。"
L["ObjectiveAndRespawn_Position"] = "位置"
L["ObjectiveAndRespawn_Position_Desc"] = "圖示要顯示在專精圖示的左側，或是飾品/種族技能圖示的右側。"
L["ObjectiveAndRespawn_RespawnEnabled"] = "顯示重生時間"
L["ObjectiveAndRespawn_RespawnEnabled_Desc"] = "啟用時，會顯示敵人再次復活的剩餘時間圖示。"
L["ObjectiveAndRespawn_ShowNumbers_Desc"] = "啟用時，會使用數字顯示敵人再次復活的剩餘時間。"
L["ObjectiveAndRespawn_Textcolor_Desc"] = "任務目標圖示上的文字顏色，用於旗幟減益效果層數文字或科特魔古神廟的傷害增加量。"
L["ObjectiveAndRespawn_Width_Desc"] = "任務目標圖示的寬度。"
L["ObjectiveAndRespawnSettings"] = "任務目標"
L["ObjectiveAndRespawnSettings_Desc"] = "戰場任務目標的設定。"
L["OffsetX"] = "水平位置"
L["OffsetY"] = "垂直位置"
L["OnlyShowMine"] = "只顯示我的"
L["OnlyShowMine_Desc"] = "只顯示我施放的%s。"
L["PlayerCount_Enabled"] = "玩家數量"
L["PlayerCount_Enabled_Desc"] = "是否要顯示目前玩家數量的文字。請注意，這個數量可能會和目前的橫列數量不同，因為插件的戰鬥中保護功能或離開隨機戰場的人數。"
L["PlayerCount_Fontsize_Desc"] = "玩家數量的文字大小。"
L["PlayerCount_Textcolor_Desc"] = "玩家數量的文字顏色。"
L["Point"] = "對齊點"
L["PointAtObject"] = "物件的對齊點"
L["Poison"] = "中毒"
L["Position"] = "位置"
L["PowerBar_Background_Desc"] = "能量條的背景顏色。"
L["PowerBar_Enabled"] = "啟用資源條"
L["PowerBar_Enabled_Desc"] = "啟用時，會顯示法力、怒氣等資源。"
L["PowerBar_Height_Desc"] = "資源條的高度。資源條愈高生命條就會愈窄。"
L["PowerBar_Texture_Desc"] = "能量條的材質。"
L["PowerBarSettings"] = "能量條"
L["PowerBarSettings_Desc"] = "資源條的設定。"
L["Racial_Enabled"] = "啟用種族特長"
L["Racial_Enabled_Desc"] = "啟用時，會顯示已使用的種族特長圖示。"
L["Racial_ShowNumbers_Desc"] = "啟用時，會在圖示上使用數字顯示種族特長的冷卻時間。"
L["Racial_Width_Desc"] = "種族技能的寬度。"
L["RacialFiltering_Enabled_Desc"] = "啟用時，只會看到過濾清單中所勾選的種族技能。"
L["RacialFiltering_Filterlist_Desc"] = "點一下以監控/取消監控這個種族技能。"
L["RacialFilteringSettings_Desc"] = "在這裡選擇要追蹤的種族技能。"
L["RacialSettings"] = "種族特長"
L["RacialSettings_Desc"] = "種族特長的設定。"
L["RangeIndicator_Alpha"] = "透明度"
L["RangeIndicator_Alpha_Desc"] = "敵人超出指定距離時，敵方框架的透明度。"
L["RangeIndicator_Enabled"] = "啟用距離指示"
L["RangeIndicator_Enabled_Desc"] = "啟用時，敵人超出指定距離時，敵方框架會顯示成指定的透明度。"
L["RangeIndicator_Everything"] = "更改全部的透明度"
L["RangeIndicator_Frames"] = "更改透明度"
L["RangeIndicator_Frames_Desc"] = "當敵人超出距離範圍時，橫列的哪個部分要變得比較透明。"
L["RangeIndicator_Range"] = "距離範圍"
L["RangeIndicator_Range_Desc"] = "敵人在這個距離 (碼) 以外時，敵方框架會顯示成指定的透明度。"
L["RangeIndicator_Settings"] = "距離指示"
L["RangeIndicator_Settings_Desc"] = "這裡可以調整距離指示。"
L["RBGSpecificSettings"] = "積分戰場"
L["RBGSpecificSettings_Desc"] = "這些設定只會套用到積分戰場。"
L["RIGHT"] = "右側"
L["Rightwards"] = "向右"
L["RoleIcon_Enabled"] = "啟用角色圖示"
L["RoleIcon_Enabled_Desc"] = "啟用時，會在血量條上顯示角色圖示。"
L["RoleIcon_Size_Desc"] = "角色圖示的大小 (寬和高)。"
L["RoleIconSettings"] = "角色圖示"
L["RoleIconSettings_Desc"] = "血量條上面的角色圖示設定。"
L["ShowNumbers"] = "顯示數字"
L["ShowRealmnames"] = "顯示伺服器"
L["ShowRealmnames_Desc"] = "顯示敵方的伺服器名稱。"
L["Side"] = "方向"
L["SideAtObject"] = "物件的方向"
L["Size"] = "大小"
L["Spec_AuraDisplay_Enabled"] = "顯示光環"
L["Spec_AuraDisplay_Enabled_Desc"] = "啟用時，會顯示群體控場和斷法技能的圖示 (有啟用時)，取代專精圖示。"
L["Spec_AuraDisplay_ShowNumbers_Desc"] = "顯示光環剩餘時間的倒數數字。"
L["Spec_Enabled"] = "啟用專精"
L["Spec_Enabled_Desc"] = "啟用時，會顯示玩家專精的圖示。"
L["Spec_Width_Desc"] = "專精圖示的寬度。"
L["SpecSettings"] = "專精"
L["SpecSettings_Desc"] = "專精圖示的設定。"
L["SpellID_Filtering"] = "依據法術 ID 過濾"
L["SymbolicTargetindicator_Enabled"] = "目標符號"
L["SymbolicTargetindicator_Enabled_Desc"] = "在當前目標是玩家的%s上顯示方形的職業顏色圖示。"
L["TargetIndicator"] = "目標指示"
L["TargetIndicator_Desc"] = "數字和符號的目標指示器。"
L["Testmode_Toggle"] = "切換測試模式"
L["Testmode_Toggle_Desc"] = [=[啟用/停用測試模式，更容易觀察調整設定選項時的變化。無法模擬全部的選項效果，但在這個華麗的測試模式中，已經包含了絕大部分。

已經在戰場中時，會停用測試模式。]=]
L["Testmode_ToggleAnimation"] = "切換測試動畫"
L["Testmode_ToggleAnimation_Desc"] = "啟用/停用測試模式的動畫效果，以便能夠更專注於設定某個選項，而不會被動畫干擾。"
L["TestmodeSettings"] = "測試模式"
L["Thick"] = "飾品"
L["TOP"] = "上"
L["TOPLEFT"] = "左上"
L["TOPRIGHT"] = "右上"
L["Trinket_Enabled"] = "啟用飾品"
L["Trinket_Enabled_Desc"] = "啟用時會顯示鬥士徽章等飾品圖示。"
L["Trinket_ShowNumbers_Desc"] = "啟用時，會在圖示上使用數字顯示飾品的冷卻時間。"
L["Trinket_Width_Desc"] = "飾品的寬度。"
L["TrinketSettings"] = "飾品"
L["TrinketSettings_Desc"] = "飾品的設定。"
L["Upwards"] = "向上"
L["UseBarHeight"] = "使用橫列高度"
L["UserDefined"] = "玩家自訂的"
L["VerticalGrowdirection"] = "垂直增長方向"
L["VerticalGrowdirection_Desc"] = "選擇橫列要向上或向下增長。"
L["VerticalPosition"] = "垂直位置"
L["VerticalSpacing"] = "垂直間距"
L["Width"] = "寬度"

end

-- How long before DR resets ?
Data.resetTimes = {
	-- As of 6.1, this is always 18 seconds, and no longer has a range between 15 and 20 seconds.
	default   = 18,
	-- Knockbacks are a special case
	knockback = 10,
}
Data.RESET_TIME = Data.resetTimes.default

-- Successives diminished durations
Data.diminishedDurations = {
	-- Decreases by 50%, immune at the 4th application
	default   = { 0.50, 0.25 },
	-- Decreases by 35%, immune at the 5th application
	taunt     = { 0.65, 0.42, 0.27 },
	-- Immediately immune
	knockback = {},
}

-- Spells and providers by categories
--[[ Generic format:
	category = {
		-- When the debuff and the spell that applies it are the same:
		debuffId = true
		-- When the debuff and the spell that applies it differs:
		debuffId = spellId
		-- When several spells apply the debuff:
		debuffId = {spellId1, spellId2, ...}
	}
--]]

-- See http://eu.battle.net/wow/en/forum/topic/11267997531
-- or http://blue.mmo-champion.com/topic/326364-diminishing-returns-in-warlords-of-draenor/
local spellsAndProvidersByCategory = {

	--[[ TAUNT ]]--
	taunt = {
		-- Death Knight
		[ 56222] = true, -- Dark Command
		[ 57603] = true, -- Death Grip
		-- I have also seen this spellID used for the Death Grip debuff in MoP:
		[ 51399] = true, -- Death Grip
		-- Demon Hunter
		[185245] = true, -- Torment
		-- Druid
		[  6795] = true, -- Growl
		-- Hunter
		[ 20736] = true, -- Distracting Shot
		-- Monk
		[116189] = 115546, -- Provoke
		[118635] = 115546, -- Provoke via the Black Ox Statue -- NEED TESTING
		-- Paladin
		[ 62124] = true, -- Reckoning
		-- Warlock
		[ 17735] = true, -- Suffering (Voidwalker)
		-- Warrior
		[   355] = true, -- Taunt
		-- Shaman
		[ 36213] = true, -- Angered Earth (Earth Elemental)
	},

	--[[ INCAPACITATES ]]--
	incapacitate = {
		-- Druid
		[236025] = true, -- Maim incap
		-- Hunter
		[  3355] = 187650, -- Freezing Trap
		[203337] = 187650, -- Freezing Trap talented
		[213691] = true, -- Scatter Shot
		-- Mage
		[   118] = true, -- Polymorph
		[ 28272] = true, -- Polymorph (pig)
		[ 28271] = true, -- Polymorph (turtle)
		[ 61305] = true, -- Polymorph (black cat)
		[ 61721] = true, -- Polymorph (rabbit)
		[ 61780] = true, -- Polymorph (turkey)
		[126819] = true, -- Polymorph (procupine)
		[161353] = true, -- Polymorph (bear cub)
		[161354] = true, -- Polymorph (monkey)
		[161355] = true, -- Polymorph (penguin)
		[161372] = true, -- Polymorph (peacock)
		[277787] = true, -- Polymorph (direhorn)
		[277792] = true, -- Polymorph (bumblebee)
		[ 82691] = 113724, -- Ring of Frost
		-- Monk
		[115078] = true, -- Paralysis
		-- Paladin
		[ 20066] = true, -- Repentance
		-- Priest
		[ 200196] = 88625, -- Holy Word: Chastise incap
		-- Rogue
		[  1776] = true, -- Gouge
		[  6770] = true, -- Sap
		-- Shaman
		[ 51514] = true, -- Hex
		[211004] = true, -- Hex (spider)
		[210873] = true, -- Hex (raptor)
		[211015] = true, -- Hex (cockroach)
		[211010] = true, -- Hex
		[277784] = true, -- Hex
		[277778] = true, -- Hex
		[269352] = true, -- Hex
		[197214] = true, -- Sundering
		-- Warlock
		[  6789] = true, -- Mortal Coil
		-- Pandaren
		[107079] = true, -- Quaking Palm
		-- Demon Hunter
		[217832] = true, -- Imprison
		[221527] = true, -- Imprison talented
	},

	--[[ SILENCES ]]--
	silence = {
		-- Death Knight
		[ 47476] = true, -- Strangulate
		-- Demon Hunter
		[204490] = 202137, -- Sigil of Silence
		-- Druid
		[81261] = true, -- Solar Beam
		-- Hunter
		[202933] = 202914, -- Spider Sting
		-- Mage
		-- Paladin
		[217824] = 31935, -- Prot pala silence
		-- Priest
		[ 15487] = true, -- Silence
		-- Rogue
		[  1330] = 703, -- Garrote
	},

	--[[ DISORIENTS ]]--
	disorient = {
		-- Death Knight
		[207167] = true, -- Blinding Sleet
		-- Demon Hunter
		[207685] = 207684, -- Sigil of Misery
		-- Druid
		[  2637] = true, -- Hibernate
		[ 33786] = true, -- Cyclone (rdruid/feral)
		[209753] = true, -- Cyclone (Balance)
		[236748] = true, -- Disorienting Roar
		-- Hunter
		-- Mage
		[ 31661] = true, -- Dragon's Breath
		-- Monk
		[198909] = 198898, -- Song of Chi-ji
		[202274] = 115181, -- Incendiary Brew
		-- Paladin
		[105421] = 115750, -- Blinding Light
		-- Priest
		[  8122] = true, -- Psychic Scream
		[   605] = true, -- Dominate Mind
		[226943] = 205369, -- Mind Bomb
		-- Rogue
		[  2094] = true, -- Blind
		-- Warlock
		[118699] = 5782, -- Fear
		[  6358] = true, -- Seduction (Succubus)
		[261589] = 261589, -- Seduction (Player)
		-- Warrior
		[  5246] = true, -- Intimidating Shout
	},

	--[[ STUNS ]]--
	stun = {
		-- Death Knight
		[108194] = true, -- Asphyxiate (unholy/frost)
		[221562] = true, -- Asphyxiate (blood)
		[ 91800] = 47481, -- Gnaw
		[ 91797] = 47481, -- Gnaw (transformed)
		[210141] = 210128, -- Zombie Explosion
		[235612] = 279302, -- frost dk stun
		[287254] = 196770, -- remorseless winter stun
		-- Demon Hunter
		[179057] = true, -- Chaos Nova
		[205630] = 205630, -- Illidan's Grasp, primary effect
		[208618] = 208173, -- Illidan's Grasp, secondary effect
		[211881] = true, -- Fel Eruption
		-- Druid
		[203123] = true, -- Maim stun
		[  5211] = true, -- Mighty Bash
		[163505] = 1822, -- Rake (Stun from Prowl)
		[202244] = 202246, -- Overrun bear stun
		-- Hunter
		[117526] = 109248, -- Binding Shot
		[ 24394] = 19577, -- Intimidation
		-- Mage

		-- Monk
		[202346] = 121253, -- Keg stun
		[119381] =   true, -- Leg Sweep
		-- Paladin
		[   853] = true, -- Hammer of Justice
		-- Priest
		[200200] = 88625, -- Holy word: Chastise stun
		[ 64044] = true, -- Psychic Horror stun
		-- Rogue
		[  1833] = true, -- Cheap Shot
		[   408] = true, -- Kidney Shot
		[199804] = true, -- Between the Eyes
		-- Shaman
		[118345] = true, -- Pulverize (Primal Earth Elemental)
		[118905] = 192058, -- Static Charge (Capacitor Totem)
		[204437] = true, -- Lightning Lasso
		-- Warlock
		[ 89766] = 111898, -- Axe Toss (Felguard)
		[ 89766] = 89766, -- Axe Toss (Felguard) 2
		[ 30283] = true, -- Shadowfury
		-- Warrior
		[132168] = 46968, -- Shockwave
		[132169] = 107570, -- Storm Bolt
		[199085] = 6544, -- Heroic Leap stun
		-- Tauren
		[ 20549] = true, -- War Stomp
		[255723] = true, -- Bull Rush
		-- Kul Tiran
		[287712] = true, -- Haymaker
	},

	--[[ ROOTS ]]--
	root = {
		-- Death Knight
		[204085] = 45524, -- Deathchill root
		[198121] = true, -- Frostbite
		[233395] = 196770, -- Frozen Center
		-- Druid
		[   339] = true, -- Entangling Roots
		[235963] = true, -- Entangling Roots undispellable
		[170855] = 102342, -- Entangling Roots ironbark
		[102359] = true, -- Mass Entanglement
		[ 45334] = 16979, -- Immobilized (wild charge, bear form)
		-- Hunter
		[162480] = 162488, -- Steel Trap root
		[190927] = 190925, -- Harpoon
		[212638] = true, -- tracker's net
		-- Mage
		[   122] = true, -- Frost Nova
		[ 33395] = true, -- Freeze (Water Elemental)
		[228600] = 199786, -- Glacial spike
		-- Monk
		[116706] = 116095, -- Disable
		-- Priest
		-- Warlock
		[233582] = 17962, -- Destro root
		-- Shaman
		[ 64695] = 51485, -- Earthgrab Totem
		[285515] = 196840, -- frost shock root (talent)
	},

	--[[ KNOCKBACK ]]--
	knockback = {
		-- Death Knight
		[108199] = true, -- Gorefiend's Grasp
		-- Druid
		[102793] = true, -- Ursol's Vortex
		[132469] = true, -- Typhoon
		-- Hunter
		-- Shaman
		[ 51490] = true, -- Thunderstorm
		-- Warlock
		[  6360] = true, -- Whiplash
		[115770] = true, -- Fellash
	},
}

-- Map deprecatedCategories to the new ones
local deprecatedCategories = {
	ctrlroot       = true,
	shortroot      = true,
	ctrlstun       = true,
	rndstun        = true,
	cyclone        = true,
	shortdisorient = true,
	fear           = true,
	horror         = true,
	mc             = true,
	disarm         = true,
}

Data.categoryNames = {
	root           = L["Roots"],
	stun           = L["Stuns"],
	disorient      = L["Disorients"],
	silence        = L["Silences"],
	taunt          = L["Taunts"],
	incapacitate   = L["Incapacitates"],
	knockback      = L["Knockbacks"],
}

Data.pveDR = {
	stun     = true,
	taunt    = true,
}

--- List of spellID -> DR category
Data.spells = {}

--- List of spellID => ProviderID
Data.providers = {}

-- Dispatch the spells in the final tables
for category, spells in pairs(spellsAndProvidersByCategory) do

	for spell, provider in pairs(spells) do
		Data.spells[spell] = category
		if provider == true then -- "== true" is really needed
			Data.providers[spell] = spell
			spells[spell] = spell
		else
			Data.providers[spell] = provider
		end
	end
end

-- Warn about deprecated categories
local function CheckDeprecatedCategory(cat)
	if cat and deprecatedCategories[cat] then
		geterrorhandler()(format("Diminishing return category '%s' does not exist anymore. The addon using DRData-1.0 may be outdated. Please consider upgrading it.", cat))
		deprecatedCategories[cat] = nil -- Warn once
	end
end

-- Public APIs
-- Category name in something usable
function Data:GetCategoryName(cat)
	CheckDeprecatedCategory(cat)
	return cat and Data.categoryNames[cat] or nil
end

-- Spell list
function Data:GetSpells()
	return Data.spells
end

-- Provider list
function Data:GetProviders()
	return Data.providers
end

-- Seconds before DR resets
function Data:GetResetTime(category)
	CheckDeprecatedCategory(category)
	return Data.resetTimes[category or "default"] or Data.resetTimes.default
end

-- Get the category of the spellID
function Data:GetSpellCategory(spellID)
	return spellID and Data.spells[spellID] or nil
end

-- Does this category DR in PvE?
function Data:IsPVE(cat)
	CheckDeprecatedCategory(cat)
	return cat and Data.pveDR[cat] or nil
end

-- List of categories
function Data:GetCategories()
	return Data.categoryNames
end

-- Next DR
function Data:NextDR(diminished, category)
	CheckDeprecatedCategory(category)
	local durations = Data.diminishedDurations[category or "default"] or Data.diminishedDurations.default
	for i = 1, #durations do
		if diminished > durations[i] then
			return durations[i]
		end
	end
	return 0
end

-- Iterate through the spells of a given category.
-- Pass "nil" to iterate through all spells.
do
	local function categoryIterator(id, category)
		local newCat
		repeat
			id, newCat = next(Data.spells, id)
			if id and newCat == category then
				return id, category
			end
		until not id
	end

	function Data:IterateSpells(category)
		if category then
			CheckDeprecatedCategory(category)
			return categoryIterator, category
		else
			return next, Data.spells
		end
	end
end

-- Iterate through the spells and providers of a given category.
-- Pass "nil" to iterate through all spells.
function Data:IterateProviders(category)
	if category then
		CheckDeprecatedCategory(category)
		return next, spellsAndProvidersByCategory[category] or {}
	else
		return next, Data.providers
	end
end

--[[ EXAMPLES ]]--
-- This is how you would track DR easily, you're welcome to do whatever you want with the below functions

--[[
local trackedPlayers = {}
local function debuffGained(spellID, destName, destGUID, isEnemy, isPlayer)
	-- Not a player, and this category isn't diminished in PVE, as well as make sure we want to track NPCs
	local drCat = DRData:GetSpellCategory(spellID)
	if( not isPlayer and not DRData:IsPVE(drCat) ) then
		return
	end

	if( not trackedPlayers[destGUID] ) then
		trackedPlayers[destGUID] = {}
	end

	-- See if we should reset it back to undiminished
	local tracked = trackedPlayers[destGUID][drCat]
	if( tracked and tracked.reset <= GetTime() ) then
		tracked.diminished = 1.0
	end
end

local function debuffFaded(spellID, destName, destGUID, isEnemy, isPlayer)
	local drCat = DRData:GetSpellCategory(spellID)
	if( not isPlayer and not DRData:IsPVE(drCat) ) then
		return
	end

	if( not trackedPlayers[destGUID] ) then
		trackedPlayers[destGUID] = {}
	end

	if( not trackedPlayers[destGUID][drCat] ) then
		trackedPlayers[destGUID][drCat] = { reset = 0, diminished = 1.0 }
	end

	local time = GetTime()
	local tracked = trackedPlayers[destGUID][drCat]

	tracked.reset = time + DRData:GetResetTime(drCat)
	tracked.diminished = DRData:NextDR(tracked.diminished, drCat)

	-- Diminishing returns changed, now you can do an update
end

local function resetDR(destGUID)
	-- Reset the tracked DRs for this person
	if( trackedPlayers[destGUID] ) then
		for cat in pairs(trackedPlayers[destGUID]) do
			trackedPlayers[destGUID][cat].reset = 0
			trackedPlayers[destGUID][cat].diminished = 1.0
		end
	end
end

local COMBATLOG_OBJECT_TYPE_PLAYER = COMBATLOG_OBJECT_TYPE_PLAYER
local COMBATLOG_OBJECT_REACTION_HOSTILE = COMBATLOG_OBJECT_REACTION_HOSTILE
local COMBATLOG_OBJECT_CONTROL_PLAYER = COMBATLOG_OBJECT_CONTROL_PLAYER

local eventRegistered = {["SPELL_AURA_APPLIED"] = true, ["SPELL_AURA_REFRESH"] = true, ["SPELL_AURA_REMOVED"] = true, ["PARTY_KILL"] = true, ["UNIT_DIED"] = true}
local function COMBAT_LOG_EVENT_UNFILTERED(self, event, timestamp, eventType, sourceGUID, sourceName, sourceFlags, destGUID, destName, destFlags, spellID, spellName, spellSchool, auraType)
	if( not eventRegistered[eventType] ) then
		return
	end

	-- Enemy gained a debuff
	if( eventType == "SPELL_AURA_APPLIED" ) then
		if( auraType == "DEBUFF" and DRData:GetSpellCategory(spellID) ) then
			local isPlayer = ( bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) == COMBATLOG_OBJECT_TYPE_PLAYER or bit.band(destFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) == COMBATLOG_OBJECT_CONTROL_PLAYER )
			debuffGained(spellID, destName, destGUID, (bit.band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE), isPlayer)
		end

	-- Enemy had a debuff refreshed before it faded, so fade + gain it quickly
	elseif( eventType == "SPELL_AURA_REFRESH" ) then
		if( auraType == "DEBUFF" and DRData:GetSpellCategory(spellID) ) then
			local isPlayer = ( bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) == COMBATLOG_OBJECT_TYPE_PLAYER or bit.band(destFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) == COMBATLOG_OBJECT_CONTROL_PLAYER )
			local isHostile = (bit.band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE)
			debuffFaded(spellID, destName, destGUID, isHostile, isPlayer)
			debuffGained(spellID, destName, destGUID, isHostile, isPlayer)
		end

	-- Buff or debuff faded from an enemy
	elseif( eventType == "SPELL_AURA_REMOVED" ) then
		if( auraType == "DEBUFF" and DRData:GetSpellCategory(spellID) ) then
			local isPlayer = ( bit.band(destFlags, COMBATLOG_OBJECT_TYPE_PLAYER) == COMBATLOG_OBJECT_TYPE_PLAYER or bit.band(destFlags, COMBATLOG_OBJECT_CONTROL_PLAYER) == COMBATLOG_OBJECT_CONTROL_PLAYER )
			debuffFaded(spellID, destName, destGUID, (bit.band(destFlags, COMBATLOG_OBJECT_REACTION_HOSTILE) == COMBATLOG_OBJECT_REACTION_HOSTILE), isPlayer)
		end

	-- Don't use UNIT_DIED inside arenas due to accuracy issues, outside of arenas we don't care too much
	elseif( ( eventType == "UNIT_DIED" and select(2, IsInInstance()) ~= "arena" ) or eventType == "PARTY_KILL" ) then
		resetDR(destGUID)
	end
end]]
