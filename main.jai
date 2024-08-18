#import "Basic";
#import "JaiBox2D-3.0.0";

main :: () {
    print("hello world\n");

    world_def := b2DefaultWorldDef();
    world_def.gravity = .{ 0, -10 };
    world_id := b2CreateWorld(*world_def);
    defer b2DestroyWorld(world_id);
    
    ground_body_def := b2DefaultBodyDef();
    ground_body_def.position = .{ 0, -10 };
    ground_body_id := b2CreateBody(world_id, *ground_body_def);

    ground_box := b2MakeBox(50, 10);
    ground_shape_def := b2DefaultShapeDef();
    b2CreatePolygonShape(ground_body_id, *ground_shape_def, *ground_box);

    body_def := b2DefaultBodyDef();
    body_def.type = .dynamicBody;
    body_def.position = .{ 0, 4 };
    body_id := b2CreateBody(world_id, *body_def);

    shape_def := b2DefaultShapeDef();
    circle := b2Circle.{ center = .{ 0, 0 }, radius = 1.0 };
    b2CreateCircleShape(body_id, *shape_def, *circle);

    time_step := 1.0 / 60;
    sub_steps : s32 = 4;
    
    for i: 0..60 {
        b2World_Step(world_id, time_step, sub_steps);
        position := b2Body_GetPosition(body_id);
        rotation := b2Body_GetRotation(body_id);

        print("pos : %, rot : %\n", position, rotation);
    }
}
