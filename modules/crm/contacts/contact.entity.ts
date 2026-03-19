import type { BaseEntity } from '@octo-crm/types'

export interface Contact extends BaseEntity {
  organizationId: string
  ownerId: string | null
  leadId: string | null
  firstName: string
  lastName: string
  email: string | null
  phone: string | null
  company: string | null
  jobTitle: string | null
  website: string | null
  address: Record<string, unknown>
  socialLinks: Record<string, unknown>
  customFields: Record<string, unknown>
  createdById: string
  updatedById: string
}
