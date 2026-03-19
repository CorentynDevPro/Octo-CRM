import { BaseEntity, AuditableEntity } from './common'
import { UserRole, UserStatus, LeadStatus, DealStatus } from './enums'

export interface UserEntity extends AuditableEntity {
  email: string
  firstName: string
  lastName: string
  phone?: string
  avatarUrl?: string
  role: UserRole
  status: UserStatus
  organizationId: string
  lastLoginAt?: Date
}

export interface OrganizationEntity extends BaseEntity {
  name: string
  slug: string
  domain?: string
  logoUrl?: string
  plan: string
  isActive: boolean
}

export interface LeadEntity extends AuditableEntity {
  firstName: string
  lastName: string
  email: string
  phone?: string
  company?: string
  status: LeadStatus
  source?: string
  ownerId: string
  organizationId: string
  score?: number
  convertedAt?: Date
  convertedToContactId?: string
}

export interface ContactEntity extends AuditableEntity {
  firstName: string
  lastName: string
  email: string
  phone?: string
  company?: string
  title?: string
  ownerId: string
  organizationId: string
  leadId?: string
}

export interface DealEntity extends AuditableEntity {
  title: string
  value: number
  currency: string
  status: DealStatus
  stageId: string
  pipelineId: string
  ownerId: string
  contactId?: string
  organizationId: string
  expectedCloseDate?: Date
  closedAt?: Date
  probability?: number
}

export interface PipelineEntity extends BaseEntity {
  name: string
  isDefault: boolean
  organizationId: string
}

export interface StageEntity extends BaseEntity {
  name: string
  order: number
  probability: number
  pipelineId: string
  color?: string
}
