# The Villages - Golf Cart Path

## Tips & Tricks

### Detect road connections

Detect Connection by selecting a Golf Cart Path & press `SHIFT+E`.

## OSM Tagging

### Parking

|Key        |Value         | Description |
|:----------|:-------------|:------------|
|golf_cart  |[yes]         |The public has an official, legally-enshrined right of access; i.e., it's a right of way |
|highway    |service       |
|service    |parking_aisle |


### Golf Cart Path

|Key          |Value       | Description |
|:------------|:-----------|:------------|
|bicycle      |[yes]       |
|foot         |[yes]       |
|golf_cart    |[designated]| A preferred or designated route for a specific vehicle type or types, often marked by a traffic sign. |
|highway      |path        |
|motor_vehicle|[no]        | No access for the general public. |
|[segregated] |[no]        | This key is used for combined cycle- and footways. If both have their own lane, tag [segregated]=[yes]. If they share one lane, tag [segregated]=[no]. This key has no default value and should be tagged on all shared ways! |


[access]: http://wiki.openstreetmap.org/wiki/Key:access
[yes]: http://wiki.openstreetmap.org/wiki/Key:access
[no]: http://wiki.openstreetmap.org/wiki/Key:access
[designated]: http://wiki.openstreetmap.org/wiki/Tag:access=designated
[segregated]: http://wiki.openstreetmap.org/wiki/Key:segregated