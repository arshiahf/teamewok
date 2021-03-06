if instance_exists(playerGeneric)
{
    // Declare primary variables
    var player = playerGeneric;
    var enemy = self;
    
    // Check if a collision object is in the way
    if !collision_line(enemy.x, enemy.y, player.x, player.y, collisionGeneric, true, true)
    {
        // Set sight cone
        var coneLeft = image_angle + global.visCone;
        if coneLeft > 359
        {
            coneLeft =  coneLeft - 359;
        }
        
        var coneRight = image_angle - global.visCone;
        if coneRight < 0
        {
            coneRight = coneRight + 359;
        }
        
        // Get angle to player
        {
            var anglePlayer = point_direction(x, y, player.x, player.y);
        }
        
        // Check if player is in cone
        var inCone
        if coneRight > coneLeft
        {
            if anglePlayer <= coneLeft or anglePlayer >= coneRight
            {
                inCone = true;
            }
            else
            {
                inCone = false;
            }
        }
        else
        {
            if anglePlayer <= coneLeft and anglePlayer >= coneRight
            {
                inCone = true;
            }
            else
            {
                inCone = false
            }
        }
        
        // If player is in cone
        if inCone
        {
            //Check distance to player
            var distancePlayer = point_distance(x, y, player.x, player.y)
            
            // Check distance against player visibility
            if player.visibility == 3
            {
                if distancePlayer <= range0 and !hostile
                {
                    MakeHostile()
                }
                else if distancePlayer <= range1 and !alert and !hostile
                {
                    MakeAlert(player)
                }
            }
            else if player.visibility == 2
            {
                if distancePlayer <= range1 and !hostile
                {
                    MakeHostile()
                }
                else if distancePlayer <= range2 and !alert and !hostile
                {
                    MakeAlert(player)
                }
            }
            else if player.visibility == 1
            {
                if distancePlayer <= range2 and !hostile
                {
                    MakeHostile()
                }
                else if distancePlayer <= range3 and !alert and !hostile
                {
                    MakeAlert(player)
                }
            }
            else
            {
                if distancePlayer <= range3 and !hostile
                {
                    MakeHostile()
                }
                else if distancePlayer <= range4 and !alert and !hostile
                {
                    MakeAlert(player)
                }
            }
        }
    }
}
