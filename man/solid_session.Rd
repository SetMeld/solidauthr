\name{solid_session}
\alias{solid_session}
\title{Create a Solid OIDC session}
\usage{
solid_session(issuer, client_id, client_secret, safety_margin = 30L)
}
\arguments{
  \item{issuer}{A length-1 character vector giving the issuer base URL for a
  Community Solid Server identity provider.}

  \item{client_id}{A length-1 character vector giving the OAuth client ID.}

  \item{client_secret}{A length-1 character vector giving the OAuth client
  secret.}

  \item{safety_margin}{A number of seconds to subtract from token expiry when
  deciding whether a token should be refreshed.}
}
\value{
An R6 \code{SolidSession} object with methods for authenticated HTTP requests
and access-token retrieval.
}
\description{
Discovers the issuer's OpenID configuration, creates a session-scoped DPoP key,
obtains DPoP-bound access tokens with the \code{webid} scope, and attaches
fresh DPoP proofs to outgoing Solid requests.
}
\examples{
issuer <- Sys.getenv("SOLID_ISSUER")
client_id <- Sys.getenv("SOLID_CLIENT_ID")
client_secret <- Sys.getenv("SOLID_CLIENT_SECRET")

if (nzchar(issuer) && nzchar(client_id) && nzchar(client_secret)) {
  session <- solid_session(
    issuer = issuer,
    client_id = client_id,
    client_secret = client_secret
  )

  session$token()
}
}
