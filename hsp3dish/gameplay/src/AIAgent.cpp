#include "Base.h"
#include "AIAgent.h"
#include "Node.h"

namespace gameplay
{

AIAgent::AIAgent()
    : _stateMachine(NULL), _node(NULL), _enabled(true), _listener(NULL), _next(NULL)
{
    _stateMachine = new AIStateMachine(this);

    addScriptEvent("message", "<AIMessage>");
}

AIAgent::~AIAgent()
{
    SAFE_DELETE(_stateMachine);
}

AIAgent* AIAgent::create()
{
    return new AIAgent();
}

const char* AIAgent::getId() const
{
    if (_node)
        return _node->getId();

    return "";
}

Node* AIAgent::getNode() const
{
    return _node;
}

AIStateMachine* AIAgent::getStateMachine()
{
    return _stateMachine;
}

bool AIAgent::isEnabled() const
{
    return (_node && _enabled);
}

void AIAgent::setEnabled(bool enabled)
{
    _enabled = enabled;
}

void AIAgent::setListener(Listener* listener)
{
    _listener = listener;
}

void AIAgent::update(float elapsedTime)
{
    _stateMachine->update(elapsedTime);
}

bool AIAgent::processMessage(AIMessage* message)
{
    // Handle built-in message types.
    switch (message->_messageType)
    {
    case AIMessage::MESSAGE_TYPE_STATE_CHANGE:
        {
            // Change state message
            const char* stateId = message->getString(0);
            if (stateId)
            {
                AIState* state = _stateMachine->getState(stateId);
                if (state)
                    _stateMachine->setStateInternal(state);
            }
        }
        break;
    }

    // Dispatch message to registered listener.
    if (_listener && _listener->messageReceived(message))
        return true;
    
    if (fireScriptEvent<bool>("message", message))
        return true;
    
    return false;
}

}
