import type { OctoCrmClient } from '../client'
import type { ContactEntity, PaginatedResponse, PaginationQuery } from '@octo-crm/types'
import type { ApiResponse } from '@octo-crm/types'

export class ContactsResource {
  constructor(private readonly client: OctoCrmClient) {}

  list(query?: PaginationQuery): Promise<ApiResponse<PaginatedResponse<ContactEntity>>> {
    return this.client.get('/crm/contacts', query as Record<string, unknown>)
  }

  get(id: string): Promise<ApiResponse<ContactEntity>> {
    return this.client.get(`/crm/contacts/${id}`)
  }

  delete(id: string): Promise<ApiResponse<void>> {
    return this.client.delete(`/crm/contacts/${id}`)
  }
}
