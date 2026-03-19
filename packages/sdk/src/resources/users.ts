import type { OctoCrmClient } from '../client'
import type { UserEntity, CreateUserDto, UpdateUserDto, PaginatedResponse, PaginationQuery } from '@octo-crm/types'
import type { ApiResponse } from '@octo-crm/types'

export class UsersResource {
  constructor(private readonly client: OctoCrmClient) {}

  list(query?: PaginationQuery): Promise<ApiResponse<PaginatedResponse<UserEntity>>> {
    return this.client.get('/users', query as Record<string, unknown>)
  }

  get(id: string): Promise<ApiResponse<UserEntity>> {
    return this.client.get(`/users/${id}`)
  }

  create(data: CreateUserDto): Promise<ApiResponse<UserEntity>> {
    return this.client.post('/users', data)
  }

  update(id: string, data: UpdateUserDto): Promise<ApiResponse<UserEntity>> {
    return this.client.patch(`/users/${id}`, data)
  }

  delete(id: string): Promise<ApiResponse<void>> {
    return this.client.delete(`/users/${id}`)
  }
}
