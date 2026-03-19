import type { ILeadRepository } from './lead.repository'
import type { Lead } from './lead.entity'
import type { CreateLeadInput, UpdateLeadInput, LeadListQuery, LeadListResult } from './lead.types'

export class LeadService {
  constructor(private readonly leads: ILeadRepository) {}

  list(organizationId: string, query: LeadListQuery): Promise<LeadListResult> {
    return this.leads.findAll(organizationId, query)
  }

  async get(id: string, organizationId: string): Promise<Lead> {
    const lead = await this.leads.findById(id, organizationId)
    if (!lead) throw new Error(`Lead ${id} not found`)
    return lead
  }

  create(organizationId: string, data: CreateLeadInput, userId: string): Promise<Lead> {
    return this.leads.create(organizationId, { ...data, createdById: userId })
  }

  update(id: string, organizationId: string, data: UpdateLeadInput): Promise<Lead> {
    return this.leads.update(id, organizationId, data)
  }

  delete(id: string, organizationId: string): Promise<void> {
    return this.leads.softDelete(id, organizationId)
  }

  async convert(id: string, organizationId: string): Promise<{ contactId: string }> {
    const lead = await this.get(id, organizationId)
    if (lead.convertedAt) throw new Error('Lead already converted')
    // In real impl: create contact, then mark converted
    const contactId = crypto.randomUUID()
    await this.leads.markConverted(id, contactId)
    return { contactId }
  }
}
