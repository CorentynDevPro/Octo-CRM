import { describe, it, expect } from 'vitest'
import { slugify, truncate, titleCase, getInitials } from '@octo-crm/utils'
import { formatCurrency, centsToDollars, dollarsToCents } from '@octo-crm/utils'
import { isValidEmail, isValidUrl } from '@octo-crm/utils'
import { parsePagination, buildPaginationMeta, getOffset } from '@octo-crm/utils'

describe('string utils', () => {
  it('slugify', () => {
    expect(slugify('Hello World!')).toBe('hello-world')
    expect(slugify('  Foo  Bar  ')).toBe('foo-bar')
  })
  it('truncate', () => {
    expect(truncate('Hello World', 8)).toBe('Hello...')
    expect(truncate('Hi', 10)).toBe('Hi')
  })
  it('titleCase', () => {
    expect(titleCase('hello world')).toBe('Hello World')
  })
  it('getInitials', () => {
    expect(getInitials('Alice', 'Johnson')).toBe('AJ')
  })
})

describe('currency utils', () => {
  it('centsToDollars', () => {
    expect(centsToDollars(1000)).toBe(10)
    expect(centsToDollars(9999)).toBe(99.99)
  })
  it('dollarsToCents', () => {
    expect(dollarsToCents(10)).toBe(1000)
    expect(dollarsToCents(99.99)).toBe(9999)
  })
})

describe('validation utils', () => {
  it('isValidEmail', () => {
    expect(isValidEmail('test@example.com')).toBe(true)
    expect(isValidEmail('not-an-email')).toBe(false)
  })
  it('isValidUrl', () => {
    expect(isValidUrl('https://example.com')).toBe(true)
    expect(isValidUrl('not-a-url')).toBe(false)
  })
})

describe('pagination utils', () => {
  it('parsePagination defaults', () => {
    const r = parsePagination({})
    expect(r.page).toBe(1)
    expect(r.perPage).toBe(20)
  })
  it('parsePagination clamps perPage to 100', () => {
    const r = parsePagination({ perPage: 999 })
    expect(r.perPage).toBe(100)
  })
  it('buildPaginationMeta', () => {
    const meta = buildPaginationMeta(100, 2, 20)
    expect(meta.totalPages).toBe(5)
    expect(meta.page).toBe(2)
  })
  it('getOffset', () => {
    expect(getOffset(1, 20)).toBe(0)
    expect(getOffset(3, 20)).toBe(40)
  })
})
