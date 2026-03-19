import type { OctoCrmClient } from '../client'
import type { DealEntity, CreateDealDto, UpdateDealDto, PaginatedResponse, PaginationQuery } from '@octo-crm/types'
import type { ApiResponse } from '@octo-crm/types'

export class DealsResource {
  constructor(private readonly client: OctoCrmClient) {}

  list(query?: PaginationQuery): Promise<ApiResponse<PaginatedResponse<DealEntity>>> {
    return this.client.get('/crm/deals', query as Record<string, unknown>)
  }

  get(id: string): Promise<ApiResponse<DealEntity>> {
    return this.client.get(`/crm/deals/${id}`)
  }

  create(data: CreateDealDto): Promise<ApiResponse<DealEntity>> {
    return this.client.post('/crm/deals', data)
  }

  update(id: string, data: UpdateDealDto): Promise<ApiResponse<DealEntity>> {
    return this.client.patch(`/crm/deals/${id}`, data)
  }

  delete(id: string): Promise<ApiResponse<void>> {
    return this.client.delete(`/crm/deals/${id}`)
  }
}
