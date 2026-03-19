import jwt from 'jsonwebtoken'

const JWT_SECRET          = process.env.JWT_SECRET          ?? 'change_me'
const REFRESH_TOKEN_SECRET = process.env.REFRESH_TOKEN_SECRET ?? 'change_me'
const ACCESS_EXPIRES_IN   = process.env.JWT_EXPIRES_IN        ?? '7d'
const REFRESH_EXPIRES_IN  = process.env.REFRESH_TOKEN_EXPIRES_IN ?? '30d'

export interface TokenPayload {
  sub: string
  email: string
  organizationId: string
  role: string
}

export function signAccessToken(payload: TokenPayload): string {
  return jwt.sign(payload, JWT_SECRET, { expiresIn: ACCESS_EXPIRES_IN } as jwt.SignOptions)
}

export function signRefreshToken(sub: string): string {
  return jwt.sign({ sub }, REFRESH_TOKEN_SECRET, { expiresIn: REFRESH_EXPIRES_IN } as jwt.SignOptions)
}

export function verifyAccessToken(token: string): TokenPayload {
  return jwt.verify(token, JWT_SECRET) as TokenPayload
}

export function verifyRefreshToken(token: string): { sub: string } {
  return jwt.verify(token, REFRESH_TOKEN_SECRET) as { sub: string }
}
