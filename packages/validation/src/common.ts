import { z } from 'zod'

export const UUIDSchema = z.string().uuid()

export const PaginationSchema = z.object({
  page: z.coerce.number().int().min(1).default(1),
  perPage: z.coerce.number().int().min(1).max(100).default(20),
  sortBy: z.string().optional(),
  sortOrder: z.enum(['asc', 'desc']).default('desc'),
  search: z.string().optional(),
})

export const IdParamSchema = z.object({
  id: UUIDSchema,
})
