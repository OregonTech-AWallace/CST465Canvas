# Identity
An important part of the web is being able to identify your users.

This allows:
- Content to be tailored to them
- Their actions to be tracked
- Resources to be protected from the general public

## Claims Authentication
The majority of authentication on the web is now based around the idea of **Claims**. This allows authentication systems to be used for access to multiple different sites/resources

With Claims Authentication:
- The authentication system can be a separate entity from the system using the login credentials
- There must be a relationship of trust between the authentication application and application receiving claims

### Terminology
**Identity Provider(IdP)** – An application that issues claims about a users identity

**Service Provider(SP) or Relying Party (RP)** – An application that receives claims about users from an IdP

**Claim** – An assertion generated on behalf of a user.  It may include information such as their name, email, ID number, roles, etc.

### Authentication Flow (Generic)
1. An unauthenticated user requests a resource on the relying party application that requires the user to be authenticated
1. The user is redirected to the Identity Provider(IdP)
1. The IdP authenticates the user and redirects them back to the relying party(RP) with a token containing information about the users identity (the claim)
1. The RP grants access to the user based on the information contained within the claim.  Usually a cookie is set in the user's browser in order to maintain the login session
