#ifndef PHYSICSGHOSTOBJECT_H_
#define PHYSICSGHOSTOBJECT_H_

#include "PhysicsCollisionObject.h"
#include "PhysicsRigidBody.h"
#include "Transform.h"

namespace gameplay
{

/**
 * Defines a class for physics ghost objects.
 */
class PhysicsGhostObject : public PhysicsCollisionObject, public Transform::Listener
{
    friend class Node;
    friend class PhysicsController;

public:

    /**
     * @see PhysicsCollisionObject::getType
     */
    PhysicsCollisionObject::Type getType() const;

    /**
     * Used to synchronize the transform between GamePlay and Bullet.
     */
    void transformChanged(Transform* transform, long cookie);

protected:

    /**
     * @see PhysicsCollisionObject::getCollisionObject
     */
    btCollisionObject* getCollisionObject() const;

protected:

    /**
     * Constructor.
     * 
     * @param node The node to attach the ghost object to.
     * @param shape The collision shape definition for the ghost object.
     */
    PhysicsGhostObject(Node* node, const PhysicsCollisionShape::Definition& shape);

    /**
     * Destructor.
     */
    virtual ~PhysicsGhostObject();

    /**
     * Creates a ghost object from the specified properties object.
     * 
     * @param node The node to create a ghost object for; note that the node must have
     *      a model attached to it prior to creating a ghost object for it.
     * @param properties The properties object defining the ghost object (must have namespace equal to 'ghost').
     * @return The newly created ghost object, or <code>NULL</code> if the ghost object failed to load.
     */
    static PhysicsGhostObject* create(Node* node, Properties* properties);

    /**
     * Pointer to the Bullet ghost collision object.
     */
    btPairCachingGhostObject* _ghostObject;
};

}

#endif
