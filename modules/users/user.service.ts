import type { User } from './user.entity'
import type { PaginatedResponse, PaginationQuery } from '@octo-crm/types'

export interface IUserService {
  list(orgId: string, query: PaginationQuery): Promise<PaginatedResponse<User>>
  getById(id: string, orgId: string): Promise<User>
  getByEmail(email: string, orgId: string): Promise<User | null>
  create(orgId: string, data: Omit<User, keyof import('@octo-crm/types').BaseEntity | 'organizationId'>): Promise<User>
  update(id: string, orgId: string, data: Partial<User>): Promise<User>
  deactivate(id: string, orgId: string): Promise<void>
}
