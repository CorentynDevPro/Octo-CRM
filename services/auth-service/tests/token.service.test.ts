import { describe, it, expect } from 'vitest'
import { signAccessToken, verifyAccessToken } from '../src/services/token.service'

describe('token.service', () => {
  const payload = { sub: 'user-1', email: 'test@example.com', organizationId: 'org-1', role: 'ADMIN' }

  it('should sign and verify an access token', () => {
    const token = signAccessToken(payload)
    const decoded = verifyAccessToken(token)
    expect(decoded.sub).toBe(payload.sub)
    expect(decoded.email).toBe(payload.email)
  })

  it('should throw on invalid token', () => {
    expect(() => verifyAccessToken('invalid')).toThrow()
  })
})
