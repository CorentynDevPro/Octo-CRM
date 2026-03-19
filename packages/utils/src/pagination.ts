import type { PaginationQuery } from '@octo-crm/types'

export function parsePagination(query: PaginationQuery): Required<Pick<PaginationQuery, 'page' | 'perPage'>> {
  return {
    page: Math.max(1, query.page ?? 1),
    perPage: Math.min(100, Math.max(1, query.perPage ?? 20)),
  }
}

export function buildPaginationMeta(total: number, page: number, perPage: number) {
  return {
    total,
    page,
    perPage,
    totalPages: Math.ceil(total / perPage),
  }
}

export function getOffset(page: number, perPage: number): number {
  return (page - 1) * perPage
}
