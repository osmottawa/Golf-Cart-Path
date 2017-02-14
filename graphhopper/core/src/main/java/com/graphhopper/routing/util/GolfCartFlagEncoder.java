/*
 *  Licensed to GraphHopper and Peter Karich under one or more contributor
 *  license agreements. See the NOTICE file distributed with this work for 
 *  additional information regarding copyright ownership.
 *
 *  GraphHopper licenses this file to you under the Apache License, 
 *  Version 2.0 (the "License"); you may not use this file except in 
 *  compliance with the License. You may obtain a copy of the License at
 *
 *       http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package com.graphhopper.routing.util;

import java.util.HashSet;
import java.util.Set;

import com.graphhopper.reader.OSMWay;
import com.graphhopper.util.PMap;

import static com.graphhopper.routing.util.PriorityCode.*;

import java.util.*;

/**
 * Specifies the settings for cycletouring/trekking
 * <p/>
 * @author ratrun
 * @author Peter Karich
 */
public class GolfCartFlagEncoder extends BikeCommonFlagEncoder
{
    public GolfCartFlagEncoder()
    {
        this(4, 2, 0);
    }

    public GolfCartFlagEncoder( String propertiesString )
    {
        this(new PMap(propertiesString));
    }

    public GolfCartFlagEncoder( PMap properties )
    {
        this((int) properties.getLong("speedBits", 4),
                properties.getLong("speedFactor", 2),
                properties.getBool("turnCosts", false) ? 3 : 0);
        this.properties = properties;
        this.setBlockFords(properties.getBool("blockFords", true));
    }

    public GolfCartFlagEncoder( int speedBits, double speedFactor, int maxTurnCosts )
    {
        super(speedBits, speedFactor, maxTurnCosts);
        restrictions.addAll(Arrays.asList("golf_cart"));
        restrictedValues.add("no");

        // addPushingSection("path");
        // addPushingSection("footway");
        // addPushingSection("pedestrian");
        // addPushingSection("steps");

        absoluteBarriers.add("bollard");
        absoluteBarriers.add("stile");
        absoluteBarriers.add("turnstile");
        absoluteBarriers.add("cycle_barrier");
        absoluteBarriers.add("motorcycle_barrier");
        absoluteBarriers.add("block");

        avoidHighwayTags.add("trunk");
        avoidHighwayTags.add("trunk_link");
        avoidHighwayTags.add("primary");
        avoidHighwayTags.add("primary_link");
        avoidHighwayTags.add("secondary");
        avoidHighwayTags.add("secondary_link");

        // preferHighwayTags.add("road");
        preferHighwayTags.add("service");
        preferHighwayTags.add("tertiary");
        preferHighwayTags.add("tertiary_link");
        preferHighwayTags.add("residential");
        preferHighwayTags.add("unclassified");

        absoluteBarriers.add("kissing_gate");
        setSpecificBicycleClass("touring");
    }

    @Override
    public int getVersion()
    {
        return 1;
    }

    @Override
    boolean isPushingSection( OSMWay way )
    {
        String highway = way.getTag("highway");
        String trackType = way.getTag("tracktype");
        return way.hasTag("highway", pushingSections)
                || way.hasTag("railway", "platform")
                || "track".equals(highway) && trackType != null && !"grade1".equals(trackType);
    }

    @Override
    public String toString()
    {
        return "golfcart";
    }
}
