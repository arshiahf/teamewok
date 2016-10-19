var projectile = self;

var projectileX1 = projectile.x - projectile.sprite_width / 2;
var projectileX2 = projectile.x + projectile.sprite_width / 2;
var projectileY1 = projectile.y - projectile.sprite_height / 2;
var projectileY2 = projectile.y - projectile.sprite_height / 2;
if collision_ellipse(projectileX1, projectileY1, projectileX2, projectileY2, all, true, false)
{
    if object_get_parent(projectile.shooter.object_index) == enemyGeneric
    {
        effect_create_above(ef_ring, other.x, other.y, 2, c_white)
    }

    if object_get_parent(other.object_index) != (alertGeneric and projectileGeneric and object_get_parent(projectile.shooter.object_index))
    {
    
        if object_get_parent(other.object_index) == projectileGeneric
        {
            effect_create_above(ef_explosion, other.x, other.y, 2, c_white)
        }
        
        if object_get_parent(other.object_index) == (playerGeneric or neutralGeneric or enemyGeneric)
        {
            other.health -= projectile.damage;
        }
        instance_destroy();
    }
}