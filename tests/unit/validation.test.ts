import { describe, it, expect } from 'vitest'
import { CreateUserSchema, UpdateUserSchema } from '@octo-crm/validation'
import { CreateLeadSchema } from '@octo-crm/validation'
import { LoginSchema } from '@octo-crm/validation'

describe('CreateUserSchema', () => {
  it('validates valid user', () => {
    const result = CreateUserSchema.safeParse({
      email: 'test@example.com',
      firstName: 'Alice',
      lastName: 'Smith',
      password: 'Password123',
    })
    expect(result.success).toBe(true)
  })
  it('rejects invalid email', () => {
    const result = CreateUserSchema.safeParse({
      email: 'bad-email',
      firstName: 'Alice',
      lastName: 'Smith',
      password: 'Password123',
    })
    expect(result.success).toBe(false)
  })
  it('rejects short password', () => {
    const result = CreateUserSchema.safeParse({
      email: 'test@example.com',
      firstName: 'A',
      lastName: 'B',
      password: 'short',
    })
    expect(result.success).toBe(false)
  })
})

describe('CreateLeadSchema', () => {
  it('validates lead with minimal fields', () => {
    const result = CreateLeadSchema.safeParse({
      firstName: 'Bob',
      lastName: 'Jones',
      email: 'bob@example.com',
    })
    expect(result.success).toBe(true)
  })
  it('rejects lead missing required fields', () => {
    const result = CreateLeadSchema.safeParse({ email: 'bob@example.com' })
    expect(result.success).toBe(false)
  })
})

describe('LoginSchema', () => {
  it('validates valid login', () => {
    const result = LoginSchema.safeParse({ email: 'a@b.com', password: 'pass' })
    expect(result.success).toBe(true)
  })
})
