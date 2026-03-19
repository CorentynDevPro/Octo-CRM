import type { UserEntity, PaginatedResponse, PaginationQuery } from '@octo-crm/types'

/** Placeholder repository interface — implement with your DB client (Drizzle/Prisma) */
export interface IUserRepository {
  findAll(orgId: string, query: PaginationQuery): Promise<PaginatedResponse<UserEntity>>
  findById(id: string): Promise<UserEntity | null>
  findByEmail(orgId: string, email: string): Promise<UserEntity | null>
  create(data: Omit<UserEntity, 'id' | 'createdAt' | 'updatedAt'>): Promise<UserEntity>
  update(id: string, data: Partial<UserEntity>): Promise<UserEntity>
  softDelete(id: string): Promise<void>
}
