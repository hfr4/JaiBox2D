//
// This file was auto-generated using the following command:
//
// jai generate.jai
//



b2_pi :: 3.14159265359;

b2_maxPolygonVertices :: 8;

b2_defaultCategoryBits :: 0x00000001;

b2_defaultMaskBits :: 0xFFFFFFFF;

/// Prototype for user allocation function
///	@param size the allocation size in bytes
///	@param alignment the required alignment, guaranteed to be a power of 2
b2AllocFcn :: #type (size: u32, alignment: s32) -> *void #c_call;

/// Prototype for user free function
///	@param mem the memory previously allocated through `b2AllocFcn`
b2FreeFcn :: #type (mem: *void) -> void #c_call;

/// Prototype for the user assert callback. Return 0 to skip the debugger break.
b2AssertFcn :: #type (condition: *u8, fileName: *u8, lineNumber: s32) -> s32 #c_call;

/// This allows the user to override the allocation functions. These should be
///	set during application startup.
b2SetAllocator :: (allocFcn: b2AllocFcn, freeFcn: b2FreeFcn) -> void #foreign box2d_windows_amd64_avx2;

/// @return the total bytes allocated by Box2D
b2GetByteCount :: () -> s32 #foreign box2d_windows_amd64_avx2;

/// Override the default assert callback
///	@param assertFcn a non-null assert callback
b2SetAssertFcn :: (assertFcn: b2AssertFcn) -> void #foreign box2d_windows_amd64_avx2;

/// Version numbering scheme.
/// See https://semver.org/
b2Version :: struct {
    /// Significant changes
    major:    s32;

    /// Incremental changes
    minor:    s32;

    /// Bug fixes
    revision: s32;
}

/// Get the current version of Box2D
b2GetVersion :: () -> b2Version #foreign box2d_windows_amd64_avx2;

//! @cond
// Timer for profiling. This has platform specific code and may not work on every platform.
b2Timer :: struct {
    start: s64;
}

b2CreateTimer :: () -> b2Timer #foreign box2d_windows_amd64_avx2;
b2GetTicks :: (timer: *b2Timer) -> s64 #foreign box2d_windows_amd64_avx2;
b2GetMilliseconds :: (timer: *b2Timer) -> float #foreign box2d_windows_amd64_avx2;
b2GetMillisecondsAndReset :: (timer: *b2Timer) -> float #foreign box2d_windows_amd64_avx2;
b2SleepMilliseconds :: (milliseconds: s32) -> void #foreign box2d_windows_amd64_avx2;
b2Yield :: () -> void #foreign box2d_windows_amd64_avx2;

/// 2D vector
/// This can be used to represent a point or free vector
b2Vec2 :: struct {
    /// coordinates
    x: float;
    /// coordinates
    y: float;
}

/// 2D rotation
/// This is similar to using a complex number for rotation
b2Rot :: struct {
    /// cosine and sine
    c: float;
    /// cosine and sine
    s: float;
}

/// A 2D rigid transform
b2Transform :: struct {
    p: b2Vec2;
    q: b2Rot;
}

/// A 2-by-2 Matrix
b2Mat22 :: struct {
    /// columns
    cx: b2Vec2;
    /// columns
    cy: b2Vec2;
}

/// Axis-aligned bounding box
b2AABB :: struct {
    lowerBound: b2Vec2;
    upperBound: b2Vec2;
}

/// Is this a valid number? Not NaN or infinity.
b2IsValid :: (a: float) -> bool #foreign box2d_windows_amd64_avx2;

/// Is this a valid vector? Not NaN or infinity.
b2Vec2_IsValid :: (v: b2Vec2) -> bool #foreign box2d_windows_amd64_avx2;

/// Is this a valid rotation? Not NaN or infinity. Is normalized.
b2Rot_IsValid :: (q: b2Rot) -> bool #foreign box2d_windows_amd64_avx2;

/// Is this a valid bounding box? Not Nan or infinity. Upper bound greater than or equal to lower bound.
b2AABB_IsValid :: (aabb: b2AABB) -> bool #foreign box2d_windows_amd64_avx2;

/// Convert a vector into a unit vector if possible, otherwise returns the zero vector.
b2Normalize :: (v: b2Vec2) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Convert a vector into a unit vector if possible, otherwise asserts.
b2NormalizeChecked :: (v: b2Vec2) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Convert a vector into a unit vector if possible, otherwise returns the zero vector. Also
///	outputs the length.
b2GetLengthAndNormalize :: (length: *float, v: b2Vec2) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Box2D bases all length units on meters, but you may need different units for your game.
/// You can set this value to use different units. This should be done at application startup
///	and only modified once. Default value is 1.
///	@warning This must be modified before any calls to Box2D
b2SetLengthUnitsPerMeter :: (lengthUnits: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the current length units per meter.
b2GetLengthUnitsPerMeter :: () -> float #foreign box2d_windows_amd64_avx2;

/// Low level ray-cast input data
b2RayCastInput :: struct {
    /// Start point of the ray cast
    origin:      b2Vec2;

    /// Translation of the ray cast
    translation: b2Vec2;

    /// The maximum fraction of the translation to consider, typically 1
    maxFraction: float;
}

/// Low level shape cast input in generic form. This allows casting an arbitrary point
///	cloud wrap with a radius. For example, a circle is a single point with a non-zero radius.
///	A capsule is two points with a non-zero radius. A box is four points with a zero radius.
b2ShapeCastInput :: struct {
    /// A point cloud to cast
    points:      [8] b2Vec2;

    /// The number of points
    count:       s32;

    /// The radius around the point cloud
    radius:      float;

    /// The translation of the shape cast
    translation: b2Vec2;

    /// The maximum fraction of the translation to consider, typically 1
    maxFraction: float;
}

/// Low level ray-cast or shape-cast output data
b2CastOutput :: struct {
    /// The surface normal at the hit point
    normal:     b2Vec2;

    /// The surface hit point
    point:      b2Vec2;

    /// The fraction of the input translation at collision
    fraction:   float;

    /// The number of iterations used
    iterations: s32;

    /// Did the cast hit?
    hit:        bool;
}

/// This holds the mass data computed for a shape.
b2MassData :: struct {
    /// The mass of the shape, usually in kilograms.
    mass:              float;

    /// The position of the shape's centroid relative to the shape's origin.
    center:            b2Vec2;

    /// The rotational inertia of the shape about the local origin.
    rotationalInertia: float;
}

/// A solid circle
b2Circle :: struct {
    /// The local center
    center: b2Vec2;

    /// The radius
    radius: float;
}

/// A solid capsule can be viewed as two semicircles connected
///	by a rectangle.
b2Capsule :: struct {
    /// Local center of the first semicircle
    center1: b2Vec2;

    /// Local center of the second semicircle
    center2: b2Vec2;

    /// The radius of the semicircles
    radius:  float;
}

/// A solid convex polygon. It is assumed that the interior of the polygon is to
/// the left of each edge.
/// Polygons have a maximum number of vertices equal to b2_maxPolygonVertices.
/// In most cases you should not need many vertices for a convex polygon.
///	@warning DO NOT fill this out manually, instead use a helper function like
///	b2MakePolygon or b2MakeBox.
b2Polygon :: struct {
    /// The polygon vertices
    vertices: [8] b2Vec2;

    /// The outward normal vectors of the polygon sides
    normals:  [8] b2Vec2;

    /// The centroid of the polygon
    centroid: b2Vec2;

    /// The external radius for rounded polygons
    radius:   float;

    /// The number of polygon vertices
    count:    s32;
}

/// A line segment with two-sided collision.
b2Segment :: struct {
    /// The first point
    point1: b2Vec2;

    /// The second point
    point2: b2Vec2;
}

/// A smooth line segment with one-sided collision. Only collides on the right side.
/// Several of these are generated for a chain shape.
/// ghost1 -> point1 -> point2 -> ghost2
b2SmoothSegment :: struct {
    /// The tail ghost vertex
    ghost1:  b2Vec2;

    /// The line segment
    segment: b2Segment;

    /// The head ghost vertex
    ghost2:  b2Vec2;

    /// The owning chain shape index (internal usage only)
    chainId: s32;
}

/// Validate ray cast input data (NaN, etc)
b2IsValidRay :: (input: *b2RayCastInput) -> bool #foreign box2d_windows_amd64_avx2;

/// Make a convex polygon from a convex hull. This will assert if the hull is not valid.
/// @warning Do not manually fill in the hull data, it must come directly from b2ComputeHull
b2MakePolygon :: (hull: *b2Hull, radius: float) -> b2Polygon #foreign box2d_windows_amd64_avx2;

/// Make an offset convex polygon from a convex hull. This will assert if the hull is not valid.
/// @warning Do not manually fill in the hull data, it must come directly from b2ComputeHull
b2MakeOffsetPolygon :: (hull: *b2Hull, radius: float, transform: b2Transform) -> b2Polygon #foreign box2d_windows_amd64_avx2;

/// Make a square polygon, bypassing the need for a convex hull.
b2MakeSquare :: (h: float) -> b2Polygon #foreign box2d_windows_amd64_avx2;

/// Make a box (rectangle) polygon, bypassing the need for a convex hull.
b2MakeBox :: (hx: float, hy: float) -> b2Polygon #foreign box2d_windows_amd64_avx2;

/// Make a rounded box, bypassing the need for a convex hull.
b2MakeRoundedBox :: (hx: float, hy: float, radius: float) -> b2Polygon #foreign box2d_windows_amd64_avx2;

/// Make an offset box, bypassing the need for a convex hull.
b2MakeOffsetBox :: (hx: float, hy: float, center: b2Vec2, angle: float) -> b2Polygon #foreign box2d_windows_amd64_avx2;

/// Transform a polygon. This is useful for transferring a shape from one body to another.
b2TransformPolygon :: (transform: b2Transform, polygon: *b2Polygon) -> b2Polygon #foreign box2d_windows_amd64_avx2;

/// Compute mass properties of a circle
b2ComputeCircleMass :: (shape: *b2Circle, density: float) -> b2MassData #foreign box2d_windows_amd64_avx2;

/// Compute mass properties of a capsule
b2ComputeCapsuleMass :: (shape: *b2Capsule, density: float) -> b2MassData #foreign box2d_windows_amd64_avx2;

/// Compute mass properties of a polygon
b2ComputePolygonMass :: (shape: *b2Polygon, density: float) -> b2MassData #foreign box2d_windows_amd64_avx2;

/// Compute the bounding box of a transformed circle
b2ComputeCircleAABB :: (shape: *b2Circle, transform: b2Transform) -> b2AABB #foreign box2d_windows_amd64_avx2;

/// Compute the bounding box of a transformed capsule
b2ComputeCapsuleAABB :: (shape: *b2Capsule, transform: b2Transform) -> b2AABB #foreign box2d_windows_amd64_avx2;

/// Compute the bounding box of a transformed polygon
b2ComputePolygonAABB :: (shape: *b2Polygon, transform: b2Transform) -> b2AABB #foreign box2d_windows_amd64_avx2;

/// Compute the bounding box of a transformed line segment
b2ComputeSegmentAABB :: (shape: *b2Segment, transform: b2Transform) -> b2AABB #foreign box2d_windows_amd64_avx2;

/// Test a point for overlap with a circle in local space
b2PointInCircle :: (point: b2Vec2, shape: *b2Circle) -> bool #foreign box2d_windows_amd64_avx2;

/// Test a point for overlap with a capsule in local space
b2PointInCapsule :: (point: b2Vec2, shape: *b2Capsule) -> bool #foreign box2d_windows_amd64_avx2;

/// Test a point for overlap with a convex polygon in local space
b2PointInPolygon :: (point: b2Vec2, shape: *b2Polygon) -> bool #foreign box2d_windows_amd64_avx2;

/// Ray cast versus circle in shape local space. Initial overlap is treated as a miss.
b2RayCastCircle :: (input: *b2RayCastInput, shape: *b2Circle) -> b2CastOutput #foreign box2d_windows_amd64_avx2;

/// Ray cast versus capsule in shape local space. Initial overlap is treated as a miss.
b2RayCastCapsule :: (input: *b2RayCastInput, shape: *b2Capsule) -> b2CastOutput #foreign box2d_windows_amd64_avx2;

/// Ray cast versus segment in shape local space. Optionally treat the segment as one-sided with hits from
/// the left side being treated as a miss.
b2RayCastSegment :: (input: *b2RayCastInput, shape: *b2Segment, oneSided: bool) -> b2CastOutput #foreign box2d_windows_amd64_avx2;

/// Ray cast versus polygon in shape local space. Initial overlap is treated as a miss.
b2RayCastPolygon :: (input: *b2RayCastInput, shape: *b2Polygon) -> b2CastOutput #foreign box2d_windows_amd64_avx2;

/// Shape cast versus a circle. Initial overlap is treated as a miss.
b2ShapeCastCircle :: (input: *b2ShapeCastInput, shape: *b2Circle) -> b2CastOutput #foreign box2d_windows_amd64_avx2;

/// Shape cast versus a capsule. Initial overlap is treated as a miss.
b2ShapeCastCapsule :: (input: *b2ShapeCastInput, shape: *b2Capsule) -> b2CastOutput #foreign box2d_windows_amd64_avx2;

/// Shape cast versus a line segment. Initial overlap is treated as a miss.
b2ShapeCastSegment :: (input: *b2ShapeCastInput, shape: *b2Segment) -> b2CastOutput #foreign box2d_windows_amd64_avx2;

/// Shape cast versus a convex polygon. Initial overlap is treated as a miss.
b2ShapeCastPolygon :: (input: *b2ShapeCastInput, shape: *b2Polygon) -> b2CastOutput #foreign box2d_windows_amd64_avx2;

/// A convex hull. Used to create convex polygons.
///	@warning Do not modify these values directly, instead use b2ComputeHull()
b2Hull :: struct {
    /// The final points of the hull
    points: [8] b2Vec2;

    /// The number of points
    count:  s32;
}

/// Compute the convex hull of a set of points. Returns an empty hull if it fails.
/// Some failure cases:
/// - all points very close together
/// - all points on a line
/// - less than 3 points
/// - more than b2_maxPolygonVertices points
/// This welds close points and removes collinear points.
///	@warning Do not modify a hull once it has been computed
b2ComputeHull :: (points: *b2Vec2, count: s32) -> b2Hull #foreign box2d_windows_amd64_avx2;

/// This determines if a hull is valid. Checks for:
/// - convexity
/// - collinear points
/// This is expensive and should not be called at runtime.
b2ValidateHull :: (hull: *b2Hull) -> bool #foreign box2d_windows_amd64_avx2;

/// Result of computing the distance between two line segments
b2SegmentDistanceResult :: struct {
    /// The closest point on the first segment
    closest1:        b2Vec2;

    /// The closest point on the second segment
    closest2:        b2Vec2;

    /// The barycentric coordinate on the first segment
    fraction1:       float;

    /// The barycentric coordinate on the second segment
    fraction2:       float;

    /// The squared distance between the closest points
    distanceSquared: float;
}

/// Compute the distance between two line segments, clamping at the end points if needed.
b2SegmentDistance :: (p1: b2Vec2, q1: b2Vec2, p2: b2Vec2, q2: b2Vec2) -> b2SegmentDistanceResult #foreign box2d_windows_amd64_avx2;

/// A distance proxy is used by the GJK algorithm. It encapsulates any shape.
b2DistanceProxy :: struct {
    /// The point cloud
    points: [8] b2Vec2;

    /// The number of points
    count:  s32;

    /// The external radius of the point cloud
    radius: float;
}

/// Used to warm start b2Distance. Set count to zero on first call or
///	use zero initialization.
b2DistanceCache :: struct {
    /// The number of stored simplex points
    count:  u16;

    /// The cached simplex indices on shape A
    indexA: [3] u8;

    /// The cached simplex indices on shape B
    indexB: [3] u8;
}

/// Input for b2ShapeDistance
b2DistanceInput :: struct {
    /// The proxy for shape A
    proxyA:     b2DistanceProxy;

    /// The proxy for shape B
    proxyB:     b2DistanceProxy;

    /// The world transform for shape A
    transformA: b2Transform;

    /// The world transform for shape B
    transformB: b2Transform;

    /// Should the proxy radius be considered?
    useRadii:   bool;
}

/// Output for b2ShapeDistance
b2DistanceOutput :: struct {
    pointA:       b2Vec2; ///< Closest point on shapeA
    pointB:       b2Vec2; ///< Closest point on shapeB
    distance:     float; ///< The final distance, zero if overlapped
    iterations:   s32; ///< Number of GJK iterations used
    simplexCount: s32; ///< The number of simplexes stored in the simplex array
}

/// Simplex vertex for debugging the GJK algorithm
b2SimplexVertex :: struct {
    wA:     b2Vec2; ///< support point in proxyA
    wB:     b2Vec2; ///< support point in proxyB
    w:      b2Vec2; ///< wB - wA
    a:      float; ///< barycentric coordinate for closest point
    indexA: s32; ///< wA index
    indexB: s32; ///< wB index
}

/// Simplex from the GJK algorithm
b2Simplex :: struct {
    v1:    b2SimplexVertex; ///< vertices
    v2:    b2SimplexVertex; ///< vertices
    v3:    b2SimplexVertex; ///< vertices
    count: s32; ///< number of valid vertices
}

/// Compute the closest points between two shapes represented as point clouds.
/// b2DistanceCache cache is input/output. On the first call set b2DistanceCache.count to zero.
///	The underlying GJK algorithm may be debugged by passing in debug simplexes and capacity. You may pass in NULL and 0 for these.
b2ShapeDistance :: (cache: *b2DistanceCache, input: *b2DistanceInput, simplexes: *b2Simplex, simplexCapacity: s32) -> b2DistanceOutput #foreign box2d_windows_amd64_avx2;

/// Input parameters for b2ShapeCast
b2ShapeCastPairInput :: struct {
    proxyA:       b2DistanceProxy; ///< The proxy for shape A
    proxyB:       b2DistanceProxy; ///< The proxy for shape B
    transformA:   b2Transform; ///< The world transform for shape A
    transformB:   b2Transform; ///< The world transform for shape B
    translationB: b2Vec2; ///< The translation of shape B
    maxFraction:  float; ///< The fraction of the translation to consider, typically 1
}

/// Perform a linear shape cast of shape B moving and shape A fixed. Determines the hit point, normal, and translation fraction.
b2ShapeCast :: (input: *b2ShapeCastPairInput) -> b2CastOutput #foreign box2d_windows_amd64_avx2;

/// Make a proxy for use in GJK and related functions.
b2MakeProxy :: (vertices: *b2Vec2, count: s32, radius: float) -> b2DistanceProxy #foreign box2d_windows_amd64_avx2;

/// This describes the motion of a body/shape for TOI computation. Shapes are defined with respect to the body origin,
/// which may not coincide with the center of mass. However, to support dynamics we must interpolate the center of mass
/// position.
b2Sweep :: struct {
    localCenter: b2Vec2; ///< Local center of mass position
    c1:          b2Vec2; ///< Starting center of mass world position
    c2:          b2Vec2; ///< Ending center of mass world position
    q1:          b2Rot; ///< Starting world rotation
    q2:          b2Rot; ///< Ending world rotation
}

/// Evaluate the transform sweep at a specific time.
b2GetSweepTransform :: (sweep: *b2Sweep, time: float) -> b2Transform #foreign box2d_windows_amd64_avx2;

/// Input parameters for b2TimeOfImpact
b2TOIInput :: struct {
    proxyA: b2DistanceProxy; ///< The proxy for shape A
    proxyB: b2DistanceProxy; ///< The proxy for shape B
    sweepA: b2Sweep; ///< The movement of shape A
    sweepB: b2Sweep; ///< The movement of shape B
    tMax:   float; ///< Defines the sweep interval [0, tMax]
}

/// Describes the TOI output
b2TOIState :: enum s32 {
    toiStateUnknown    :: 0;
    toiStateFailed     :: 1;
    toiStateOverlapped :: 2;
    toiStateHit        :: 3;
    toiStateSeparated  :: 4;

    b2_toiStateUnknown    :: toiStateUnknown;
    b2_toiStateFailed     :: toiStateFailed;
    b2_toiStateOverlapped :: toiStateOverlapped;
    b2_toiStateHit        :: toiStateHit;
    b2_toiStateSeparated  :: toiStateSeparated;
}

/// Output parameters for b2TimeOfImpact.
b2TOIOutput :: struct {
    state: b2TOIState; ///< The type of result
    t:     float; ///< The time of the collision
}

/// Compute the upper bound on time before two shapes penetrate. Time is represented as
/// a fraction between [0,tMax]. This uses a swept separating axis and may miss some intermediate,
/// non-tunneling collisions. If you change the time interval, you should call this function
/// again.
b2TimeOfImpact :: (input: *b2TOIInput) -> b2TOIOutput #foreign box2d_windows_amd64_avx2;

/// A manifold point is a contact point belonging to a contact
/// manifold. It holds details related to the geometry and dynamics
/// of the contact points.
b2ManifoldPoint :: struct {
    /// Location of the contact point in world space. Subject to precision loss at large coordinates.
    ///	@note Should only be used for debugging.
    point:            b2Vec2;

    /// Location of the contact point relative to bodyA's origin in world space
    ///	@note When used internally to the Box2D solver, these are relative to the center of mass.
    anchorA:          b2Vec2;

    /// Location of the contact point relative to bodyB's origin in world space
    anchorB:          b2Vec2;

    /// The separation of the contact point, negative if penetrating
    separation:       float;

    /// The impulse along the manifold normal vector.
    normalImpulse:    float;

    /// The friction impulse
    tangentImpulse:   float;

    /// The maximum normal impulse applied during sub-stepping
    ///	todo not sure this is needed
    maxNormalImpulse: float;

    /// Relative normal velocity pre-solve. Used for hit events. If the normal impulse is
    /// zero then there was no hit. Negative means shapes are approaching.
    normalVelocity:   float;

    /// Uniquely identifies a contact point between two shapes
    id:               u16;

    /// Did this contact point exist the previous step?
    persisted:        bool;
}

/// A contact manifold describes the contact points between colliding shapes
b2Manifold :: struct {
    /// The manifold points, up to two are possible in 2D
    points:     [2] b2ManifoldPoint;

    /// The unit normal vector in world space, points from shape A to bodyB
    normal:     b2Vec2;

    /// The number of contacts points, will be 0, 1, or 2
    pointCount: s32;
}

/// Compute the contact manifold between two circles
b2CollideCircles :: (circleA: *b2Circle, xfA: b2Transform, circleB: *b2Circle, xfB: b2Transform) -> b2Manifold #foreign box2d_windows_amd64_avx2;

/// Compute the contact manifold between a capsule and circle
b2CollideCapsuleAndCircle :: (capsuleA: *b2Capsule, xfA: b2Transform, circleB: *b2Circle, xfB: b2Transform) -> b2Manifold #foreign box2d_windows_amd64_avx2;

/// Compute the contact manifold between an segment and a circle
b2CollideSegmentAndCircle :: (segmentA: *b2Segment, xfA: b2Transform, circleB: *b2Circle, xfB: b2Transform) -> b2Manifold #foreign box2d_windows_amd64_avx2;

/// Compute the contact manifold between a polygon and a circle
b2CollidePolygonAndCircle :: (polygonA: *b2Polygon, xfA: b2Transform, circleB: *b2Circle, xfB: b2Transform) -> b2Manifold #foreign box2d_windows_amd64_avx2;

/// Compute the contact manifold between a capsule and circle
b2CollideCapsules :: (capsuleA: *b2Capsule, xfA: b2Transform, capsuleB: *b2Capsule, xfB: b2Transform) -> b2Manifold #foreign box2d_windows_amd64_avx2;

/// Compute the contact manifold between an segment and a capsule
b2CollideSegmentAndCapsule :: (segmentA: *b2Segment, xfA: b2Transform, capsuleB: *b2Capsule, xfB: b2Transform) -> b2Manifold #foreign box2d_windows_amd64_avx2;

/// Compute the contact manifold between a polygon and capsule
b2CollidePolygonAndCapsule :: (polygonA: *b2Polygon, xfA: b2Transform, capsuleB: *b2Capsule, xfB: b2Transform) -> b2Manifold #foreign box2d_windows_amd64_avx2;

/// Compute the contact manifold between two polygons
b2CollidePolygons :: (polygonA: *b2Polygon, xfA: b2Transform, polygonB: *b2Polygon, xfB: b2Transform) -> b2Manifold #foreign box2d_windows_amd64_avx2;

/// Compute the contact manifold between an segment and a polygon
b2CollideSegmentAndPolygon :: (segmentA: *b2Segment, xfA: b2Transform, polygonB: *b2Polygon, xfB: b2Transform) -> b2Manifold #foreign box2d_windows_amd64_avx2;

/// Compute the contact manifold between a smooth segment and a circle
b2CollideSmoothSegmentAndCircle :: (smoothSegmentA: *b2SmoothSegment, xfA: b2Transform, circleB: *b2Circle, xfB: b2Transform) -> b2Manifold #foreign box2d_windows_amd64_avx2;

/// Compute the contact manifold between an segment and a capsule
b2CollideSmoothSegmentAndCapsule :: (smoothSegmentA: *b2SmoothSegment, xfA: b2Transform, capsuleB: *b2Capsule, xfB: b2Transform, cache: *b2DistanceCache) -> b2Manifold #foreign box2d_windows_amd64_avx2;

/// Compute the contact manifold between a smooth segment and a rounded polygon
b2CollideSmoothSegmentAndPolygon :: (smoothSegmentA: *b2SmoothSegment, xfA: b2Transform, polygonB: *b2Polygon, xfB: b2Transform, cache: *b2DistanceCache) -> b2Manifold #foreign box2d_windows_amd64_avx2;

/// A node in the dynamic tree. This is private data placed here for performance reasons.
/// 16 + 16 + 8 + pad(8)
b2TreeNode :: struct {
    aabb:         b2AABB; // 16

    categoryBits: u32; // 4

    union {
        /// The node parent index
        parent: s32;

        /// The node freelist next index
        next:   s32;
    }

    child1:       s32; // 4

    child2:       s32; // 4

    userData:     s32; // 4

    height:       s16; // 2

    enlarged:     bool; // 1

    /// Padding for clarity
    pad:          [9] u8;
}

/// The dynamic tree structure. This should be considered private data.
/// It is placed here for performance reasons.
b2DynamicTree :: struct {
    /// The tree nodes
    nodes:           *b2TreeNode;

    /// The root index
    root:            s32;

    /// The number of nodes
    nodeCount:       s32;

    /// The allocated node space
    nodeCapacity:    s32;

    /// Node free list
    freeList:        s32;

    /// Number of proxies created
    proxyCount:      s32;

    /// Leaf indices for rebuild
    leafIndices:     *s32;

    /// Leaf bounding boxes for rebuild
    leafBoxes:       *b2AABB;

    /// Leaf bounding box centers for rebuild
    leafCenters:     *b2Vec2;

    /// Bins for sorting during rebuild
    binIndices:      *s32;

    /// Allocated space for rebuilding
    rebuildCapacity: s32;
}

/// Constructing the tree initializes the node pool.
b2DynamicTree_Create :: () -> b2DynamicTree #foreign box2d_windows_amd64_avx2;

/// Destroy the tree, freeing the node pool.
b2DynamicTree_Destroy :: (tree: *b2DynamicTree) -> void #foreign box2d_windows_amd64_avx2;

/// Create a proxy. Provide an AABB and a userData value.
b2DynamicTree_CreateProxy :: (tree: *b2DynamicTree, aabb: b2AABB, categoryBits: u32, userData: s32) -> s32 #foreign box2d_windows_amd64_avx2;

/// Destroy a proxy. This asserts if the id is invalid.
b2DynamicTree_DestroyProxy :: (tree: *b2DynamicTree, proxyId: s32) -> void #foreign box2d_windows_amd64_avx2;

/// Move a proxy to a new AABB by removing and reinserting into the tree.
b2DynamicTree_MoveProxy :: (tree: *b2DynamicTree, proxyId: s32, aabb: b2AABB) -> void #foreign box2d_windows_amd64_avx2;

/// Enlarge a proxy and enlarge ancestors as necessary.
b2DynamicTree_EnlargeProxy :: (tree: *b2DynamicTree, proxyId: s32, aabb: b2AABB) -> void #foreign box2d_windows_amd64_avx2;

/// This function receives proxies found in the AABB query.
/// @return true if the query should continue
b2TreeQueryCallbackFcn :: #type (proxyId: s32, userData: s32, _context: *void) -> bool #c_call;

/// Query an AABB for overlapping proxies. The callback class
/// is called for each proxy that overlaps the supplied AABB.
b2DynamicTree_Query :: (tree: *b2DynamicTree, aabb: b2AABB, maskBits: u32, callback: b2TreeQueryCallbackFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// This function receives clipped raycast input for a proxy. The function
/// returns the new ray fraction.
/// - return a value of 0 to terminate the ray cast
/// - return a value less than input->maxFraction to clip the ray
/// - return a value of input->maxFraction to continue the ray cast without clipping
b2TreeRayCastCallbackFcn :: #type (input: *b2RayCastInput, proxyId: s32, userData: s32, _context: *void) -> float #c_call;

/// Ray-cast against the proxies in the tree. This relies on the callback
/// to perform a exact ray-cast in the case were the proxy contains a shape.
/// The callback also performs the any collision filtering. This has performance
/// roughly equal to k * log(n), where k is the number of collisions and n is the
/// number of proxies in the tree.
///	Bit-wise filtering using mask bits can greatly improve performance in some scenarios.
///	@param tree the dynamic tree to ray cast
/// @param input the ray-cast input data. The ray extends from p1 to p1 + maxFraction * (p2 - p1)
///	@param maskBits filter bits: `bool accept = (maskBits & node->categoryBits) != 0;`
/// @param callback a callback class that is called for each proxy that is hit by the ray
///	@param context user context that is passed to the callback
b2DynamicTree_RayCast :: (tree: *b2DynamicTree, input: *b2RayCastInput, maskBits: u32, callback: b2TreeRayCastCallbackFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// This function receives clipped ray-cast input for a proxy. The function
/// returns the new ray fraction.
/// - return a value of 0 to terminate the ray-cast
/// - return a value less than input->maxFraction to clip the ray
/// - return a value of input->maxFraction to continue the ray cast without clipping
b2TreeShapeCastCallbackFcn :: #type (input: *b2ShapeCastInput, proxyId: s32, userData: s32, _context: *void) -> float #c_call;

/// Ray-cast against the proxies in the tree. This relies on the callback
/// to perform a exact ray-cast in the case were the proxy contains a shape.
/// The callback also performs the any collision filtering. This has performance
/// roughly equal to k * log(n), where k is the number of collisions and n is the
/// number of proxies in the tree.
///	@param tree the dynamic tree to ray cast
/// @param input the ray-cast input data. The ray extends from p1 to p1 + maxFraction * (p2 - p1).
///	@param maskBits filter bits: `bool accept = (maskBits & node->categoryBits) != 0;`
/// @param callback a callback class that is called for each proxy that is hit by the shape
///	@param context user context that is passed to the callback
b2DynamicTree_ShapeCast :: (tree: *b2DynamicTree, input: *b2ShapeCastInput, maskBits: u32, callback: b2TreeShapeCastCallbackFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Validate this tree. For testing.
b2DynamicTree_Validate :: (tree: *b2DynamicTree) -> void #foreign box2d_windows_amd64_avx2;

/// Compute the height of the binary tree in O(N) time. Should not be
/// called often.
b2DynamicTree_GetHeight :: (tree: *b2DynamicTree) -> s32 #foreign box2d_windows_amd64_avx2;

/// Get the maximum balance of the tree. The balance is the difference in height of the two children of a node.
b2DynamicTree_GetMaxBalance :: (tree: *b2DynamicTree) -> s32 #foreign box2d_windows_amd64_avx2;

/// Get the ratio of the sum of the node areas to the root area.
b2DynamicTree_GetAreaRatio :: (tree: *b2DynamicTree) -> float #foreign box2d_windows_amd64_avx2;

/// Build an optimal tree. Very expensive. For testing.
b2DynamicTree_RebuildBottomUp :: (tree: *b2DynamicTree) -> void #foreign box2d_windows_amd64_avx2;

/// Get the number of proxies created
b2DynamicTree_GetProxyCount :: (tree: *b2DynamicTree) -> s32 #foreign box2d_windows_amd64_avx2;

/// Rebuild the tree while retaining subtrees that haven't changed. Returns the number of boxes sorted.
b2DynamicTree_Rebuild :: (tree: *b2DynamicTree, fullBuild: bool) -> s32 #foreign box2d_windows_amd64_avx2;

/// Shift the world origin. Useful for large worlds.
/// The shift formula is: position -= newOrigin
/// @param tree the tree to shift
/// @param newOrigin the new origin with respect to the old origin
b2DynamicTree_ShiftOrigin :: (tree: *b2DynamicTree, newOrigin: b2Vec2) -> void #foreign box2d_windows_amd64_avx2;

/// Get the number of bytes used by this tree
b2DynamicTree_GetByteCount :: (tree: *b2DynamicTree) -> s32 #foreign box2d_windows_amd64_avx2;

/// World id references a world instance. This should be treated as an opaque handle.
b2WorldId :: struct {
    index1:   u16;
    revision: u16;
}

/// Body id references a body instance. This should be treated as an opaque handle.
b2BodyId :: struct {
    index1:   s32;
    world0:   u16;
    revision: u16;
}

/// Shape id references a shape instance. This should be treated as an opaque handle.
b2ShapeId :: struct {
    index1:   s32;
    world0:   u16;
    revision: u16;
}

/// Joint id references a joint instance. This should be treated as an opaque handle.
b2JointId :: struct {
    index1:   s32;
    world0:   u16;
    revision: u16;
}

/// Chain id references a chain instances. This should be treated as an opaque handle.
b2ChainId :: struct {
    index1:   s32;
    world0:   u16;
    revision: u16;
}

/// Task interface
/// This is prototype for a Box2D task. Your task system is expected to invoke the Box2D task with these arguments.
/// The task spans a range of the parallel-for: [startIndex, endIndex)
/// The worker index must correctly identify each worker in the user thread pool, expected in [0, workerCount).
///	A worker must only exist on only one thread at a time and is analogous to the thread index.
/// The task context is the context pointer sent from Box2D when it is enqueued.
///	The startIndex and endIndex are expected in the range [0, itemCount) where itemCount is the argument to b2EnqueueTaskCallback
/// below. Box2D expects startIndex < endIndex and will execute a loop like this:
///
///	@code{.c}
/// for (int i = startIndex; i < endIndex; ++i)
///	{
///		DoWork();
///	}
///	@endcode
///	@ingroup world
b2TaskCallback :: #type (startIndex: s32, endIndex: s32, workerIndex: u32, taskContext: *void) -> void #c_call;

/// These functions can be provided to Box2D to invoke a task system. These are designed to work well with enkiTS.
/// Returns a pointer to the user's task object. May be nullptr. A nullptr indicates to Box2D that the work was executed
///	serially within the callback and there is no need to call b2FinishTaskCallback.
///	The itemCount is the number of Box2D work items that are to be partitioned among workers by the user's task system.
///	This is essentially a parallel-for. The minRange parameter is a suggestion of the minimum number of items to assign
///	per worker to reduce overhead. For example, suppose the task is small and that itemCount is 16. A minRange of 8 suggests
///	that your task system should split the work items among just two workers, even if you have more available.
///	In general the range [startIndex, endIndex) send to b2TaskCallback should obey:
///	endIndex - startIndex >= minRange
///	The exception of course is when itemCount < minRange.
///	@ingroup world
b2EnqueueTaskCallback :: #type (task: b2TaskCallback, itemCount: s32, minRange: s32, taskContext: *void, userContext: *void) -> *void #c_call;

/// Finishes a user task object that wraps a Box2D task.
///	@ingroup world
b2FinishTaskCallback :: #type (userTask: *void, userContext: *void) -> void #c_call;

/// Result from b2World_RayCastClosest
/// @ingroup world
b2RayResult :: struct {
    shapeId:  b2ShapeId;
    point:    b2Vec2;
    normal:   b2Vec2;
    fraction: float;
    hit:      bool;
}

/// World definition used to create a simulation world.
/// Must be initialized using b2DefaultWorldDef().
/// @ingroup world
b2WorldDef :: struct {
    /// Gravity vector. Box2D has no up-vector defined.
    gravity:                b2Vec2;

    /// Restitution velocity threshold, usually in m/s. Collisions above this
    /// speed have restitution applied (will bounce).
    restitutionThreshold:   float;

    /// This parameter controls how fast overlap is resolved and has units of meters per second
    contactPushoutVelocity: float;

    /// Threshold velocity for hit events. Usually meters per second.
    hitEventThreshold:      float;

    /// Contact stiffness. Cycles per second.
    contactHertz:           float;

    /// Contact bounciness. Non-dimensional.
    contactDampingRatio:    float;

    /// Joint stiffness. Cycles per second.
    jointHertz:             float;

    /// Joint bounciness. Non-dimensional.
    jointDampingRatio:      float;

    /// Maximum linear velocity. Usually meters per second.
    maximumLinearVelocity:  float;

    /// Can bodies go to sleep to improve performance
    enableSleep:            bool;

    /// Enable continuous collision
    enableContinous:        bool;

    /// Number of workers to use with the provided task system. Box2D performs best when using only
    ///	performance cores and accessing a single L2 cache. Efficiency cores and hyper-threading provide
    ///	little benefit and may even harm performance.
    workerCount:            s32;

    /// Function to spawn tasks
    enqueueTask:            b2EnqueueTaskCallback;

    /// Function to finish a task
    finishTask:             b2FinishTaskCallback;

    /// User context that is provided to enqueueTask and finishTask
    userTaskContext:        *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:          s32;
}

/// Use this to initialize your world definition
/// @ingroup world
b2DefaultWorldDef :: () -> b2WorldDef #foreign box2d_windows_amd64_avx2;

/// The body simulation type.
/// Each body is one of these three types. The type determines how the body behaves in the simulation.
/// @ingroup body
b2BodyType :: enum s32 {
    staticBody    :: 0;

    kinematicBody :: 1;

    dynamicBody   :: 2;

    bodyTypeCount :: 3;

    b2_staticBody    :: staticBody;

    b2_kinematicBody :: kinematicBody;

    b2_dynamicBody   :: dynamicBody;

    b2_bodyTypeCount :: bodyTypeCount;
}

/// A body definition holds all the data needed to construct a rigid body.
/// You can safely re-use body definitions. Shapes are added to a body after construction.
///	Body definitions are temporary objects used to bundle creation parameters.
/// Must be initialized using b2DefaultBodyDef().
/// @ingroup body
b2BodyDef :: struct {
    /// The body type: static, kinematic, or dynamic.
    type:              b2BodyType;

    /// The initial world position of the body. Bodies should be created with the desired position.
    /// @note Creating bodies at the origin and then moving them nearly doubles the cost of body creation, especially
    ///	if the body is moved after shapes have been added.
    position:          b2Vec2;

    /// The initial world rotation of the body. Use b2MakeRot() if you have an angle.
    rotation:          b2Rot;

    /// The initial linear velocity of the body's origin. Typically in meters per second.
    linearVelocity:    b2Vec2;

    /// The initial angular velocity of the body. Radians per second.
    angularVelocity:   float;

    /// Linear damping is use to reduce the linear velocity. The damping parameter
    /// can be larger than 1 but the damping effect becomes sensitive to the
    /// time step when the damping parameter is large.
    ///	Generally linear damping is undesirable because it makes objects move slowly
    ///	as if they are floating.
    linearDamping:     float;

    /// Angular damping is use to reduce the angular velocity. The damping parameter
    /// can be larger than 1.0f but the damping effect becomes sensitive to the
    /// time step when the damping parameter is large.
    ///	Angular damping can be use slow down rotating bodies.
    angularDamping:    float;

    /// Scale the gravity applied to this body. Non-dimensional.
    gravityScale:      float;

    /// Sleep velocity threshold, default is 0.05 meter per second
    sleepThreshold:    float;

    /// Use this to store application specific body data.
    userData:          *void;

    /// Set this flag to false if this body should never fall asleep.
    enableSleep:       bool;

    /// Is this body initially awake or sleeping?
    isAwake:           bool;

    /// Should this body be prevented from rotating? Useful for characters.
    fixedRotation:     bool;

    /// Treat this body as high speed object that performs continuous collision detection
    /// against dynamic and kinematic bodies, but not other bullet bodies.
    ///	@warning Bullets should be used sparingly. They are not a solution for general dynamic-versus-dynamic
    ///	continuous collision. They may interfere with joint constraints.
    isBullet:          bool;

    /// Used to disable a body. A disabled body does not move or collide.
    isEnabled:         bool;

    /// Automatically compute mass and related properties on this body from shapes.
    /// Triggers whenever a shape is add/removed/changed. Default is true.
    automaticMass:     bool;

    /// This allows this body to bypass rotational speed limits. Should only be used
    ///	for circular objects, like wheels.
    allowFastRotation: bool;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:     s32;
}

/// Use this to initialize your body definition
/// @ingroup body
b2DefaultBodyDef :: () -> b2BodyDef #foreign box2d_windows_amd64_avx2;

/// This is used to filter collision on shapes. It affects shape-vs-shape collision
///	and shape-versus-query collision (such as b2World_CastRay).
/// @ingroup shape
b2Filter :: struct {
    /// The collision category bits. Normally you would just set one bit. The category bits should
    ///	represent your application object types. For example:
    ///	@code{.cpp}
    ///	enum MyCategories
    ///	{
    ///	   Static  = 0x00000001,
    ///	   Dynamic = 0x00000002,
    ///	   Debris  = 0x00000004,
    ///	   Player  = 0x00000008,
    ///	   // etc
    /// };
    ///	@endcode
    categoryBits: u32;

    /// The collision mask bits. This states the categories that this
    /// shape would accept for collision.
    ///	For example, you may want your player to only collide with static objects
    ///	and other players.
    ///	@code{.c}
    ///	maskBits = Static | Player;
    ///	@endcode
    maskBits:     u32;

    /// Collision groups allow a certain group of objects to never collide (negative)
    /// or always collide (positive). A group index of zero has no effect. Non-zero group filtering
    /// always wins against the mask bits.
    ///	For example, you may want ragdolls to collide with other ragdolls but you don't want
    ///	ragdoll self-collision. In this case you would give each ragdoll a unique negative group index
    ///	and apply that group index to all shapes on the ragdoll.
    groupIndex:   s32;
}

/// Use this to initialize your filter
/// @ingroup shape
b2DefaultFilter :: () -> b2Filter #foreign box2d_windows_amd64_avx2;

/// The query filter is used to filter collisions between queries and shapes. For example,
///	you may want a ray-cast representing a projectile to hit players and the static environment
///	but not debris.
/// @ingroup shape
b2QueryFilter :: struct {
    /// The collision category bits of this query. Normally you would just set one bit.
    categoryBits: u32;

    /// The collision mask bits. This states the shape categories that this
    /// query would accept for collision.
    maskBits:     u32;
}

/// Use this to initialize your query filter
/// @ingroup shape
b2DefaultQueryFilter :: () -> b2QueryFilter #foreign box2d_windows_amd64_avx2;

/// Shape type
/// @ingroup shape
b2ShapeType :: enum s32 {
    circleShape        :: 0;

    capsuleShape       :: 1;

    segmentShape       :: 2;

    polygonShape       :: 3;

    smoothSegmentShape :: 4;

    shapeTypeCount     :: 5;

    b2_circleShape        :: circleShape;

    b2_capsuleShape       :: capsuleShape;

    b2_segmentShape       :: segmentShape;

    b2_polygonShape       :: polygonShape;

    b2_smoothSegmentShape :: smoothSegmentShape;

    b2_shapeTypeCount     :: shapeTypeCount;
}

/// Used to create a shape.
/// This is a temporary object used to bundle shape creation parameters. You may use
///	the same shape definition to create multiple shapes.
/// Must be initialized using b2DefaultShapeDef().
/// @ingroup shape
b2ShapeDef :: struct {
    /// Use this to store application specific shape data.
    userData:             *void;

    /// The Coulomb (dry) friction coefficient, usually in the range [0,1].
    friction:             float;

    /// The restitution (bounce) usually in the range [0,1].
    restitution:          float;

    /// The density, usually in kg/m^2.
    density:              float;

    /// Collision filtering data.
    filter:               b2Filter;

    /// Custom debug draw color.
    customColor:          u32;

    /// A sensor shape generates overlap events but never generates a collision response.
    isSensor:             bool;

    /// Enable sensor events for this shape. Only applies to kinematic and dynamic bodies. Ignored for sensors.
    enableSensorEvents:   bool;

    /// Enable contact events for this shape. Only applies to kinematic and dynamic bodies. Ignored for sensors.
    enableContactEvents:  bool;

    /// Enable hit events for this shape. Only applies to kinematic and dynamic bodies. Ignored for sensors.
    enableHitEvents:      bool;

    /// Enable pre-solve contact events for this shape. Only applies to dynamic bodies. These are expensive
    ///	and must be carefully handled due to threading. Ignored for sensors.
    enablePreSolveEvents: bool;

    /// Normally shapes on static bodies don't invoke contact creation when they are added to the world. This overrides
    ///	that behavior and causes contact creation. This significantly slows down static body creation which can be important
    ///	when there are many static shapes.
    /// This is implicitly always true for sensors.
    forceContactCreation: bool;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:        s32;
}

/// Use this to initialize your shape definition
/// @ingroup shape
b2DefaultShapeDef :: () -> b2ShapeDef #foreign box2d_windows_amd64_avx2;

/// Used to create a chain of edges. This is designed to eliminate ghost collisions with some limitations.
///	- chains are one-sided
///	- chains have no mass and should be used on static bodies
///	- chains have a counter-clockwise winding order
///	- chains are either a loop or open
/// - a chain must have at least 4 points
///	- the distance between any two points must be greater than b2_linearSlop
///	- a chain shape should not self intersect (this is not validated)
///	- an open chain shape has NO COLLISION on the first and final edge
///	- you may overlap two open chains on their first three and/or last three points to get smooth collision
///	- a chain shape creates multiple smooth edges shapes on the body
/// https://en.wikipedia.org/wiki/Polygonal_chain
/// Must be initialized using b2DefaultChainDef().
///	@warning Do not use chain shapes unless you understand the limitations. This is an advanced feature.
/// @ingroup shape
b2ChainDef :: struct {
    /// Use this to store application specific shape data.
    userData:      *void;

    /// An array of at least 4 points. These are cloned and may be temporary.
    points:        *b2Vec2;

    /// The point count, must be 4 or more.
    count:         s32;

    /// The friction coefficient, usually in the range [0,1].
    friction:      float;

    /// The restitution (elasticity) usually in the range [0,1].
    restitution:   float;

    /// Contact filtering data.
    filter:        b2Filter;

    /// Indicates a closed chain formed by connecting the first and last points
    isLoop:        bool;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue: s32;
}

/// Use this to initialize your chain definition
/// @ingroup shape
b2DefaultChainDef :: () -> b2ChainDef #foreign box2d_windows_amd64_avx2;

//! @cond
/// Profiling data. Times are in milliseconds.
b2Profile :: struct {
    step:                float;
    pairs:               float;
    collide:             float;
    solve:               float;
    buildIslands:        float;
    solveConstraints:    float;
    prepareTasks:        float;
    solverTasks:         float;
    prepareConstraints:  float;
    integrateVelocities: float;
    warmStart:           float;
    solveVelocities:     float;
    integratePositions:  float;
    relaxVelocities:     float;
    applyRestitution:    float;
    storeImpulses:       float;
    finalizeBodies:      float;
    splitIslands:        float;
    sleepIslands:        float;
    hitEvents:           float;
    broadphase:          float;
    continuous:          float;
}

/// Counters that give details of the simulation size.
b2Counters :: struct {
    staticBodyCount:  s32;
    bodyCount:        s32;
    shapeCount:       s32;
    contactCount:     s32;
    jointCount:       s32;
    islandCount:      s32;
    stackUsed:        s32;
    staticTreeHeight: s32;
    treeHeight:       s32;
    byteCount:        s32;
    taskCount:        s32;
    colorCounts:      [12] s32;
}

/// Joint type enumeration
///
/// This is useful because all joint types use b2JointId and sometimes you
/// want to get the type of a joint.
/// @ingroup joint
b2JointType :: enum s32 {
    distanceJoint  :: 0;
    motorJoint     :: 1;
    mouseJoint     :: 2;
    prismaticJoint :: 3;
    revoluteJoint  :: 4;
    weldJoint      :: 5;
    wheelJoint     :: 6;

    b2_distanceJoint  :: distanceJoint;
    b2_motorJoint     :: motorJoint;
    b2_mouseJoint     :: mouseJoint;
    b2_prismaticJoint :: prismaticJoint;
    b2_revoluteJoint  :: revoluteJoint;
    b2_weldJoint      :: weldJoint;
    b2_wheelJoint     :: wheelJoint;
}

/// Distance joint definition
///
/// This requires defining an anchor point on both
/// bodies and the non-zero distance of the distance joint. The definition uses
/// local anchor points so that the initial configuration can violate the
/// constraint slightly. This helps when saving and loading a game.
/// @ingroup distance_joint
b2DistanceJointDef :: struct {
    /// The first attached body
    bodyIdA:          b2BodyId;

    /// The second attached body
    bodyIdB:          b2BodyId;

    /// The local anchor point relative to bodyA's origin
    localAnchorA:     b2Vec2;

    /// The local anchor point relative to bodyB's origin
    localAnchorB:     b2Vec2;

    /// The rest length of this joint. Clamped to a stable minimum value.
    length:           float;

    /// Enable the distance constraint to behave like a spring. If false
    ///	then the distance joint will be rigid, overriding the limit and motor.
    enableSpring:     bool;

    /// The spring linear stiffness Hertz, cycles per second
    hertz:            float;

    /// The spring linear damping ratio, non-dimensional
    dampingRatio:     float;

    /// Enable/disable the joint limit
    enableLimit:      bool;

    /// Minimum length. Clamped to a stable minimum value.
    minLength:        float;

    /// Maximum length. Must be greater than or equal to the minimum length.
    maxLength:        float;

    /// Enable/disable the joint motor
    enableMotor:      bool;

    /// The maximum motor force, usually in newtons
    maxMotorForce:    float;

    /// The desired motor speed, usually in meters per second
    motorSpeed:       float;

    /// Set this flag to true if the attached bodies should collide
    collideConnected: bool;

    /// User data pointer
    userData:         *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:    s32;
}

/// Use this to initialize your joint definition
/// @ingroup distance_joint
b2DefaultDistanceJointDef :: () -> b2DistanceJointDef #foreign box2d_windows_amd64_avx2;

/// A motor joint is used to control the relative motion between two bodies
///
/// A typical usage is to control the movement of a dynamic body with respect to the ground.
/// @ingroup motor_joint
b2MotorJointDef :: struct {
    /// The first attached body
    bodyIdA:          b2BodyId;

    /// The second attached body
    bodyIdB:          b2BodyId;

    /// Position of bodyB minus the position of bodyA, in bodyA's frame
    linearOffset:     b2Vec2;

    /// The bodyB angle minus bodyA angle in radians
    angularOffset:    float;

    /// The maximum motor force in newtons
    maxForce:         float;

    /// The maximum motor torque in newton-meters
    maxTorque:        float;

    /// Position correction factor in the range [0,1]
    correctionFactor: float;

    /// Set this flag to true if the attached bodies should collide
    collideConnected: bool;

    /// User data pointer
    userData:         *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:    s32;
}

/// Use this to initialize your joint definition
/// @ingroup motor_joint
b2DefaultMotorJointDef :: () -> b2MotorJointDef #foreign box2d_windows_amd64_avx2;

/// A mouse joint is used to make a point on a body track a specified world point.
///
/// This a soft constraint and allows the constraint to stretch without
/// applying huge forces. This also applies rotation constraint heuristic to improve control.
/// @ingroup mouse_joint
b2MouseJointDef :: struct {
    /// The first attached body.
    bodyIdA:          b2BodyId;

    /// The second attached body.
    bodyIdB:          b2BodyId;

    /// The initial target point in world space
    target:           b2Vec2;

    /// Stiffness in hertz
    hertz:            float;

    /// Damping ratio, non-dimensional
    dampingRatio:     float;

    /// Maximum force, typically in newtons
    maxForce:         float;

    /// Set this flag to true if the attached bodies should collide.
    collideConnected: bool;

    /// User data pointer
    userData:         *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:    s32;
}

/// Use this to initialize your joint definition
/// @ingroup mouse_joint
b2DefaultMouseJointDef :: () -> b2MouseJointDef #foreign box2d_windows_amd64_avx2;

/// Prismatic joint definition
///
/// This requires defining a line of motion using an axis and an anchor point.
/// The definition uses local anchor points and a local axis so that the initial
/// configuration can violate the constraint slightly. The joint translation is zero
/// when the local anchor points coincide in world space.
/// @ingroup prismatic_joint
b2PrismaticJointDef :: struct {
    /// The first attached body
    bodyIdA:          b2BodyId;

    /// The second attached body
    bodyIdB:          b2BodyId;

    /// The local anchor point relative to bodyA's origin
    localAnchorA:     b2Vec2;

    /// The local anchor point relative to bodyB's origin
    localAnchorB:     b2Vec2;

    /// The local translation unit axis in bodyA
    localAxisA:       b2Vec2;

    /// The constrained angle between the bodies: bodyB_angle - bodyA_angle
    referenceAngle:   float;

    /// Enable a linear spring along the prismatic joint axis
    enableSpring:     bool;

    /// The spring stiffness Hertz, cycles per second
    hertz:            float;

    /// The spring damping ratio, non-dimensional
    dampingRatio:     float;

    /// Enable/disable the joint limit
    enableLimit:      bool;

    /// The lower translation limit
    lowerTranslation: float;

    /// The upper translation limit
    upperTranslation: float;

    /// Enable/disable the joint motor
    enableMotor:      bool;

    /// The maximum motor force, typically in newtons
    maxMotorForce:    float;

    /// The desired motor speed, typically in meters per second
    motorSpeed:       float;

    /// Set this flag to true if the attached bodies should collide
    collideConnected: bool;

    /// User data pointer
    userData:         *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:    s32;
}

/// Use this to initialize your joint definition
/// @ingroupd prismatic_joint
b2DefaultPrismaticJointDef :: () -> b2PrismaticJointDef #foreign box2d_windows_amd64_avx2;

/// Revolute joint definition
///
/// This requires defining an anchor point where the bodies are joined.
/// The definition uses local anchor points so that the
/// initial configuration can violate the constraint slightly. You also need to
/// specify the initial relative angle for joint limits. This helps when saving
/// and loading a game.
/// The local anchor points are measured from the body's origin
/// rather than the center of mass because:
/// 1. you might not know where the center of mass will be
/// 2. if you add/remove shapes from a body and recompute the mass, the joints will be broken
/// @ingroup revolute_joint
b2RevoluteJointDef :: struct {
    /// The first attached body
    bodyIdA:          b2BodyId;

    /// The second attached body
    bodyIdB:          b2BodyId;

    /// The local anchor point relative to bodyA's origin
    localAnchorA:     b2Vec2;

    /// The local anchor point relative to bodyB's origin
    localAnchorB:     b2Vec2;

    /// The bodyB angle minus bodyA angle in the reference state (radians).
    /// This defines the zero angle for the joint limit.
    referenceAngle:   float;

    /// Enable a rotational spring on the revolute hinge axis
    enableSpring:     bool;

    /// The spring stiffness Hertz, cycles per second
    hertz:            float;

    /// The spring damping ratio, non-dimensional
    dampingRatio:     float;

    /// A flag to enable joint limits
    enableLimit:      bool;

    /// The lower angle for the joint limit in radians
    lowerAngle:       float;

    /// The upper angle for the joint limit in radians
    upperAngle:       float;

    /// A flag to enable the joint motor
    enableMotor:      bool;

    /// The maximum motor torque, typically in newton-meters
    maxMotorTorque:   float;

    /// The desired motor speed in radians per second
    motorSpeed:       float;

    /// Scale the debug draw
    drawSize:         float;

    /// Set this flag to true if the attached bodies should collide
    collideConnected: bool;

    /// User data pointer
    userData:         *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:    s32;
}

/// Use this to initialize your joint definition.
/// @ingroup revolute_joint
b2DefaultRevoluteJointDef :: () -> b2RevoluteJointDef #foreign box2d_windows_amd64_avx2;

/// Weld joint definition
///
/// A weld joint connect to bodies together rigidly. This constraint provides springs to mimic
///	soft-body simulation.
/// @note The approximate solver in Box2D cannot hold many bodies together rigidly
/// @ingroup weld_joint
b2WeldJointDef :: struct {
    /// The first attached body
    bodyIdA:             b2BodyId;

    /// The second attached body
    bodyIdB:             b2BodyId;

    /// The local anchor point relative to bodyA's origin
    localAnchorA:        b2Vec2;

    /// The local anchor point relative to bodyB's origin
    localAnchorB:        b2Vec2;

    /// The bodyB angle minus bodyA angle in the reference state (radians)
    referenceAngle:      float;

    /// Linear stiffness expressed as Hertz (cycles per second). Use zero for maximum stiffness.
    linearHertz:         float;

    /// Angular stiffness as Hertz (cycles per second). Use zero for maximum stiffness.
    angularHertz:        float;

    /// Linear damping ratio, non-dimensional. Use 1 for critical damping.
    linearDampingRatio:  float;

    /// Linear damping ratio, non-dimensional. Use 1 for critical damping.
    angularDampingRatio: float;

    /// Set this flag to true if the attached bodies should collide
    collideConnected:    bool;

    /// User data pointer
    userData:            *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:       s32;
}

/// Use this to initialize your joint definition
/// @ingroup weld_joint
b2DefaultWeldJointDef :: () -> b2WeldJointDef #foreign box2d_windows_amd64_avx2;

/// Wheel joint definition
///
/// This requires defining a line of motion using an axis and an anchor point.
/// The definition uses local  anchor points and a local axis so that the initial
/// configuration can violate the constraint slightly. The joint translation is zero
/// when the local anchor points coincide in world space.
/// @ingroup wheel_joint
b2WheelJointDef :: struct {
    /// The first attached body
    bodyIdA:          b2BodyId;

    /// The second attached body
    bodyIdB:          b2BodyId;

    /// The local anchor point relative to bodyA's origin
    localAnchorA:     b2Vec2;

    /// The local anchor point relative to bodyB's origin
    localAnchorB:     b2Vec2;

    /// The local translation unit axis in bodyA
    localAxisA:       b2Vec2;

    /// Enable a linear spring along the local axis
    enableSpring:     bool;

    /// Spring stiffness in Hertz
    hertz:            float;

    /// Spring damping ratio, non-dimensional
    dampingRatio:     float;

    /// Enable/disable the joint linear limit
    enableLimit:      bool;

    /// The lower translation limit
    lowerTranslation: float;

    /// The upper translation limit
    upperTranslation: float;

    /// Enable/disable the joint rotational motor
    enableMotor:      bool;

    /// The maximum motor torque, typically in newton-meters
    maxMotorTorque:   float;

    /// The desired motor speed in radians per second
    motorSpeed:       float;

    /// Set this flag to true if the attached bodies should collide
    collideConnected: bool;

    /// User data pointer
    userData:         *void;

    /// Used internally to detect a valid definition. DO NOT SET.
    internalValue:    s32;
}

/// Use this to initialize your joint definition
/// @ingroup wheel_joint
b2DefaultWheelJointDef :: () -> b2WheelJointDef #foreign box2d_windows_amd64_avx2;

/// A begin touch event is generated when a shape starts to overlap a sensor shape.
b2SensorBeginTouchEvent :: struct {
    /// The id of the sensor shape
    sensorShapeId:  b2ShapeId;

    /// The id of the dynamic shape that began touching the sensor shape
    visitorShapeId: b2ShapeId;
}

/// An end touch event is generated when a shape stops overlapping a sensor shape.
b2SensorEndTouchEvent :: struct {
    /// The id of the sensor shape
    sensorShapeId:  b2ShapeId;

    /// The id of the dynamic shape that stopped touching the sensor shape
    visitorShapeId: b2ShapeId;
}

/// Sensor events are buffered in the Box2D world and are available
///	as begin/end overlap event arrays after the time step is complete.
///	Note: these may become invalid if bodies and/or shapes are destroyed
b2SensorEvents :: struct {
    /// Array of sensor begin touch events
    beginEvents: *b2SensorBeginTouchEvent;

    /// Array of sensor end touch events
    endEvents:   *b2SensorEndTouchEvent;

    /// The number of begin touch events
    beginCount:  s32;

    /// The number of end touch events
    endCount:    s32;
}

/// A begin touch event is generated when two shapes begin touching.
b2ContactBeginTouchEvent :: struct {
    /// Id of the first shape
    shapeIdA: b2ShapeId;

    /// Id of the second shape
    shapeIdB: b2ShapeId;
}

/// An end touch event is generated when two shapes stop touching.
b2ContactEndTouchEvent :: struct {
    /// Id of the first shape
    shapeIdA: b2ShapeId;

    /// Id of the second shape
    shapeIdB: b2ShapeId;
}

/// A hit touch event is generated when two shapes collide with a speed faster than the hit speed threshold.
b2ContactHitEvent :: struct {
    /// Id of the first shape
    shapeIdA:      b2ShapeId;

    /// Id of the second shape
    shapeIdB:      b2ShapeId;

    /// Point where the shapes hit
    point:         b2Vec2;

    /// Normal vector pointing from shape A to shape B
    normal:        b2Vec2;

    /// The speed the shapes are approaching. Always positive. Typically in meters per second.
    approachSpeed: float;
}

/// Contact events are buffered in the Box2D world and are available
///	as event arrays after the time step is complete.
///	Note: these may become invalid if bodies and/or shapes are destroyed
b2ContactEvents :: struct {
    /// Array of begin touch events
    beginEvents: *b2ContactBeginTouchEvent;

    /// Array of end touch events
    endEvents:   *b2ContactEndTouchEvent;

    /// Array of hit events
    hitEvents:   *b2ContactHitEvent;

    /// Number of begin touch events
    beginCount:  s32;

    /// Number of end touch events
    endCount:    s32;

    /// Number of hit events
    hitCount:    s32;
}

/// Body move events triggered when a body moves.
/// Triggered when a body moves due to simulation. Not reported for bodies moved by the user.
/// This also has a flag to indicate that the body went to sleep so the application can also
/// sleep that actor/entity/object associated with the body.
/// On the other hand if the flag does not indicate the body went to sleep then the application
/// can treat the actor/entity/object associated with the body as awake.
///	This is an efficient way for an application to update game object transforms rather than
///	calling functions such as b2Body_GetTransform() because this data is delivered as a contiguous array
///	and it is only populated with bodies that have moved.
///	@note If sleeping is disabled all dynamic and kinematic bodies will trigger move events.
b2BodyMoveEvent :: struct {
    transform:  b2Transform;
    bodyId:     b2BodyId;
    userData:   *void;
    fellAsleep: bool;
}

/// Body events are buffered in the Box2D world and are available
///	as event arrays after the time step is complete.
///	Note: this data becomes invalid if bodies are destroyed
b2BodyEvents :: struct {
    /// Array of move events
    moveEvents: *b2BodyMoveEvent;

    /// Number of move events
    moveCount:  s32;
}

/// The contact data for two shapes. By convention the manifold normal points
///	from shape A to shape B.
///	@see b2Shape_GetContactData() and b2Body_GetContactData()
b2ContactData :: struct {
    shapeIdA: b2ShapeId;
    shapeIdB: b2ShapeId;
    manifold: b2Manifold;
}

/// Prototype for a contact filter callback.
/// This is called when a contact pair is considered for collision. This allows you to
///	perform custom logic to prevent collision between shapes. This is only called if
///	one of the two shapes has custom filtering enabled. @see b2ShapeDef.
/// Notes:
///	- this function must be thread-safe
///	- this is only called if one of the two shapes has enabled custom filtering
/// - this is called only for awake dynamic bodies
///	Return false if you want to disable the collision
///	@warning Do not attempt to modify the world inside this callback
///	@ingroup world
b2CustomFilterFcn :: #type (shapeIdA: b2ShapeId, shapeIdB: b2ShapeId, _context: *void) -> bool #c_call;

/// Prototype for a pre-solve callback.
/// This is called after a contact is updated. This allows you to inspect a
/// contact before it goes to the solver. If you are careful, you can modify the
/// contact manifold (e.g. modify the normal).
/// Notes:
///	- this function must be thread-safe
///	- this is only called if the shape has enabled pre-solve events
/// - this is called only for awake dynamic bodies
/// - this is not called for sensors
/// - the supplied manifold has impulse values from the previous step
///	Return false if you want to disable the contact this step
///	@warning Do not attempt to modify the world inside this callback
///	@ingroup world
b2PreSolveFcn :: #type (shapeIdA: b2ShapeId, shapeIdB: b2ShapeId, manifold: *b2Manifold, _context: *void) -> bool #c_call;

/// Prototype callback for overlap queries.
/// Called for each shape found in the query.
/// @see b2World_QueryAABB
/// @return false to terminate the query.
///	@ingroup world
b2OverlapResultFcn :: #type (shapeId: b2ShapeId, _context: *void) -> bool #c_call;

/// Prototype callback for ray casts.
/// Called for each shape found in the query. You control how the ray cast
/// proceeds by returning a float:
/// return -1: ignore this shape and continue
/// return 0: terminate the ray cast
/// return fraction: clip the ray to this point
/// return 1: don't clip the ray and continue
/// @param shapeId the shape hit by the ray
/// @param point the point of initial intersection
/// @param normal the normal vector at the point of intersection
/// @param fraction the fraction along the ray at the point of intersection
///	@param context the user context
/// @return -1 to filter, 0 to terminate, fraction to clip the ray for closest hit, 1 to continue
/// @see b2World_CastRay
///	@ingroup world
b2CastResultFcn :: #type (shapeId: b2ShapeId, point: b2Vec2, normal: b2Vec2, fraction: float, _context: *void) -> float #c_call;

/// These colors are used for debug draw.
///	See https://www.rapidtables.com/web/color/index.html
b2HexColor :: enum s32 {
    colorAliceBlue            :: 15792383;
    colorAntiqueWhite         :: 16444375;
    colorAqua                 :: 65535;
    colorAquamarine           :: 8388564;
    colorAzure                :: 15794175;
    colorBeige                :: 16119260;
    colorBisque               :: 16770244;
    colorBlack                :: 0;
    colorBlanchedAlmond       :: 16772045;
    colorBlue                 :: 255;
    colorBlueViolet           :: 9055202;
    colorBrown                :: 10824234;
    colorBurlywood            :: 14596231;
    colorCadetBlue            :: 6266528;
    colorChartreuse           :: 8388352;
    colorChocolate            :: 13789470;
    colorCoral                :: 16744272;
    colorCornflowerBlue       :: 6591981;
    colorCornsilk             :: 16775388;
    colorCrimson              :: 14423100;
    colorCyan                 :: 65535;
    colorDarkBlue             :: 139;
    colorDarkCyan             :: 35723;
    colorDarkGoldenrod        :: 12092939;
    colorDarkGray             :: 11119017;
    colorDarkGreen            :: 25600;
    colorDarkKhaki            :: 12433259;
    colorDarkMagenta          :: 9109643;
    colorDarkOliveGreen       :: 5597999;
    colorDarkOrange           :: 16747520;
    colorDarkOrchid           :: 10040012;
    colorDarkRed              :: 9109504;
    colorDarkSalmon           :: 15308410;
    colorDarkSeaGreen         :: 9419919;
    colorDarkSlateBlue        :: 4734347;
    colorDarkSlateGray        :: 3100495;
    colorDarkTurquoise        :: 52945;
    colorDarkViolet           :: 9699539;
    colorDeepPink             :: 16716947;
    colorDeepSkyBlue          :: 49151;
    colorDimGray              :: 6908265;
    colorDodgerBlue           :: 2003199;
    colorFirebrick            :: 11674146;
    colorFloralWhite          :: 16775920;
    colorForestGreen          :: 2263842;
    colorFuchsia              :: 16711935;
    colorGainsboro            :: 14474460;
    colorGhostWhite           :: 16316671;
    colorGold                 :: 16766720;
    colorGoldenrod            :: 14329120;
    colorGray                 :: 12500670;
    colorGray1                :: 1710618;
    colorGray2                :: 3355443;
    colorGray3                :: 5066061;
    colorGray4                :: 6710886;
    colorGray5                :: 8355711;
    colorGray6                :: 10066329;
    colorGray7                :: 11776947;
    colorGray8                :: 13421772;
    colorGray9                :: 15066597;
    colorGreen                :: 65280;
    colorGreenYellow          :: 11403055;
    colorHoneydew             :: 15794160;
    colorHotPink              :: 16738740;
    colorIndianRed            :: 13458524;
    colorIndigo               :: 4915330;
    colorIvory                :: 16777200;
    colorKhaki                :: 15787660;
    colorLavender             :: 15132410;
    colorLavenderBlush        :: 16773365;
    colorLawnGreen            :: 8190976;
    colorLemonChiffon         :: 16775885;
    colorLightBlue            :: 11393254;
    colorLightCoral           :: 15761536;
    colorLightCyan            :: 14745599;
    colorLightGoldenrod       :: 15654274;
    colorLightGoldenrodYellow :: 16448210;
    colorLightGray            :: 13882323;
    colorLightGreen           :: 9498256;
    colorLightPink            :: 16758465;
    colorLightSalmon          :: 16752762;
    colorLightSeaGreen        :: 2142890;
    colorLightSkyBlue         :: 8900346;
    colorLightSlateBlue       :: 8679679;
    colorLightSlateGray       :: 7833753;
    colorLightSteelBlue       :: 11584734;
    colorLightYellow          :: 16777184;
    colorLime                 :: 65280;
    colorLimeGreen            :: 3329330;
    colorLinen                :: 16445670;
    colorMagenta              :: 16711935;
    colorMaroon               :: 11546720;
    colorMediumAquamarine     :: 6737322;
    colorMediumBlue           :: 205;
    colorMediumOrchid         :: 12211667;
    colorMediumPurple         :: 9662683;
    colorMediumSeaGreen       :: 3978097;
    colorMediumSlateBlue      :: 8087790;
    colorMediumSpringGreen    :: 64154;
    colorMediumTurquoise      :: 4772300;
    colorMediumVioletRed      :: 13047173;
    colorMidnightBlue         :: 1644912;
    colorMintCream            :: 16121850;
    colorMistyRose            :: 16770273;
    colorMoccasin             :: 16770229;
    colorNavajoWhite          :: 16768685;
    colorNavy                 :: 128;
    colorNavyBlue             :: 128;
    colorOldLace              :: 16643558;
    colorOlive                :: 8421376;
    colorOliveDrab            :: 7048739;
    colorOrange               :: 16753920;
    colorOrangeRed            :: 16729344;
    colorOrchid               :: 14315734;
    colorPaleGoldenrod        :: 15657130;
    colorPaleGreen            :: 10025880;
    colorPaleTurquoise        :: 11529966;
    colorPaleVioletRed        :: 14381203;
    colorPapayaWhip           :: 16773077;
    colorPeachPuff            :: 16767673;
    colorPeru                 :: 13468991;
    colorPink                 :: 16761035;
    colorPlum                 :: 14524637;
    colorPowderBlue           :: 11591910;
    colorPurple               :: 10494192;
    colorRebeccaPurple        :: 6697881;
    colorRed                  :: 16711680;
    colorRosyBrown            :: 12357519;
    colorRoyalBlue            :: 4286945;
    colorSaddleBrown          :: 9127187;
    colorSalmon               :: 16416882;
    colorSandyBrown           :: 16032864;
    colorSeaGreen             :: 3050327;
    colorSeashell             :: 16774638;
    colorSienna               :: 10506797;
    colorSilver               :: 12632256;
    colorSkyBlue              :: 8900331;
    colorSlateBlue            :: 6970061;
    colorSlateGray            :: 7372944;
    colorSnow                 :: 16775930;
    colorSpringGreen          :: 65407;
    colorSteelBlue            :: 4620980;
    colorTan                  :: 13808780;
    colorTeal                 :: 32896;
    colorThistle              :: 14204888;
    colorTomato               :: 16737095;
    colorTurquoise            :: 4251856;
    colorViolet               :: 15631086;
    colorVioletRed            :: 13639824;
    colorWheat                :: 16113331;
    colorWhite                :: 16777215;
    colorWhiteSmoke           :: 16119285;
    colorYellow               :: 16776960;
    colorYellowGreen          :: 10145074;
    colorBox2DRed             :: 14430514;
    colorBox2DBlue            :: 3190463;
    colorBox2DGreen           :: 9226532;
    colorBox2DYellow          :: 16772748;

    b2_colorAliceBlue            :: colorAliceBlue;
    b2_colorAntiqueWhite         :: colorAntiqueWhite;
    b2_colorAqua                 :: colorAqua;
    b2_colorAquamarine           :: colorAquamarine;
    b2_colorAzure                :: colorAzure;
    b2_colorBeige                :: colorBeige;
    b2_colorBisque               :: colorBisque;
    b2_colorBlack                :: colorBlack;
    b2_colorBlanchedAlmond       :: colorBlanchedAlmond;
    b2_colorBlue                 :: colorBlue;
    b2_colorBlueViolet           :: colorBlueViolet;
    b2_colorBrown                :: colorBrown;
    b2_colorBurlywood            :: colorBurlywood;
    b2_colorCadetBlue            :: colorCadetBlue;
    b2_colorChartreuse           :: colorChartreuse;
    b2_colorChocolate            :: colorChocolate;
    b2_colorCoral                :: colorCoral;
    b2_colorCornflowerBlue       :: colorCornflowerBlue;
    b2_colorCornsilk             :: colorCornsilk;
    b2_colorCrimson              :: colorCrimson;
    b2_colorCyan                 :: colorCyan;
    b2_colorDarkBlue             :: colorDarkBlue;
    b2_colorDarkCyan             :: colorDarkCyan;
    b2_colorDarkGoldenrod        :: colorDarkGoldenrod;
    b2_colorDarkGray             :: colorDarkGray;
    b2_colorDarkGreen            :: colorDarkGreen;
    b2_colorDarkKhaki            :: colorDarkKhaki;
    b2_colorDarkMagenta          :: colorDarkMagenta;
    b2_colorDarkOliveGreen       :: colorDarkOliveGreen;
    b2_colorDarkOrange           :: colorDarkOrange;
    b2_colorDarkOrchid           :: colorDarkOrchid;
    b2_colorDarkRed              :: colorDarkRed;
    b2_colorDarkSalmon           :: colorDarkSalmon;
    b2_colorDarkSeaGreen         :: colorDarkSeaGreen;
    b2_colorDarkSlateBlue        :: colorDarkSlateBlue;
    b2_colorDarkSlateGray        :: colorDarkSlateGray;
    b2_colorDarkTurquoise        :: colorDarkTurquoise;
    b2_colorDarkViolet           :: colorDarkViolet;
    b2_colorDeepPink             :: colorDeepPink;
    b2_colorDeepSkyBlue          :: colorDeepSkyBlue;
    b2_colorDimGray              :: colorDimGray;
    b2_colorDodgerBlue           :: colorDodgerBlue;
    b2_colorFirebrick            :: colorFirebrick;
    b2_colorFloralWhite          :: colorFloralWhite;
    b2_colorForestGreen          :: colorForestGreen;
    b2_colorFuchsia              :: colorFuchsia;
    b2_colorGainsboro            :: colorGainsboro;
    b2_colorGhostWhite           :: colorGhostWhite;
    b2_colorGold                 :: colorGold;
    b2_colorGoldenrod            :: colorGoldenrod;
    b2_colorGray                 :: colorGray;
    b2_colorGray1                :: colorGray1;
    b2_colorGray2                :: colorGray2;
    b2_colorGray3                :: colorGray3;
    b2_colorGray4                :: colorGray4;
    b2_colorGray5                :: colorGray5;
    b2_colorGray6                :: colorGray6;
    b2_colorGray7                :: colorGray7;
    b2_colorGray8                :: colorGray8;
    b2_colorGray9                :: colorGray9;
    b2_colorGreen                :: colorGreen;
    b2_colorGreenYellow          :: colorGreenYellow;
    b2_colorHoneydew             :: colorHoneydew;
    b2_colorHotPink              :: colorHotPink;
    b2_colorIndianRed            :: colorIndianRed;
    b2_colorIndigo               :: colorIndigo;
    b2_colorIvory                :: colorIvory;
    b2_colorKhaki                :: colorKhaki;
    b2_colorLavender             :: colorLavender;
    b2_colorLavenderBlush        :: colorLavenderBlush;
    b2_colorLawnGreen            :: colorLawnGreen;
    b2_colorLemonChiffon         :: colorLemonChiffon;
    b2_colorLightBlue            :: colorLightBlue;
    b2_colorLightCoral           :: colorLightCoral;
    b2_colorLightCyan            :: colorLightCyan;
    b2_colorLightGoldenrod       :: colorLightGoldenrod;
    b2_colorLightGoldenrodYellow :: colorLightGoldenrodYellow;
    b2_colorLightGray            :: colorLightGray;
    b2_colorLightGreen           :: colorLightGreen;
    b2_colorLightPink            :: colorLightPink;
    b2_colorLightSalmon          :: colorLightSalmon;
    b2_colorLightSeaGreen        :: colorLightSeaGreen;
    b2_colorLightSkyBlue         :: colorLightSkyBlue;
    b2_colorLightSlateBlue       :: colorLightSlateBlue;
    b2_colorLightSlateGray       :: colorLightSlateGray;
    b2_colorLightSteelBlue       :: colorLightSteelBlue;
    b2_colorLightYellow          :: colorLightYellow;
    b2_colorLime                 :: colorLime;
    b2_colorLimeGreen            :: colorLimeGreen;
    b2_colorLinen                :: colorLinen;
    b2_colorMagenta              :: colorMagenta;
    b2_colorMaroon               :: colorMaroon;
    b2_colorMediumAquamarine     :: colorMediumAquamarine;
    b2_colorMediumBlue           :: colorMediumBlue;
    b2_colorMediumOrchid         :: colorMediumOrchid;
    b2_colorMediumPurple         :: colorMediumPurple;
    b2_colorMediumSeaGreen       :: colorMediumSeaGreen;
    b2_colorMediumSlateBlue      :: colorMediumSlateBlue;
    b2_colorMediumSpringGreen    :: colorMediumSpringGreen;
    b2_colorMediumTurquoise      :: colorMediumTurquoise;
    b2_colorMediumVioletRed      :: colorMediumVioletRed;
    b2_colorMidnightBlue         :: colorMidnightBlue;
    b2_colorMintCream            :: colorMintCream;
    b2_colorMistyRose            :: colorMistyRose;
    b2_colorMoccasin             :: colorMoccasin;
    b2_colorNavajoWhite          :: colorNavajoWhite;
    b2_colorNavy                 :: colorNavy;
    b2_colorNavyBlue             :: colorNavyBlue;
    b2_colorOldLace              :: colorOldLace;
    b2_colorOlive                :: colorOlive;
    b2_colorOliveDrab            :: colorOliveDrab;
    b2_colorOrange               :: colorOrange;
    b2_colorOrangeRed            :: colorOrangeRed;
    b2_colorOrchid               :: colorOrchid;
    b2_colorPaleGoldenrod        :: colorPaleGoldenrod;
    b2_colorPaleGreen            :: colorPaleGreen;
    b2_colorPaleTurquoise        :: colorPaleTurquoise;
    b2_colorPaleVioletRed        :: colorPaleVioletRed;
    b2_colorPapayaWhip           :: colorPapayaWhip;
    b2_colorPeachPuff            :: colorPeachPuff;
    b2_colorPeru                 :: colorPeru;
    b2_colorPink                 :: colorPink;
    b2_colorPlum                 :: colorPlum;
    b2_colorPowderBlue           :: colorPowderBlue;
    b2_colorPurple               :: colorPurple;
    b2_colorRebeccaPurple        :: colorRebeccaPurple;
    b2_colorRed                  :: colorRed;
    b2_colorRosyBrown            :: colorRosyBrown;
    b2_colorRoyalBlue            :: colorRoyalBlue;
    b2_colorSaddleBrown          :: colorSaddleBrown;
    b2_colorSalmon               :: colorSalmon;
    b2_colorSandyBrown           :: colorSandyBrown;
    b2_colorSeaGreen             :: colorSeaGreen;
    b2_colorSeashell             :: colorSeashell;
    b2_colorSienna               :: colorSienna;
    b2_colorSilver               :: colorSilver;
    b2_colorSkyBlue              :: colorSkyBlue;
    b2_colorSlateBlue            :: colorSlateBlue;
    b2_colorSlateGray            :: colorSlateGray;
    b2_colorSnow                 :: colorSnow;
    b2_colorSpringGreen          :: colorSpringGreen;
    b2_colorSteelBlue            :: colorSteelBlue;
    b2_colorTan                  :: colorTan;
    b2_colorTeal                 :: colorTeal;
    b2_colorThistle              :: colorThistle;
    b2_colorTomato               :: colorTomato;
    b2_colorTurquoise            :: colorTurquoise;
    b2_colorViolet               :: colorViolet;
    b2_colorVioletRed            :: colorVioletRed;
    b2_colorWheat                :: colorWheat;
    b2_colorWhite                :: colorWhite;
    b2_colorWhiteSmoke           :: colorWhiteSmoke;
    b2_colorYellow               :: colorYellow;
    b2_colorYellowGreen          :: colorYellowGreen;
    b2_colorBox2DRed             :: colorBox2DRed;
    b2_colorBox2DBlue            :: colorBox2DBlue;
    b2_colorBox2DGreen           :: colorBox2DGreen;
    b2_colorBox2DYellow          :: colorBox2DYellow;
}

/// This struct holds callbacks you can implement to draw a Box2D world.
///	@ingroup world
b2DebugDraw :: struct {
    /// Draw a closed polygon provided in CCW order.
    DrawPolygon:          #type (vertices: *b2Vec2, vertexCount: s32, color: b2HexColor, _context: *void) -> void #c_call;

    /// Draw a solid closed polygon provided in CCW order.
    DrawSolidPolygon:     #type (transform: b2Transform, vertices: *b2Vec2, vertexCount: s32, radius: float, color: b2HexColor, _context: *void) -> void #c_call;

    /// Draw a circle.
    DrawCircle:           #type (center: b2Vec2, radius: float, color: b2HexColor, _context: *void) -> void #c_call;

    /// Draw a solid circle.
    DrawSolidCircle:      #type (transform: b2Transform, radius: float, color: b2HexColor, _context: *void) -> void #c_call;

    /// Draw a capsule.
    DrawCapsule:          #type (p1: b2Vec2, p2: b2Vec2, radius: float, color: b2HexColor, _context: *void) -> void #c_call;

    /// Draw a solid capsule.
    DrawSolidCapsule:     #type (p1: b2Vec2, p2: b2Vec2, radius: float, color: b2HexColor, _context: *void) -> void #c_call;

    /// Draw a line segment.
    DrawSegment:          #type (p1: b2Vec2, p2: b2Vec2, color: b2HexColor, _context: *void) -> void #c_call;

    /// Draw a transform. Choose your own length scale.
    DrawTransform:        #type (transform: b2Transform, _context: *void) -> void #c_call;

    /// Draw a point.
    DrawPoint:            #type (p: b2Vec2, size: float, color: b2HexColor, _context: *void) -> void #c_call;

    /// Draw a string.
    DrawString:           #type (p: b2Vec2, s: *u8, _context: *void) -> void #c_call;

    /// Bounds to use if restricting drawing to a rectangular region
    drawingBounds:        b2AABB;

    /// Option to restrict drawing to a rectangular region. May suffer from unstable depth sorting.
    useDrawingBounds:     bool;

    /// Option to draw shapes
    drawShapes:           bool;

    /// Option to draw joints
    drawJoints:           bool;

    /// Option to draw additional information for joints
    drawJointExtras:      bool;

    /// Option to draw the bounding boxes for shapes
    drawAABBs:            bool;

    /// Option to draw the mass and center of mass of dynamic bodies
    drawMass:             bool;

    /// Option to draw contact points
    drawContacts:         bool;

    /// Option to visualize the graph coloring used for contacts and joints
    drawGraphColors:      bool;

    /// Option to draw contact normals
    drawContactNormals:   bool;

    /// Option to draw contact normal impulses
    drawContactImpulses:  bool;

    /// Option to draw contact friction impulses
    drawFrictionImpulses: bool;

    /// User context that is passed as an argument to drawing callback functions
    _context:             *void;
}

/// Create a world for rigid body simulation. A world contains bodies, shapes, and constraints. You make create
///	up to 128 worlds. Each world is completely independent and may be simulated in parallel.
///	@return the world id.
b2CreateWorld :: (def: *b2WorldDef) -> b2WorldId #foreign box2d_windows_amd64_avx2;

/// Destroy a world
b2DestroyWorld :: (worldId: b2WorldId) -> void #foreign box2d_windows_amd64_avx2;

/// World id validation. Provides validation for up to 64K allocations.
b2World_IsValid :: (id: b2WorldId) -> bool #foreign box2d_windows_amd64_avx2;

/// Simulate a world for one time step. This performs collision detection, integration, and constraint solution.
/// @param worldId The world to simulate
/// @param timeStep The amount of time to simulate, this should be a fixed number. Typically 1/60.
/// @param subStepCount The number of sub-steps, increasing the sub-step count can increase accuracy. Typically 4.
b2World_Step :: (worldId: b2WorldId, timeStep: float, subStepCount: s32) -> void #foreign box2d_windows_amd64_avx2;

/// Call this to draw shapes and other debug draw data
b2World_Draw :: (worldId: b2WorldId, draw: *b2DebugDraw) -> void #foreign box2d_windows_amd64_avx2;

/// Get the body events for the current time step. The event data is transient. Do not store a reference to this data.
b2World_GetBodyEvents :: (worldId: b2WorldId) -> b2BodyEvents #foreign box2d_windows_amd64_avx2;

/// Get sensor events for the current time step. The event data is transient. Do not store a reference to this data.
b2World_GetSensorEvents :: (worldId: b2WorldId) -> b2SensorEvents #foreign box2d_windows_amd64_avx2;

/// Get contact events for this current time step. The event data is transient. Do not store a reference to this data.
b2World_GetContactEvents :: (worldId: b2WorldId) -> b2ContactEvents #foreign box2d_windows_amd64_avx2;

/// Overlap test for all shapes that *potentially* overlap the provided AABB
b2World_OverlapAABB :: (worldId: b2WorldId, aabb: b2AABB, filter: b2QueryFilter, fcn: b2OverlapResultFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Overlap test for for all shapes that overlap the provided circle
b2World_OverlapCircle :: (worldId: b2WorldId, circle: *b2Circle, transform: b2Transform, filter: b2QueryFilter, fcn: b2OverlapResultFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Overlap test for all shapes that overlap the provided capsule
b2World_OverlapCapsule :: (worldId: b2WorldId, capsule: *b2Capsule, transform: b2Transform, filter: b2QueryFilter, fcn: b2OverlapResultFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Overlap test for all shapes that overlap the provided polygon
b2World_OverlapPolygon :: (worldId: b2WorldId, polygon: *b2Polygon, transform: b2Transform, filter: b2QueryFilter, fcn: b2OverlapResultFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Cast a ray into the world to collect shapes in the path of the ray.
/// Your callback function controls whether you get the closest point, any point, or n-points.
/// The ray-cast ignores shapes that contain the starting point.
///	@param worldId The world to cast the ray against
///	@param origin The start point of the ray
///	@param translation The translation of the ray from the start point to the end point
///	@param filter Contains bit flags to filter unwanted shapes from the results
/// @param fcn A user implemented callback function
/// @param context A user context that is passed along to the callback function
///	@note The callback function may receive shapes in any order
b2World_CastRay :: (worldId: b2WorldId, origin: b2Vec2, translation: b2Vec2, filter: b2QueryFilter, fcn: b2CastResultFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Cast a ray into the world to collect the closest hit. This is a convenience function.
/// This is less general than b2World_CastRay() and does not allow for custom filtering.
b2World_CastRayClosest :: (worldId: b2WorldId, origin: b2Vec2, translation: b2Vec2, filter: b2QueryFilter) -> b2RayResult #foreign box2d_windows_amd64_avx2;

/// Cast a circle through the world. Similar to a cast ray except that a circle is cast instead of a point.
b2World_CastCircle :: (worldId: b2WorldId, circle: *b2Circle, originTransform: b2Transform, translation: b2Vec2, filter: b2QueryFilter, fcn: b2CastResultFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Cast a capsule through the world. Similar to a cast ray except that a capsule is cast instead of a point.
b2World_CastCapsule :: (worldId: b2WorldId, capsule: *b2Capsule, originTransform: b2Transform, translation: b2Vec2, filter: b2QueryFilter, fcn: b2CastResultFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Cast a polygon through the world. Similar to a cast ray except that a polygon is cast instead of a point.
b2World_CastPolygon :: (worldId: b2WorldId, polygon: *b2Polygon, originTransform: b2Transform, translation: b2Vec2, filter: b2QueryFilter, fcn: b2CastResultFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Enable/disable sleep. If your application does not need sleeping, you can gain some performance
///	by disabling sleep completely at the world level.
///	@see b2WorldDef
b2World_EnableSleeping :: (worldId: b2WorldId, flag: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Enable/disable continuous collision between dynamic and static bodies. Generally you should keep continuous
/// collision enabled to prevent fast moving objects from going through static objects. The performance gain from
///	disabling continuous collision is minor.
///	@see b2WorldDef
b2World_EnableContinuous :: (worldId: b2WorldId, flag: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Adjust the restitution threshold. It is recommended not to make this value very small
///	because it will prevent bodies from sleeping. Typically in meters per second.
///	@see b2WorldDef
b2World_SetRestitutionThreshold :: (worldId: b2WorldId, value: float) -> void #foreign box2d_windows_amd64_avx2;

/// Adjust the hit event threshold. This controls the collision velocity needed to generate a b2ContactHitEvent.
/// Typically in meters per second.
///	@see b2WorldDef::hitEventThreshold
b2World_SetHitEventThreshold :: (worldId: b2WorldId, value: float) -> void #foreign box2d_windows_amd64_avx2;

/// Register the custom filter callback. This is optional.
b2World_SetCustomFilterCallback :: (worldId: b2WorldId, fcn: b2CustomFilterFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Register the pre-solve callback. This is optional.
b2World_SetPreSolveCallback :: (worldId: b2WorldId, fcn: b2PreSolveFcn, _context: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Set the gravity vector for the entire world. Box2D has no concept of an up direction and this
/// is left as a decision for the application. Typically in m/s^2.
///	@see b2WorldDef
b2World_SetGravity :: (worldId: b2WorldId, gravity: b2Vec2) -> void #foreign box2d_windows_amd64_avx2;

/// Get the gravity vector
b2World_GetGravity :: (worldId: b2WorldId) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Apply a radial explosion
///	@param worldId The world id
///	@param position The center of the explosion
///	@param radius The radius of the explosion
///	@param impulse The impulse of the explosion, typically in kg * m / s or N * s.
b2World_Explode :: (worldId: b2WorldId, position: b2Vec2, radius: float, impulse: float) -> void #foreign box2d_windows_amd64_avx2;

/// Adjust contact tuning parameters
///	@param worldId The world id
/// @param hertz The contact stiffness (cycles per second)
/// @param dampingRatio The contact bounciness with 1 being critical damping (non-dimensional)
/// @param pushVelocity The maximum contact constraint push out velocity (meters per second)
///	@note Advanced feature
b2World_SetContactTuning :: (worldId: b2WorldId, hertz: float, dampingRatio: float, pushVelocity: float) -> void #foreign box2d_windows_amd64_avx2;

/// Enable/disable constraint warm starting. Advanced feature for testing. Disabling
///	sleeping greatly reduces stability and provides no performance gain.
b2World_EnableWarmStarting :: (worldId: b2WorldId, flag: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Get the current world performance profile
b2World_GetProfile :: (worldId: b2WorldId) -> b2Profile #foreign box2d_windows_amd64_avx2;

/// Get world counters and sizes
b2World_GetCounters :: (worldId: b2WorldId) -> b2Counters #foreign box2d_windows_amd64_avx2;

/// Dump memory stats to box2d_memory.txt
b2World_DumpMemoryStats :: (worldId: b2WorldId) -> void #foreign box2d_windows_amd64_avx2;

/// Create a rigid body given a definition. No reference to the definition is retained. So you can create the definition
///	on the stack and pass it as a pointer.
///	@code{.c}
///	b2BodyDef bodyDef = b2DefaultBodyDef();
///	b2BodyId myBodyId = b2CreateBody(myWorldId, &bodyDef);
///	@endcode
/// @warning This function is locked during callbacks.
b2CreateBody :: (worldId: b2WorldId, def: *b2BodyDef) -> b2BodyId #foreign box2d_windows_amd64_avx2;

/// Destroy a rigid body given an id. This destroys all shapes and joints attached to the body.
///	Do not keep references to the associated shapes and joints.
b2DestroyBody :: (bodyId: b2BodyId) -> void #foreign box2d_windows_amd64_avx2;

/// Body identifier validation. Can be used to detect orphaned ids. Provides validation for up to 64K allocations.
b2Body_IsValid :: (id: b2BodyId) -> bool #foreign box2d_windows_amd64_avx2;

/// Get the body type: static, kinematic, or dynamic
b2Body_GetType :: (bodyId: b2BodyId) -> b2BodyType #foreign box2d_windows_amd64_avx2;

/// Change the body type. This is an expensive operation. This automatically updates the mass
///	properties regardless of the automatic mass setting.
b2Body_SetType :: (bodyId: b2BodyId, type: b2BodyType) -> void #foreign box2d_windows_amd64_avx2;

/// Set the user data for a body
b2Body_SetUserData :: (bodyId: b2BodyId, userData: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Get the user data stored in a body
b2Body_GetUserData :: (bodyId: b2BodyId) -> *void #foreign box2d_windows_amd64_avx2;

/// Get the world position of a body. This is the location of the body origin.
b2Body_GetPosition :: (bodyId: b2BodyId) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Get the world rotation of a body as a cosine/sine pair (complex number)
b2Body_GetRotation :: (bodyId: b2BodyId) -> b2Rot #foreign box2d_windows_amd64_avx2;

/// Get the world transform of a body.
b2Body_GetTransform :: (bodyId: b2BodyId) -> b2Transform #foreign box2d_windows_amd64_avx2;

/// Set the world transform of a body. This acts as a teleport and is fairly expensive.
/// @note Generally you should create a body with then intended transform.
///	@see b2BodyDef::position and b2BodyDef::angle
b2Body_SetTransform :: (bodyId: b2BodyId, position: b2Vec2, rotation: b2Rot) -> void #foreign box2d_windows_amd64_avx2;

/// Get a local point on a body given a world point
b2Body_GetLocalPoint :: (bodyId: b2BodyId, worldPoint: b2Vec2) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Get a world point on a body given a local point
b2Body_GetWorldPoint :: (bodyId: b2BodyId, localPoint: b2Vec2) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Get a local vector on a body given a world vector
b2Body_GetLocalVector :: (bodyId: b2BodyId, worldVector: b2Vec2) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Get a world vector on a body given a local vector
b2Body_GetWorldVector :: (bodyId: b2BodyId, localVector: b2Vec2) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Get the linear velocity of a body's center of mass. Typically in meters per second.
b2Body_GetLinearVelocity :: (bodyId: b2BodyId) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Get the angular velocity of a body in radians per second
b2Body_GetAngularVelocity :: (bodyId: b2BodyId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the linear velocity of a body. Typically in meters per second.
b2Body_SetLinearVelocity :: (bodyId: b2BodyId, linearVelocity: b2Vec2) -> void #foreign box2d_windows_amd64_avx2;

/// Set the angular velocity of a body in radians per second
b2Body_SetAngularVelocity :: (bodyId: b2BodyId, angularVelocity: float) -> void #foreign box2d_windows_amd64_avx2;

/// Apply a force at a world point. If the force is not applied at the center of mass,
/// it will generate a torque and affect the angular velocity. This optionally wakes up the body.
///	The force is ignored if the body is not awake.
///	@param bodyId The body id
/// @param force The world force vector, typically in newtons (N)
/// @param point The world position of the point of application
/// @param wake Option to wake up the body
b2Body_ApplyForce :: (bodyId: b2BodyId, force: b2Vec2, point: b2Vec2, wake: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Apply a force to the center of mass. This optionally wakes up the body.
///	The force is ignored if the body is not awake.
///	@param bodyId The body id
/// @param force the world force vector, usually in newtons (N).
/// @param wake also wake up the body
b2Body_ApplyForceToCenter :: (bodyId: b2BodyId, force: b2Vec2, wake: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Apply a torque. This affects the angular velocity without affecting the linear velocity.
///	This optionally wakes the body. The torque is ignored if the body is not awake.
///	@param bodyId The body id
/// @param torque about the z-axis (out of the screen), typically in N*m.
/// @param wake also wake up the body
b2Body_ApplyTorque :: (bodyId: b2BodyId, torque: float, wake: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Apply an impulse at a point. This immediately modifies the velocity.
/// It also modifies the angular velocity if the point of application
/// is not at the center of mass. This optionally wakes the body.
/// The impulse is ignored if the body is not awake.
///	@param bodyId The body id
/// @param impulse the world impulse vector, typically in N*s or kg*m/s.
/// @param point the world position of the point of application.
/// @param wake also wake up the body
///	@warning This should be used for one-shot impulses. If you need a steady force,
/// use a force instead, which will work better with the sub-stepping solver.
b2Body_ApplyLinearImpulse :: (bodyId: b2BodyId, impulse: b2Vec2, point: b2Vec2, wake: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Apply an impulse to the center of mass. This immediately modifies the velocity.
/// The impulse is ignored if the body is not awake. This optionally wakes the body.
///	@param bodyId The body id
/// @param impulse the world impulse vector, typically in N*s or kg*m/s.
/// @param wake also wake up the body
///	@warning This should be used for one-shot impulses. If you need a steady force,
/// use a force instead, which will work better with the sub-stepping solver.
b2Body_ApplyLinearImpulseToCenter :: (bodyId: b2BodyId, impulse: b2Vec2, wake: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Apply an angular impulse. The impulse is ignored if the body is not awake.
/// This optionally wakes the body.
///	@param bodyId The body id
/// @param impulse the angular impulse, typically in units of kg*m*m/s
/// @param wake also wake up the body
///	@warning This should be used for one-shot impulses. If you need a steady force,
/// use a force instead, which will work better with the sub-stepping solver.
b2Body_ApplyAngularImpulse :: (bodyId: b2BodyId, impulse: float, wake: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Get the mass of the body, typically in kilograms
b2Body_GetMass :: (bodyId: b2BodyId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the inertia tensor of the body, typically in kg*m^2
b2Body_GetInertiaTensor :: (bodyId: b2BodyId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the center of mass position of the body in local space
b2Body_GetLocalCenterOfMass :: (bodyId: b2BodyId) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Get the center of mass position of the body in world space
b2Body_GetWorldCenterOfMass :: (bodyId: b2BodyId) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Override the body's mass properties. Normally this is computed automatically using the
///	shape geometry and density. This information is lost if a shape is added or removed or if the
///	body type changes.
b2Body_SetMassData :: (bodyId: b2BodyId, massData: b2MassData) -> void #foreign box2d_windows_amd64_avx2;

/// Get the mass data for a body
b2Body_GetMassData :: (bodyId: b2BodyId) -> b2MassData #foreign box2d_windows_amd64_avx2;

/// This update the mass properties to the sum of the mass properties of the shapes.
/// This normally does not need to be called unless you called SetMassData to override
/// the mass and you later want to reset the mass.
///	You may also use this when automatic mass computation has been disabled.
///	You should call this regardless of body type.
b2Body_ApplyMassFromShapes :: (bodyId: b2BodyId) -> void #foreign box2d_windows_amd64_avx2;

/// Set the automatic mass setting. Normally this is set in b2BodyDef before creation.
///	@see b2BodyDef::automaticMass
b2Body_SetAutomaticMass :: (bodyId: b2BodyId, automaticMass: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Get the automatic mass setting
b2Body_GetAutomaticMass :: (bodyId: b2BodyId) -> bool #foreign box2d_windows_amd64_avx2;

/// Adjust the linear damping. Normally this is set in b2BodyDef before creation.
b2Body_SetLinearDamping :: (bodyId: b2BodyId, linearDamping: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the current linear damping.
b2Body_GetLinearDamping :: (bodyId: b2BodyId) -> float #foreign box2d_windows_amd64_avx2;

/// Adjust the angular damping. Normally this is set in b2BodyDef before creation.
b2Body_SetAngularDamping :: (bodyId: b2BodyId, angularDamping: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the current angular damping.
b2Body_GetAngularDamping :: (bodyId: b2BodyId) -> float #foreign box2d_windows_amd64_avx2;

/// Adjust the gravity scale. Normally this is set in b2BodyDef before creation.
///	@see b2BodyDef::gravityScale
b2Body_SetGravityScale :: (bodyId: b2BodyId, gravityScale: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the current gravity scale
b2Body_GetGravityScale :: (bodyId: b2BodyId) -> float #foreign box2d_windows_amd64_avx2;

/// @return true if this body is awake
b2Body_IsAwake :: (bodyId: b2BodyId) -> bool #foreign box2d_windows_amd64_avx2;

/// Wake a body from sleep. This wakes the entire island the body is touching.
///	@warning Putting a body to sleep will put the entire island of bodies touching this body to sleep,
///	which can be expensive and possibly unintuitive.
b2Body_SetAwake :: (bodyId: b2BodyId, awake: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Enable or disable sleeping for this body. If sleeping is disabled the body will wake.
b2Body_EnableSleep :: (bodyId: b2BodyId, enableSleep: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Returns true if sleeping is enabled for this body
b2Body_IsSleepEnabled :: (bodyId: b2BodyId) -> bool #foreign box2d_windows_amd64_avx2;

/// Set the sleep threshold, typically in meters per second
b2Body_SetSleepThreshold :: (bodyId: b2BodyId, sleepVelocity: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the sleep threshold, typically in meters per second.
b2Body_GetSleepThreshold :: (bodyId: b2BodyId) -> float #foreign box2d_windows_amd64_avx2;

/// Returns true if this body is enabled
b2Body_IsEnabled :: (bodyId: b2BodyId) -> bool #foreign box2d_windows_amd64_avx2;

/// Disable a body by removing it completely from the simulation. This is expensive.
b2Body_Disable :: (bodyId: b2BodyId) -> void #foreign box2d_windows_amd64_avx2;

/// Enable a body by adding it to the simulation. This is expensive.
b2Body_Enable :: (bodyId: b2BodyId) -> void #foreign box2d_windows_amd64_avx2;

/// Set this body to have fixed rotation. This causes the mass to be reset in all cases.
b2Body_SetFixedRotation :: (bodyId: b2BodyId, flag: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Does this body have fixed rotation?
b2Body_IsFixedRotation :: (bodyId: b2BodyId) -> bool #foreign box2d_windows_amd64_avx2;

/// Set this body to be a bullet. A bullet does continuous collision detection
/// against dynamic bodies (but not other bullets).
b2Body_SetBullet :: (bodyId: b2BodyId, flag: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is this body a bullet?
b2Body_IsBullet :: (bodyId: b2BodyId) -> bool #foreign box2d_windows_amd64_avx2;

/// Enable/disable hit events on all shapes
///	@see b2ShapeDef::enableHitEvents
b2Body_EnableHitEvents :: (bodyId: b2BodyId, enableHitEvents: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Get the number of shapes on this body
b2Body_GetShapeCount :: (bodyId: b2BodyId) -> s32 #foreign box2d_windows_amd64_avx2;

/// Get the shape ids for all shapes on this body, up to the provided capacity.
///	@returns the number of shape ids stored in the user array
b2Body_GetShapes :: (bodyId: b2BodyId, shapeArray: *b2ShapeId, capacity: s32) -> s32 #foreign box2d_windows_amd64_avx2;

/// Get the number of joints on this body
b2Body_GetJointCount :: (bodyId: b2BodyId) -> s32 #foreign box2d_windows_amd64_avx2;

/// Get the joint ids for all joints on this body, up to the provided capacity
///	@returns the number of joint ids stored in the user array
b2Body_GetJoints :: (bodyId: b2BodyId, jointArray: *b2JointId, capacity: s32) -> s32 #foreign box2d_windows_amd64_avx2;

/// Get the maximum capacity required for retrieving all the touching contacts on a body
b2Body_GetContactCapacity :: (bodyId: b2BodyId) -> s32 #foreign box2d_windows_amd64_avx2;

/// Get the touching contact data for a body
b2Body_GetContactData :: (bodyId: b2BodyId, contactData: *b2ContactData, capacity: s32) -> s32 #foreign box2d_windows_amd64_avx2;

/// Get the current world AABB that contains all the attached shapes. Note that this may not encompass the body origin.
///	If there are no shapes attached then the returned AABB is empty and centered on the body origin.
b2Body_ComputeAABB :: (bodyId: b2BodyId) -> b2AABB #foreign box2d_windows_amd64_avx2;

/// Create a circle shape and attach it to a body. The shape definition and geometry are fully cloned.
/// Contacts are not created until the next time step.
///	@return the shape id for accessing the shape
b2CreateCircleShape :: (bodyId: b2BodyId, def: *b2ShapeDef, circle: *b2Circle) -> b2ShapeId #foreign box2d_windows_amd64_avx2;

/// Create a line segment shape and attach it to a body. The shape definition and geometry are fully cloned.
/// Contacts are not created until the next time step.
///	@return the shape id for accessing the shape
b2CreateSegmentShape :: (bodyId: b2BodyId, def: *b2ShapeDef, segment: *b2Segment) -> b2ShapeId #foreign box2d_windows_amd64_avx2;

/// Create a capsule shape and attach it to a body. The shape definition and geometry are fully cloned.
/// Contacts are not created until the next time step.
///	@return the shape id for accessing the shape
b2CreateCapsuleShape :: (bodyId: b2BodyId, def: *b2ShapeDef, capsule: *b2Capsule) -> b2ShapeId #foreign box2d_windows_amd64_avx2;

/// Create a polygon shape and attach it to a body. The shape definition and geometry are fully cloned.
/// Contacts are not created until the next time step.
///	@return the shape id for accessing the shape
b2CreatePolygonShape :: (bodyId: b2BodyId, def: *b2ShapeDef, polygon: *b2Polygon) -> b2ShapeId #foreign box2d_windows_amd64_avx2;

/// Destroy a shape
b2DestroyShape :: (shapeId: b2ShapeId) -> void #foreign box2d_windows_amd64_avx2;

/// Shape identifier validation. Provides validation for up to 64K allocations.
b2Shape_IsValid :: (id: b2ShapeId) -> bool #foreign box2d_windows_amd64_avx2;

/// Get the type of a shape
b2Shape_GetType :: (shapeId: b2ShapeId) -> b2ShapeType #foreign box2d_windows_amd64_avx2;

/// Get the id of the body that a shape is attached to
b2Shape_GetBody :: (shapeId: b2ShapeId) -> b2BodyId #foreign box2d_windows_amd64_avx2;

/// Returns true If the shape is a sensor
b2Shape_IsSensor :: (shapeId: b2ShapeId) -> bool #foreign box2d_windows_amd64_avx2;

/// Set the user data for a shape
b2Shape_SetUserData :: (shapeId: b2ShapeId, userData: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Get the user data for a shape. This is useful when you get a shape id
///	from an event or query.
b2Shape_GetUserData :: (shapeId: b2ShapeId) -> *void #foreign box2d_windows_amd64_avx2;

/// Set the mass density of a shape, typically in kg/m^2.
///	This will not update the mass properties on the parent body.
///	@see b2ShapeDef::density, b2Body_ApplyMassFromShapes
b2Shape_SetDensity :: (shapeId: b2ShapeId, density: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the density of a shape, typically in kg/m^2
b2Shape_GetDensity :: (shapeId: b2ShapeId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the friction on a shape
///	@see b2ShapeDef::friction
b2Shape_SetFriction :: (shapeId: b2ShapeId, friction: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the friction of a shape
b2Shape_GetFriction :: (shapeId: b2ShapeId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the shape restitution (bounciness)
///	@see b2ShapeDef::restitution
b2Shape_SetRestitution :: (shapeId: b2ShapeId, restitution: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the shape restitution
b2Shape_GetRestitution :: (shapeId: b2ShapeId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the shape filter
b2Shape_GetFilter :: (shapeId: b2ShapeId) -> b2Filter #foreign box2d_windows_amd64_avx2;

/// Set the current filter. This is almost as expensive as recreating the shape.
///	@see b2ShapeDef::filter
b2Shape_SetFilter :: (shapeId: b2ShapeId, filter: b2Filter) -> void #foreign box2d_windows_amd64_avx2;

/// Enable sensor events for this shape. Only applies to kinematic and dynamic bodies. Ignored for sensors.
///	@see b2ShapeDef::isSensor
b2Shape_EnableSensorEvents :: (shapeId: b2ShapeId, flag: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Returns true if sensor events are enabled
b2Shape_AreSensorEventsEnabled :: (shapeId: b2ShapeId) -> bool #foreign box2d_windows_amd64_avx2;

/// Enable contact events for this shape. Only applies to kinematic and dynamic bodies. Ignored for sensors.
///	@see b2ShapeDef::enableContactEvents
b2Shape_EnableContactEvents :: (shapeId: b2ShapeId, flag: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Returns true if contact events are enabled
b2Shape_AreContactEventsEnabled :: (shapeId: b2ShapeId) -> bool #foreign box2d_windows_amd64_avx2;

/// Enable pre-solve contact events for this shape. Only applies to dynamic bodies. These are expensive
///	and must be carefully handled due to multithreading. Ignored for sensors.
///	@see b2PreSolveFcn
b2Shape_EnablePreSolveEvents :: (shapeId: b2ShapeId, flag: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Returns true if pre-solve events are enabled
b2Shape_ArePreSolveEventsEnabled :: (shapeId: b2ShapeId) -> bool #foreign box2d_windows_amd64_avx2;

/// Enable contact hit events for this shape. Ignored for sensors.
///	@see b2WorldDef.hitEventThreshold
b2Shape_EnableHitEvents :: (shapeId: b2ShapeId, flag: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Returns true if hit events are enabled
b2Shape_AreHitEventsEnabled :: (shapeId: b2ShapeId) -> bool #foreign box2d_windows_amd64_avx2;

/// Test a point for overlap with a shape
b2Shape_TestPoint :: (shapeId: b2ShapeId, point: b2Vec2) -> bool #foreign box2d_windows_amd64_avx2;

/// Ray cast a shape directly
b2Shape_RayCast :: (shapeId: b2ShapeId, origin: b2Vec2, translation: b2Vec2) -> b2CastOutput #foreign box2d_windows_amd64_avx2;

/// Get a copy of the shape's circle. Asserts the type is correct.
b2Shape_GetCircle :: (shapeId: b2ShapeId) -> b2Circle #foreign box2d_windows_amd64_avx2;

/// Get a copy of the shape's line segment. Asserts the type is correct.
b2Shape_GetSegment :: (shapeId: b2ShapeId) -> b2Segment #foreign box2d_windows_amd64_avx2;

/// Get a copy of the shape's smooth line segment. These come from chain shapes.
/// Asserts the type is correct.
b2Shape_GetSmoothSegment :: (shapeId: b2ShapeId) -> b2SmoothSegment #foreign box2d_windows_amd64_avx2;

/// Get a copy of the shape's capsule. Asserts the type is correct.
b2Shape_GetCapsule :: (shapeId: b2ShapeId) -> b2Capsule #foreign box2d_windows_amd64_avx2;

/// Get a copy of the shape's convex polygon. Asserts the type is correct.
b2Shape_GetPolygon :: (shapeId: b2ShapeId) -> b2Polygon #foreign box2d_windows_amd64_avx2;

/// Allows you to change a shape to be a circle or update the current circle.
/// This does not modify the mass properties.
///	@see b2Body_ApplyMassFromShapes
b2Shape_SetCircle :: (shapeId: b2ShapeId, circle: *b2Circle) -> void #foreign box2d_windows_amd64_avx2;

/// Allows you to change a shape to be a capsule or update the current capsule.
/// This does not modify the mass properties.
///	@see b2Body_ApplyMassFromShapes
b2Shape_SetCapsule :: (shapeId: b2ShapeId, capsule: *b2Capsule) -> void #foreign box2d_windows_amd64_avx2;

/// Allows you to change a shape to be a segment or update the current segment.
b2Shape_SetSegment :: (shapeId: b2ShapeId, segment: *b2Segment) -> void #foreign box2d_windows_amd64_avx2;

/// Allows you to change a shape to be a polygon or update the current polygon.
/// This does not modify the mass properties.
///	@see b2Body_ApplyMassFromShapes
b2Shape_SetPolygon :: (shapeId: b2ShapeId, polygon: *b2Polygon) -> void #foreign box2d_windows_amd64_avx2;

/// Get the parent chain id if the shape type is b2_smoothSegmentShape, otherwise
/// returns b2_nullChainId.
b2Shape_GetParentChain :: (shapeId: b2ShapeId) -> b2ChainId #foreign box2d_windows_amd64_avx2;

/// Get the maximum capacity required for retrieving all the touching contacts on a shape
b2Shape_GetContactCapacity :: (shapeId: b2ShapeId) -> s32 #foreign box2d_windows_amd64_avx2;

/// Get the touching contact data for a shape. The provided shapeId will be either shapeIdA or shapeIdB on the contact data.
b2Shape_GetContactData :: (shapeId: b2ShapeId, contactData: *b2ContactData, capacity: s32) -> s32 #foreign box2d_windows_amd64_avx2;

/// Get the current world AABB
b2Shape_GetAABB :: (shapeId: b2ShapeId) -> b2AABB #foreign box2d_windows_amd64_avx2;

/// Get the closest point on a shape to a target point. Target and result are in world space.
b2Shape_GetClosestPoint :: (shapeId: b2ShapeId, target: b2Vec2) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Create a chain shape
///	@see b2ChainDef for details
b2CreateChain :: (bodyId: b2BodyId, def: *b2ChainDef) -> b2ChainId #foreign box2d_windows_amd64_avx2;

/// Destroy a chain shape
b2DestroyChain :: (chainId: b2ChainId) -> void #foreign box2d_windows_amd64_avx2;

/// Set the chain friction
/// @see b2ChainDef::friction
b2Chain_SetFriction :: (chainId: b2ChainId, friction: float) -> void #foreign box2d_windows_amd64_avx2;

/// Set the chain restitution (bounciness)
/// @see b2ChainDef::restitution
b2Chain_SetRestitution :: (chainId: b2ChainId, restitution: float) -> void #foreign box2d_windows_amd64_avx2;

/// Chain identifier validation. Provides validation for up to 64K allocations.
b2Chain_IsValid :: (id: b2ChainId) -> bool #foreign box2d_windows_amd64_avx2;

/// Destroy a joint
b2DestroyJoint :: (jointId: b2JointId) -> void #foreign box2d_windows_amd64_avx2;

/// Joint identifier validation. Provides validation for up to 64K allocations.
b2Joint_IsValid :: (id: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Get the joint type
b2Joint_GetType :: (jointId: b2JointId) -> b2JointType #foreign box2d_windows_amd64_avx2;

/// Get body A id on a joint
b2Joint_GetBodyA :: (jointId: b2JointId) -> b2BodyId #foreign box2d_windows_amd64_avx2;

/// Get body B id on a joint
b2Joint_GetBodyB :: (jointId: b2JointId) -> b2BodyId #foreign box2d_windows_amd64_avx2;

/// Get the local anchor on bodyA
b2Joint_GetLocalAnchorA :: (jointId: b2JointId) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Get the local anchor on bodyB
b2Joint_GetLocalAnchorB :: (jointId: b2JointId) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Toggle collision between connected bodies
b2Joint_SetCollideConnected :: (jointId: b2JointId, shouldCollide: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is collision allowed between connected bodies?
b2Joint_GetCollideConnected :: (jointId: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Set the user data on a joint
b2Joint_SetUserData :: (jointId: b2JointId, userData: *void) -> void #foreign box2d_windows_amd64_avx2;

/// Get the user data on a joint
b2Joint_GetUserData :: (jointId: b2JointId) -> *void #foreign box2d_windows_amd64_avx2;

/// Wake the bodies connect to this joint
b2Joint_WakeBodies :: (jointId: b2JointId) -> void #foreign box2d_windows_amd64_avx2;

/// Get the current constraint force for this joint
b2Joint_GetConstraintForce :: (jointId: b2JointId) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Get the current constraint torque for this joint
b2Joint_GetConstraintTorque :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Create a distance joint
///	@see b2DistanceJointDef for details
b2CreateDistanceJoint :: (worldId: b2WorldId, def: *b2DistanceJointDef) -> b2JointId #foreign box2d_windows_amd64_avx2;

/// Set the rest length of a distance joint
/// @param jointId The id for a distance joint
/// @param length The new distance joint length
b2DistanceJoint_SetLength :: (jointId: b2JointId, length: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the rest length of a distance joint
b2DistanceJoint_GetLength :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Enable/disable the distance joint spring. When disabled the distance joint is rigid.
b2DistanceJoint_EnableSpring :: (jointId: b2JointId, enableSpring: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is the distance joint spring enabled?
b2DistanceJoint_IsSpringEnabled :: (jointId: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Set the spring stiffness in Hertz
b2DistanceJoint_SetSpringHertz :: (jointId: b2JointId, hertz: float) -> void #foreign box2d_windows_amd64_avx2;

/// Set the spring damping ratio, non-dimensional
b2DistanceJoint_SetSpringDampingRatio :: (jointId: b2JointId, dampingRatio: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the spring Hertz
b2DistanceJoint_GetHertz :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the spring damping ratio
b2DistanceJoint_GetDampingRatio :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Enable joint limit. The limit only works if the joint spring is enabled. Otherwise the joint is rigid
///	and the limit has no effect.
b2DistanceJoint_EnableLimit :: (jointId: b2JointId, enableLimit: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is the distance joint limit enabled?
b2DistanceJoint_IsLimitEnabled :: (jointId: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Set the minimum and maximum length parameters of a distance joint
b2DistanceJoint_SetLengthRange :: (jointId: b2JointId, minLength: float, maxLength: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the distance joint minimum length
b2DistanceJoint_GetMinLength :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the distance joint maximum length
b2DistanceJoint_GetMaxLength :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the current length of a distance joint
b2DistanceJoint_GetCurrentLength :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Enable/disable the distance joint motor
b2DistanceJoint_EnableMotor :: (jointId: b2JointId, enableMotor: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is the distance joint motor enabled?
b2DistanceJoint_IsMotorEnabled :: (jointId: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Set the distance joint motor speed, typically in meters per second
b2DistanceJoint_SetMotorSpeed :: (jointId: b2JointId, motorSpeed: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the distance joint motor speed, typically in meters per second
b2DistanceJoint_GetMotorSpeed :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the distance joint maximum motor force, typically in newtons
b2DistanceJoint_SetMaxMotorForce :: (jointId: b2JointId, force: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the distance joint maximum motor force, typically in newtons
b2DistanceJoint_GetMaxMotorForce :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the distance joint current motor force, typically in newtons
b2DistanceJoint_GetMotorForce :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Create a motor joint
///	@see b2MotorJointDef for details
b2CreateMotorJoint :: (worldId: b2WorldId, def: *b2MotorJointDef) -> b2JointId #foreign box2d_windows_amd64_avx2;

/// Set the motor joint linear offset target
b2MotorJoint_SetLinearOffset :: (jointId: b2JointId, linearOffset: b2Vec2) -> void #foreign box2d_windows_amd64_avx2;

/// Get the motor joint linear offset target
b2MotorJoint_GetLinearOffset :: (jointId: b2JointId) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Set the motor joint angular offset target in radians
b2MotorJoint_SetAngularOffset :: (jointId: b2JointId, angularOffset: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the motor joint angular offset target in radians
b2MotorJoint_GetAngularOffset :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the motor joint maximum force, typically in newtons
b2MotorJoint_SetMaxForce :: (jointId: b2JointId, maxForce: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the motor joint maximum force, typically in newtons
b2MotorJoint_GetMaxForce :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the motor joint maximum torque, typically in newton-meters
b2MotorJoint_SetMaxTorque :: (jointId: b2JointId, maxTorque: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the motor joint maximum torque, typically in newton-meters
b2MotorJoint_GetMaxTorque :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the motor joint correction factor, typically in [0, 1]
b2MotorJoint_SetCorrectionFactor :: (jointId: b2JointId, correctionFactor: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the motor joint correction factor, typically in [0, 1]
b2MotorJoint_GetCorrectionFactor :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Create a mouse joint
///	@see b2MouseJointDef for details
b2CreateMouseJoint :: (worldId: b2WorldId, def: *b2MouseJointDef) -> b2JointId #foreign box2d_windows_amd64_avx2;

/// Set the mouse joint target
b2MouseJoint_SetTarget :: (jointId: b2JointId, target: b2Vec2) -> void #foreign box2d_windows_amd64_avx2;

/// Get the mouse joint target
b2MouseJoint_GetTarget :: (jointId: b2JointId) -> b2Vec2 #foreign box2d_windows_amd64_avx2;

/// Set the mouse joint spring stiffness in Hertz
b2MouseJoint_SetSpringHertz :: (jointId: b2JointId, hertz: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the mouse joint spring stiffness in Hertz
b2MouseJoint_GetSpringHertz :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the mouse joint spring damping ratio, non-dimensional
b2MouseJoint_SetSpringDampingRatio :: (jointId: b2JointId, dampingRatio: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the mouse joint damping ratio, non-dimensional
b2MouseJoint_GetSpringDampingRatio :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the mouse joint maximum force, typically in newtons
b2MouseJoint_SetMaxForce :: (jointId: b2JointId, maxForce: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the mouse joint maximum force, typically in newtons
b2MouseJoint_GetMaxForce :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Create a prismatic (slider) joint.
///	@see b2PrismaticJointDef for details
b2CreatePrismaticJoint :: (worldId: b2WorldId, def: *b2PrismaticJointDef) -> b2JointId #foreign box2d_windows_amd64_avx2;

/// Enable/disable the joint spring.
b2PrismaticJoint_EnableSpring :: (jointId: b2JointId, enableSpring: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is the prismatic joint spring enabled or not?
b2PrismaticJoint_IsSpringEnabled :: (jointId: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Set the prismatic joint stiffness in Hertz.
/// This should usually be less than a quarter of the simulation rate. For example, if the simulation
/// runs at 60Hz then the joint stiffness should be 15Hz or less.
b2PrismaticJoint_SetSpringHertz :: (jointId: b2JointId, hertz: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the prismatic joint stiffness in Hertz
b2PrismaticJoint_GetSpringHertz :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the prismatic joint damping ratio (non-dimensional)
b2PrismaticJoint_SetSpringDampingRatio :: (jointId: b2JointId, dampingRatio: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the prismatic spring damping ratio (non-dimensional)
b2PrismaticJoint_GetSpringDampingRatio :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Enable/disable a prismatic joint limit
b2PrismaticJoint_EnableLimit :: (jointId: b2JointId, enableLimit: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is the prismatic joint limit enabled?
b2PrismaticJoint_IsLimitEnabled :: (jointId: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Get the prismatic joint lower limit
b2PrismaticJoint_GetLowerLimit :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the prismatic joint upper limit
b2PrismaticJoint_GetUpperLimit :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the prismatic joint limits
b2PrismaticJoint_SetLimits :: (jointId: b2JointId, lower: float, upper: float) -> void #foreign box2d_windows_amd64_avx2;

/// Enable/disable a prismatic joint motor
b2PrismaticJoint_EnableMotor :: (jointId: b2JointId, enableMotor: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is the prismatic joint motor enabled?
b2PrismaticJoint_IsMotorEnabled :: (jointId: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Set the prismatic joint motor speed, typically in meters per second
b2PrismaticJoint_SetMotorSpeed :: (jointId: b2JointId, motorSpeed: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the prismatic joint motor speed, typically in meters per second
b2PrismaticJoint_GetMotorSpeed :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the prismatic joint maximum motor force, typically in newtons
b2PrismaticJoint_SetMaxMotorForce :: (jointId: b2JointId, force: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the prismatic joint maximum motor force, typically in newtons
b2PrismaticJoint_GetMaxMotorForce :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the prismatic joint current motor force, typically in newtons
b2PrismaticJoint_GetMotorForce :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Create a revolute joint
///	@see b2RevoluteJointDef for details
b2CreateRevoluteJoint :: (worldId: b2WorldId, def: *b2RevoluteJointDef) -> b2JointId #foreign box2d_windows_amd64_avx2;

/// Enable/disable the revolute joint spring
b2RevoluteJoint_EnableSpring :: (jointId: b2JointId, enableSpring: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Set the revolute joint spring stiffness in Hertz
b2RevoluteJoint_SetSpringHertz :: (jointId: b2JointId, hertz: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the revolute joint spring stiffness in Hertz
b2RevoluteJoint_GetSpringHertz :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the revolute joint spring damping ratio, non-dimensional
b2RevoluteJoint_SetSpringDampingRatio :: (jointId: b2JointId, dampingRatio: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the revolute joint spring damping ratio, non-dimensional
b2RevoluteJoint_GetSpringDampingRatio :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the revolute joint current angle in radians relative to the reference angle
///	@see b2RevoluteJointDef::referenceAngle
b2RevoluteJoint_GetAngle :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Enable/disable the revolute joint limit
b2RevoluteJoint_EnableLimit :: (jointId: b2JointId, enableLimit: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is the revolute joint limit enabled?
b2RevoluteJoint_IsLimitEnabled :: (jointId: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Get the revolute joint lower limit in radians
b2RevoluteJoint_GetLowerLimit :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the revolute joint upper limit in radians
b2RevoluteJoint_GetUpperLimit :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the revolute joint limits in radians
b2RevoluteJoint_SetLimits :: (jointId: b2JointId, lower: float, upper: float) -> void #foreign box2d_windows_amd64_avx2;

/// Enable/disable a revolute joint motor
b2RevoluteJoint_EnableMotor :: (jointId: b2JointId, enableMotor: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is the revolute joint motor enabled?
b2RevoluteJoint_IsMotorEnabled :: (jointId: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Set the revolute joint motor speed in radians per second
b2RevoluteJoint_SetMotorSpeed :: (jointId: b2JointId, motorSpeed: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the revolute joint motor speed in radians per second
b2RevoluteJoint_GetMotorSpeed :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the revolute joint current motor torque, typically in newton-meters
b2RevoluteJoint_GetMotorTorque :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the revolute joint maximum motor torque, typically in newton-meters
b2RevoluteJoint_SetMaxMotorTorque :: (jointId: b2JointId, torque: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the revolute joint maximum motor torque, typically in newton-meters
b2RevoluteJoint_GetMaxMotorTorque :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Create a weld joint
///	@see b2WeldJointDef for details
b2CreateWeldJoint :: (worldId: b2WorldId, def: *b2WeldJointDef) -> b2JointId #foreign box2d_windows_amd64_avx2;

/// Set the weld joint linear stiffness in Hertz. 0 is rigid.
b2WeldJoint_SetLinearHertz :: (jointId: b2JointId, hertz: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the weld joint linear stiffness in Hertz
b2WeldJoint_GetLinearHertz :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the weld joint linear damping ratio (non-dimensional)
b2WeldJoint_SetLinearDampingRatio :: (jointId: b2JointId, dampingRatio: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the weld joint linear damping ratio (non-dimensional)
b2WeldJoint_GetLinearDampingRatio :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the weld joint angular stiffness in Hertz. 0 is rigid.
b2WeldJoint_SetAngularHertz :: (jointId: b2JointId, hertz: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the weld joint angular stiffness in Hertz
b2WeldJoint_GetAngularHertz :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set weld joint angular damping ratio, non-dimensional
b2WeldJoint_SetAngularDampingRatio :: (jointId: b2JointId, dampingRatio: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the weld joint angular damping ratio, non-dimensional
b2WeldJoint_GetAngularDampingRatio :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Create a wheel joint
///	@see b2WheelJointDef for details
b2CreateWheelJoint :: (worldId: b2WorldId, def: *b2WheelJointDef) -> b2JointId #foreign box2d_windows_amd64_avx2;

/// Enable/disable the wheel joint spring
b2WheelJoint_EnableSpring :: (jointId: b2JointId, enableSpring: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is the wheel joint spring enabled?
b2WheelJoint_IsSpringEnabled :: (jointId: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Set the wheel joint stiffness in Hertz
b2WheelJoint_SetSpringHertz :: (jointId: b2JointId, hertz: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the wheel joint stiffness in Hertz
b2WheelJoint_GetSpringHertz :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the wheel joint damping ratio, non-dimensional
b2WheelJoint_SetSpringDampingRatio :: (jointId: b2JointId, dampingRatio: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the wheel joint damping ratio, non-dimensional
b2WheelJoint_GetSpringDampingRatio :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Enable/disable the wheel joint limit
b2WheelJoint_EnableLimit :: (jointId: b2JointId, enableLimit: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is the wheel joint limit enabled?
b2WheelJoint_IsLimitEnabled :: (jointId: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Get the wheel joint lower limit
b2WheelJoint_GetLowerLimit :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the wheel joint upper limit
b2WheelJoint_GetUpperLimit :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the wheel joint limits
b2WheelJoint_SetLimits :: (jointId: b2JointId, lower: float, upper: float) -> void #foreign box2d_windows_amd64_avx2;

/// Enable/disable the wheel joint motor
b2WheelJoint_EnableMotor :: (jointId: b2JointId, enableMotor: bool) -> void #foreign box2d_windows_amd64_avx2;

/// Is the wheel joint motor enabled?
b2WheelJoint_IsMotorEnabled :: (jointId: b2JointId) -> bool #foreign box2d_windows_amd64_avx2;

/// Set the wheel joint motor speed in radians per second
b2WheelJoint_SetMotorSpeed :: (jointId: b2JointId, motorSpeed: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the wheel joint motor speed in radians per second
b2WheelJoint_GetMotorSpeed :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Set the wheel joint maximum motor torque, typically in newton-meters
b2WheelJoint_SetMaxMotorTorque :: (jointId: b2JointId, torque: float) -> void #foreign box2d_windows_amd64_avx2;

/// Get the wheel joint maximum motor torque, typically in newton-meters
b2WheelJoint_GetMaxMotorTorque :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

/// Get the wheel joint current motor torque, typically in newton-meters
b2WheelJoint_GetMotorTorque :: (jointId: b2JointId) -> float #foreign box2d_windows_amd64_avx2;

#scope_file

box2d_windows_amd64_avx2 :: #library,no_dll "./box2d_windows_amd64_avx2";
