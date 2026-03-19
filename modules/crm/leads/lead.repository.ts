import type { Lead } from './lead.entity'
import type { CreateLeadInput, UpdateLeadInput, LeadListQuery, LeadListResult } from './lead.types'

export interface ILeadRepository {
  findAll(organizationId: string, query: LeadListQuery): Promise<LeadListResult>
  findById(id: string, organizationId: string): Promise<Lead | null>
  findByEmail(email: string, organizationId: string): Promise<Lead | null>
  create(organizationId: string, data: CreateLeadInput & { createdById: string }): Promise<Lead>
  update(id: string, organizationId: string, data: UpdateLeadInput): Promise<Lead>
  softDelete(id: string, organizationId: string): Promise<void>
  markConverted(id: string, contactId: string): Promise<Lead>
}
