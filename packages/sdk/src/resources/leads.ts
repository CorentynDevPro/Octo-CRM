import type { OctoCrmClient } from '../client'
import type { LeadEntity, CreateLeadDto, UpdateLeadDto, PaginatedResponse, PaginationQuery } from '@octo-crm/types'
import type { ApiResponse } from '@octo-crm/types'

export class LeadsResource {
  constructor(private readonly client: OctoCrmClient) {}

  list(query?: PaginationQuery): Promise<ApiResponse<PaginatedResponse<LeadEntity>>> {
    return this.client.get('/crm/leads', query as Record<string, unknown>)
  }

  get(id: string): Promise<ApiResponse<LeadEntity>> {
    return this.client.get(`/crm/leads/${id}`)
  }

  create(data: CreateLeadDto): Promise<ApiResponse<LeadEntity>> {
    return this.client.post('/crm/leads', data)
  }

  update(id: string, data: UpdateLeadDto): Promise<ApiResponse<LeadEntity>> {
    return this.client.patch(`/crm/leads/${id}`, data)
  }

  delete(id: string): Promise<ApiResponse<void>> {
    return this.client.delete(`/crm/leads/${id}`)
  }

  convert(id: string): Promise<ApiResponse<{ contactId: string }>> {
    return this.client.post(`/crm/leads/${id}/convert`)
  }
}
