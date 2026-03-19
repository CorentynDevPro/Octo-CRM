import type { LeadEntity, CreateLeadDto, UpdateLeadDto, PaginatedResponse, PaginationQuery } from '@octo-crm/types'

export interface ILeadService {
  listLeads(orgId: string, query: PaginationQuery): Promise<PaginatedResponse<LeadEntity>>
  getLead(id: string, orgId: string): Promise<LeadEntity>
  createLead(orgId: string, data: CreateLeadDto): Promise<LeadEntity>
  updateLead(id: string, orgId: string, data: UpdateLeadDto): Promise<LeadEntity>
  deleteLead(id: string, orgId: string): Promise<void>
  convertLead(id: string, orgId: string): Promise<{ contactId: string }>
}
